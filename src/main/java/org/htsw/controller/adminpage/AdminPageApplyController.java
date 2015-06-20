package org.htsw.controller.adminpage;

import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.easyui.DataGridJson;
import org.htsw.model.view.VApplyDetail;

import java.util.List;

/**
 * Created by snowfigure on 2015/6/12.
 */
public class AdminPageApplyController extends AdminController  {
    public void index(){
        render("/WEB-INF/ADMIN_PAGE/APPLY/apply.ftl");
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
}
