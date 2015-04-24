package org.htsw.controller.adminpage;

/**
 * 环境变量
 * Created by snowfigure on 2015/4/22.
 */
public class AdminPageWebConfigController extends AdminController  {
    public void index()
    {
        render("/WEB-INF/ADMIN_PAGE/system_config.ftl");
    }
}
