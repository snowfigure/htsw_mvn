package org.htsw.route;

import com.jfinal.config.Routes;
import org.htsw.controller.frontpage.FrontPageIndexController;

/**
 * @author FengDuqing
 *         通用管理平台的路由规则
 */
public class FrontPageRoute extends Routes {

    @Override
    public void config() {
        add("/", FrontPageIndexController.class);

    }

}
