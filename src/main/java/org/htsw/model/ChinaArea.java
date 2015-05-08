package org.htsw.model;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

/**
 * 行政区域划分
 * Created by snowfigure on 2015/4/26.
 */
public class ChinaArea extends Model<ChinaArea> {
    private final static String ID = "id";
    private final static String PARENT_ID = "parent_id";
    private final static String AREA_NAME = "area_name";
    private final static String ZIP_CODE = "zipcode";
    private final static int ROOT = 0;
    public final static ChinaArea me = new ChinaArea();

    /**
     * 获取省份列表
     *
     * @return 省份列表
     */
    public List<ChinaArea> getProvince() {
        return me.find("select * from china_areas where parent_id=?", ROOT);
    }

    /**
     * 获取城市列表
     *
     * @param pid 省份编号
     * @return 城市列表
     */
    public List<ChinaArea> getCity(int pid) {
        return me.find("select * from china_areas where parent_id=?", pid);
    }

    /**
     * 获取县区列表
     *
     * @param cid 城市编号
     * @return 县区列表
     */
    public List<ChinaArea> getTown(int cid) {
        return me.find("select * from china_areas where parent_id=?", cid);
    }
}
