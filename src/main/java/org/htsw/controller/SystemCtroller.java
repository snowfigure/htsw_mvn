package org.htsw.controller;

import com.jfinal.core.Controller;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ShiroConfig;
import org.htsw.model.User;
import org.htsw.util.StaticFactory;

import java.util.Calendar;
import java.util.Date;

/**
 * ͳһ�̳еĺ�̨Controller
 * Created by snowfigure on 2015/4/11.
 */
public class SystemCtroller extends Controller {
    @Override
    public void render(String view) {
        //1 保存全局参数
        setAttr("ctx", getRequest().getContextPath());
        setAttr("systemConfig", StaticFactory.getSystemConfigMap());

        //2、获取当前时间
        Calendar c = Calendar.getInstance();
        int hour = c.get(Calendar.HOUR_OF_DAY);
        System.out.println("hour:" + hour);
        //3 验证用户登陆
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            System.out.println("User Has Login the System");
            User user = (User) subject.getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = user.getInt("id");
            int role_id = User.dao.getUserRoleIDByUserID(uid);
            System.out.println("User Has Login the System:role_id" + role_id);
            if (role_id >= 2 && role_id <= 4) {
                String html =
                        String.format(ShiroConfig.loginHtmlMap.get(role_id), user.get("username"));
                setAttr("loginHtml", html);
                setAttr(
                        "welcome",
                        String.format(ShiroConfig.WelcomeMsgMap.get(hour), user.get("username"))
                );
                setAttr("user", user);
                super.render(view);
            } else {
                setAttr("loginHtml", ShiroConfig.loginHtmlMap.get(0));
            }
        } else {
            System.out.println("User Has not Login the System");
            setAttr("loginHtml", ShiroConfig.loginHtmlMap.get(0));
        }


        super.render(view);
    }
}
