package org.htsw.config;

import java.util.HashMap;

/**
 * Shiro常用变量
 * Created by snowfigure on 2015/4/11.
 */
public class ShiroConfig {
    /** 文件上传目录 */

    /**
     * 图片文件
     */
    public static final String UPLOAD_IMAGE_DIR = "upload/images/";
    /**
     * 媒体文件
     */
    public static final String UPLOAD_MEDIA_DIR = "upload/medias/";
    /**
     * 其它文件
     */
    public static final String UPLOAD_FILE_DIR = "upload/files/";
    /**
     * 编辑器上传文件路径
     */
    public static final String UPLOAD_XHEDITOR_DIR = "upload/xhEditor";

    /** 缓存时间 */

    /**
     * 缓存时间 10分钟
     */
    public static final int CACHE_TIME_MINI = 60 * 10;
    /**
     * 缓存时间 30分钟
     */
    public static final int CACHE_TIME_MAX = 60 * 30;
    /**
     * Http缓存时间 一个月
     */
    public static final long HTTP_CACHE_TIME = 2592000L;

    public static final int PAGESIZE = 20; // 每页默认显示数
    public static final String DWZ_PAGE_NUMBER = "pageNum"; // dwz page number
    public static final String DWZ_PAGE_SIZE = "numPerPage"; // dwz page size


    public static final HashMap<Integer,String> loginHtmlMap = new HashMap<Integer, String>();
    static {
        loginHtmlMap.put(0,"<a href=\"login.html\">\n" +
                "                <input type=\"button\" value=\"登陆\">\n" +
                "            </a>\n" +
                "            <a href=\"register.html\">\n" +
                "                <input type=\"button\" value=\"注册\">\n" +
                "            </a>");
        loginHtmlMap.put(2,"<div style=\"padding: 20px\">\n" +
                "                <a href=\"/admin/index.html\">\n" +
                "                    <span style=\"\">系统管理（%s）</span>\n" +
                "                </a>\n" +
                "                <a href=\"/fpc/logout\" style=\"padding: 20px\">\n" +
                "                    <span >退出</span>\n" +
                "                </a>\n" +
                "            </div>");
        loginHtmlMap.put(3,"<div style=\"padding: 20px\">\n" +
                "                <a href=\"/employee/index.html\">\n" +
                "                    <span style=\"\">业务处理（%s）</span>\n" +
                "                </a>\n" +
                "                <a href=\"/fpc/logout\" style=\"padding: 20px\">\n" +
                "                    <span >退出</span>\n" +
                "                </a>\n" +
                "            </div>");
        loginHtmlMap.put(4," <div style=\"padding: 20px\">\n" +
                "                <a href=\"/member/index.html\">\n" +
                "                    <span style=\"\">%s</span>\n" +
                "                </a>\n" +
                "                <a href=\"/fpc/logout\" style=\"padding: 20px\">\n" +
                "                    <span >退出</span>\n" +
                "                </a>\n" +
                "            </div>");
    }


    //权限编号

    public static final int GUEST_ROLE = 0;
    /**
     * 管理员
     */
    public static final int ADMIN_ROLE = 2;
    /**
     * 业务员
     */
    public static final int EMPLOYEE_ROLE = 3;
    /**
     * 客户
     */
    public static final int MEMBER_ROLE = 4;

    // Shiro default
    /** */
    public static final String DEFAULT_AUTHENTICATION_QUERY = "SELECT * FROM user WHERE enable = '0'  AND username = ?";
    /** */
    public static final String DEFAULT_USER_ROLES_QUERY = "SELECT role_id FROM u_role_user WHERE user_id = ?";
    /**
     * 系统超级管理员默认获取全部角色
     */
    public static final String DEFAULT_ADMIN_ROLES_QUERY = "SELECT role_id FROM u_role_user";
    /** */
    public static final String DEFAULT_PERMISSIONS_QUERY = "SELECT resc_id FROM u_role_resc WHERE role_id = ?";
    /**
     * 系统超级管理员默认获取全部权限
     */
    public static final String DEFAULT_ADMIN_PERMISSIONS_QUERY = "SELECT id FROM u_resc";
    /**
     * 权限查看设置
     */
    public static final boolean PERMISSIONS_LOOKUP_ENABLED = true;

    // 系统默认常量
    /**
     * 管理员
     */
    public static final String SYSTEM_ADMINISTRATOR = "admin";
    /**
     * shiro seesion 保存登录用户
     */
    public static final String SHIRO_LOGIN_USER = "loginUser";
    /**
     * shiro seesion 保存登录日志
     */
    public static final String SHIRO_LOGIN_LOG = "loginLog";

    // 菜单项
    /**
     * 一级菜单
     */
    public static final String MENU_PARENT = "parent"; // 一级菜单
    /**
     * 二级及以下菜单
     */
    public static final String MENU_CHILDREN = "children"; // 二级及以下菜单
    /**
     * 菜单对应权限
     */
    public static final String MENU_PERMITTED = "permitted"; // 菜单对应权限

    // 登录异常
    /**
     * 登录信息填写不完整
     */
    public static final String INCOMPLETE_LOGIN_INFO = "登录信息填写不完整";
    /**
     * 验证码超时
     */
    public static final String TIMEOUT_CAPTCHA_EXCEPTION = "验证码超时!";
    /**
     * 验证码错误
     */
    public static final String INCORRECT_CAPTCHA_EXCEPTION = "验证码错误!";
    /**
     * 异常会话
     */
    public static final String UNKNOWN_SESSION_EXCEPTION = "异常会话!";
    /**
     * 账号错误
     */
    public static final String UNKNOWN_ACCOUNT_EXCEPTION = "账号错误!";
    /**
     * 密码错误
     */
    public static final String INCORRECT_CREDENTIALS_EXCEPTION = "密码错误!";
    /**
     * 账号已被锁定，请与系统管理员联系
     */
    public static final String LOCKED_ACCOUNT_EXCEPTION = "账号已被锁定，请与系统管理员联系!";
    /**
     * 用户登录超过限制数,请稍后再访问
     */
    public static final String EXCESSIVE_ATTEMPTS_EXCEPTION = "用户登录超过限制数,请稍后再访问！";
    /**
     * 您没有授权
     */
    public static final String AUTHENTICATION_EXCEPTION = "您没有授权!";
    /**
     * 登录成功
     */
    public static final String LOGIN_SUCCESS = "登录成功";
    /**
     * 身份异常
     */
    public static final String LOGINOUT_AUTHENTICATION_EXCEPTION = "身份异常!";

}
