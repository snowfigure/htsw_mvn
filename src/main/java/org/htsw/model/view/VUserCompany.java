package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import org.htsw.util.HtswUtil;

import java.util.List;

/**
 * 用户申请VUserCompany信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserCompany extends Model<VUserCompany> {
    public static final VUserCompany me = new VUserCompany();

    public VUserCompany findByUid(int uid) {
        List<VUserCompany> list = me.find("select * from v_user_company where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new VUserCompany();
        } else {
            VUserCompany vUserCompany = list.get(0);

            String join_time = HtswUtil.timeFormatToCNStyle(vUserCompany.getStr("join_time"));
            vUserCompany.set("join_time", join_time);

            String company_telephone = HtswUtil.numberFormatToCNStyle(vUserCompany.getStr("company_telephone"));
            vUserCompany.set("company_telephone", company_telephone);

            return vUserCompany;
        }
    }
}
