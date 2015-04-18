package org.htsw.controller.employee;

public class EmployeePageIndexController extends EmployeeController {
    public void index() {
        renderJson("业务员首页");
    }
}
