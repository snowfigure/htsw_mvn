package org.htsw.controller.adminpage;

import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import com.sf.kits.easyui.DataGridJson;
import org.apache.commons.lang.StringUtils;
import org.htsw.Service.ApplyService;
import org.htsw.model.Apply;
import org.htsw.model.user.User_Contact;
import org.htsw.model.view.*;

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


    public void applyDetail() {
        setAttr("title", "申请信息详情");

        String _apply_id_ = getPara();
        try {
            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);

            System.err.println("apply_id:" + apply_id);
            Apply apply = Apply.me.findById(apply_id);
            int uid = apply.getInt("uid");

            String apply_detail_status = apply.getStr("apply_detail_status");
            String apply_detail_html = apply.getStr("apply_detail_html");

            //如果是历史存根，只能查看历史存根
            if("save".equals(apply_detail_status) && StringUtils.isNotEmpty(apply_detail_html)){//已经是历史存根了
                renderHtml(apply_detail_html);
                return;
            }



            setAttr("V_APPLY", VApplyShort.me.findByApplyID(apply_id));
            setAttr("V_USER_BANK", VUserBank.me.findByUid(uid));
            setAttr("V_USER_COMPANY", VUserCompany.me.findByUid(uid));
            setAttr("V_USER_ENTERPRISE", VUserEnterprise.me.findByUid(uid));
            setAttr("V_USER_HOUSE", VUserHouse.me.findByUid(uid));
            setAttr("V_USER_CAR", VUserCar.me.findByUid(uid));
            setAttr("V_USER_INFO", VUserInfo.me.findByUid(uid));
            setAttr("V_USER_CONTACT", User_Contact.me.findVByUid(uid));

            render("/WEB-INF/MEMBER_PAGE/member_apply_detail.ftl");
        } catch (Exception ex) {
            System.err.println(ex.toString());
            renderError(404);
        }

    }


}
