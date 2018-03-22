package com.yuezhi.ws.http.vo;

import com.yuezhi.ws.domain.Area;
import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.utils.BestMeetBeaUtils;

public class AreaVO {

    private Integer id;

    private Integer code;

    private String name;

    private String pinyinName;

    private Integer parentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPinyinName() {
        return pinyinName;
    }

    public void setPinyinName(String pinyinName) {
        this.pinyinName = pinyinName == null ? null : pinyinName.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    public void vo2Domain(Area area){
    	
    	try {
    		BestMeetBeaUtils.copyProperties(area, this);
		} catch (Exception e) {
			e.printStackTrace();
			throw new BusinessException("获取城市信息失败！");
		}
    }
    public  void  domain2VO(Area area){
    	try{
            BestMeetBeaUtils.copyProperties(this, area);
    	}catch(Exception e){
    		e.printStackTrace();
    		throw new BusinessException("获取城市信息失败！");
    	}
    }
}
