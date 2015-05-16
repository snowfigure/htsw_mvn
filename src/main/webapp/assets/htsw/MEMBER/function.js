/**
 * 通用代码
 * 所有Select组件的预加载处理
 * 保存按钮点击操作
 * 下拉框关联附加输入框操作
 * Created by snowfigure on 2015/5/9.
 */
$(document).ready(function () {

    /********************************************************************************************************/
    /*                                             保存按钮处理                                              */
    /********************************************************************************************************/
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
        if ($("[id='" + id + "']").length <= 0) {
            return;
        }
        $.ajax({
            type: 'POST',
            url: _url,
            success: function (data) {
                var html = "";
                //var html = "<option value='-1'> - </option>";
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


    //产品类型
    comboboxLoad("apply.product_id", "/load/ProductTypeJSON");
    //申请期限
    comboboxLoad("apply.use_time_id", "/load/UseTimeTypeJSON");
    //借款用途
    comboboxLoad("apply.use_for_id", "/load/TypeUseForTypeJSON");
    //还款方式
    comboboxLoad("apply.pay_way_id", "/load/PayWayTypeJSON");

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


    /********************************************************************************************************/
    /*                                       下拉框关联附加输入框操作                                          */
    /********************************************************************************************************/
    /**
     *
     * @param id    combobox 的id
     * @param idx   选中某条需要添加额外的信息
     * @param oid   额外输入框id
     */
    function comboboxClick(id, idx, oid) {
        $("[id='" + id + "']").bind({
            'click': function () {
                if ($(this).value == idx) {
                    $("[id='" + oid + "']").attr("readonly", "readonly");
                }
                else {
                    $("[id='" + oid + "']").removeAttr("readonly");
                }
            }
        });

    }


    /********************************************************************************************************/
    /*                                             保存按钮处理                                              */
    /********************************************************************************************************/
    function saveBind(save_btn_id, form_id, _url, check) {
        $("[id='" + save_btn_id + "']").bind({
            'click': function () {
                var values = ($("[id='" + form_id + "']"))[0];
                var map = {};
                if (check == true) {
                    for (var idx = 0; idx < values.length; idx++) {
                        var validate = $("[id='" + values[idx].id + "']").attr("validate");
                        if (validate == "true") {
                            var _value = values[idx].value;
                            if (null == _value || _value == undefined || "" == _value.trim()) {
                                $("[id='" + save_btn_id + "_alert']").html("请填写完整。");
                                $("[id='" + save_btn_id + "_alert']").css('visibility', 'visible');
                                setTimeout(
                                    function () {
                                        $("[id='" + save_btn_id + "_alert']").css('visibility', 'hidden');
                                    }
                                    ,
                                    3000
                                );
                                return;
                            }
                        }

                        map[values[idx].id] = values[idx].value;
                    }
                }
                else {
                    for (var idx = 0; idx < values.length; idx++) {
                        map[values[idx].id] = values[idx].value;
                    }
                }

                console.log(map);

                $.ajax({
                    type: 'POST',
                    url: _url,
                    data: map,
                    dataType: 'text',
                    success: function (data) {
                        if (data == "true") {
                            $("[id='" + save_btn_id + "_alert']").html("保存成功。");
                            $("[id='" + save_btn_id + "_alert']").css('visibility', 'visible');
                        }
                        else {
                            $("[id='" + save_btn_id + "_alert']").html("保存失败,有非法输入。");
                            $("[id='" + save_btn_id + "_alert']").css('visibility', 'visible');
                        }

                        setTimeout(
                            function () {
                                $("[id='" + save_btn_id + "_alert']").css('visibility', 'hidden');
                            }
                            ,
                            3000
                        );

                    }
                });

            }
        });
    }

    saveBind("user_Info_save", "user_Info_form", "/member/userEdit/userInfo", false);
    saveBind("user_House_save", "user_House_form", "/member/userEdit/userHouseCar", false);
    saveBind("user_Bank_save", "user_Bank_form", "/member/userEdit/userBank", false);
    saveBind("user_Company_save", "user_Company_form", "/member/userEdit/userCompany", false);
    saveBind("user_Enterprise_save", "user_Enterprise_form", "/member/userEdit/userEnterprise", false);
    saveBind("user_Contact_save", "user_Contact_form", "/member/userEdit/userContact", false);
    saveBind("apply_save", "apply_form", "/member/userEdit/saveApply", true);

});

