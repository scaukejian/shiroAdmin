package com.yuezhi.ws.service;

import com.yuezhi.ws.exception.BusinessException;
import com.yuezhi.ws.http.vo.WxJsSignature;
import com.yuezhi.ws.service.redis.RedisCacheManger;
import com.yuezhi.ws.utils.HttpClientUtil;
import com.yuezhi.ws.utils.StaticFileUtil;
import org.apache.commons.lang.StringUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.UUID;

/**
 * 微信服务类
 * Created by yanyuan on 2017/2/16.
 */
@Service
public class WxService {

    @Autowired
    RedisCacheManger redisCacheManger;

    Logger logger = LoggerFactory.getLogger(this.getClass());

    public final static String appId = StaticFileUtil.getProperty("webLicense", "appid");
    public final static String secret = StaticFileUtil.getProperty("webLicense", "secret");

    /**
     * 获取微信accessToken 有效期7200秒
     *
     * @return
     */
    public String getAccessToken() {
        String wxAccessToken = redisCacheManger.getRedisCacheInfo("wxAccessToken");
        if (StringUtils.isNotBlank(wxAccessToken)) return wxAccessToken;
        //缓存为空时查询微信服务器
        StringBuffer url = new StringBuffer("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential");
        url.append("&appid=").append(appId).append("&secret=").append(secret);
        url.append("&grant_type=client_credential");
        String response = HttpClientUtil.sendGet(url.toString());
        JSONObject data = new JSONObject(response);
        if (StringUtils.isBlank(data.getString("access_token"))) {
            throw new BusinessException("请求失败, 请稍后再试");
        }
        wxAccessToken = data.getString("access_token");
        redisCacheManger.setRedisCacheInfo("wxAccessToken", 60 * 60, wxAccessToken);
        return wxAccessToken;
    }

    /**
     * 获取ticket
     *
     * @param accessToken
     * @return
     */
    public String getJsApiTicket(String accessToken) {
        String jsApiTicket = redisCacheManger.getRedisCacheInfo("jsApiTicket");
        if (StringUtils.isNotBlank(jsApiTicket)) return jsApiTicket;
        //缓存为空时查询微信服务器
        StringBuffer url = new StringBuffer("https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi");
        url.append("&access_token=").append(accessToken);
        String response = HttpClientUtil.sendGet(url.toString());
        JSONObject data = new JSONObject(response);
        if (StringUtils.isBlank(data.getString("ticket"))) {
            throw new BusinessException("请求失败, 请稍后再试");
        }
        jsApiTicket = data.getString("ticket");
        redisCacheManger.setRedisCacheInfo("jsApiTicket", 60 * 60, jsApiTicket);
        return jsApiTicket;
    }

    /**
     * 生成签名
     * @return
     */
    public WxJsSignature generateJsSignature(String url) {
        if(StringUtils.isBlank(url)) throw new BusinessException("获取失败: 网址不能为空");
        WxJsSignature wxJsSignature = new WxJsSignature(appId,
                                                        StringUtils.lowerCase(UUID.randomUUID().toString()),
                                                        System.currentTimeMillis()/1000);
        StringBuffer params = new StringBuffer();
        params.append("jsapi_ticket=").append(getJsApiTicket(getAccessToken()))
                .append("&noncestr=").append(wxJsSignature.getNoncestr())
                .append("&timestamp=").append(wxJsSignature.getTimestamp())
                .append("&url=" + url);
        logger.info("signature params = " + params);
        wxJsSignature.setSignature(getSha1(params.toString()));;
        logger.info("wxJsSignature = " + wxJsSignature.toString());
        return wxJsSignature;
    }

    /**
     * sha1加密
     *
     * @param str
     * @return
     */
    public static String getSha1(String str) {
        if (StringUtils.isBlank(str)) {
            return null;
        }
        String sha1Str = null;
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
            mdTemp.update(str.getBytes("UTF-8"));

            byte[] md = mdTemp.digest();
            int j = md.length;
            char[] buf = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
                buf[k++] = hexDigits[byte0 & 0xf];
            }
            sha1Str = new String(buf);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return sha1Str;
    }

    public static void main(String[] args){
        String[] arrays = new String[4];
        arrays[0] = "noncestr";
        arrays[1] = "jsapi_ticket";
        arrays[2] = "timestamp";
        arrays[3] = "url";
        Arrays.sort(arrays);

        for (String val: arrays) {
            System.out.println(val);
        }

    }
}
