package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import org.htsw.util.HtswUtil;

import java.util.List;

/**
 * 用户申请处理日志
 * Created by snowfigure on 2015/5/1.
 */
public class VApplyLog extends Model<VApplyLog> {
    public static final VApplyLog me = new VApplyLog();

    public List<VApplyLog> getLogList(int apply_id){
        System.out.println("VApplyLog:apply_id:" + apply_id);
        return me.find("select * from v_apply_log where apply_id=? order by deal_time",apply_id);
    }

}
