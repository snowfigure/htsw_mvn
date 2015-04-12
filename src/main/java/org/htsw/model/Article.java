package org.htsw.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 角色
 *
 * @author SnowFigure {Orgin:風佑兲}
 * @date 2014年11月30日 上午10:56:03
 */
public class Article extends Model<Article> {

    public static final Article me = new Article();
    public static final String TABLE_NAME = "article";
    public static final String ID = "id"; // id
    public static final String TITLE = "title"; // 标题
    public static final String CONTENT = "content"; // 内容
    public static final String USER_ID = "user_id"; // user id
    public static final String SUPPORT = "support"; // 赞
    public static final String CLICK_COUNT = "click_count"; // 点击数
    public static final String TYPE = "type"; // 博客类型 默认：0（原创） 收藏：1
    public static final String SHARE_URL = "share_url"; // 收藏 url
    public static final String CREATE_TIME = "create_time"; // 添加时间
    public static final String UPDATE_TIME = "update_time"; // 更新时间
    public static final String DELETE_STATUS = "delete_status"; // 是否删除 默认：0
    private static final long serialVersionUID = 9055386396899161693L;
    // 删除：1

    /**
     * 根据文章编号获取文章内容
     *
     * @param id 文章编号
     * @return 文章内容
     */
    public Article getArticleByID(int id) {
        return me.findById(id);
    }

}
