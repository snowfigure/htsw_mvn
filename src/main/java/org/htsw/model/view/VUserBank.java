package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户申请VUserBank信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserBank extends Model<VUserBank> {
    public static final VUserBank me = new VUserBank();

    public VUserBank findByUid(int uid) {
        List<VUserBank> list = me.find("select * from v_user_bank where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new VUserBank();
        } else {
            return list.get(0);
        }
    }
}
