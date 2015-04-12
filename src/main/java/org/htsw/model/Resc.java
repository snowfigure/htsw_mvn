package org.htsw.model;

import com.jfinal.plugin.activerecord.Model;
import com.sf.kits.easyui.TreeJson;
import com.sf.kits.easyui.TreeLeaf;
import com.sf.kits.easyui.TreeNode;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 权限
 *
 * @author SnowFigure {Orgin:風佑兲}
 * @date 2014年11月30日 上午10:42:50
 */
public class Resc extends Model<Resc> {

    public static final Resc me = new Resc();
    public static final String TABLE_NAME = "u_resc";
    public static final String ID = "id";
    public static final String PID = "pid"; // 父id
    public static final String NAME = "name"; // 名称
    public static final String LEVEL = "level"; // 层级(不超过10层)
    public static final String SORT = "sort"; // 排序(不超过100)
    public static final String REMARK = "remark"; // 备注
    public static final String TYPE = "type"; // 权限类型 默认：0 后台权限：1
    public static final String FUNCTION_TYPE = "function_type"; // 功能类型 从数据字典获得
    public static final String URL = "url"; // URL
    public static final String REL = "rel"; // DWZ定制(rel)
    public static final String TARGET = "target";
    public static final String WIDTH = "width";
    public static final String HEIGHT = "height";
    public static final String CREATE_TIME = "create_time"; // 创建时间
    public static final String ENABLE = "enable"; // 是否停用 默认：0 停用：1
    private static final long serialVersionUID = 672021427009956027L;
    static int root = 1;

    /**
     * 获取根节点
     *
     * @return
     */
    public static Resc getRoot() {
        return me.findById(1);
    }

    /**
     * 查找所有权限
     *
     * @return List<Resc>
     */
    public List<Resc> searchAll() {
        String sql = "SELECT * FROM u_resc WHERE enable = '0' ORDER BY level ASC, sort ASC";
        return find(sql);
    }

    /**
     * 获取二级节点
     *
     * @param pid
     * @return
     */
    public List<Resc> getSubMenu(Object pid) {
        return me.find("select * from u_resc where pid=? order by sort", pid);
    }


    /**
     * 后台菜单，只有两层，不是无限层次调用
     *
     * @return
     */
    public TreeJson generateMenu() {
        List<Object> menuJsonList = new ArrayList<Object>();

        List<Resc> rescList = me.getSubMenu(root);
        System.err.println(rescList.size());


        for (Resc resc : rescList) {
            int pid = resc.getInt("id");
            List<Resc> subuList = me.getSubMenu(pid);
            TreeNode treeNode = new TreeNode(pid + "", resc.getStr("name"));
            String iconCls = resc.getStr("iconCls");
            if (StringUtils.isNotEmpty(iconCls)) {
                treeNode.setIconCls(iconCls);
            } else {
                treeNode.setIconCls("");
            }
            if (subuList != null && subuList.size() > 0) {
                List<Object> children = new ArrayList<Object>();

                for (Resc sub : subuList) {
                    String _iconCls = sub.getStr("iconCls");
                    if (!StringUtils.isNotEmpty(iconCls)) {
                        _iconCls = "";
                    }
                    children.add(new TreeLeaf(
                            sub.get("id").toString(),
                            sub.getStr("name"),
                            sub.getStr("url"),
                            _iconCls
                    ));
                }
                treeNode.setChildren(children);
            }
            menuJsonList.add(treeNode);
        }
        System.out.println(menuJsonList.size());
        return new TreeJson(menuJsonList);
    }
}
