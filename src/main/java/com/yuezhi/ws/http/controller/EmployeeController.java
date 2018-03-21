package com.yuezhi.ws.http.controller;

import com.github.pagehelper.PageInfo;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.http.shiro.RefreshAuthDefinitionsService;
import com.yuezhi.ws.http.vo.EmployeeVO;
import com.yuezhi.ws.service.EmpRoleRelationService;
import com.yuezhi.ws.service.EmployeeService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author yanyuan 20180301
 *
 */
@RequestMapping("employee")
@Controller
public class EmployeeController extends BaseController {

	Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private EmpRoleRelationService empRoleRelationService;

	@Autowired
	private RefreshAuthDefinitionsService refreshAuthDefinitionsService;

	/**
	 * 新增职员
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/add.do")
	public Map<String, Object> add(EmployeeVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		employeeService.add(vo);
		logger.info("新增员工:" + vo.getName());
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	/**
	 * 获取职员
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/get/{id}.do")
	public Map<String, Object> get(@PathVariable Long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(DATA, employeeService.get(id));
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	/**
	 * 删除职员
	 * 
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/delete/{ids}.do")
	public Map<String, Object> delete(@PathVariable String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		String[] idArray = ids.split(",");
		Long[] idLong = new Long[idArray.length];
		int index = 0;
		for (String idStr : idArray) {
			idLong[index] = Long.parseLong(idStr);
			index++;
		}
		// 删除用户角色关系
		empRoleRelationService.deleteByEmpIds(idLong);
		// 删除用户
		employeeService.delete(idLong);
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	/**
	 * 更新职工
	 * 
	 * @param vo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/update.do")
	public Map<String, Object> update(EmployeeVO vo, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		employeeService.update(vo);
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	/**
	 * 职工列表
	 * 
	 * @param vo
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/pageJson.do")
	public Map<String, Object> pageJson(EmployeeVO vo, @RequestParam int page,
			@RequestParam int pageSize) {
		Map<String, Object> map = new HashMap<String, Object>();
		PageInfo pageInfo = employeeService.pageJson(vo, page, pageSize);
		map.put(DATA_LIST, pageInfo.getList());
		map.put(TOTAL, pageInfo.getTotal());
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	/**
	 * 赋权
	 * 
	 * @param ids
	 * @param empId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/permission/{ids}-{empId}.do")
	public Map<String, Object> permission(@PathVariable String ids,
			@PathVariable String empId) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 删除已有权限
		empRoleRelationService.deleteByEmpId(Long.parseLong(empId));
		if(StringUtils.isNotBlank(ids)){
			String[] idStr = ids.split(",");
			Long[] idArray = new Long[idStr.length];
			int index = 0;
			for (String id : idStr) {
				if (StringUtils.isNotBlank(id))
					idArray[index] = Long.parseLong(id);
				index++;
			}
			// 添加新权限
			empRoleRelationService.adds(Long.parseLong(empId), idArray);
		}
		refreshAuthDefinitionsService.reloadFilterChains(); //刷新权限
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}

	/**
	 * 职工id
	 * 
	 * @param empId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getRoles/{id}.do")
	public Map<String, Object> getRoles(@PathVariable String empId) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 获取职工的所有权限id
		List list = empRoleRelationService.getRoleIds(Long.parseLong(empId));
		map.put(STATUS, STATUS_SUCCESS);
		map.put(DATA_LIST, list);
		return map;
	}

	/**
	 * 用户启/禁用
	 * 
	 * @param empId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/refuse/{empId}-{status}.do")
	public Map<String, Object> refuse(@PathVariable String empId,@PathVariable Integer status, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		EmployeeVO vo = employeeService.get(Long.parseLong(empId));
		if (vo == null) {
			throw new BusinessException("获取用户信息失败! ");

		}
		vo.setStatus(status);
		employeeService.update(vo);
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/getByName.do")
	public Map<String , Object> getByName(@RequestParam String name){
		Map<String , Object> map=new HashMap<String, Object>();
		map.put(DATA_LIST,employeeService.getByName(name));
		map.put(STATUS, STATUS_SUCCESS);
		return map;
	}
	
}
