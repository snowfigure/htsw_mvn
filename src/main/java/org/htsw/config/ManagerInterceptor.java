package org.htsw.config;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.htsw.model.User;

/**
 * 简单的未登录拦截
 * 包括未登录的拦截、用户错误访问路径
 *
 * @author SnowFigure {Orgin:風佑兲}
 * @date 2014年11月30日 下午4:38:01
 */
public class ManagerInterceptor implements Interceptor {

    public void intercept(ActionInvocation ai) {
        System.out.println("Before action invoking");
        Controller controller = ai.getController();
        String uri = controller.getRequest().getRequestURI();
        System.out.println("uri:" + uri);
        // 获取shiro中的session
        Subject subject = SecurityUtils.getSubject();
        User loginUser = (User) subject.getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        // session为空
        if (null == loginUser) {
            controller.redirect("/login.html");
        } else {
            //根据URI的第一层简单过滤用户的请求
            int uid = loginUser.getInt("id");
            int role_id = User.dao.getUserRoleIDByUserID(uid);
            System.out.println("User Has Login the System:role_id" + role_id);
            if (
                    (role_id == 2 && uri.startsWith("/admin/")) ||
                            (role_id == 3 && uri.startsWith("/employee/")) ||
                            (role_id == 4 && uri.startsWith("/member/"))
                             || (role_id == 2 && uri.startsWith("/assets/ueditor/jsp/"))
                    ) {
                ai.invoke();// 注意 一定要执行此方法
            } else {
                controller.redirect("/index.html");
            }


            // ai.invoke();// 注意 一定要执行此方法
        }
        System.out.println("After action invoking");
    }

}
