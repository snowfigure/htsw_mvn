package org.htsw.controller.adminpage;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class AdminPageIndexController extends AdminController {
    public void index() {
        Subject subject = SecurityUtils.getSubject();

        render("/WEB-INF/ADMIN_PAGE/index.ftl");

    }
}
