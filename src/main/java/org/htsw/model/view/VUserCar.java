package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import org.htsw.util.HtswUtil;

import java.util.List;

/**
 * 用户申请VUserHouse信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserCar extends Model<VUserCar> {
    public static final VUserCar me = new VUserCar();

    public VUserCar findByUid(int uid) {
        List<VUserCar> list = me.find("select * from v_user_car where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new VUserCar();
        } else {
            VUserCar vUserCar = list.get(0);
            String hbt = (vUserCar.get("buy_time").toString().split("-"))[0] + "&nbsp;&nbsp;年";
            vUserCar.set("buy_time", hbt);

            int type = vUserCar.get("have_car_type");
            if (type != 1) {
                String car_type = vUserCar.get("intro");
                double money = vUserCar.get("buy_total_loan");
                String result = String.format(car_type, "" + money);
                vUserCar.set("intro", result);
            }

            return vUserCar;
        }
    }
}
