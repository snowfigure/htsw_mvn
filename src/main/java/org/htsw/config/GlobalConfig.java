package org.htsw.config;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import org.htsw.model.*;
import org.htsw.route.AdminPageRoute;
import org.htsw.route.FrontPageRoute;

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
        me.add(new AdminPageRoute());
        me.add(new FrontPageRoute());
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
        arp.addMapping("u_resc", Resc.class);
        arp.addMapping("u_role", Role.class);
        arp.addMapping("u_role_resc", RoleResc.class);
        arp.addMapping("u_role_user", RoleUser.class);
        arp.addMapping("user", User.class);
        arp.addMapping("c_webconfig", WebConfig.class);
    }

    /**
     * 配置全局拦截器
     */
    @Override
    public void configInterceptor(Interceptors me) {
        // TODO Auto-generated method stub
        // 自定义未登录拦截
//		 me.add(new ManagerInterceptor());
        // 添加事物，对save、update和delete自动进行拦截
//		me.add(new TxByActionMethods( "save", "update", "delete" ));
    }

    /**
     * 配置处理器
     */
    @Override
    public void configHandler(Handlers me) {
        // TODO Auto-generated method stub
        me.add(new HtmlHandler());
    }

}
