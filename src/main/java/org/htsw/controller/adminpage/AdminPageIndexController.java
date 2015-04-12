package org.htsw.controller.adminpage;

import com.jfinal.core.Controller;

public class AdminPageIndexController extends Controller {
    public void index() {

        render("/WEB-INF/ADMIN_PAGE/index.html");

    }
}
