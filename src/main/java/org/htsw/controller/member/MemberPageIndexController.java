package org.htsw.controller.member;


import com.jfinal.aop.Before;
import org.htsw.config.ManagerInterceptor;

@Before(ManagerInterceptor.class)
public class MemberPageIndexController extends MemberController {
    public void index() {
        setAttr("title", "用户首页");
        setAttr("pageFlag", "index");
        render("/WEB-INF/MEMBER_PAGE/member_info_edit.ftl");
    }
    public void edit() {
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
