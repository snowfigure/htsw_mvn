package org.htsw.model;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.coder.MD5;
import org.htsw.config.ShiroConfig;

import java.lang.reflect.Member;
import java.util.List;

/**
 * 用户
 *
 * @author SnowFigure {Orgin:風佑兲}
 * @date 2014年11月29日 下午10:54:28
 */
public class User extends Model<User> {

    private static final long serialVersionUID = 3412441464329317748L;
    public static final User dao = new User();

    public static final String TABLE_NAME = "user";

    public static final String ID = "id";
    public static final String USERNAME = "username"; // 登录账号
    public static final String PASSWORD = "password"; // 登录密码
    public static final String NICKNAME = "nickname"; // 昵称
    public static final String NAME = "name"; // 姓名
    public static final String SEX = "sex"; // 性别 默认：0（男） 女：1
    public static final String BIRTHDAY = "birthday"; // 生日
    public static final String HEAD_PHOTO_PATH = "head_photo_path"; // 头像
    public static final String SIGNATURE = "signature"; // 个性签名
    public static final String WEBSITE = "website"; // 个人网站
    public static final String TYPE = "type"; // 用户类型 默认：0（普通用户） 管理员：1
    public static final String LOGIN_STATUS = "login_status"; // 是否登录状态 默认：0
    // 在线：1
    public static final String CREATE_TIME = "create_time"; // 创建时间
    public static final String UPDATE_TIME = "update_time"; // 更新时间
    public static final String LAST_LOGIN_TIME = "last_login_time"; // 最后登录时间
    public static final String LAST_LOGIN_IP = "last_login_ip"; // 最后登录IP
    public static final String DELETE_STATUS = "delete_status"; // 删除状态 默认：0
    // 删除：1
    public static final String ENABLE = "enable"; // 是否停用 默认：1 停用：2





    public int getUserRoleIDByUserID(int uid) {
        User user = dao.findFirst(ShiroConfig.DEFAULT_USER_ROLES_QUERY, uid);
        if (null == user) {
            return -1;
        }
        return user.getInt("role_id");
    }
}
