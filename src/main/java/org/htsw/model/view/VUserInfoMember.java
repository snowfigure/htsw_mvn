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
}
