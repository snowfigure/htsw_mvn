package org.htsw.controller.member;

import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import org.apache.shiro.SecurityUtils;
import org.htsw.config.ShiroConfig;
import org.htsw.controller.SystemCtroller;
import org.htsw.model.User;

import java.util.Date;

/**
 * 管理员总过滤器
 * Created by snowfigure on 2015/4/17.
 */
public class MemberController extends SystemCtroller {
    @Override
    public void render(String view) {

        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");
        User user = User.dao.findById(uid);
        String reg_valid = user.get("reg_valid");

        if("checked".equals(reg_valid)){
            super.render(view);
        } else{
            try {
                String _des = DesUtil.encrypt(uid + "");
                String _base64 = Base64.getBase64(_des);
                String confuse_id = _base64.replaceAll("/+", "@").replaceAll("//", "#").replaceAll("=", "$");
                setAttr("confuse_id",confuse_id);
                String email = loginUser.get("email");
                int pos = email.indexOf("@");
                char start = email.charAt(0);
                char end = email.charAt(pos - 1);
                String _email = start + "****" + end + email.substring(pos,email.length());

                setAttr("email",_email);
                super.render("/WEB-INF/MEMBER_PAGE/member_no_valid_email.ftl");
            } catch (Exception ex) {
                super.render("/WEB-INF/MEMBER_PAGE/member_no_valid_email.ftl");
                return;
            }
        }


    }
}
