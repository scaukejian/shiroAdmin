package service;

import com.yuezhi.ws.service.redis.RedisCacheManger;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import service.base.ServiceTestBase;

/**
 * Created by yanyuan on 15/10/28.
 */
public class RedisCacheMangerTest extends ServiceTestBase {
    @Autowired
    RedisCacheManger redisCacheManger;

    @Test
    public void get(){
        String str = redisCacheManger.getRedisCacheInfo("BaseData_smsChannel");
        System.out.println(str);
    }
}
