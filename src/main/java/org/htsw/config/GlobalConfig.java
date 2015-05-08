package org.htsw.config;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import org.htsw.controller.adminpage.AdminPageArticleController;
import org.htsw.controller.adminpage.AdminPageIndexController;
import org.htsw.controller.adminpage.AdminPageMenuController;
import org.htsw.controller.adminpage.AdminPageWebConfigController;
import org.htsw.controller.employee.EmployeePageIndexController;
import org.htsw.controller.frontpage.FrontPageIndexController;
import org.htsw.controller.frontpage.FrontPageLoginController;
import org.htsw.controller.load.LoadCtroller;
import org.htsw.controller.member.MemberPageUserEditController;
import org.htsw.controller.member.MemberPageIndexController;
import org.htsw.controller.ueditor.UeditorIndexController;
import org.htsw.model.*;
import org.htsw.model.type.*;
import org.htsw.model.user.*;

public class GlobalConfig extends JFinalConfig {
    /**
     * 配置常量
     */
    @Override
    public void configConstant(Constants me) {
        loadPropertyFile("a_little_config.txt");
        me.setDevMode(true);
    }

    /**
     * 配置路由
     */
    @Override
    public void configRoute(Routes me) {
//        me.add(new AdminPageRoute());
//        me.add(new FrontPageRoute());
//        me.add(new MemberPageRoute());

        //游客0
        me.add("/", FrontPageIndexController.class);
        me.add("/fpc", FrontPageLoginController.class);
        me.add("/load", LoadCtroller.class);

        //管理员2
        me.add("/admin", AdminPageIndexController.class);
        me.add("/admin/menu", AdminPageMenuController.class);
        me.add("/admin/article", AdminPageArticleController.class);
        me.add("/admin/webconfig", AdminPageWebConfigController.class);

        //业务员3
        me.add("/employee", EmployeePageIndexController.class);

        //客户4
        me.add("/member", MemberPageIndexController.class);
        me.add("/member/userEdit", MemberPageUserEditController.class);
        //

        me.add("/ueditor", UeditorIndexController.class);
    }

    /**
     * 配置插件
     */
    @Override
    public void configPlugin(Plugins me) {


        // 配置C3p0数据库连接池插件
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
        me.add(c3p0Plugin);

        // 配置ActiveRecord插件
        ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
        me.add(arp);
        arp.addMapping("article", Article.class);
        arp.addMapping("china_areas", ChinaArea.class);
        arp.addMapping("u_resc", Resc.class);
        arp.addMapping("u_role", Role.class);
        arp.addMapping("u_role_resc", RoleResc.class);
        arp.addMapping("u_role_user", RoleUser.class);
        arp.addMapping("user", User.class);
        arp.addMapping("c_webconfig", WebConfig.class);


        arp.addMapping("apply_degree_type", TypeDegree.class);
        arp.addMapping("apply_marry_status_type", TypeMarryStatus.class);
        arp.addMapping("apply_house_type", TypeHouse.class);
        arp.addMapping("apply_company_belong_type", TypeCompanyBelong.class);
        arp.addMapping("apply_company_type", TypeCompany.class);
        arp.addMapping("apply_job_type", TypeJob.class);
        arp.addMapping("apply_gender_type", TypeGender.class);
        arp.addMapping("apply_car_buy_type", TypeCarBuy.class);
        arp.addMapping("apply_salary_give_type", TypeSalaryGive.class);
        arp.addMapping("apply_enterprise_type", TypeEnterprise.class);
        arp.addMapping("apply_enterprise_place_type", TypeEnterprisePlace.class);


        arp.addMapping("user_bank", User_Bank.class);
        arp.addMapping("user_car", User_Car.class);
        arp.addMapping("user_company", User_Company.class);
        arp.addMapping("user_contact", User_Contact.class);
        arp.addMapping("user_house", User_House.class);
        arp.addMapping("user_enterprise", User_Enterprise.class);
        arp.addMapping("user_info", User_Info.class);


    }

    /**
     * 配置全局拦截器
     */
    @Override
    public void configInterceptor(Interceptors me) {

    }

    /**
     * 配置处理器
     */
    @Override
    public void configHandler(Handlers me) {

        me.add(new HtmlHandler());
    }

}
