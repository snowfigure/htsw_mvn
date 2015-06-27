package org.htsw.controller.frontpage;


import com.jfinal.kit.JsonKit;
import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import com.sf.kits.coder.MD5;
import com.sf.kits.mail.SimpleMailBean;
import com.sf.kits.mail.SimpleMailSendUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.config.ShiroConfig;
import org.htsw.controller.SystemCtroller;
import org.htsw.model.Apply;
import org.htsw.model.Article;
import org.htsw.model.User;
import org.htsw.model.user.User_Contact;
import org.htsw.model.view.*;
import org.htsw.util.StaticFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.List;
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

    public void forgetPsd(){
        setAttr("title", "找回密码");
        setAttr("pageFlag", "forgetPsd");
        render("/WEB-INF/FRONT_PAGE/forget_psd.ftl");
    }

    public void getUserRegEmail(){
        String username = getPara("username","");
        if(StringUtils.isEmpty(username.trim())){
            renderText("ERROR_USERNAME");
            return;
        }

        List<User> list = User.dao.find("select * from user where username = ?" , username);
        if(null == list || list.size()!=1){
            renderText("ERROR_USERNAME");
            return;
        }

        String email = list.get(0).getStr("email");
        int pos = email.indexOf("@");
        char start = email.charAt(0);
        char end = email.charAt(pos - 1);
        String _email = start + "****" + end + email.substring(pos,email.length());

        renderText(_email);
    }


    public void getForgetPsdEmailCode(){
        String username = getPara("username","");
        String email = getPara("email", "");
        if(StringUtils.isEmpty(username.trim())){
            renderText("ERROR_USERNAME");
            return;
        }

        List<User> list = User.dao.find("select * from user where username = ?", username);
        if(null == list || list.size()!=1){
            renderText("ERROR_USERNAME");
            return;
        }

        User user = list.get(0);
        String _email = user.getStr("email");

        if(!_email.equals(email.trim())){
            renderText("ERROR_EMAIL");
            return;
        }
        try {
            String time = (new Date()).getTime() + "";

            String _des = DesUtil.encrypt(time + "");
            String _base64 = Base64.getBase64(_des);
            String forget_psd_key = _base64.replaceAll("/+", "@").replaceAll("//", "#").replaceAll("=", "$");

            Map<String, String> map = StaticFactory.getSystemConfigMap();
//            System.out.println(JsonKit.toJson(map));


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
            msg.setSubject(map.get("mail_find_psd_title".toUpperCase()));  //"JavaMail测试"
            // 设置邮件内容
            msg.setText(map.get("mail_find_psd_text".toUpperCase()) + forget_psd_key); //"这是一封由JavaMail发送的邮件！"
            // 设置发件人
            msg.setFrom(new InternetAddress(map.get("EMAIL_FROM")));//"fdqlbf@126.com"

            Transport transport = session.getTransport();
            // 连接邮件服务器
            transport.connect(map.get("EMAIL_USER"), map.get("EMAIL_UPSD")); //"email username", "email password1"
            // 发送邮件
            transport.sendMessage(msg, new Address[]{new InternetAddress(email)});//"snowfigure@126.com"
            // 关闭连接
            transport.close();

            user.set("forget_valid", forget_psd_key);
            user.set("email", email);
            user.update();
            renderJson("SUCCESS");

        }
        catch(Exception ex){
            System.err.println(ex.toString());
            renderJson("FALSE");
        }
    }


    public void editPsd(){
        String username = getPara("username","");
        String email = getPara("email", "");
        String valid_str = getPara("valid_str", "");
        String password =  getPara("password", "");

        if(StringUtils.isEmpty(username.trim())){
            renderText("ERROR_USERNAME");
            return;
        }

        List<User> list = User.dao.find("select * from user where username = ?", username);
        if(null == list || list.size()!=1){
            renderText("ERROR_USERNAME");
            return;
        }

        User user = list.get(0);

        password = MD5.getMD5ofStr(password).toLowerCase();

        String forget_psd_key =  user.get("forget_valid");
        if(valid_str.equals(forget_psd_key)){
            user.set("password",password);
            user.set("forget_valid","");
            renderText("SUCCESS");
            return;
        }else{
            renderText("ERROR_VALID_STR");
            return;
        }


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

            Properties props = new Properties();
            // 开启debug调试
            props.setProperty("mail.debug", "true");
            // 发送服务器需要身份验证
            props.setProperty("mail.smtp.auth", "true");
            // 设置邮件服务器主机名
            props.setProperty("mail.host", map.get("EMAIL_HOST"));             //"smtp.126.com"
            // 发送邮件协议名称
            props.setProperty("mail.transport.protocol", "smtp");

//            Authenticator authenticator = new Authenticator("","") ;
            // 设置环境信息
            Session session = Session.getDefaultInstance(props);

            // 创建邮件对象
            Message msg = new MimeMessage(session);
            ;
            msg.setSubject(map.get("email_reg_title".toUpperCase()));  //"JavaMail测试"
            // 设置邮件内容
            msg.setText(map.get("email_reg_text".toUpperCase()) + reg_valid_key); //"这是一封由JavaMail发送的邮件！"
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
            ex.printStackTrace();
            System.err.println(ex.toString());
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


    //获取detail加密处理

    public void apperrlygetase64DeFromBtail() {
        setAttr("title", "申请信息详情");

        String _apply_id_ = getPara();
        try {
            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);

            System.err.println("apply_id:" + apply_id);
            Apply apply = Apply.me.findById(apply_id);
            int uid = apply.getInt("uid");


            setAttr("V_APPLY", VApplyShort.me.findByApplyID(apply_id));
            setAttr("V_USER_BANK", VUserBank.me.findByUid(uid));
            setAttr("V_USER_COMPANY", VUserCompany.me.findByUid(uid));
            setAttr("V_USER_ENTERPRISE", VUserEnterprise.me.findByUid(uid));
            setAttr("V_USER_HOUSE", VUserHouse.me.findByUid(uid));
            setAttr("V_USER_CAR", VUserCar.me.findByUid(uid));
            setAttr("V_USER_INFO", VUserInfo.me.findByUid(uid));
            setAttr("V_USER_CONTACT", User_Contact.me.findVByUid(uid));

            render("/WEB-INF/MEMBER_PAGE/member_apply_detail.ftl");
        } catch (Exception ex) {
            System.err.println(ex.toString());
            renderError(404);
        }

    }




}
