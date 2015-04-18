package org.htsw.controller.frontpage;

import com.sf.kits.mail.MailSenderInfo;
import com.sf.kits.mail.MailUtil;
import com.sf.kits.mail.SimpleMailSender;
import org.htsw.controller.SystemCtroller;
import org.htsw.model.Article;

/**
 * 前端页面
 * Created by snowfigure on 2015/4/11.
 */
public class FrontPageIndexController extends SystemCtroller {
    public void index() {
        setAttr("title", "首页");
        setAttr("pageFlag", "index");
        render("/WEB-INF/FRONT_PAGE/index.ftl");
    }

    public void aboutUs() {
        setAttr("title", "关于我们");
        setAttr("pageFlag", "aboutUs");
        setAttr("aid", 1);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }
    public void contact() {
        setAttr("title", "联系我们");
        setAttr("pageFlag", "contact");
        setAttr("aid", 4);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }
    public void joinUs() {
        setAttr("title", "人才招聘");
        setAttr("pageFlag", "joinUs");
        setAttr("aid", 3);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void privacy() {
        setAttr("title", "隐私声明");
        setAttr("pageFlag", "privacy");
        setAttr("aid", 2);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void article(){
        int aid = getParaToInt("aid", -1);
        if(aid == -1)
        {
            renderText("false");
            return;
        }
        System.out.println(aid);
        renderJson(Article.me.findById(aid));
    }
    public void qaOnline() {
        setAttr("title", "意见反馈");
        setAttr("pageFlag", "qaOnline");
        render("/WEB-INF/FRONT_PAGE/qaOnline.ftl");
    }

    public void login() {
        setAttr("title", "用户登录");
        setAttr("pageFlag", "login");
        render("/WEB-INF/FRONT_PAGE/login.ftl");
    }

    public void register() {
        setAttr("title", "会员注册");
        setAttr("pageFlag", "register");
        render("/WEB-INF/FRONT_PAGE/register.ftl");
    }

}
