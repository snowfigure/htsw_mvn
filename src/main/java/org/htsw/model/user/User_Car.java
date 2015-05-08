package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户Car信息详情表
 * Created by snowfigure on 2015/5/1.
 */
public class User_Car extends Model<User_Car> {
    public static final User_Car me = new User_Car();

    public User_Car findByUid(int uid) {
        List<User_Car> list = me.find("select * from user_car where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_Car();
        } else {
            return list.get(0);
        }
    }
}
