package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import com.jfinal.kit.JsonKit;
import com.sf.kits.time.TimeUtil;
import org.htsw.config.ManagerInterceptor;
import org.htsw.model.WebConfig;

import java.util.Date;

/**
 * 环境变量
 * Created by snowfigure on 2015/4/22.
 */

@Before(ManagerInterceptor.class)
public class AdminPageWebConfigController extends AdminController {
    public void index() {
        render("/WEB-INF/ADMIN_PAGE/system_config.ftl");
    }
    public void list(){
        renderJson(WebConfig.me.find("select * from c_webconfig"));
    }
    public void edit(){
        keepModel(WebConfig.class);
        WebConfig webConfig = getModel(WebConfig.class);
        String updateTime = TimeUtil.format2(new Date());
        webConfig.set("update_time",updateTime);
        renderText(webConfig.update() + "");
    }
}
