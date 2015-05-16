package org.htsw.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.time.TimeUtil;

import java.util.Date;
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

    /**
     * 根据状态查看申请信息有多少条
     * 1：等待处理；2：业务员处理中；3：管理员处理中；4：处理完毕
     * @param status
     * @return
     */
    public int countDealByDealStatus(int status){
        List<Apply> list = me.find("select id from apply where deal_status=?",status);
        return list.size();
    }
    /**
     * 根据状态查看申请信息有多少条
     * 1：审核未通过；2：等待资料审核；3：等待面签；4：等待资金发放
     * @param status
     * @return
     */
    public int countByStatus(int status){
        List<Apply> list = me.find("select id from apply where status=?",status);
        return list.size();
    }
    public int coutTodayWait(){
        Date date = new Date();
        String _time = TimeUtil.format(date,"yyyy-MM-dd") + " 00:00:00";
        List<Apply> list = me.find("select id from apply where status=2 and apply_time>'" + _time + "'");
        return list.size();
    }

    public int countByStatusAndEid(int eid , int status){
        List<Apply> list = me.find("select id from apply where deal_uid=? and status=?",eid,status);
        return list.size();
    }

    public int countDealTotalByEid(int eid){
        List<Apply> list = me.find("select id from apply where deal_uid=?",eid);
        return list.size();
    }





}
