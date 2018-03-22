package com.yuezhi.ws.http.controller;

import com.yuezhi.ws.http.vo.BaseDataTypeVO;
import com.yuezhi.ws.service.BaseDataTypeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * 基础数据控制器 Created by kejian on 2018/3/21.
 */
@Controller
@RequestMapping("baseDataType")
public class BaseDataTypeController extends BaseController {
	
	@Autowired
	public BaseDataTypeService baseDataTypeService;

	@ResponseBody
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public Map<String, Object> add(@ModelAttribute BaseDataTypeVO baseDataTypeVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		baseDataTypeService.add(baseDataTypeVO);
		result.put(STATUS, STATUS_SUCCESS);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public Map<String, Object> update(@ModelAttribute BaseDataTypeVO baseDataTypeVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		baseDataTypeService.update(baseDataTypeVO);
		result.put(STATUS, STATUS_SUCCESS);
		return result;
	}

	@ResponseBody
	@RequestMapping("/get/{id}.do")
	public Map<String, Object> get(@PathVariable Integer id) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(DATA, baseDataTypeService.get(id));
		result.put(STATUS, STATUS_SUCCESS);
		return result;
	}

	@ResponseBody
	@RequestMapping("/pageJson.do")
	public Map<String, Object> pageJson(BaseDataTypeVO baseDataTypeVO,
			@RequestParam int page, @RequestParam int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageInfo pageInfo = baseDataTypeService
				.pageJson(baseDataTypeVO, page, pageSize);
		map.put(DATA_LIST, pageInfo.getList());
		map.put(TOTAL, pageInfo.getTotal());
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/modifyStatus/{id}-{status}.do")
	public Map<String, Object> modifyStatus(@PathVariable Integer id, @PathVariable Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		baseDataTypeService.modifyStatusById(id, status);
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}
	
}
