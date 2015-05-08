package org.htsw.controller.load;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.ehcache.CacheInterceptor;
import org.htsw.model.ChinaArea;
import org.htsw.model.type.*;

/**
 * Load ̨Controller
 * Created by snowfigure on 2015/4/11.
 */
public class LoadCtroller extends Controller {
    /**
     * 获取省份列表
     */
    public void ProvinceJSON()
    {
        renderJson(ChinaArea.me.getProvince());
    }

    /**
     * 根据省份编号获取城市列表
     */
    public void CityJSON()
    {
        System.out.println("Loading。。。");
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

    public void CompanyBelongJSON() {
        renderJson(TypeCompanyBelong.me.find("select * from apply_company_belong_type"));
    }

    public void CompanyTypeJSON() {
        renderJson(TypeCompany.me.find("select * from apply_company_type"));
    }

    public void JobTypeJSON() {
        renderJson(TypeJob.me.find("select * from apply_job_type"));
    }

    public void GenderTypeJSON() {
        renderJson(TypeGender.me.find("select * from apply_gender_type"));
    }

    public void CarBuyTypeJSON() {
        renderJson(TypeCarBuy.me.find("select * from apply_car_buy_type"));
    }

    public void SalaryGiveTypeJSON() {
        renderJson(TypeSalaryGive.me.find("select * from apply_salary_give_type"));
    }

    public void EnterpriseTypeJSON() {
        renderJson(TypeEnterprise.me.find("select * from apply_enterprise_type"));
    }

    public void EnterprisePlaceTypeJSON() {
        renderJson(TypeEnterprisePlace.me.find("select * from apply_enterprise_place_type"));
    }

}
