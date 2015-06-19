<#include '/WEB-INF/ADMIN_PAGE/comm/_layout.ftl'/>
<@layout >


<div class="col-sm-8" style="margin: 20px 0 50px ">
    <form class="am-form am-form-horizontal">

        <div class="am-form-group">
            <label for="doc-ipt-pwd-2" class="am-u-sm-2 am-form-label">原始密码</label>

            <div class="am-u-sm-10">
                <input id="pre_password" type="password" id="doc-ipt-pwd-2" placeholder="原始密码">
            </div>
        </div>

        <div class="am-form-group">
            <label for="doc-ipt-pwd-2" class="am-u-sm-2 am-form-label">新密码</label>

            <div class="am-u-sm-10">
                <input id="new_password" type="password" id="doc-ipt-pwd-2" placeholder="新密码">
            </div>
        </div>

        <div class="am-form-group">
            <label for="doc-ipt-pwd-2" class="am-u-sm-2 am-form-label">重复新密码</label>

            <div class="am-u-sm-10">
                <input id="repeat_new_password" type="password" id="doc-ipt-pwd-2" placeholder="重复新密码">
            </div>
        </div>
        <div class="col-sm-4">
            <div class="alert alert-info" id="password_save_alert"
                 style="margin: 0 ;visibility: hidden"></div>
        </div>
        <button id="password_save" type="button" class="col-sm-4 am-btn am-btn-primary am-btn-block">&nbsp;修&nbsp;改&nbsp;密&nbsp;码&nbsp;</button>
        <div class="col-sm-3"></div>


    </form>
</div>
<div class="col-sm-4"></div>
<div style="clear: both"></div>

<div class="am-g">
    <div style="clear: both"></div>
    <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
            <p><span class="am-icon-tag"></span> 密码修改规范</p>

            <p></p>

            <p>1、修改密码需要先输入原始密码，在输入新的密码；</p>

            <p>2、新密码必须至少6位，密码可以是：英文字母大小写、数字和特殊字符等；</p>

            <p>3、忘记密码，请联系账户拥有者、管理员或者开发人员；</p>

            <p></p>
        </div>
    </div>
</div>


</@layout>
<script src="/assets/ext/md5.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        function disableAlert() {
            setTimeout(
                    function () {
                        $("#password_save_alert").css('visibility', 'hidden');
                    }
                    ,
                    3000
            );
        }

        $('#password_save').bind({
            'click': function () {
                var username = '${user['username']!}';
                var pre_password = $('#pre_password').val().trim();
                var new_password = $('#new_password').val().trim();
                var repeat_new_password = $('#repeat_new_password').val().trim();
                if (pre_password == null || pre_password == undefined || pre_password == "") {
                    $("#password_save_alert").html("请输入原始密码。");
                    $("#password_save_alert").css('visibility', 'visible');
                    disableAlert();
                    return;
                }
                if (new_password == null || new_password == undefined || new_password == "" || new_password.length < 6) {
                    $("#password_save_alert").html("新密码不符合要求。");
                    $("#password_save_alert").css('visibility', 'visible');
                    disableAlert();
                    return;
                }

                if (new_password != repeat_new_password) {
                    $("#password_save_alert").html("两次密码不一致。");
                    $("#password_save_alert").css('visibility', 'visible');
                    disableAlert();
                    return;
                }
                $.ajax({
                    type: 'POST',
                    url: '/admin/updatePsd/',
                    dataType: 'text',
                    data: {
                        pre_password: hex_md5(hex_md5(pre_password) + username),
                        new_password: hex_md5(hex_md5(new_password) + new_password)
                    },
                    success: function (data) {
                        if (data == "ERROR") {
                            $('#password_save_alert').html("密码输入不正确。");
                            $('#password_save_alert').css('visibility', 'visible');
                            disableAlert();
                            return false;
                        }
                        if (data == "FALSE") {
                            $('#password_save_alert').html("密码修改失败。");
                            $('#password_save_alert').css('visibility', 'visible');
                            disableAlert();
                            return false;
                        }

                        $('#password_save_alert').html("密码修改成功。");
                        $('#password_save_alert').css('visibility', 'visible');

                        disableAlert();
                        //window.open("/login.html","_self")
                    }
                });


            }
        });
    });
</script>

