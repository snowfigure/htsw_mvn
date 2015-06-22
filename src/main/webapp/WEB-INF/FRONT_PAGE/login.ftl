<#include '/WEB-INF/COMM_LAYOUT/_layout.ftl'/>
<@layout >

<div id="main-content">
    <div id="login-register">
        <div id="content">
            <div id="title"><span>账户登陆</span></div>
            <div id="splite"></div>
            <span>用户名</span><br/>

            <input type="text" id="username"/><br/>
            <span>登录密码</span><br/>
            <input type="password" id="password"/><br/>
            <div id="forget-psd" >
                <a href="forgetPsd.html">忘记密码?</a>
            </div>
            <div class="alert alert-info" id="login-alert" style="margin: 0 ;visibility: hidden"></div>
            <input type="button" id="submit-login" value="登　　　　录"/>
            <div id="register-now" >还没有账号?<a href="/register.html">马上注册</a></div>
        </div>
    </div>
    <div id="right-content">
       <img src="/img/login_mn.png" />
    </div>
    <div id="div-clear"></div>
</div>
</@layout>
<script src="/assets/ext/md5.js"></script>
<script type="text/javascript">
    $(function () {
        $('#password').bind({
            "keypress":function(event){
                if(event.keyCode == "13")
                {
                    $('#submit-login').click();
                }
            }
        });
       $('#submit-login').bind({
           'click':function(){
               var username = $('#username').val();
               var password = $('#password').val();
               $.ajax({
                   type: 'POST',
                   url: '/fpc/login/',
                   dataType: 'text',
                   data: {
                       username:username,
                       password:hex_md5(hex_md5(password)+username),
                   },
                   success: function (data) {

                       if(data =="empty")
                       {
                           $('#login-alert').html("用户名和密码不能为空。");
                           $('#login-alert').css('visibility','visible');
                           return;
                       }
                       if(data =="falseLogin")
                       {
                           $('#login-alert').html("用户名与密码不匹配（或用户已被禁用/删除）。");
                           $('#login-alert').css('visibility','visible');
                           return ;
                       }
                       if(data == "2")
                       {
                           window.open("/admin/index.html","_self");
                           return;
                       }
                       if(data == "3")
                       {
                           window.open("/employee/index.html","_self");
                           return;
                       }
                       if(data == "4")
                       {
                           window.open("/member/index.html","_self");
                           return;

                       }
                       window.open("/index.html","_self");
                   }
               });
           }

       });

    });
</script>
