package org.htsw.controller.member;


import com.jfinal.aop.Before;
import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import org.apache.shiro.SecurityUtils;
import org.htsw.config.ManagerInterceptor;
import org.htsw.config.ShiroConfig;
import org.htsw.model.Apply;
import org.htsw.model.User;
import org.htsw.model.user.*;
import org.htsw.model.view.*;

import java.util.List;

@Before(ManagerInterceptor.class)
public class MemberPageIndexController extends MemberController {
    public void index() {
        setAttr("title", "用户首页");
        setAttr("pageFlag", "index");
        render("/WEB-INF/MEMBER_PAGE/member_index.ftl");
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
        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");
        int Unverify = Apply.me.findUnverify(uid);
        setAttr("title", "申请");
        setAttr("pageFlag", "apply");

        setAttr("USER_CONTACT", User_Contact.me.findByUid(uid));

        if (Unverify == 0) {
            setAttr("USER_APPLY", new Apply());
            setAttr("USER_APPLY_SAVE", "申请贷款");
        } else {
            setAttr("USER_APPLY", Apply.me.findById(Unverify));
            setAttr("USER_APPLY_SAVE", "修改申请信息");
        }
        render("/WEB-INF/MEMBER_PAGE/member_apply.ftl");

    }

    public void applyLog() {
        setAttr("title", "申请记录");
        setAttr("pageFlag", "applyLog");
        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");
        List<VApplyShort> list = VApplyShort.me.getList(uid);
        setAttr("V_APPLY_SHORT_LIST", list);
        render("/WEB-INF/MEMBER_PAGE/member_applyLog.ftl");
//        renderJson(list);
    }

    public void applyDetail() {
        setAttr("title", "申请信息详情");

        String _apply_id_ = getPara();
        try {
            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);

            System.err.println("apply_id:" + apply_id);

            User loginUser = (User) SecurityUtils.getSubject().
                    getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = loginUser.getInt("id");

            //不匹配跳转404
            if (!Apply.me.isChecked(uid, apply_id)) {
                renderError(404);
                return;
            }

//            System.out.println(JsonKit.toJson(VApplyShort.me.findByUid(uid)));
//            System.out.println(JsonKit.toJson(VUserBank.me.findByUid(uid)));
//            System.out.println(JsonKit.toJson(VUserCompany.me.findByUid(uid)));
//            System.out.println(JsonKit.toJson(VUserEnterprise.me.findByUid(uid)));
//            System.out.println(JsonKit.toJson(VUserHouse.me.findByUid(uid)));
//            System.out.println(JsonKit.toJson(VUserInfo.me.findByUid(uid)));

            setAttr("V_APPLY", VApplyShort.me.findByUid(uid));
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
