package org.htsw.controller.employee;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Page;
import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import com.sf.kits.coder.MD5;
import com.sf.kits.time.TimeUtil;
import org.apache.shiro.SecurityUtils;
import org.htsw.config.ManagerInterceptor;
import org.htsw.config.ShiroConfig;
import org.htsw.model.Apply;
import org.htsw.model.ApplyLog;
import org.htsw.model.User;
import org.htsw.model.user.User_Contact;
import org.htsw.model.view.*;

import java.util.ArrayList;
import java.util.Date;

@Before(ManagerInterceptor.class)
public class EmployeePageIndexController extends EmployeeController {
    public void index() {
        setAttr("title", "业务员管理 - 首页");
        setAttr("pageFlag", "index");

        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");

        setAttr("WAIT_TOTAL", Apply.me.countByStatus(2));
        setAttr("WAIT_TOTAL_TODAY", Apply.me.coutTodayWait());
        setAttr("EMPLOYEE_DEAL_TOTAL", Apply.me.countDealTotalByEid(uid));
        setAttr("EMPLOYEE_DEAL_1", Apply.me.countByStatusAndEid(uid, 1));
        setAttr("EMPLOYEE_DEAL_2", Apply.me.countByStatusAndEid(uid, 2));
        setAttr("EMPLOYEE_DEAL_3", Apply.me.countByStatusAndEid(uid, 3));
        setAttr("EMPLOYEE_DEAL_4", Apply.me.countByStatusAndEid(uid, 4));
        setAttr("EMPLOYEE_DEAL_5", Apply.me.countByStatusAndEid(uid, 5));
        setAttr("EMPLOYEE_DEAL_6", Apply.me.countByStatusAndEid(uid, 6));
        setAttr("EMPLOYEE_DEAL_7", Apply.me.countByStatusAndEid(uid, 7));


        render("/WEB-INF/EMPLOYEE_PAGE/employee_index.ftl");
    }

    public void password() {
        setAttr("title", "修改密码");
        setAttr("pageFlag", "password");
        render("/WEB-INF/EMPLOYEE_PAGE/employee_password.ftl");
    }

    public void updatePsd() {
        String pre_password = getPara("pre_password");
        String new_password = getPara("new_password");
        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        pre_password = MD5.getMD5ofStr(pre_password).toLowerCase();
        String psd = loginUser.get("password");

        if (!psd.equals(pre_password)) {
            renderText("ERROR");
            return;
        }
        new_password = MD5.getMD5ofStr(new_password).toLowerCase();

        loginUser.set("password", new_password);
        renderText(loginUser.update() + "");
    }

    public void deal() {
        setAttr("title", "业务员管理 - 处理中心");
        setAttr("pageFlag", "deal");
        Page<VApplyShort> page = VApplyShort.me.paginate(getParaToInt(0, 1), 10);

        setAttr("V_APPLY_SHORT_LIST", page.getList());
        setAttr("currentPage", page.getPageNumber());
        setAttr("totalPage", page.getTotalPage());
        render("/WEB-INF/EMPLOYEE_PAGE/employee_deal.ftl");
    }

    public void dealLog() {
        setAttr("title", "业务员管理 - 处理中心");
        setAttr("pageFlag", "dealLog");

        User loginUser = (User) SecurityUtils.getSubject().
                getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
        int uid = loginUser.getInt("id");

        int _status = getParaToInt(0, 0);
        int _pageSize = getParaToInt(1, 1);

        Page<VApplyShort> page = VApplyShort.me.paginate(_pageSize, 10, _status, uid);

        setAttr("V_APPLY_SHORT_LIST", page.getList());
        setAttr("currentPage", page.getPageNumber());
        setAttr("totalPage", page.getTotalPage());
        setAttr("STATUS", _status);

        render("/WEB-INF/EMPLOYEE_PAGE/employee_deaLog.ftl");
    }

    public void applyChangeStatus() {
        String _apply_id_ = getPara("_apply_id_");
        String deal_log = getPara("deal_log");
        int diff = getParaToInt("diff", Integer.MIN_VALUE);
        try {
            User loginUser = (User) SecurityUtils.getSubject().
                    getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = loginUser.getInt("id");

            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);
            Apply apply = Apply.me.findById(apply_id);
            int status = apply.get("status");

            ApplyLog applyLog = new ApplyLog();
            applyLog.set("apply_id",apply_id);
            applyLog.set("deal_uid",uid);
            applyLog.set("deal_time", TimeUtil.format2(new Date()));
            applyLog.set("deal_log",getPara("deal_log"));



            if (apply == null) {
                renderText("此申请单已经不存在，有可能是管理员删除了此申请单。");
                return;
            }
            int _uid = apply.getInt("deal_uid");
            if (uid != _uid) {
                renderText("此申请单不是您进行处理的，请勿非法操作，谢谢合作。");
                return;
            }
            if (diff == Integer.MIN_VALUE) {
                renderText("非法操作，请勿尝试，谢谢合作。");
                return;
            }

            if(diff==0){
                apply.set("status", 1);
                boolean flag = apply.update();
                if (flag) {
                    applyLog.save();
                    renderText("更改状态成功，页面将重新刷新，请稍后。");
                    return;
                } else {
                    renderText("更改状态失败，请联系管理人员查看具体原题，谢谢合作。");
                    return;
                }
            }

            if(diff==-2){
                if (status == 1) {
                    apply.set("status", 2);
                    boolean flag = apply.update();
                    if (flag) {
                        applyLog.save();
                        renderText("更改状态成功，页面将重新刷新，请稍后。");
                        return;
                    } else {
                        renderText("更改状态失败，请联系管理人员查看具体原题，谢谢合作。");
                        return;
                    }
                }else{
                    renderText("非法操作，请勿尝试，谢谢合作。");
                    return;
                }
            }

            if (status > 6 || status < 2 || (status == 2 && diff == -1)) {
                renderText("非法操作，请勿尝试，谢谢合作。");
                return;
            }

            status = status + diff;
            apply.set("status", status);
            boolean flag = apply.update();
            if (flag) {
                applyLog.save();
                renderText("更改状态成功，页面将重新刷新，请稍后。");
                return;
            } else {
                renderText("更改状态失败，请联系管理人员查看具体原题，谢谢合作。");
                return;
            }
        } catch (Exception ex) {
            if (diff == Integer.MIN_VALUE) {
                renderText("非法操作，请勿尝试，谢谢合作。");
                return;
            }
        }
    }

    public void applyDeal() {
        setAttr("title", "业务处理");

        String _apply_id_ = getPara(0);

        try {
            User loginUser = (User) SecurityUtils.getSubject().
                    getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = loginUser.getInt("id");

            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);
            Apply apply = Apply.me.findById(apply_id);
            if (apply == null) {
                renderError(404);
                return;
            }
            int _uid = apply.getInt("deal_uid");
            if (uid != _uid) {
                renderError(404);
                return;
            }


            int status = apply.getInt("status");
            setAttr("_apply_id_", _apply_id_);
            setAttr("status", status);
            render("/WEB-INF/EMPLOYEE_PAGE/employee_applyDeal.ftl");
        } catch (Exception ex) {
            System.err.println(ex.toString());
            renderError(404);
        }


    }

    public void applyTake(){
        String _apply_id_ = getPara("apply_id");
        try {
            User loginUser = (User) SecurityUtils.getSubject().
                    getSession().getAttribute(ShiroConfig.SHIRO_LOGIN_USER);
            int uid = loginUser.getInt("id");


            int eid_total_allpy = Apply.me.countByStatusAndEid(uid, 2) ;
            if(eid_total_allpy>=1){
                renderText("<span style='color:red'>失败：</span>无法接受此申请单：您有至少一笔申请单还未审核资料，请您先审核资料。");
                return;
            }

            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);

            System.err.println("apply_id:" + apply_id);
            Apply apply = Apply.me.findById(apply_id);
            try{
                int deal_uid = apply.getInt("deal_uid");
                if(deal_uid!=uid){
                    renderText("<span style='color:red'>失败：</span>无法接受此申请单：此申请单已经被其它业务员接手，请刷新页面后选择其它申请单。");
                } else{
                    renderText("false");
                }
                return;
            }
            catch (Exception ex){
                System.err.println(ex.toString());
                apply.set("deal_uid",uid);
                apply.update();
                renderText("true");
                return;
            }




        } catch (Exception ex) {
            System.err.println(ex.toString());
            renderText("<span style='color:red'>失败：</span>无法接受此申请单：申请单编号错误，请联系管理员。");
        }
    }

    public void getApplyLog(){

        try {
            String _apply_id_ = getPara();
            System.out.println("_apply_id_:" + _apply_id_);

            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);

            System.out.println("apply_id:" + apply_id);

            renderJson(VApplyLog.me.getLogList(apply_id));

        } catch (Exception ex) {
            System.err.println(ex.toString());
            renderJson(new ArrayList<VApplyLog>());
        }
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
