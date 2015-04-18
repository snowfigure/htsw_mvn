package org.htsw.controller;

import com.jfinal.core.Controller;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ShiroConfig;
import org.htsw.model.User;
import org.htsw.util.StaticFactory;

/**
 * ͳһ�̳еĺ�̨Controller
 * Created by snowfigure on 2015/4/11.
 */
public class SystemCtroller extends Controller {
    @Override
    public void render(String view) {
        setAttr("ctx", getRequest().getContextPath());
        setAttr("systemConfig", StaticFactory.getSystemConfigMap());
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated())
        {
            User user = (User) subject.getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = user.getInt("id");
            int role_id = User.dao.getUserRoleIDByUserID(uid);
            if(role_id>=2 && role_id<=4)
            {
                String html =
                        String.format(ShiroConfig.loginHtmlMap.get(role_id),user.get("username"));
                setAttr("loginHtml", html);
                super.render(view);
            }
            else
            {
                setAttr("loginHtml",ShiroConfig.loginHtmlMap.get(0));
            }
        }
        else
        {
            setAttr("loginHtml",ShiroConfig.loginHtmlMap.get(0));
        }
        super.render(view);
    }
}
