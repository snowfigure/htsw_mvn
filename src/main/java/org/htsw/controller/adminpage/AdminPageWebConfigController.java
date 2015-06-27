package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import com.jfinal.kit.JsonKit;
import com.sf.kits.time.TimeUtil;
import org.htsw.config.ManagerInterceptor;
import org.htsw.model.WebConfig;
import org.htsw.util.StaticFactory;

import java.util.Date;

/**
 * 环境变量
 * Created by snowfigure on 2015/4/22.
 */

@Before(ManagerInterceptor.class)
public class AdminPageWebConfigController extends AdminController {
    public void index() {
        int type = getParaToInt("type",0);
        setAttr("type",type);
        render("/WEB-INF/ADMIN_PAGE/SYSTEMCONFIG/system_config.ftl");
    }
    public void list(){
        int type = getParaToInt("type",0);
        if(type==0){
            renderJson(WebConfig.me.find("select * from c_webconfig"));
        }else if(type==1){
            renderJson(WebConfig.me.find("select * from c_webconfig where id between 1 and 99"));
        }else if(type==2){
            renderJson(WebConfig.me.find("select * from c_webconfig where id between 101 and 199"));
        }else if(type==3){
            renderJson(WebConfig.me.find("select * from c_webconfig where id between 201 and 299"));
        }

    }
    public void edit(){
        keepModel(WebConfig.class);
        WebConfig webConfig = getModel(WebConfig.class);
        String updateTime = TimeUtil.format2(new Date());
        webConfig.set("update_time", updateTime);
        boolean flag = webConfig.update();
        StaticFactory.clearWebConfig();
        StaticFactory.setSystemConfigMap();
        renderText(flag + "");
    }
}
