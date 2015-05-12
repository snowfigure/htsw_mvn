package org.htsw.model.user;

import com.jfinal.plugin.activerecord.Model;
import org.htsw.util.HtswUtil;

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

    public User_Contact findVByUid(int uid) {
        List<User_Contact> list = me.find("select * from user_contact where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new User_Contact();
        } else {
            User_Contact user_contact = list.get(0);

            String spouse_company_telephone = HtswUtil.numberFormatToCNStyle(user_contact.get("spouse_company_telephone").toString());
            user_contact.set("spouse_company_telephone", spouse_company_telephone);

            String relative_house_telephone = HtswUtil.numberFormatToCNStyle(user_contact.get("relative_house_telephone").toString());
            user_contact.set("relative_house_telephone", relative_house_telephone);

            String workmate_company_telephone = HtswUtil.numberFormatToCNStyle(user_contact.get("workmate_company_telephone").toString());
            user_contact.set("workmate_company_telephone", workmate_company_telephone);

            String other_house_telephone = HtswUtil.numberFormatToCNStyle(user_contact.get("other_house_telephone").toString());
            user_contact.set("other_house_telephone", other_house_telephone);

            return user_contact;
        }
    }
}
