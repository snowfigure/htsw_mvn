<#include '/WEB-INF/COMM_LAYOUT/_layout.ftl'/>
<@layout >
<div id="main-content">
    <div id="right-article">
        <div id="right-article-content" style="margin-top: -17px">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">通过Email找回密码（重新设置密码）</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" id="user_Info_form">

                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">登录用户名</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="username" />
                            </div>
                            <div class="col-sm-2">
                                <input type="button" class="form-control btn-info" id="getRegEmail" value="获取注册邮箱" />
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">注册邮箱</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="email" disabled="disabled"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="check_email" class="col-sm-3 control-label">确认注册邮箱</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="check_email" disabled="disabled"/>
                            </div>
                            <div class="col-sm-2">
                                <input type="button" class="form-control btn-info" id="getForgetPsdEmailCode" value="获取验证码"
                                       disabled="disabled"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">验证码</label>

                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="valid_str" disabled="disabled"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label">新密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" id="password" disabled="disabled"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="re_password" class="col-sm-3 control-label">确认新密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" id="re_password" disabled="disabled"/>
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-sm-4">
                                <div class="alert alert-danger" id="edit_psd_alert"
                                     style="margin: 0 ;visibility: hidden"></div>
                            </div>
                            <div class="col-sm-4">
                                <input type="button" class="form-control btn-primary" id="edit_psd"
                                       value="&nbsp;修&nbsp;改&nbsp;密&nbsp;码&nbsp;" disabled="disabled">
                            </div>
                            <div class="col-sm-4">

                            </div>
                        </div>
                    </form>
                </div>

                <div class="panel-footer" style="padding: 20px">

                    <p>密码找回帮助：</p>

                    <p>
                        找回密码功能是为了在用户在忘记登录密码的情况下，帮助用户通过登录名一步一步重新设置密码，具体流程如下。
                    </p>

                    <p>
                        1、输入您的用户名，点击“获取注册邮箱”按钮，找回该用户名绑定的注册邮箱；
                    </p>

                    <p>
                        2、在“确认注册邮箱”一栏中输入完整的注册邮箱；点击“获取验证码”按钮，使用注册的邮箱获取修改密码的验证码；
                    </p>

                    <p>
                        3、点击“确认验证码”按钮，确认您输入的验证码信息，然后分别在“新密码”和“确认新密码”两栏输入您的新密码。
                    </p>

                    <p>
                        4、点击“修改密码”按钮，修改您的密码。
                    </p>
                    <p>
                        Notice:如果无法找回，请重新注册或者联系本公司相关业务人员。
                    </p>


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
<script type="text/javascript" >
    function disableAlert()
    {
        setTimeout(
                function () {
                    $("#edit_psd_alert").css('visibility', 'hidden');
                }
                ,
                10000
        );
    }

    $(document).ready(function () {

        //获取注册邮箱
        $("#getRegEmail").click(function(){
            var username = $('#username').val().trim();
            if (username == null || username == undefined || username == "") {
                $("#edit_psd_alert").html("登录用户名不能为空。");
                $("#edit_psd_alert").css('visibility', 'visible');
                disableAlert();
                return;
            }
            $.ajax({
                type: 'POST',
                url: '/getUserRegEmail/',
                dataType: 'text',
                data: {
                    username: username,
                },
                success: function (data) {
                    if(data == "ERROR_USERNAME"){
                        $("#edit_psd_alert").html("系统无法查询到该用户。");
                        $("#edit_psd_alert").css('visibility', 'visible');
                        disableAlert();
                        return;
                    }
                    $("#email").val(data);
                    $("#check_email").removeAttr("disabled");
                    $("#getForgetPsdEmailCode").removeAttr("disabled");
                }
            });




        });

        //获取修改密码的注册码
        $("#getForgetPsdEmailCode").click(function(){

            var username = $('#username').val().trim();
            var check_email = $('#check_email').val().trim();
            if (username == null || username == undefined || username == "") {
                $("#edit_psd_alert").html("登录用户名不能为空。");
                $("#edit_psd_alert").css('visibility', 'visible');
                disableAlert();
                return;
            }

            if (check_email == null || check_email == undefined || check_email == "") {
                $("#edit_psd_alert").html("确认注册邮箱不能为空。");
                $("#edit_psd_alert").css('visibility', 'visible');
                disableAlert();
                return;
            }
            $.ajax({
                type: 'POST',
                url: '/getForgetPsdEmailCode/',
                dataType: 'text',
                data: {
                    username: username,
                    email: check_email,
                },
                success: function (data) {
                    if(data == "ERROR_USERNAME"){
                        $("#edit_psd_alert").html("系统无法查询到该用户。");
                        $("#edit_psd_alert").css('visibility', 'visible');
                        disableAlert();
                        return;
                    }
                    if(data == "FALSE"){
                        $("#edit_psd_alert").html("无法向该邮箱发送邮件。");
                        $("#edit_psd_alert").css('visibility', 'visible');
                        disableAlert();
                        return;
                    }
                    if(data =="SUCCESS")
                    {
                        $('#edit_psd_alert').html("Email发送成功，请验收。");
                        $('#edit_psd_alert').css('visibility','visible');

                        $("#valid_str").removeAttr("disabled");
                        $("#password").removeAttr("disabled");
                        $("#re_password").removeAttr("disabled");
                        $("#edit_psd").removeAttr("disabled");
                        disableAlert();
                        return false;
                    }
                }
            });


        });

        //修改密码
        $('#edit_psd').bind({
           "click":function(){
               var username = $('#username').val().trim();
               var email = $('#check_email').val().trim();
               var valid_str = $('#valid_str').val().trim();
               var password = $('#password').val();
               var re_password = $('#re_password').val();
               if(password.length<6){
                   $('#edit_psd_alert').html("密码不符合要求（最少6位）。");
                   $('#edit_psd_alert').css('visibility','visible');
                   disableAlert();
                   return false;
               }
               if(password != re_password)
               {
                   $('#edit_psd_alert').html("两次密码输入不匹配。");
                   $('#edit_psd_alert').css('visibility','visible');
                   disableAlert();
                   return false;
               }
               if (username == null || username == undefined || username == "") {
                   $("#edit_psd_alert").html("用户名不能为空。");
                   $("#edit_psd_alert").css('visibility', 'visible');
                   disableAlert();
                   return;
               }
               if (email == null || email == undefined || email == "") {
                   $("#edit_psd_alert").html("email不能为空。");
                   $("#edit_psd_alert").css('visibility', 'visible');
                   disableAlert();
                   return;
               }
               if (valid_str == null || valid_str == undefined || valid_str == "") {
                   $("#edit_psd_alert").html("验证信息不能为空。");
                   $("#edit_psd_alert").css('visibility', 'visible');
                   disableAlert();
                   return;
               }
               $.ajax({
                   type: 'POST',
                   url: '/editPsd/',
                   dataType: 'text',
                   data: {
                       username:username,
                       email: email,
                       valid_str: valid_str,
                       password:hex_md5(hex_md5(password)+username),
                   },
                   success: function (data) {
                       if(data =="ERROR_USERNAME")
                       {
                           $('#edit_psd_alert').html("无法查询到给用户。");
                           $('#edit_psd_alert').css('visibility','visible');
                           disableAlert();
                           return false;
                       }
                       if(data =="ERROR_VALID_STR")
                       {
                           $('#edit_psd_alert').html("验证码不正确，请重新输入。");
                           $('#edit_psd_alert').css('visibility','visible');
                           disableAlert();
                           return false;
                       }
                       if(data =="SUCCESS")
                       {
                           $('#edit_psd_alert').html("密码修改成功，请重新<a href='/login.html'>登录</a>。");
                           $('#edit_psd_alert').css('visibility','visible');
                           window.setTimeout(
                                   function(){
                                       location.href = "/login.html";
                                   },2000);
                           return false;
                       }
                   }
               });
           }
        });


    });
</script>
