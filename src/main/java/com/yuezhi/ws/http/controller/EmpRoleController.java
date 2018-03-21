package com.yuezhi.ws.http.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yuezhi.ws.http.vo.EmpRoleRelationKeyVO;
import com.yuezhi.ws.service.EmpRoleRelationService;
import com.yuezhi.ws.service.EmployeeService;
import com.yuezhi.ws.service.RoleService;

/**
 * 
 * @author yanyuan 20180301
 *
 */
@Controller
@RequestMapping("empAndRole")
public class EmpRoleController extends BaseController {
	
	@Autowired
	private EmpRoleRelationService empRoleRelationService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private RoleService roleService;

	@ResponseBody
	@RequestMapping("/add.do")
	public Map<String, Object> add(EmpRoleRelationKeyVO VO) {
		Map<String, Object> map = new HashMap<String, Object>();
		empRoleRelationService.add(VO);
		map.put(STATUS, STATUS_SUCCESS);
		return map;

	}

	@RequestMapping("/list/{path}-{fileName}")
	public String list(@PathVariable String path, @PathVariable String fileName) {
		return super.list(path, fileName);
	}

}
