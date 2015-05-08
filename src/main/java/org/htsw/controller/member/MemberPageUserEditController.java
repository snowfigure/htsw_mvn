package org.htsw.controller.member;


import com.jfinal.aop.Before;
import com.jfinal.kit.JsonKit;
import org.htsw.config.ManagerInterceptor;
import org.htsw.model.user.*;

@Before(ManagerInterceptor.class)
public class MemberPageUserEditController extends MemberController {
    /**
     * 更新用户基本信息
     */
    public void userInfo()
   {
       keepModel(User_Info.class);
       User_Info user_info = getModel(User_Info.class);
//       System.out.println(JsonKit.toJson(user_info));
       renderText(user_info.update() + "");
   }
    /**
     * 更新用户银行、征信信息
     */
    public void userBank()
    {
        keepModel(User_Bank.class);
        User_Bank user_bank = getModel(User_Bank.class);
//        System.out.println(JsonKit.toJson(user_bank));
        renderText(user_bank.update() + "");
    }
    /**
     * 更新用户房产、车辆信息
     */
    public void userHouseCar()
    {
        keepModel(User_House.class);
        User_House user_house = getModel(User_House.class);
//        System.out.println(JsonKit.toJson(user_house));

        keepModel(User_Car.class);
        User_Car user_car = getModel(User_Car.class);
//        System.out.println(JsonKit.toJson(user_car));
        renderText((user_house.update() && user_car.update()) + "");
    }
    /**
     * 更新用户工作信息
     */
    public void userCompany()
    {
        keepModel(User_Company.class);
        User_Company user_company = getModel(User_Company.class);
        renderText(user_company.update() + "");
    }
    /**
     * 更新用户公司信息（私人企业主）
     */
    public void userEnterprise()
    {
        keepModel(User_Enterprise.class);
        User_Enterprise user_enterprise = getModel(User_Enterprise.class);
        renderText(user_enterprise.update() + "");
    }
    /**
     * 更新用户的联系人信息
     */
    public void userContact()
    {
        keepModel(User_Contact.class);
        User_Contact user_contact = getModel(User_Contact.class);

        renderText(user_contact.update() + "");
    }
}
