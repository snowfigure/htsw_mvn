package org.htsw.controller.adminpage;

import org.htsw.model.Resc;

public class AdminPageMenuController extends AdminController {
    public void resc() {
        renderJson(Resc.me.generateMenu());
    }
}
