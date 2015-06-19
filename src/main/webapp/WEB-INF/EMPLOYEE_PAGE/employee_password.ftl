<#include '/WEB-INF/EMPLOYEE_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/EMPLOYEE_PAGE/comm/_emeployee_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content" style="margin-top: -17px ">


            <div class="col-sm-8">


                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">修改密码</h3>
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" id="user_Info_form">
                            <div class="form-group">
                                <label for="pre_password" class="col-sm-3 control-label">原始密码</label>

                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="pre_password"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="new_password" class="col-sm-3 control-label">新密码</label>

                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="new_password"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="repeat_new_password" class="col-sm-3 control-label">重复新密码</label>

                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="repeat_new_password"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-4">
                                    <div class="alert alert-info" id="password_save_alert"
                                         style="margin: 0 ;visibility: hidden"></div>
                                </div>
                                <div class="col-sm-4">
                                    <input type="button" class="form-control btn-primary" id="password_save"
                                           value="&nbsp;修&nbsp;改&nbsp;密&nbsp;码&nbsp;">
                                </div>
                                <div class="col-sm-4">

                                </div>
                            </div>
                        </form>

                    </div>
                </div>


            </div>

        </div>
        <div id="div-clear"></div>
    </div>
    <div id="div-clear"></div>
</div>
<div id="div-clear"></div>
</@layout>
<script src="/assets/ext/md5.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        function disableAlert()
        {
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
                if (new_password == null || new_password == undefined || new_password == "" || new_password.length<6) {
                    $("#password_save_alert").html("新密码不符合要求。");
                    $("#password_save_alert").css('visibility', 'visible');
                    disableAlert();
                    return;
                }

                if(new_password != repeat_new_password){
                    $("#password_save_alert").html("两次密码不一致。");
                    $("#password_save_alert").css('visibility', 'visible');
                    disableAlert();
                    return;
                }
                $.ajax({
                    type: 'POST',
                    url: '/employee/updatePsd/',
                    dataType: 'text',
                    data: {
                        pre_password:hex_md5(hex_md5(pre_password)+username),
                        new_password:hex_md5(hex_md5(new_password)+new_password)
                    },
                    success: function (data) {
                        if(data =="ERROR")
                        {
                            $('#password_save_alert').html("密码输入不正确。");
                            $('#password_save_alert').css('visibility','visible');
                            disableAlert();
                            return false;
                        }
                        if(data =="FALSE")
                        {
                            $('#password_save_alert').html("密码修改失败。");
                            $('#password_save_alert').css('visibility','visible');
                            disableAlert();
                            return false;
                        }

                        $('#password_save_alert').html("密码修改成功。");
                        $('#password_save_alert').css('visibility','visible');

                        disableAlert();
                        //window.open("/login.html","_self")
                    }
                });


            }
        });
    });
</script>
