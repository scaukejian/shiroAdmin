package com.yuezhi.ws.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yuezhi.ws.constant.Code;
import com.yuezhi.ws.domain.BaseData;
import com.yuezhi.ws.domain.BaseDataExample;
import com.yuezhi.ws.domain.BaseDataType;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.http.vo.BaseDataVO;
import com.yuezhi.ws.mapper.BaseDataMapper;
import com.yuezhi.ws.service.redis.RedisCacheManger;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 基础数据服务 Created by kejian on 2018/3/21.
 */
@Service
@Transactional
public class BaseDataService {

	@Autowired
	private BaseDataMapper baseDataMapper;
	@Autowired
	private BaseDataTypeService baseDataTypeService;

	@Autowired
	private RedisCacheManger redisCacheManger;

	private Gson gson = new Gson();

	/**
	 * 检查参数是否为空
	 * @param vo
	 */
	public void checkParam(BaseDataVO vo) {
		if (StringUtils.isBlank(vo.getType()))
			throw new BusinessException("请选择数据类型");
		if (StringUtils.isBlank(vo.getCode()))
			throw new BusinessException("请输入编号");
		if (StringUtils.isBlank(vo.getName()))
			throw new BusinessException("请输入名称");
	}

	/**
	 * @param vo
	 * @return
	 */
	public void add(BaseDataVO vo) {
		checkParam(vo); //检查参数是否为空
		BaseDataExample example = new BaseDataExample();
		BaseDataExample.Criteria criteria = example.createCriteria();
		criteria.andCodeEqualTo(vo.getCode());
		criteria.andTypeEqualTo(vo.getType());
		List<BaseData> baseDataList = baseDataMapper.selectByExample(example);
		if (!baseDataList.isEmpty())
			throw new BusinessException("该类型已存在此编号基础数据");
		BaseData baseData = new BaseData();
		vo.vo2Domain(baseData);
		baseData.setStatus(1);
		baseData.setCreateTime(new Date());
		baseData.setUpdateTime(new Date());
		baseDataMapper.insert(baseData);
		//更新redis缓存
		getValidDataByType(baseData.getType(), true);
	}

	/**
	 * @param vo
	 * @return
	 */
	public void update(BaseDataVO vo) {
		checkParam(vo); //检查参数是否为空
		if (vo.getId() == null)
			throw new BusinessException("获取参数失败");
		BaseData oldBaseData = baseDataMapper.selectByPrimaryKey(vo.getId());
		if (oldBaseData == null || StringUtils.isBlank(oldBaseData.getCode()))
			throw new BusinessException("获取数据失败");
		String oldCode = oldBaseData.getCode();
		String newCode = vo.getCode();
		if (!newCode.equals(oldCode)) {
			BaseDataExample example = new BaseDataExample();
			BaseDataExample.Criteria criteria = example.createCriteria();
			criteria.andCodeEqualTo(newCode);
			criteria.andTypeEqualTo(vo.getType());
			List<BaseData> baseDataList = baseDataMapper.selectByExample(example);
			if (!baseDataList.isEmpty())
				throw new BusinessException("该类型已存在此编号基础数据");
		}

		BaseData baseData = new BaseData();
		vo.vo2Domain(baseData);
		baseData.setUpdateTime(new Date());
		baseDataMapper.updateByPrimaryKeySelective(baseData);
		//更新redis缓存
		getValidDataByType(baseData.getType(), true);
	}

	/**
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public BaseDataVO get(Integer id) {
		if (id == null) {
			throw new BusinessException("id不能为空");
		}
		BaseData baseData = baseDataMapper.selectByPrimaryKey(id);
		BaseDataVO vo = new BaseDataVO();
		vo.domain2Vo(baseData);
		return vo;
	}

	/**
	 * 
	 * @param baseDataVO
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public PageInfo pageJson(BaseDataVO baseDataVO, int page, int pageSize) {
		// 分页
		PageHelper.startPage(page, pageSize);
		BaseDataExample example = new BaseDataExample();
		List<BaseDataVO> listvo = new ArrayList<BaseDataVO>();
		// 条件查询
		BaseDataExample.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(baseDataVO.getName())) {
			// 模糊查询
			criteria.andNameLike(MessageFormat.format("%{0}%",
					baseDataVO.getName()));
		}
		if (StringUtils.isNotBlank(baseDataVO.getCode())) {
			// 模糊查询
			criteria.andCodeLike(MessageFormat.format("%{0}%",
					baseDataVO.getCode()));
		}
		if (StringUtils.isNotBlank(baseDataVO.getType())) {
			// 模糊查询
			criteria.andTypeLike(MessageFormat.format("%{0}%",
					baseDataVO.getType()));
		}
		if (baseDataVO.getStatus() != null) {
			criteria.andStatusEqualTo(baseDataVO.getStatus());
		}
		List<BaseData> baseDatas = baseDataMapper.selectByExample(example);
		PageInfo pageInfo = new PageInfo(baseDatas);
		for (BaseData baseData : baseDatas) {
			BaseDataVO vo = new BaseDataVO();
			vo.domain2Vo(baseData);
			if (StringUtils.isNotBlank(baseData.getType())) {
				BaseDataType baseDataType = baseDataTypeService.getByCode(baseData.getType());
				if (baseDataType != null) vo.setType(baseDataType.getName());
			}
			listvo.add(vo);
		}
		pageInfo.getList().clear();
		pageInfo.getList().addAll(listvo);
		return pageInfo;
	}

	public boolean modifyStatusById(Integer id, Integer status) {
		BaseData baseData = baseDataMapper.selectByPrimaryKey(id);
		if (baseData != null) {
			baseData.setStatus(status);
			baseDataMapper.updateByPrimaryKeySelective(baseData);
			//更新redis缓存
			getValidDataByType(baseData.getType(), true);
			return true;
		}
		return false;
	}

	/**
	 * 按类型缓存
	 * @param type
	 * @refresh 是否刷新缓存
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<BaseDataVO> getValidDataByType(BaseData type, boolean refresh) {
		return getValidDataByType(type.getCode(), refresh);
	}

	/**
	 * 按类型缓存
	 * @param type
	 * @refresh 是否刷新缓存
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<BaseDataVO> getValidDataByType(String type, boolean refresh) {
		List<BaseDataVO> list = new ArrayList<>();
		String baseDataCacheKey = BaseData.class.getSimpleName() + "_" + type;
		String jsonStr = null;
		//是否刷新缓存
		if(false == refresh){
			jsonStr = redisCacheManger.getRedisCacheInfo(baseDataCacheKey);
		}
		if(StringUtils.isNotBlank(jsonStr)){
			list = gson.fromJson(jsonStr, new TypeToken<List<BaseDataVO>>() {}.getType());
		}else {
			BaseDataExample example = new BaseDataExample();
			example.createCriteria().andCodeEqualTo(type).andStatusEqualTo(Code.STATUS_VALID);
			List<BaseData> baseDatas = baseDataMapper.selectByExample(example);
			for (BaseData domain : baseDatas) {
				BaseDataVO vo = new BaseDataVO();
				vo.domain2Vo(domain);
				list.add(vo);
			}
			redisCacheManger.setRedisCacheInfo(baseDataCacheKey, RedisCacheManger.REDIS_CACHE_EXPIRE_DEFAULT, gson.toJson(list));
		}
		return list;
	}
}
