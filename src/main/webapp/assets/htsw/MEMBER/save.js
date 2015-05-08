/**
 * 保存按钮处理
 * Created by snowfigure on 2015/5/6.
 */

$(document).ready(function () {
    function saveBind(save_btn_id, form_id, _url) {
        $("[id='" + save_btn_id + "']").bind({
            'click': function () {
                var values = ($("[id='" + form_id + "']"))[0];
                var map = {};
                for (var idx = 0; idx < values.length; idx++) {
                    if (values[idx].type == "select-one") {
                        map[values[idx].id] = values[idx].value;
                        continue;
                    }

                    if (values[idx].type == "text") {
                        map[values[idx].id] = values[idx].value;
                        continue;
                    }
                    map[values[idx].id] = values[idx].value;

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
                            $("[id='" + save_btn_id + "_alert']").html("保存失败。");
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

    saveBind("user_Info_save", "user_Info_form", "/member/userEdit/userInfo");
    saveBind("user_House_save", "user_House_form", "/member/userEdit/userHouseCar");
    saveBind("user_Bank_save", "user_Bank_form", "/member/userEdit/userBank");
    saveBind("user_Company_save", "user_Company_form", "/member/userEdit/userCompany");
    saveBind("user_Enterprise_save", "user_Enterprise_form", "/member/userEdit/userEnterprise");
    saveBind("user_Contact_save", "user_Contact_form", "/member/userEdit/userContact");


});
