package com.yuezhi.ws.http.vo;

import com.yuezhi.ws.domain.EmpRoleRelationKey;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.utils.BestMeetBeaUtils;

public class EmpRoleRelationKeyVO {
	private String empId;
	private String roleId;
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public void vo2Domain(EmpRoleRelationKey domain){
		try {
			BestMeetBeaUtils.copyProperties(domain, this);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取用户角色Key关联信息失败！");
		}
	}
	public void domain2VO(EmpRoleRelationKey domain){
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取用户角色Key关联信息失败！");
		}
	}
}
