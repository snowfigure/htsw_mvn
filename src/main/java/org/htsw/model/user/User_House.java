package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户House信息详情表
 * Created by snowfigure on 2015/5/1.
 */
public class User_House extends Model<User_House>{
    public static final User_House me = new User_House();

    public User_House findByUid(int uid) {
        List<User_House> list = me.find("select * from user_house where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_House();
        } else {
            return list.get(0);
        }
    }
}
