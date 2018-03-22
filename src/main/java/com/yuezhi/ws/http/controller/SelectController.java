package com.yuezhi.ws.http.controller;

import com.yuezhi.ws.domain.Area;
import com.yuezhi.ws.http.vo.BaseDataTypeVO;
import com.yuezhi.ws.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 下拉框初始化 Created by kejian on 2018/3/22.
 */
@RequestMapping("/select")
@Controller
public class SelectController extends BaseController {

	@Autowired
	private BaseDataTypeService baseDataTypeService;
	@Autowired
	AreaService areaService;
	@Autowired
	ProvinceService  provinceService;


	@ResponseBody
	@RequestMapping("/baseDataType.do")
	public Map<String, Object> selectBaseDataTypeList() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<BaseDataTypeVO> list = baseDataTypeService.getValidAll();
		map.put(DATA_LIST, list);
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	@ResponseBody
	@RequestMapping("getAllProvince.do")
	public Map<String, Object> getAllProvince(){
		Map<String, Object> map = new HashMap<>();
		map.put("provinceList", provinceService.getAll());
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	@ResponseBody
	@RequestMapping("getCityByProvince/{parentId}.do")
	public Map<String, Object> getCityByProvince(@PathVariable("parentId") Integer parentId){
		Map<String, Object> map = new HashMap<>();
		map.put("areaList", areaService.getAreaByParentId(parentId));
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	/**
	 * 获取城市
	 */
	@ResponseBody
	@RequestMapping("/getCitysByName.do")
	public Map<String, Object> getCitysByName(@RequestParam String cityName) {
		Map<String, Object> map = new HashMap<>();
		List<Area> list = areaService.getByCityName(cityName);
		//显示前10条
		if(list.size() > 10) list = list.subList(0, 10);
		map.put(DATA_LIST, list);
		return map;
	}
}
