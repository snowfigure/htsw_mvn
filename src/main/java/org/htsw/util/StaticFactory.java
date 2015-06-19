package org.htsw.util;

import org.htsw.model.WebConfig;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * SystemConfigMap的静态工厂
 * Created by snowfigure on 2015/4/11.
 */
public class StaticFactory {
    private static Map<String, String> webConfig = new HashMap<String, String>();

    /**
     * 获取SystemConfigMap
     *
     * @return Map<String,String>
     */
    public synchronized static Map<String, String> getSystemConfigMap() {
        if (webConfig.isEmpty()) {
            setSystemConfigMap();
        }
        return webConfig;
    }

    /**
     * 设置WebConfig
     */
    public synchronized static void setSystemConfigMap() {
        List<WebConfig> webConfigs = WebConfig.me.searchByIsSystem(WebConfig.IS_SYSTEM_CONFIG);
        for (WebConfig wc : webConfigs) {
            webConfig.put(wc.getStr(WebConfig.K).toUpperCase(), wc.getStr(WebConfig.VAL));
        }
    }

    /**
     * 清空WebConfig
     */
    public synchronized static void clearWebConfig() {
        webConfig.clear();
    }

}
