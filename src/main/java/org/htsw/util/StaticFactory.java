package org.htsw.util;

import org.apache.commons.lang.SystemUtils;
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
        webConfig.put("OS_NAME", SystemUtils.OS_NAME);
        webConfig.put("OS_ARCH", SystemUtils.OS_ARCH);
        webConfig.put("OS_VERSION", SystemUtils.OS_VERSION);
        webConfig.put("JAVA_VERSION", SystemUtils.JAVA_VERSION);
        webConfig.put("JAVA_VENDOR", SystemUtils.JAVA_VENDOR);
        webConfig.put("JAVA_HOME", SystemUtils.JAVA_HOME);
        webConfig.put("USER_COUNTRY", SystemUtils.USER_COUNTRY);


    }

    /**
     * 清空WebConfig
     */
    public synchronized static void clearWebConfig() {
        webConfig.clear();
    }

}
