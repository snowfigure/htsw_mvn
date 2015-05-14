package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户申请信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VApplyShort extends Model<VApplyShort> {
    public static final VApplyShort me = new VApplyShort();

    public List<VApplyShort> getList(int uid) {
        return me.find("select * from v_apply where uid=? order by apply_time desc", uid);
    }

    public VApplyShort findByUid(int uid) {
        List<VApplyShort> list = me.find("select * from v_apply where uid=?", uid);
        if (list == null || list.size() <= 0) {
            return new VApplyShort();
        } else {
            return list.get(0);
        }
    }

    /**
     * 统计申请状态
     * @param uid  用户编号
     * @param status 申请状态
     * @return
     */
    public int countBYUidAndStatus(int uid, int status){
        List<VApplyShort> list = me.find("select * from v_apply where uid=? and status=?", uid,status);
        return list.size();
    }
}
