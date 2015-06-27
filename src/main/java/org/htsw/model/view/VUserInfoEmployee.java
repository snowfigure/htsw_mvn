package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * VUserInfoAdmin信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserInfoEmployee extends Model<VUserInfoEmployee> {
    public static final VUserInfoEmployee me = new VUserInfoEmployee();

    public Page<VUserInfoEmployee> paginate(int rows,int page,String search)
    {
        return me.paginate(page, rows, "select * ",
                " from v_userinfo_employee " + search)  ;
    }
    public int coutSize(){
        return me.find("select id from v_userinfo_employee").size();
    }
}
