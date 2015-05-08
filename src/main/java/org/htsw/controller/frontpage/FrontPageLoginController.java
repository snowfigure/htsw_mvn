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
import org.htsw.model.user.*;

import java.text.SimpleDateFormat;
import java.util.Date;

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
            System.out.println(ex.toString());
            renderText("falseLogin");
            return;
        }
        User user = (User) subject.getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = user.getInt("id");
        int role_id = User.dao.getUserRoleIDByUserID(uid);
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式


        String login_time = dateFormat.format(now);
        User _user = User.dao.findById(uid);
        _user.set("last_login_time",login_time).update();
        //System.out.println("role_id->" + role_id);
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

        //member用户的角色分配
        RoleUser newRoleUser = new RoleUser();
        newRoleUser.set("user_id",newUser.getInt("id"))
                .set("role_id", 4).save();

        //member用户的几个基本信息表创建

        (new User_Bank()).set("uid", newUser.getInt("id")).save();
        (new User_Car()).set("uid", newUser.getInt("id")).save();
        (new User_Company()).set("uid", newUser.getInt("id")).save();
        (new User_Contact()).set("uid", newUser.getInt("id")).save();
        (new User_Enterprise()).set("uid", newUser.getInt("id")).save();
        (new User_House()).set("uid", newUser.getInt("id")).save();
        (new User_Info()).set("uid", newUser.getInt("id")).save();

        renderText("" + flag);
    }
}
