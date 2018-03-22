package com.yuezhi.ws.http.controller;

import com.yuezhi.ws.http.vo.BaseDataVO;
import com.yuezhi.ws.service.BaseDataService;
import com.yuezhi.ws.service.BaseDataTypeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * 基础数据控制器 Created by kejian on 2018/3/21.
 */
@Controller
@RequestMapping("baseData")
public class BaseDataController extends BaseController {
	
	@Autowired
	public BaseDataService baseDataService;

	@ResponseBody
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public Map<String, Object> add(@ModelAttribute BaseDataVO baseDataVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		baseDataService.add(baseDataVO);
		result.put(STATUS, STATUS_SUCCESS);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public Map<String, Object> update(@ModelAttribute BaseDataVO baseDataVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		baseDataService.update(baseDataVO);
		result.put(STATUS, STATUS_SUCCESS);
		return result;
	}

	@ResponseBody
	@RequestMapping("/get/{id}.do")
	public Map<String, Object> get(@PathVariable Integer id) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(DATA, baseDataService.get(id));
		result.put(STATUS, STATUS_SUCCESS);
		return result;
	}

	@ResponseBody
	@RequestMapping("/pageJson.do")
	public Map<String, Object> pageJson(BaseDataVO baseDataVO,
			@RequestParam int page, @RequestParam int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageInfo pageInfo = baseDataService
				.pageJson(baseDataVO, page, pageSize);
		map.put(DATA_LIST, pageInfo.getList());
		map.put(TOTAL, pageInfo.getTotal());
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/modifyStatus/{id}-{status}.do")
	public Map<String, Object> modifyStatus(@PathVariable Integer id,
			@PathVariable Integer status) {
		Map<String, Object> map = new HashMap<String, Object>();
		baseDataService.modifyStatusById(id, status);
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}
	
}
