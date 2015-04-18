package org.htsw.controller.member;

public class MemberPageIndexController extends MemberController {
    public void index() {
        setAttr("title", "首页");
        setAttr("pageFlag", "index");
        render("/WEB-INF/MEMBER_PAGE/member_index.ftl");
    }
}
