package org.htsw.Service;

import com.sf.kits.coder.Base64;
import com.sf.kits.coder.DesUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.htsw.config.ShiroConfig;
import org.htsw.model.Apply;
import org.htsw.model.User;
import org.htsw.model.user.User_Contact;
import org.htsw.model.view.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lisa-zlx on 2015/6/24.
 */
public class ApplyService {
    public static final List<VApplyLog> getApplyLog(String _apply_id_){
        try {
            System.out.println("_apply_id_:" + _apply_id_);

            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);

            System.out.println("apply_id:" + apply_id);

            return VApplyLog.me.getLogList(apply_id);

        } catch (Exception ex) {
            System.err.println(ex.toString());
            return new ArrayList<VApplyLog>();
        }
    }


    public static final int getApplyId(String _apply_id_){
        try {
            String _base64 = _apply_id_.replaceAll("@", "/+").replaceAll("#", "//").replaceAll("$", "=");
            String _des = Base64.getFromBase64(_base64);
            String _apply_id = DesUtil.decrypt(_des);
            int apply_id = new Integer(_apply_id);

            System.err.println("apply_id:" + apply_id);

            return apply_id;
        } catch (Exception ex) {
            return -1;
        }
    }


    public static final Map<String, Object> getApplyDetail( int apply_id , int uid){
        Map<String, Object> attrs = new HashMap<String, Object>();
        attrs.put("V_APPLY", VApplyShort.me.findByApplyID(apply_id));
        attrs.put("V_USER_BANK", VUserBank.me.findByUid(uid));
        attrs.put("V_USER_COMPANY", VUserCompany.me.findByUid(uid));
        attrs.put("V_USER_ENTERPRISE", VUserEnterprise.me.findByUid(uid));
        attrs.put("V_USER_HOUSE", VUserHouse.me.findByUid(uid));
        attrs.put("V_USER_CAR", VUserCar.me.findByUid(uid));
        attrs.put("V_USER_INFO", VUserInfo.me.findByUid(uid));
        attrs.put("V_USER_CONTACT", User_Contact.me.findVByUid(uid));
        return attrs;

    }

}
