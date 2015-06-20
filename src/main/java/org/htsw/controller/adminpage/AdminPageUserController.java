package org.htsw.controller.adminpage;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.coder.MD5;
import com.sf.kits.easyui.DataGridJson;
import org.apache.commons.lang.StringUtils;
import org.htsw.config.ManagerInterceptor;
import org.htsw.model.Article;
import org.htsw.model.RoleUser;
import org.htsw.model.User;
import org.htsw.model.user.*;
import org.htsw.model.view.VUserInfoAdmin;
import org.htsw.model.view.VUserInfoEmployee;
import org.htsw.model.view.VUserInfoMember;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Before(ManagerInterceptor.class)
public class AdminPageUserController extends AdminController {
    public void index() {
        String type = getPara("type", "admin");
        String cat = getPara("cat");
        setAttr("cat_id",cat);
        setAttr("cat", cat);
        setAttr("type", type);
        render("/WEB-INF/ADMIN_PAGE/USER/userInfo.ftl");
    }

    private String searchDeal(String user_uname,String user_name,String user_email){
        String search = "";
        if(StringUtils.isNotEmpty(user_uname)){
            search += String.format(" and username like  '%s' ","%" +user_uname + "%");
        }
        if(StringUtils.isNotEmpty(user_name)){
            search += String.format(" and realname like  '%s' ","%" +user_name + "%");
        }
        if(StringUtils.isNotEmpty(user_email)){
            search += String.format(" and email like  '%s' ","%" +user_email + "%");
        }


        return search;
    }

    /**
     * 用户管理（Admin）
     */
    public void admin(){
        int page = getParaToInt("page", 1);
        int rows = getParaToInt("rows", 10);

        String user_uname = getPara("user_uname", "");
        String user_name = getPara("user_name","");
        String user_email = getPara("user_email","");

        String search = searchDeal(user_uname,user_name,user_email);

        if(StringUtils.isNotEmpty(search)){
            search = " where 1=1 " + search;
        }

        System.out.println(search);

        Page<VUserInfoAdmin> nav_page = VUserInfoAdmin.me.paginate(rows,page, search);

        DataGridJson json = new DataGridJson();
        json.setRows(nav_page.getList());
        json.setTotal(nav_page.getTotalRow() + "");
        renderJson(json);
    }

    public void employee(){
        int page = getParaToInt("page", 1);
        int rows = getParaToInt("rows", 10);
        String cat = getPara("cat", "e_all");

        String user_uname = getPara("user_uname", "");
        String user_name = getPara("user_name", "");
        String user_email = getPara("user_email","");

        String search = searchDeal(user_uname,user_name,user_email);

        if ("e_disabled".equals(cat)) {
            search = " where enable=1 " + search;
        }
        if ("e_enable".equals(cat)) {
            search = " where enable=0 " + search;
        }

        if(StringUtils.isNotEmpty(search)){
            search = " where 1=1 " + search;
        }

        System.out.println(search);

        Page<VUserInfoEmployee> nav_page = VUserInfoEmployee.me.paginate(rows,page,search);
        List<VUserInfoEmployee> list = nav_page.getList();
        DataGridJson json = new DataGridJson();
        json.setRows(list);
        json.setTotal(nav_page.getTotalRow()+"");
        renderJson(json);
    }
    /**
     * 用户管理（ Employee用户）
     */
    public void employeeManager(){
        int uid = getParaToInt(0);
        String type = getPara(1, "");


        User user = User.dao.findById(uid);

        if(null == user || "".equals(type)){
            renderText("ERROR");
            return;
        }

        if("enable".equals(type)){
            user.set("enable",0).update();
            renderText("true");
            return;
        }
        if("disable".equals(type)){
            user.set("enable",1).update();
            renderText("true");
            return;
        }
        if("clear_psd".equals(type)){
            String orinPsd = "1234567890";
            String username = user.get("username");
            String psd = MD5.getMD5ofStr(orinPsd) + username;
            psd = MD5.getMD5ofStr(MD5.getMD5ofStr(psd));
            user.set("password",psd).update();
            renderText("true");
            return;
        }

        renderText("ERROR");
    }

    /**
     * 用户管理（Member用户）
     */
    public void member(){
        int page = getParaToInt("page", 1);
        int rows = getParaToInt("rows", 10);

        String cat = getPara("cat", "m_all");

        String user_uname = getPara("user_uname", "");
        String user_name = getPara("user_name", "");
        String user_email = getPara("user_email","");

        String search = searchDeal(user_uname,user_name,user_email);


        if ("m_unchecked".equals(cat)) {
            search = "where reg_valid<>'checked' or reg_valid is null " + search;
        }
        if ("m_checked".equals(cat)) {
            search = "where reg_valid='checked' "  + search;
        }

        if(StringUtils.isNotEmpty(search)){
            search = " where 1=1 " + search;
        }

        System.out.println(search);

        Page<VUserInfoMember> nav_page = VUserInfoMember.me.paginate(rows,page,search);
        List<VUserInfoMember> list = nav_page.getList();
        DataGridJson json = new DataGridJson();
        json.setRows(list);
        json.setTotal(nav_page.getTotalRow()+"");
        renderJson(json);
    }


    /**
     * 新增业务员
     */
    public void employeeRegister() {

        String username = getPara("username", "");
        String realname = getPara("realname", "");
        String orinPsd = "1234567890";
        String psd = MD5.getMD5ofStr(orinPsd) + username;
        String password = MD5.getMD5ofStr(MD5.getMD5ofStr(psd));

        String email = getPara("email", "");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(realname) || StringUtils.isEmpty(email)) {
            renderText("用户名、邮箱或者真实姓名三者不可为空。");
            return;
        }
        User user = User.dao.findFirst("select * from user where username = ?", username);
        if (user != null) {
            renderText("该登录名已经存在，请更换另一个登录名。");
            return;
        }
        user = User.dao.findFirst("select * from user where email = ?", email);
        if (user != null) {
            renderText("邮箱已存在，请更换另一个邮箱。");
            return;
        }

        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式


        String reg_time = dateFormat.format(now);

        User newUser = new User();
        Boolean flag = newUser.set("username", username)
                .set("password", password)
                .set("name", realname)
                .set("email", email)
                .set("create_time", reg_time)
                .set("enable", 0)     //
                .set("delete_status", 0).save();

        //member用户的角色分配
        RoleUser newRoleUser = new RoleUser();
        newRoleUser.set("user_id", newUser.getInt("id"))
                .set("role_id", 3).save();



        renderText("" + flag);
    }

}
