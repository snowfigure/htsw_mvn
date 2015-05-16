package org.htsw.controller.member;


import com.jfinal.aop.Before;
import com.jfinal.kit.JsonKit;
import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import com.sf.kits.time.TimeUtil;
import org.apache.shiro.SecurityUtils;
import org.htsw.config.ManagerInterceptor;
import org.htsw.config.ShiroConfig;
import org.htsw.model.Apply;
import org.htsw.model.ApplyLog;
import org.htsw.model.User;
import org.htsw.model.user.*;

import java.text.SimpleDateFormat;
import java.util.Date;

@Before(ManagerInterceptor.class)
public class MemberPageUserEditController extends MemberController {


    public void saveApply() {
        try {
            User loginUser = (User) SecurityUtils.getSubject().
                    getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = loginUser.getInt("id");
            keepModel(Apply.class);
            Apply apply = getModel(Apply.class);

            if (apply.get("id") == null) {
                apply.set("uid", uid);
                Date now = new Date();
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
                String apply_time = dateFormat.format(now);
                apply.set("apply_time", apply_time);
                apply.save();

                ApplyLog applyLog = new ApplyLog();
                applyLog.set("deal_log", "用户贷款申请。");
                applyLog.set("deal_time", apply_time);
                applyLog.set("apply_id",apply.get("id"));
                applyLog.save();
            }
            int apply_id = apply.get("id");

            String _des = DesUtil.encrypt(apply_id + "");
            String _base64 = Base64.getBase64(_des);
            String APPLY_ID = _base64.replaceAll("/+", "@").replaceAll("//", "#").replaceAll("=", "$");
            apply.set("_apply_id_", APPLY_ID);
            renderText(apply.update() + "");
        } catch (Exception ex1) {
            renderText("false");
        }

    }

    /**
     * 更新用户基本信息
     */
    public void userInfo() {
        try {
            keepModel(User_Info.class);
            User_Info user_info = getModel(User_Info.class);
//       System.out.println(JsonKit.toJson(user_info));
            renderText(user_info.update() + "");
        } catch (Exception ex) {
            renderText("false");
        }

    }

    /**
     * 更新用户银行、征信信息
     */
    public void userBank() {
        try {
            keepModel(User_Bank.class);
            User_Bank user_bank = getModel(User_Bank.class);
//        System.out.println(JsonKit.toJson(user_bank));
            renderText(user_bank.update() + "");
        } catch (Exception ex) {
            renderText("false");
        }

    }

    /**
     * 更新用户房产、车辆信息
     */
    public void userHouseCar() {
        try {
            keepModel(User_House.class);
            User_House user_house = getModel(User_House.class);
//        System.out.println(JsonKit.toJson(user_house));

            keepModel(User_Car.class);
            User_Car user_car = getModel(User_Car.class);
//        System.out.println(JsonKit.toJson(user_car));
            renderText((user_house.update() && user_car.update()) + "");
        } catch (Exception ex) {
            renderText("false");
        }

    }

    /**
     * 更新用户工作信息
     */
    public void userCompany() {
        try {
            keepModel(User_Company.class);
            User_Company user_company = getModel(User_Company.class);
            renderText(user_company.update() + "");
        } catch (Exception ex) {
            renderText("false");
        }

    }

    /**
     * 更新用户公司信息（私人企业主）
     */
    public void userEnterprise() {
        try {
            keepModel(User_Enterprise.class);
            User_Enterprise user_enterprise = getModel(User_Enterprise.class);
            renderText(user_enterprise.update() + "");
        } catch (Exception ex) {
            renderText("false");
        }

    }

    /**
     * 更新用户的联系人信息
     */
    public void userContact() {
        try {
            keepModel(User_Contact.class);
            User_Contact user_contact = getModel(User_Contact.class);

            renderText(user_contact.update() + "");
        } catch (Exception ex) {
            renderText("false");
        }

    }
}
