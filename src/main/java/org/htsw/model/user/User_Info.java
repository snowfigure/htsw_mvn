package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户信息详情表
 * Created by snowfigure on 2015/5/1.
 */
public class User_Info extends Model<User_Info> {
    public static final User_Info me = new User_Info();

    public User_Info findByUid(int uid) {
        List<User_Info> list = me.find("select * from user_info where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_Info();
        } else {
            return list.get(0);
        }
    }
}
