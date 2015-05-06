package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import org.htsw.config.ManagerInterceptor;
import org.htsw.model.Resc;

@Before(ManagerInterceptor.class)
public class AdminPageMenuController extends AdminController {
    public void resc() {
        renderJson(Resc.me.generateMenu());
    }
}
