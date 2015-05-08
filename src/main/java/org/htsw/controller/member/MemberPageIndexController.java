package org.htsw.controller.member;


import com.jfinal.aop.Before;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ManagerInterceptor;
import org.htsw.config.ShiroConfig;
import org.htsw.model.User;
import org.htsw.model.user.*;

@Before(ManagerInterceptor.class)
public class MemberPageIndexController extends MemberController {
    public void index() {
        setAttr("title", "用户首页");
        setAttr("pageFlag", "index");
        render("/WEB-INF/MEMBER_PAGE/member_info_edit.ftl");
    }
    public void edit() {
        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");

        setAttr("USER_INFO", User_Info.me.findByUid(uid));
        setAttr("USER_BANK", User_Bank.me.findByUid(uid));
        setAttr("USER_HOUSE", User_House.me.findByUid(uid));
        setAttr("USER_CAR", User_Car.me.findByUid(uid));
        setAttr("USER_COMPANY", User_Company.me.findByUid(uid));
        setAttr("USER_ENTERPRISE", User_Enterprise.me.findByUid(uid));
        setAttr("USER_CONTACT", User_Contact.me.findByUid(uid));

        setAttr("title", "用户基本信息编辑");
        setAttr("pageFlag", "edit");
        render("/WEB-INF/MEMBER_PAGE/member_info_edit.ftl");
    }
    public void apply() {
        setAttr("title", "申请");
        setAttr("pageFlag", "apply");
        render("/WEB-INF/MEMBER_PAGE/member_apply.ftl");
    }
    public void applyLog() {
        setAttr("title", "申请记录");
        setAttr("pageFlag", "applyLog");
        render("/WEB-INF/MEMBER_PAGE/member_applyLog.ftl");
    }
}
