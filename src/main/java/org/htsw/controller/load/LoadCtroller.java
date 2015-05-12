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
    public void ProvinceJSON() {
        renderJson(ChinaArea.me.getProvince());
    }

    /**
     * 根据省份编号获取城市列表
     */
    public void CityJSON() {
        System.out.println("Loading。。。");
        int pid = getParaToInt(0, -1);
        if (pid == -1) {
            renderText("ERROR");
        } else {
            renderJson(ChinaArea.me.getCity(pid));
        }
    }

    /**
     * 根据省份编号获取城市列表
     */
    public void TownJSON() {
        int cid = getParaToInt(0, -1);
        if (cid == -1) {
            renderText("ERROR");
        } else {
            renderJson(ChinaArea.me.getTown(cid));
        }
    }

    /**
     * 婚姻状况
     */
    public void MarryStatusJSON() {
        renderJson(TypeMarryStatus.me.find("select * from apply_marry_status_type"));
    }

    /**
     * 学历状况
     */
    public void DegreeTypeJSON() {
        renderJson(TypeDegree.me.find("select * from apply_degree_type"));
    }

    /**
     * 房产类型
     */
    public void HouseTypeJSON() {
        renderJson(TypeHouse.me.find("select * from apply_house_type"));
    }

    /**
     * 公司所属行业
     */
    public void CompanyBelongJSON() {
        renderJson(TypeCompanyBelong.me.find("select * from apply_company_belong_type"));
    }

    /**
     * 公司类型
     */
    public void CompanyTypeJSON() {
        renderJson(TypeCompany.me.find("select * from apply_company_type"));
    }

    /**
     * 职位类型
     */
    public void JobTypeJSON() {
        renderJson(TypeJob.me.find("select * from apply_job_type"));
    }

    /**
     * 性别类型
     */
    public void GenderTypeJSON() {
        renderJson(TypeGender.me.find("select * from apply_gender_type"));
    }

    /**
     * 车辆购买方式
     */
    public void CarBuyTypeJSON() {
        renderJson(TypeCarBuy.me.find("select * from apply_car_buy_type"));
    }

    /**
     * 工资发放形式
     */
    public void SalaryGiveTypeJSON() {
        renderJson(TypeSalaryGive.me.find("select * from apply_salary_give_type"));
    }

    /**
     * 个企类型
     */
    public void EnterpriseTypeJSON() {
        renderJson(TypeEnterprise.me.find("select * from apply_enterprise_type"));
    }

    /**
     * 个企经营场所类型
     */
    public void EnterprisePlaceTypeJSON() {
        renderJson(TypeEnterprisePlace.me.find("select * from apply_enterprise_place_type"));
    }

    /**
     * 贷款 使用周期
     */
    public void UseTimeTypeJSON() {
        renderJson(TypeUseTime.me.find("select * from apply_use_time_type"));
    }

    /**
     * 贷款使用的用途
     */
    public void TypeUseForTypeJSON() {
        renderJson(TypeUseFor.me.find("select * from apply_use_for_type"));
    }

    /**
     * 贷款的还款方式
     */
    public void PayWayTypeJSON() {
        renderJson(TypePayWay.me.find("select * from apply_pay_way"));
    }

    /**
     * 贷款类型
     */
    public void ProductTypeJSON() {
        renderJson(TypeProduct.me.find("select * from apply_product_type"));
    }
}
