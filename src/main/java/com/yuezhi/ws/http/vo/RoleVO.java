package com.yuezhi.ws.http.vo;

import com.yuezhi.ws.domain.Role;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.utils.BestMeetBeaUtils;

import java.io.Serializable;
import java.util.Date;

public class RoleVO  implements Serializable{

	public final static String SYSADMIN = "sysadmin";//系统管理员
	public final static String CUSTOMER_MANAGER = "customerManager";//客服经理
	public final static String CUSTOMER_SERVICE = "customerService";//客服
	public final static String CHECK = "check";//审核人员
	public final static String MARKET = "market";//市场专员
	public final static String FINANCE = "finance";//财务
	public final static String ACTIVITY = "activity";//活动发布
	public final static String TEST = "test";//测试人员
	public final static String UAT = "uat";//测试验收人员

	private static final long serialVersionUID = 3103154924185613294L;
	private Long id;
	private String code;
	private String name;
	private String description;
	private Integer level;
	private Date createtime;

	private Date updatetime;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public void vo2Domain(Role domain) {
		try {
			BestMeetBeaUtils.copyProperties(domain, this);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取角色信息失败。");
		}
	}

	public void domain2VO(Role domain) {
		try {
			BestMeetBeaUtils.copyProperties(this, domain);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取角色信息失败。");
		}
	}
}
