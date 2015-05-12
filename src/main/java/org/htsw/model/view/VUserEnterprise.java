package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import org.htsw.util.HtswUtil;

import java.util.List;

/**
 * 用户申请VUserEnterprise信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserEnterprise extends Model<VUserEnterprise> {
    public static final VUserEnterprise me = new VUserEnterprise();

    public VUserEnterprise findByUid(int uid) {
        List<VUserEnterprise> list = me.find("select * from v_user_enterprise where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new VUserEnterprise();
        } else {
            VUserEnterprise vUserEnterprise = list.get(0);
            String establish_time = HtswUtil.timeFormatToCNStyle(vUserEnterprise.get("establish_time").toString());
            vUserEnterprise.set("establish_time", establish_time);

            String place_rent_endtime = HtswUtil.timeFormatToCNStyle(vUserEnterprise.get("place_rent_endtime").toString());
            vUserEnterprise.set("place_rent_endtime", place_rent_endtime);

            return vUserEnterprise;
        }
    }
}
