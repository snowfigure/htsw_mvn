package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import org.htsw.config.ManagerInterceptor;

/**
 * 环境变量
 * Created by snowfigure on 2015/4/22.
 */

@Before(ManagerInterceptor.class)
public class AdminPageWebConfigController extends AdminController  {
    public void index()
    {
        render("/WEB-INF/ADMIN_PAGE/system_config.ftl");
    }
}
