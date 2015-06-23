package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

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
    public VApplyShort findByApplyID(int apply_id) {
        List<VApplyShort> list = me.find("select * from v_apply where id=?", apply_id);
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

    /**
     * 查询所有没有接手进行审核的贷款请求
     * @param pageNumber
     * @param pageSize
     * @return
     */
    public Page<VApplyShort> paginate(int pageNumber, int pageSize){
        return paginate(pageNumber, pageSize,
                "select * ",
                "from v_apply where deal_uid = 9 order by apply_time");
    }

    public Page<VApplyShort> paginate(int pageNumber, int pageSize , int status ,int deal_uid){
        if(status == 0)
        {
            return paginate(pageNumber,pageSize,
                    "select * ",
                    "from v_apply where deal_uid =? order by apply_time",deal_uid);
        }
        else
        {
            return paginate(pageNumber,pageSize,
                    "select * ",
                    "from v_apply where deal_uid =? and status=? order by apply_time",deal_uid,status);
        }
    }
}
