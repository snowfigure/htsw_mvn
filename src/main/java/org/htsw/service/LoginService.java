package org.htsw.service;

import org.apache.shiro.subject.Subject;
import org.htsw.config.ShiroConfig;
import org.htsw.model.User;

/**
 * ����session�ж��û��Ƿ��ǵ�½��
 * Created by snowfigure on 2015/4/17.
 */
public class LoginService {
    public static String isRightAccess(Subject subject) {
        if (subject.isAuthenticated()) {
            User user = (User) subject.getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = user.getInt("id");
            int role_id = User.dao.getUserRoleIDByUserID(uid);
            System.out.println("role_id��" + role_id);
            if (role_id == ShiroConfig.MEMBER_ROLE) {
                System.out.println("��Ȼͨ����");
                return "SUCCESS";
            }
        }
        System.out.println("�Ƿ����û�����member·��");
        return "../../index.html";
    }
}
