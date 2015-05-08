package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户User_Contact信息详情表
 * Created by snowfigure on 2015/5/1.
 */
public class User_Contact extends Model<User_Contact> {
    public static final User_Contact me = new User_Contact();

    public User_Contact findByUid(int uid) {
        List<User_Contact> list = me.find("select * from user_contact where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_Contact();
        } else {
            return list.get(0);
        }
    }
}
