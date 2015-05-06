package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ManagerInterceptor;

@Before(ManagerInterceptor.class)
public class AdminPageIndexController extends AdminController {
    public void index() {
        Subject subject = SecurityUtils.getSubject();

        render("/WEB-INF/ADMIN_PAGE/index.ftl");

    }
}
