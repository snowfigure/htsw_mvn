package org.htsw.model.view;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import org.htsw.util.HtswUtil;

import java.util.List;

/**
 * VUserInfoAdmin信息视图
 * Created by snowfigure on 2015/5/1.
 */
public class VUserInfoAdmin extends Model<VUserInfoAdmin> {
    public static final VUserInfoAdmin me = new VUserInfoAdmin();

    public Page<VUserInfoAdmin> paginate(int rows,int page)
    {
        return me.paginate(page, rows, "select * ",
                " from v_userinfo_admin")  ;
    }
}
