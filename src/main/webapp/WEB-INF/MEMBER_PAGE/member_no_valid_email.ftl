<#include '/WEB-INF/MEMBER_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/MEMBER_PAGE/comm/_member_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content" style="margin-top: -17px">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Email验证</h3>
                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" id="user_Info_form">
                        <div class="form-group">
                            <input type="hidden" class="form-control" id="uid" value="${confuse_id!}"/>
                            <label for="email" class="col-sm-3 control-label">认证邮箱</label>

                            <div class="col-sm-7">
                                <input type="text" class="form-control" id="email" value="${email!}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-3 control-label">验证码</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="valid_str" value=""/>
                            </div>
                            <div class="col-sm-2">
                                <input type="button" class="form-control btn-info" id="getEmailCode" value="获取验证码"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-4">
                                <div class="alert alert-danger" id="valid_email_alert"
                                     style="margin: 0 ;visibility: hidden"></div>
                            </div>
                            <div class="col-sm-4">
                                <input type="button" class="form-control btn-primary" id="valid_email"
                                       value="&nbsp;验&nbsp;证&nbsp;邮&nbsp;箱&nbsp;">
                            </div>
                            <div class="col-sm-4">

                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
        <div id="div-clear"></div>
    </div>
    <div id="div-clear"></div>
</div>
<div id="div-clear"></div>
</@layout>
<script type="text/javascript" >
    function disableAlert()
    {
        setTimeout(
                function () {
                    $("#valid_email_alert").css('visibility', 'hidden');
                }
                ,
                10000
        );
    }

    $(document).ready(function () {
        $('#valid_email').bind({
           "click":function(){
               var email = $('#email').val().trim();
               var valid_str = $('#valid_str').val().trim();
               if (email == null || email == undefined || email == "") {
                   $("#valid_email_alert").html("email不能为空。");
                   $("#valid_email_alert").css('visibility', 'visible');
                   disableAlert();
                   return;
               }
               if (valid_str == null || valid_str == undefined || valid_str == "") {
                   $("#valid_email_alert").html("验证信息不能为空。");
                   $("#valid_email_alert").css('visibility', 'visible');
                   disableAlert();
                   return;
               }
               $.ajax({
                   type: 'POST',
                   url: '/validEmail/',
                   dataType: 'text',
                   data: {
                       email: email,
                       valid_str: valid_str,
                       confuse_id: '${confuse_id!}'
                   },
                   success: function (data) {
                       if(data =="ERROR_USER")
                       {
                           $('#valid_email_alert').html("账户不匹配，重新登录。");
                           $('#valid_email_alert').css('visibility','visible');
                           disableAlert();
                           return false;
                       }
                       if(data =="GET_CODE" || data =="ERROR_CODE" )
                       {
                           $('#valid_email_alert').html("验证码不匹配，请核准或重新获取。");
                           $('#valid_email_alert').css('visibility','visible');
                           disableAlert();
                           return false;
                       }
                       if(data =="SUCCESS")
                       {
                           $('#valid_email_alert').html("Email认证成功，请退出后重新登录。");
                           $('#valid_email_alert').css('visibility','visible');
                           disableAlert();
                           return false;
                       }
                   }
               });
           }
        });

        $('#getEmailCode').bind({
            "click":function(){
                var email = $('#email').val().trim();
                if (email == null || email == undefined || email == "") {
                    $("#valid_email_alert").html("email不能为空。");
                    $("#valid_email_alert").css('visibility', 'visible');
                    disableAlert();
                    return;
                }
                $.ajax({
                    type: 'POST',
                    url: '/getEmailCode/',
                    dataType: 'text',
                    data: {
                        email: email,
                        confuse_id: '${confuse_id!}'
                    },
                    success: function (data) {
                        if(data =="SUCCESS")
                        {
                            $('#valid_email_alert').html("验证码发送成功，请登录邮箱查看。");
                            $('#valid_email_alert').css('visibility','visible');
                            disableAlert();
                            return false;
                        }
                        if(data =="FALSE")
                        {
                            $('#valid_email_alert').html("不支持的Email，请重新输入。");
                            $('#valid_email_alert').css('visibility','visible');
                            disableAlert();
                            return false;
                        }
                    }
                });
            }
        });

    });
</script>
