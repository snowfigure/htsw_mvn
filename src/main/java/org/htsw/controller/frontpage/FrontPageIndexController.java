package org.htsw.controller.frontpage;


import com.jfinal.kit.JsonKit;
import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import com.sf.kits.mail.SimpleMailBean;
import com.sf.kits.mail.SimpleMailSendUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ShiroConfig;
import org.htsw.controller.SystemCtroller;
import org.htsw.model.Article;
import org.htsw.model.User;
import org.htsw.util.StaticFactory;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

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

    public void browser() {
        setAttr("title", "首页");
        setAttr("pageFlag", "browser");
        render("/WEB-INF/FRONT_PAGE/browser.ftl");
    }

    public void aboutUs() {
        setAttr("title", "关于我们");
        setAttr("pageFlag", "aboutUs");
        setAttr("aid", 1);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void privacy() {
        setAttr("title", "隐私声明");
        setAttr("pageFlag", "privacy");
        setAttr("aid", 2);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void joinUs() {
        setAttr("title", "人才招聘");
        setAttr("pageFlag", "joinUs");
        setAttr("aid", 3);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void contact() {
        setAttr("title", "联系我们");
        setAttr("pageFlag", "contact");
        setAttr("aid", 4);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void products() {
        setAttr("title", "产品介绍");
        setAttr("pageFlag", "products");
        setAttr("aid", 5);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void fresher() {
        setAttr("title", "新手入门");
        setAttr("pageFlag", "fresher");
        setAttr("aid", 6);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void zifei() {
        setAttr("title", "资费说明");
        setAttr("pageFlag", "zifei");
        setAttr("aid", 7);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }

    public void commques() {
        setAttr("title", "常见问题");
        setAttr("pageFlag", "commques");
        setAttr("aid", 8);
        render("/WEB-INF/FRONT_PAGE/frontArticle.ftl");
    }


    public void article() {
        int aid = getParaToInt("aid", -1);
        if (aid == -1) {
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

    public void getEmailCode() {
        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");
        User user = User.dao.findById(uid);
        String email = getPara("email");
        if (email.contains("*")) {
            email = user.get("email");
        }
        String confuse_id = getAttr("confuse_id");
        try {
            String time = (new Date()).getTime() + "";

            String _des = DesUtil.encrypt(time + "");
            String _base64 = Base64.getBase64(_des);
            String reg_valid_key = _base64.replaceAll("/+", "@").replaceAll("//", "#").replaceAll("=", "$");

            Map<String, String> map = StaticFactory.getSystemConfigMap();
            System.out.println(JsonKit.toJson(map));


            Properties props = new Properties();
            // 开启debug调试
            props.setProperty("mail.debug", "true");
            // 发送服务器需要身份验证
            props.setProperty("mail.smtp.auth", "true");
            // 设置邮件服务器主机名
            props.setProperty("mail.host", map.get("EMAIL_HOST"));             //"smtp.126.com"
            // 发送邮件协议名称
            props.setProperty("mail.transport.protocol", "smtp");

            // 设置环境信息
            Session session = Session.getInstance(props);

            // 创建邮件对象
            Message msg = new MimeMessage(session);
            ;
            msg.setSubject("恒通商务 用户注册验证");  //"JavaMail测试"
            // 设置邮件内容
            msg.setText(reg_valid_key); //"这是一封由JavaMail发送的邮件！"
            // 设置发件人
            msg.setFrom(new InternetAddress(map.get("EMAIL_FROM")));//"fdqlbf@126.com"

            Transport transport = session.getTransport();
            // 连接邮件服务器
            transport.connect(map.get("EMAIL_USER"), map.get("EMAIL_UPSD")); //"email username", "email password1"
            // 发送邮件
            transport.sendMessage(msg, new Address[]{new InternetAddress(email)});//"snowfigure@126.com"
            // 关闭连接
            transport.close();

            user.set("reg_valid", reg_valid_key);
            user.set("email", email);
            user.update();
            renderJson("SUCCESS");
        } catch (Exception ex) {
//            ex.printStackTrace();
            renderJson("FALSE");
        }
    }

    public void validEmail() {


        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");
        User user = User.dao.findById(uid);
        if (null == user) {
            renderJson("ERROR_USER");
            return;
        }
        String reg_valid = user.get("reg_valid");
        if (null == reg_valid || "".equals(reg_valid)) {
            renderJson("GET_CODE");
            return;
        }
        if ("checked".equals(reg_valid)) {
            SecurityUtils.getSubject().logout();
            renderJson("SUCCESS");
            return;
        }
        String _reg_valid = getPara("valid_str");
        if (_reg_valid == null || "".equals(_reg_valid)) {
            renderJson("ERROR_CODE");
            return;
        }
        if (_reg_valid.equals(reg_valid)) {

            user.set("reg_valid","checked").update();
            SecurityUtils.getSubject().logout();
            renderJson("SUCCESS");
            return;
        } else {
            renderJson("ERROR_CODE");
            return;
        }
    }

}
