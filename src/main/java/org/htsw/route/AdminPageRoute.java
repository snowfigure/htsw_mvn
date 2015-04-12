package org.htsw.route;

import com.jfinal.config.Routes;
import org.htsw.controller.adminpage.AdminPageArticleController;
import org.htsw.controller.adminpage.AdminPageIndexController;
import org.htsw.controller.adminpage.AdminPageMenuController;

/**
 * @author FengDuqing
 *         通用管理平台的路由规则
 */
public class AdminPageRoute extends Routes {

    @Override
    public void config() {
        add("/admin", AdminPageIndexController.class);
        add("/admin/menu", AdminPageMenuController.class);
        add("/admin/article", AdminPageArticleController.class);
    }

}
