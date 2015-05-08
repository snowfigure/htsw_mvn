package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户User_Enterprise信息详情表
 * Created by snowfigure on 2015/5/1.
 */
public class User_Enterprise extends Model<User_Enterprise> {
    public static final User_Enterprise me = new User_Enterprise();

    public User_Enterprise findByUid(int uid) {
        List<User_Enterprise> list = me.find("select * from user_enterprise where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_Enterprise();
        } else {
            return list.get(0);
        }
    }
}
