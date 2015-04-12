package org.htsw.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 角色
 *
 * @author SnowFigure {Orgin:風佑兲}
 * @date 2014年11月30日 上午10:56:03
 */
public class Role extends Model<Role> {

    public static final Role dao = new Role();
    public static final String TABLE_NAME = "u_role";
    public static final String ID = "id";
    public static final String NAME = "name"; // 名称
    public static final String TYPE = "type"; // 角色类型 默认：0 后台角色：1
    public static final String REMARK = "remark"; // 备注
    public static final String SORT = "sort"; // 排序(不超过100)
    public static final String CREATE_TIME = "create_time"; // 创建时间
    public static final String ENABLE = "enable"; // 是否停用 默认：0 停用：1
    private static final long serialVersionUID = 7169089338395429694L;

    /**
     * 获取所有角色
     *
     * @return List<Role>
     */
    public List<Role> searchAll() {
        String sql = "SELECT * FROM u_role ORDER BY sort ASC, id DESC";
        return find(sql);
    }

}
