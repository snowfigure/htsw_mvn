package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import org.htsw.util.HtswUtil;

import java.util.List;

/**
 * 用户申请VUserInfo信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserInfo extends Model<VUserInfo> {
    public static final VUserInfo me = new VUserInfo();

    public VUserInfo findByUid(int uid) {
        List<VUserInfo> list = me.find("select * from v_user_info where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new VUserInfo();
        } else {

            VUserInfo vUserInfo = list.get(0);
            String aat = HtswUtil.timeFormatToCNStyle(vUserInfo.get("address_arrive_time").toString());
            vUserInfo.set("address_arrive_time", aat);

            String cat = HtswUtil.timeFormatToCNStyle(vUserInfo.get("city_arrive_time").toString());
            vUserInfo.set("city_arrive_time", cat);

            String _format = "■有<u>&nbsp;&nbsp;%s&nbsp;&nbsp;</u>&nbsp;□无";
            String format = "□有<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>&nbsp;■无";

            String qq_number = vUserInfo.get("qq_number").toString();
            if (qq_number == null) {
                vUserInfo.set("qq_number", format);
            } else {
                vUserInfo.set("qq_number", String.format(_format, qq_number));
            }

            String wechat_number = vUserInfo.get("wechat_number").toString();
            if (wechat_number == null) {
                vUserInfo.set("wechat_number", format);
            } else {
                vUserInfo.set("wechat_number", String.format(_format, wechat_number));
            }

            String address_telephone = HtswUtil.numberFormatToCNStyle(vUserInfo.get("address_telephone").toString());
            vUserInfo.set("address_telephone", address_telephone);


            return vUserInfo;
        }
    }
}
