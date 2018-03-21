package com.yuezhi.ws.http.vo;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.yuezhi.ws.domain.EmployeeOrderRelation;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.utils.BestMeetBeaUtils;

public class EmployeeOrderRelationVO {
    private Integer id;

    private Long empId;

    private Integer orderId;

    private Integer status;

    private String statusName;

    private Date bindTime;

    private Date closeTime;
    
    private String oldHandler;
    
    private EmployeeVO employee;
  
	public String getOldHandler() {
		return oldHandler;
	}

	public void setOldHandler(String oldHandler) {
		this.oldHandler = oldHandler;
	}

	public EmployeeVO getEmployee() {
		return employee;
	}

	public void setEmployee(EmployeeVO employee) {
		this.employee = employee;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Long getEmpId() {
        return empId;
    }

    public void setEmpId(Long empId) {
        this.empId = empId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

  
    public Date getBindTime() {
		return bindTime;
	}

	public void setBindTime(Date bindTime) {
		this.bindTime = bindTime;
	}

	public Date getCloseTime() {
		return closeTime;
	}

	public void setCloseTime(Date closeTime) {
		this.closeTime = closeTime;
	}

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public void vo2Domain(EmployeeOrderRelation domain){

		try {
			BestMeetBeaUtils.copyProperties(domain, this);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取套餐信息失败");
		}
	
    }
    public void domain2VO(EmployeeOrderRelation domain){
    	try {
			BestMeetBeaUtils.copyProperties(this,domain);
            this.statusName = getEmpOrderStatusName(this.status);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取套餐信息失败");
		}
    }

    public static String getEmpOrderStatusName(Integer status){
        Map<Integer, String> map = new HashMap<>();
        map.put(0, "处理中");
        map.put(1, "已处理");
        map.put(2, "已解绑");
        map.put(3, "已取消");
        return map.get(status).toString();
    }
}
