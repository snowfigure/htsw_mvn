package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户Bank信息详情表
 * Created by snowfigure on 2015/5/1.
 */
public class User_Bank extends Model<User_Bank>{
    public static final User_Bank me = new User_Bank();

    public User_Bank findByUid(int uid) {
        List<User_Bank> list = me.find("select * from user_bank where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_Bank();
        } else {
            return list.get(0);
        }
    }
}
