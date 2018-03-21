package com.yuezhi.ws.domain;

import java.util.Date;

public class EmployeeOrderRelation {
    private Integer id;

    private Long empId;

    private Integer orderId;

    private Integer status;

    private Date bindTime;

    private Date closeTime;

    private String oldHandler;

    public EmployeeOrderRelation() {
    }

    public EmployeeOrderRelation(Long empId, Integer orderId, Integer status) {
        this.empId = empId;
        this.orderId = orderId;
        this.status = status;
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

    public String getOldHandler() {
        return oldHandler;
    }

    public void setOldHandler(String oldHandler) {
        this.oldHandler = oldHandler == null ? null : oldHandler.trim();
    }

}