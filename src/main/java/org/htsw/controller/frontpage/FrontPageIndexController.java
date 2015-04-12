package org.htsw.controller.frontpage;

import org.htsw.controller.SystemCtroller;

/**
 * 前端页面
 * Created by snowfigure on 2015/4/11.
 */
public class FrontPageIndexController extends SystemCtroller {
    public void index() {
        setAttr("title", "首页");
        setAttr("pageFlag", "index");
        render("/WEB-INF/FRONT_PAGE/index.ftl");
        // render("/flash.html");
    }

    public void aboutUs() {
        setAttr("title", "关于我们");
        setAttr("pageFlag", "aboutUs");
        render("/WEB-INF/FRONT_PAGE/aboutUs.ftl");
    }

    public void qaOnline() {
        setAttr("title", "意见反馈");
        setAttr("pageFlag", "qaOnline");
        render("/WEB-INF/FRONT_PAGE/qaOnline.ftl");
    }

    public void login() {
        setAttr("title", "用户登陆");
        setAttr("pageFlag", "login");
        render("/WEB-INF/FRONT_PAGE/login.ftl");
    }

    public void register() {
        setAttr("title", "会员注册");
        setAttr("pageFlag", "register");
        render("/WEB-INF/FRONT_PAGE/register.ftl");
    }

    public void joinUs() {
        setAttr("title", "人才招聘");
        setAttr("pageFlag", "joinUs");
        render("/WEB-INF/FRONT_PAGE/joinUs.ftl");
    }

    public void privacy() {
        setAttr("title", "隐私声明");
        setAttr("pageFlag", "privacy");
        render("/WEB-INF/FRONT_PAGE/privacy.ftl");
    }
}
