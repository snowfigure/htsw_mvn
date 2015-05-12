package org.htsw.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 用户申请表
 * Created by snowfigure on 2015/5/1.
 */
public class Apply extends Model<Apply> {
    public static final Apply me = new Apply();
    public static final int ShenHeZhong = 2;

    /**
     * 获取待审核的申请记录编号
     * 如果有待申请记录，则返回首条记录的编号
     * 如果没有待申请记录，则返回0
     *
     * @param uid
     * @return
     */
    public int findUnverify(int uid) {
        List<Apply> list = me.find("select * from apply where status=2 and uid=?", uid);
        if (list == null || list.size() <= 0) {
            return 0;
        } else {
            return list.get(0).getInt("id");
        }
    }

    /**
     * 判断 uid 和apply_id是否匹配
     *
     * @param uid
     * @param apply_id
     * @return
     */
    public boolean isChecked(int uid, int apply_id) {
        List<Apply> list = me.find("select * from apply where uid=? and id=?", uid, apply_id);
        return list != null && list.size() == 1;
    }
}
