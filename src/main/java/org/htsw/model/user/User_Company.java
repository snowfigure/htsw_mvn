package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户User_Company信息详情表
 * Created by snowfigure on 2015/5/1.
 */
public class User_Company extends Model<User_Company> {
    public static final User_Company me = new User_Company();

    public User_Company findByUid(int uid) {
        List<User_Company> list = me.find("select * from user_company where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_Company();
        } else {
            return list.get(0);
        }
    }
}
