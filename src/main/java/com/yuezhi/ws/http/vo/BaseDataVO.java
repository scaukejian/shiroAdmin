package com.yuezhi.ws.http.vo;

import com.yuezhi.ws.domain.BaseData;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.utils.BestMeetBeaUtils;

import java.util.Date;

public class BaseDataVO {
    private Integer id;

    private String type;

    private String code;

    private String name;

    private Date createTime;

    private Date updateTime;

    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }


    public void vo2Domain(BaseData domain) {
        try {
            BestMeetBeaUtils.copyProperties(domain, this);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("获取基础数据失败");
        }
    }

    public void domain2Vo(BaseData domain) {
        try {
            BestMeetBeaUtils.copyProperties(this, domain);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("获取基础数据失败");
        }
    }

    @Override
    public String toString() {
        return "BaseDataVO{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", status=" + status +
                '}';
    }
}