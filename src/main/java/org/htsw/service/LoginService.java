package org.htsw.service;

import org.apache.shiro.subject.Subject;
import org.htsw.config.ShiroConfig;
import org.htsw.model.User;

/**
 * 根据session判定用户是否是登陆了
 * Created by snowfigure on 2015/4/17.
 */
public class LoginService {
    public static String isRightAccess(Subject subject) {
        if (subject.isAuthenticated()) {
            User user = (User) subject.getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = user.getInt("id");
            int role_id = User.dao.getUserRoleIDByUserID(uid);
            System.out.println("role_id：" + role_id);
            if (role_id == ShiroConfig.MEMBER_ROLE) {
                System.out.println("竟然通过了");
                return "SUCCESS";
            }
        }
        System.out.println("非法的用户请求member路径");
        return "../../index.html";
    }
}
