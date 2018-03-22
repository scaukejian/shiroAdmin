package com.yuezhi.ws.http.vo;

import com.yuezhi.ws.domain.BaseDataType;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.utils.BestMeetBeaUtils;

public class BaseDataTypeVO {
    private Integer id;

    private String code;

    private String name;

    private Integer status;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public void vo2Domain(BaseDataType domain) {
        try {
            BestMeetBeaUtils.copyProperties(domain, this);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("获取基础数据类型失败");
        }
    }

    public void domain2Vo(BaseDataType domain) {
        try {
            BestMeetBeaUtils.copyProperties(this, domain);
        } catch (Exception e) {
            e.printStackTrace();
            throw new BusinessException("获取基础数据类型失败");
        }
    }

    @Override
    public String toString() {
        return "BaseDataTypeVO{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}