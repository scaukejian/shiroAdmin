package com.yuezhi.ws.enumeration;


/**
 * Created by yanyuan on 15/10/28.
 */
public enum BaseDataType {
    INDUSTRY("industry", "行业"), JOB("job", "职位");

    private String code;

    private String name;

    BaseDataType(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * 查询枚举
     * @param code
     * @return
     */
    public static BaseDataType get(String code) {
        for (BaseDataType baseDataType : BaseDataType.values()) {
            if (baseDataType.getCode().equals(code)) {
                return baseDataType;
            }
        }
        return null;
    }

    public static void main(String[] args){
        System.out.println(BaseDataType.get("degree"));
    }
}
