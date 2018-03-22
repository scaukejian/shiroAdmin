package com.yuezhi.ws.service;

import com.google.gson.reflect.TypeToken;
import com.yuezhi.ws.constant.Code;
import com.yuezhi.ws.domain.BaseDataType;
import com.yuezhi.ws.domain.BaseDataTypeExample;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.http.vo.BaseDataTypeVO;
import com.yuezhi.ws.mapper.BaseDataTypeMapper;
import com.yuezhi.ws.service.redis.RedisCacheManger;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.text.MessageFormat;
import java.util.*;

/**
 * 基础数据服务 Created by kejian on 2018/3/21.
 */
@Service
@Transactional
public class BaseDataTypeService {

	@Autowired
	private BaseDataTypeMapper baseDataTypeMapper;

	@Autowired
	private RedisCacheManger redisCacheManger;

	private Gson gson = new Gson();

	/**
	 * 检查参数是否为空
	 * @param vo
	 */
	public void checkParam(BaseDataTypeVO vo) {
		if (StringUtils.isBlank(vo.getCode()))
			throw new BusinessException("请输入编号");
		if (StringUtils.isBlank(vo.getName()))
			throw new BusinessException("请输入名称");
	}

	/**
	 * @param vo
	 * @return
	 */
	public void add(BaseDataTypeVO vo) {
		checkParam(vo); //检查参数是否为空
		BaseDataTypeExample example = new BaseDataTypeExample();
		BaseDataTypeExample.Criteria criteria = example.createCriteria();
		criteria.andCodeEqualTo(vo.getCode());
		List<BaseDataType> baseDataTypeList = baseDataTypeMapper.selectByExample(example);
		if (!baseDataTypeList.isEmpty())
			throw new BusinessException("已存在此编号基础数据类型");
		BaseDataType baseDataType = new BaseDataType();
		vo.vo2Domain(baseDataType);
		baseDataTypeMapper.insert(baseDataType);
		//更新redis缓存
		getValidDataByType(baseDataType, true);
	}

	/**
	 * @param vo
	 * @return
	 */
	public void update(BaseDataTypeVO vo) {
		checkParam(vo); //检查参数是否为空
		if (vo.getId() == null)
			throw new BusinessException("获取参数失败");
		BaseDataType oldBaseDataType = baseDataTypeMapper.selectByPrimaryKey(vo.getId());
		if (oldBaseDataType == null || StringUtils.isBlank(oldBaseDataType.getCode()))
			throw new BusinessException("获取数据失败");
		String oldCode = oldBaseDataType.getCode();
		String newCode = vo.getCode();
		if (!newCode.equals(oldCode)) {
			BaseDataTypeExample example = new BaseDataTypeExample();
			BaseDataTypeExample.Criteria criteria = example.createCriteria();
			criteria.andCodeEqualTo(newCode);
			List<BaseDataType> baseDataTypeList = baseDataTypeMapper.selectByExample(example);
			if (!baseDataTypeList.isEmpty())
				throw new BusinessException("已存在此编号基础数据类型");
		}

		BaseDataType baseDataType = new BaseDataType();
		vo.vo2Domain(baseDataType);
		baseDataTypeMapper.updateByPrimaryKeySelective(baseDataType);
		//更新redis缓存
		getValidDataByType(baseDataType, true);
	}

	/**
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public BaseDataTypeVO get(Integer id) {
		if (id == null) {
			throw new BusinessException("id不能为空");
		}
		BaseDataType baseDataType = baseDataTypeMapper.selectByPrimaryKey(id);
		BaseDataTypeVO vo = new BaseDataTypeVO();
		vo.domain2Vo(baseDataType);
		return vo;
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<BaseDataTypeVO> getValidAll() {
		List<BaseDataTypeVO> list = new ArrayList<BaseDataTypeVO>();
		BaseDataTypeExample example = new BaseDataTypeExample();
		example.createCriteria().andStatusEqualTo(Code.STATUS_VALID);
		List<BaseDataType> baseDataTypes = baseDataTypeMapper.selectByExample(example);
		for (BaseDataType baseDataType : baseDataTypes) {
			BaseDataTypeVO baseDataTypeVO = new BaseDataTypeVO();
			baseDataTypeVO.domain2Vo(baseDataType);
			list.add(baseDataTypeVO);
		}
		return list;
	}

	/**
	 * 通过code查找基础数据类型
	 * @param code
	 * @return
	 */
	public BaseDataType getByCode(String code) {
		BaseDataTypeExample example = new BaseDataTypeExample();
		example.createCriteria().andCodeEqualTo(code);
		return baseDataTypeMapper.selectByExample(example).get(0);
	}

	/**
	 * 
	 * @param baseDataTypeVO
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public PageInfo pageJson(BaseDataTypeVO baseDataTypeVO, int page, int pageSize) {
		// 分页
		PageHelper.startPage(page, pageSize);
		BaseDataTypeExample example = new BaseDataTypeExample();
		List<BaseDataTypeVO> listvo = new ArrayList<BaseDataTypeVO>();
		// 条件查询
		BaseDataTypeExample.Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(baseDataTypeVO.getName())) {
			criteria.andNameLike(MessageFormat.format("%{0}%",
					baseDataTypeVO.getName()));
		}
		if (StringUtils.isNotBlank(baseDataTypeVO.getCode())) {
			criteria.andCodeLike(MessageFormat.format("%{0}%",
					baseDataTypeVO.getCode()));
		}
		if (baseDataTypeVO.getStatus() != null) {
			criteria.andStatusEqualTo(baseDataTypeVO.getStatus());
		}
		List<BaseDataType> baseDataTypes = baseDataTypeMapper.selectByExample(example);
		PageInfo pageInfo = new PageInfo(baseDataTypes);
		for (BaseDataType baseDataType : baseDataTypes) {
			BaseDataTypeVO vo = new BaseDataTypeVO();
			vo.domain2Vo(baseDataType);
			listvo.add(vo);
		}
		pageInfo.getList().clear();
		pageInfo.getList().addAll(listvo);
		return pageInfo;
	}

	public boolean modifyStatusById(Integer id, Integer status) {
		BaseDataType baseDataType = baseDataTypeMapper.selectByPrimaryKey(id);
		if (baseDataType != null) {
			baseDataType.setStatus(status);
			baseDataTypeMapper.updateByPrimaryKeySelective(baseDataType);
			//更新redis缓存
			getValidDataByType(baseDataType, true);
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
	public List<BaseDataTypeVO> getValidDataByType(BaseDataType type, boolean refresh) {
		return getValidDataByType(type.getCode(), refresh);
	}

	/**
	 * 按类型缓存
	 * @param type
	 * @refresh 是否刷新缓存
	 * @return
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED, readOnly = true)
	public List<BaseDataTypeVO> getValidDataByType(String type, boolean refresh) {
		List<BaseDataTypeVO> list = new ArrayList<>();
		String baseDataTypeCacheKey = BaseDataType.class.getSimpleName() + "_" + type;
		String jsonStr = null;
		//是否刷新缓存
		if(false == refresh){
			jsonStr = redisCacheManger.getRedisCacheInfo(baseDataTypeCacheKey);
		}
		if(StringUtils.isNotBlank(jsonStr)){
			list = gson.fromJson(jsonStr, new TypeToken<List<BaseDataTypeVO>>() {}.getType());
		}else {
			BaseDataTypeExample example = new BaseDataTypeExample();
			example.createCriteria().andCodeEqualTo(type).andStatusEqualTo(Code.STATUS_VALID);
			List<BaseDataType> baseDataTypes = baseDataTypeMapper.selectByExample(example);
			for (BaseDataType domain : baseDataTypes) {
				BaseDataTypeVO vo = new BaseDataTypeVO();
				vo.domain2Vo(domain);
				list.add(vo);
			}
			redisCacheManger.setRedisCacheInfo(baseDataTypeCacheKey, RedisCacheManger.REDIS_CACHE_EXPIRE_DEFAULT, gson.toJson(list));
		}
		return list;
	}
}
