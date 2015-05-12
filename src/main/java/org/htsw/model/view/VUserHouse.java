package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import org.htsw.util.HtswUtil;

import java.util.List;

/**
 * 用户申请VUserHouse信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserHouse extends Model<VUserHouse> {
    public static final VUserHouse me = new VUserHouse();

    public VUserHouse findByUid(int uid) {
        List<VUserHouse> list = me.find("select * from v_user_house where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new VUserHouse();
        } else {
            VUserHouse vUserHouseCar = list.get(0);
            String hbt = HtswUtil.timeFormatToCNStyle(vUserHouseCar.get("buy_time").toString());
            vUserHouseCar.set("buy_time", hbt);

            return vUserHouseCar;
        }
    }
}
