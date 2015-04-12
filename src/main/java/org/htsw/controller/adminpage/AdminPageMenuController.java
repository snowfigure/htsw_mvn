package org.htsw.controller.adminpage;

import com.jfinal.core.Controller;
import org.htsw.model.Resc;

public class AdminPageMenuController extends Controller {
    public void resc() {
        renderJson(Resc.me.generateMenu());
    }
}
