package com.yuezhi.ws.http.vo;

import com.yuezhi.ws.domain.EmpRoleRelation;
import com.yuezhi.ws.domain.Employee;
import com.yuezhi.ws.domain.Role;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.utils.BestMeetBeaUtils;

public class EmpRoleRelationVO {
	private Role role;
	private Employee employee;
	public Role getrole() {
		return role;
	}
	public void setrole(Role role) {
		this.role = role;
	}
	public Employee getemployee() {
		return employee;
	}
	public void setemployee(Employee employee) {
		this.employee = employee;
	}
	
	public void vo2Domain(EmpRoleRelation domain)
	{
		try {
			BestMeetBeaUtils.copyProperties(domain, this);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取员工角色关系信息失败！");
		}
	}
	public  void domain2VO(EmpRoleRelation domain){
		try {
			BestMeetBeaUtils.copyProperties(this, domain);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取员工角色关系信息失败！");
		}
	}
}
