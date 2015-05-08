/**
 * 所有Select组件的预加载处理
 * Created by snowfigure on 2015/5/1.
 */

$(document).ready(function () {

    /**
     * 设置选中值
     * @param id  combobox的id
     */
    function setComboboxVal(id) {
        var value = $("[id='" + id + "']").attr("dataval");
        if (value != null && value != "undefined" && value != "null" && value != undefined) {
            $("[id='" + id + "']").val(value);
        }
        return value;
    }

    /**
     * 页面内Select加载公共组件
     * @param id
     * @param _url
     */
    function comboboxLoad(id, _url) {
        $.ajax({
            type: 'POST',
            url: _url,
            success: function (data) {
                var html = "<option value='-1'> - </option>";
                for (var i = 0; i < data.length; i++) {
                    html += "<option value='" + data[i].id + "'>" + data[i].name + "</option>";
                }
                $("[id='" + id + "']").html(html);
                setComboboxVal(id);
            }
        });
    }

    //加载婚姻状况
    comboboxLoad("user_Info.gender", "/load/GenderTypeJSON");
    //加载婚姻状况
    comboboxLoad("user_Info.marry_status_id", "/load/MarryStatusJSON");
    //加载学历分类
    comboboxLoad("user_Info.degree_id", "/load/DegreeTypeJSON");
    //房产类型
    comboboxLoad("user_House.type_id", "/load/HouseTypeJSON");

    //车辆购买类型
    comboboxLoad("user_Car.have_car_type", "/load/CarBuyTypeJSON");


    //加载单位性质
    comboboxLoad("user_Company.company_type_id", "/load/CompanyTypeJSON");
    //加载单位所属行业
    comboboxLoad("user_Company.company_belong_id", "/load/CompanyBelongJSON");
    //职位类别
    comboboxLoad("user_Company.job_type_id", "/load/JobTypeJSON");

    //职位类别
    comboboxLoad("user_Company.salary_give_type_id", "/load/SalaryGiveTypeJSON");
    //企业类别
    comboboxLoad("user_Enterprise.type_id", "/load/EnterpriseTypeJSON");
    //企业经营场所类别
    comboboxLoad("user_Enterprise.place_type_id", "/load/EnterprisePlaceTypeJSON");


    //省市县三级联动
    function chinaAreaChangeLoad(pid, cid, tid) {
        comboboxLoad(pid, "/load/ProvinceJSON");
        var _pid = setComboboxVal(pid);
        if (_pid != null) {
            comboboxLoad(cid, "/load/CityJSON/" + _pid);
            var _cid = setComboboxVal(cid);
            if (_cid != null) {
                comboboxLoad(tid, "/load/TownJSON/" + _cid);
                setComboboxVal(tid);
            }
        }


        $("[id='" + pid + "']").bind({
            'change': function () {
                var _pid = $("[id='" + pid + "']").val();
                comboboxLoad(cid, "/load/CityJSON/" + _pid);
                $("[id='" + tid + "']").html("<option value='-1'> - </option>");
                $("[id='" + cid + "']").bind({
                    'change': function () {
                        var _cid = $("[id='" + cid + "']").val();
                        comboboxLoad(tid, "/load/TownJSON/" + _cid);
                    }
                });
            }
        });

    }


    chinaAreaChangeLoad("user_Info.huji_province", "user_Info.huji_city", "user_Info.huji_town");
    chinaAreaChangeLoad("user_Info.address_province", "user_Info.address_city", "user_Info.address_town");
    chinaAreaChangeLoad("user_House.address_province", "user_House.address_city", "user_House.address_town");
    chinaAreaChangeLoad("user_Company.company_address_province", "user_Company.company_address_city", "user_Company.company_address_town");

});
