package org.htsw.controller.load;

import com.jfinal.core.Controller;
import org.htsw.model.ChinaArea;
import org.htsw.model.type.TypeDegree;
import org.htsw.model.type.TypeHouse;
import org.htsw.model.type.TypeMarryStatus;

/**
 * Load ̨Controller
 * Created by snowfigure on 2015/4/11.
 */
public class LoadCtroller extends Controller {
    /**
     * 获取省份列表
     */
    public void ProvenceJSON()
    {
        renderJson(ChinaArea.me.getProvince());
    }

    /**
     * 根据省份编号获取城市列表
     */
    public void CityJSON()
    {
        int pid = getParaToInt(0,-1);
        if(pid==-1)
        {
            renderText("ERROR");
        }
        else
        {
            renderJson(ChinaArea.me.getCity(pid));
        }
    }

    /**
     * 根据省份编号获取城市列表
     */
    public void TownJSON()
    {
        int cid = getParaToInt(0,-1);
        if(cid==-1)
        {
            renderText("ERROR");
        }
        else
        {
            renderJson(ChinaArea.me.getTown(cid));
        }
    }

    public void MarryStatusJSON()
    {
        renderJson(TypeMarryStatus.me.find("select * from apply_marry_status_type"));
    }
    public void DegreeTypeJSON()
    {
        renderJson(TypeDegree.me.find("select * from apply_degree_type"));
    }
    public void HouseTypeJSON()
    {
        renderJson(TypeHouse.me.find("select * from apply_house_type"));
    }

}
