package org.htsw.controller.frontpage;

import com.sf.kits.coder.MD5;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ShiroConfig;
import org.htsw.controller.SystemCtroller;
import org.htsw.model.RoleUser;
import org.htsw.model.User;

/**
 * 前台的登陆和退出
 * 包括普通用户和管理员用户
 * Created by snowfigure on 2015/4/16.
 */
public class FrontPageLoginController extends SystemCtroller {

    /**
     * 用户登录
     */
    public void login()
    {
        String username = getPara("username","");
        String password = getPara("password","");
        if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
        {
            renderText("empty");
            return;
        }
        UsernamePasswordToken token =
                new UsernamePasswordToken(username,password,true,getRequest().getRemoteAddr());
        Subject subject = SecurityUtils.getSubject();
        try {
            if( subject.isAuthenticated() )
            {
                subject.logout();
            }
            subject.login(token);
        }
        catch (Exception ex)
        {
            renderText("falseLogin");
            return;
        }
        User user = (User) subject.getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = user.getInt("id");
        int role_id = User.dao.getUserRoleIDByUserID(uid);
        System.out.println("role_id：" + role_id);
        renderText("" + role_id);
    }

    /**
     * 用户注销
     */
    public void logout()
    {

        try{
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
        }
        catch (Exception ex) {

        }
        redirect("/index.html");
    }

    public void register()
    {
        String username = getPara("username","");
        String password = getPara("password", "");
        password = MD5.getMD5ofStr(password).toLowerCase();
        String email = getPara("email", "");
        if( StringUtils.isEmpty(username) || StringUtils.isEmpty(password) || StringUtils.isEmpty(email))
        {
            renderText("ERROR");
            return;
        }
        User user = User.dao.findFirst("select * from user where username = ?",username);
        if(user != null)
        {
            renderText("EXIST_USER");
            return;
        }
        user = User.dao.findFirst("select * from user where email = ?",email);
        if(user != null)
        {
            renderText("EXIST_EMAIL");
            return;
        }
        User newUser = new User();
        Boolean flag = newUser.set("username", username)
                .set("password",password)
                .set("email",email)
                .set("enable",0)
                .set("delete_status",0).save();

        RoleUser newRoleUser = new RoleUser();
        newRoleUser.set("user_id",newUser.getInt("id"))
                .set("role_id",4).save();
        renderText("" + flag);
    }
}