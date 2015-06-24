package org.htsw.controller.adminpage;

import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import com.sf.kits.easyui.DataGridJson;
import org.htsw.Service.ApplyService;
import org.htsw.model.Apply;
import org.htsw.model.view.VApplyDetail;
import org.htsw.model.view.VApplyLog;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by snowfigure on 2015/6/12.
 */
public class AdminPageApplyController extends AdminController  {
    public void index(){
        render("/WEB-INF/ADMIN_PAGE/APPLY/apply.ftl");
    }

    public void count(){

        setAttr("status_1",Apply.me.countByStatus(1));
        setAttr("status_2",Apply.me.countByStatus(2));
        setAttr("status_3",Apply.me.countByStatus(3));
        setAttr("status_4",Apply.me.countByStatus(4));
        setAttr("status_5",Apply.me.countByStatus(5));
        setAttr("status_6",Apply.me.countByStatus(6));
        setAttr("status_7",Apply.me.countByStatus(7));

        setAttr("type_2",Apply.me.countByProductType(2));
        setAttr("type_3",Apply.me.countByProductType(3));
        setAttr("type_4",Apply.me.countByProductType(4));
        setAttr("type_5",Apply.me.countByProductType(5));
        setAttr("type_6",Apply.me.countByProductType(6));
        setAttr("type_7",Apply.me.countByProductType(7));


        setAttr("money_0_1w",Apply.me.countByMoney(0, 10000.0)  );
        setAttr("money_1_5w",Apply.me.countByMoney(10000.0,50000.0)  );
        setAttr("money_5_10w",Apply.me.countByMoney( 50000.0,  100000.0)  );
        setAttr("money_10_20w",Apply.me.countByMoney( 100000.0, 200000.0)  );
        setAttr("money_20_50w",Apply.me.countByMoney( 200000.0, 500000.0)  );
        setAttr("money_50_100w",Apply.me.countByMoney(500000.0, 1000000.0)  );
        setAttr("money_100w",Apply.me.countByMoney(   1000000.0,Integer.MAX_VALUE *1.0 ));


        render("/WEB-INF/ADMIN_PAGE/APPLY/applyCount.ftl");
    }

    public void search(){
        int page = getParaToInt("page", 1);
        int rows = getParaToInt("rows", 1);
        int status =getParaToInt("status",0);
        String apply_user_name = getPara("apply_user_name", "");
        String deal_user_name = getPara("deal_user_name","");
        String start_time = getPara("start_time","");
        String end_time = getPara("end_time","");
        Page<VApplyDetail> VApplyPage = VApplyDetail.me.paginate(page, rows,
                status,
                apply_user_name, deal_user_name,
                start_time, end_time);

        DataGridJson json = new DataGridJson();
        json.setRows(VApplyPage.getList());
        json.setTotal(VApplyPage.getTotalRow() + "");
        renderJson(json);
    }

    public void getApplyLog(){

        String _apply_id_ = getPara();
        renderJson(ApplyService.getApplyLog(_apply_id_));

    }


}
