package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import com.sf.kits.coder.MD5;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ManagerInterceptor;
import org.htsw.config.ShiroConfig;
import org.htsw.model.User;

@Before(ManagerInterceptor.class)
public class AdminPageIndexController extends AdminController {
    public void index() {
//        Subject subject = SecurityUtils.getSubject();

//        render("/WEB-INF/ADMIN_PAGE/index.ftl");

        render("/WEB-INF/ADMIN_PAGE/EASYUI_PAGE/index.ftl");
    }

    public void fnf() {
//        Subject subject = SecurityUtils.getSubject();

//        render("/WEB-INF/ADMIN_PAGE/index.ftl");

        render("/WEB-INF/ADMIN_PAGE/404.ftl");
    }
    public void editPassword(){
        render("/WEB-INF/ADMIN_PAGE/admin_password.ftl");
    }

    public void updatePsd() {
        String pre_password = getPara("pre_password");
        String new_password = getPara("new_password");
        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        pre_password = MD5.getMD5ofStr(pre_password).toLowerCase();
        String psd = loginUser.get("password").toString().toLowerCase();

        if (!psd.equals(pre_password)) {
            renderText("ERROR");
            return;
        }
        new_password = MD5.getMD5ofStr(new_password).toLowerCase();

        loginUser.set("password", new_password);
        renderText(loginUser.update() + "");
    }
}
