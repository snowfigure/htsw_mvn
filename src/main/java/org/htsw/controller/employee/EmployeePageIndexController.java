package org.htsw.controller.employee;

import com.jfinal.aop.Before;
import org.htsw.config.ManagerInterceptor;

@Before(ManagerInterceptor.class)
public class EmployeePageIndexController extends EmployeeController {
    public void index() {
        renderJson("业务员首页");
    }
}
