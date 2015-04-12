package org.htsw.config;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListenerAdapter;

/**
 * session过期处理
 *
 * @author SnowFigure {Orgin:風佑兲}
 * @date 2014年11月30日 下午4:41:01
 */
public class WebSessionListener extends SessionListenerAdapter {

    /**
     * seesion 结束时调用
     */
    @Override
    public void onStop(Session session) {
        super.onExpiration(session);
        session.removeAttribute(ShiroConfig.SHIRO_LOGIN_USER); // session结束，移除用户
    }

    /**
     * session过期处理
     */
    @Override
    public void onExpiration(Session session) {
        super.onExpiration(session);
        session.removeAttribute(ShiroConfig.SHIRO_LOGIN_USER); // 移除旧的session
    }

}
