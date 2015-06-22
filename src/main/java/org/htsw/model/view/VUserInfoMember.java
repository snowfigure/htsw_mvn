package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * VUserInfoAdmin信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserInfoMember extends Model<VUserInfoMember> {
    public static final VUserInfoMember me = new VUserInfoMember();

    public Page<VUserInfoMember> paginate(int rows,int page,String search)
    {
        return me.paginate(page, rows, "select * ",
                " from v_userinfo_member " + search)  ;
    }
    public int coutSize(){
        return me.find("select id from v_userinfo_member").size();
    }

    public int countUnChecked(){
        return me.find("select id from v_userinfo_member where reg_valid is null or reg_valid <> 'checked'").size();
    }

    public int countCheckedAndNotApply(){
        return me.find("SELECT id FROM v_userinfo_member vum WHERE vum.reg_valid = 'checked' AND vum.id NOT IN ( SELECT DISTINCT a.uid FROM apply a )").size();
    }
    public int countCheckedAndApply(){
        return me.find("SELECT id FROM v_userinfo_member vum WHERE vum.reg_valid = 'checked' AND vum.id IN ( SELECT DISTINCT a.uid FROM apply a )").size();
    }

}
