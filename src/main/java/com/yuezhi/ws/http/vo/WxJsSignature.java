package com.yuezhi.ws.http.vo;

/**
 * 微信JS签名
 * Created by yanyuan on 2017/2/17.
 */
public class WxJsSignature {

    private String appId;
    private String noncestr;//随机字符串
    private long timestamp; //时间戳
    private String signature;//签名

    public WxJsSignature() {
    }

    public WxJsSignature(String appId, String noncestr, long timestamp) {
        this.appId = appId;
        this.noncestr = noncestr;
        this.timestamp = timestamp;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getNoncestr() {
        return noncestr;
    }

    public void setNoncestr(String noncestr) {
        this.noncestr = noncestr;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(long timestamp) {
        this.timestamp = timestamp;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    @Override
    public String toString() {
        return "WxJsSignature{" +
                "appId='" + appId + '\'' +
                ", noncestr='" + noncestr + '\'' +
                ", timestamp=" + timestamp +
                ", signature='" + signature + '\'' +
                '}';
    }
}
