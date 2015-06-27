<#include '/WEB-INF/COMM_LAYOUT/_layout.ftl'/>
<@layout >

<div id="main-content">
    <div id="login-register" style="width: 460px">
        <div id="content">
            <div id="title"><span>账户注册</span></div>
            <div id="splite" style="width: 420px"></div>
            <span>用&nbsp 户 &nbsp名</span><input type="text" id="username"/><br/>
            <span>密　　码</span><input type="password" id="password"/><br/>
            <span>确认密码</span><input type="password" id="re_password"/><br/>
            <span>邮　　箱</span><input type="text" id="email"/><br/>
            <div class="alert alert-info" id="login-alert" style="margin-right: 10px ;visibility: hidden"></div>
            <input type="button" id="submit-login" value="注　　　　册" style="width: 400px;"/>

        </div>
    </div>
    <div id="right-content" style="text-align: center;margin-top: 60px;width: auto">
        <img src="/img/reg_desc.png" />
    </div>
    <div id="div-clear"></div>
</div>


</@layout>

<script src="/assets/ext/md5.js"></script>
<script type="text/javascript">
    $(function () {
        function register_Check()
        {
            var username = $('#username').val();
            var password = $('#password').val();
            var re_password = $('#re_password').val();
            var email = $('#email').val();

            if(username.length<6){
                $('#login-alert').html("用户名不符合要求（最少6位）。");
                $('#login-alert').css('visibility','visible');
                return false;
            }

            if(password.length<6){
                $('#login-alert').html("密码不符合要求（最少6位）。");
                $('#login-alert').css('visibility','visible');
                return false;
            }
            if(password != re_password)
            {
                $('#login-alert').html("两次密码输入不匹配。");
                $('#login-alert').css('visibility','visible');
                return false;
            }
            var e=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if(email.length==0){
                $('#login-alert').html("邮箱不能为空。");
                $('#login-alert').css('visibility','visible');
                return false;
            }
            if(!email.match(e))
            {
                $('#login-alert').html("邮箱不合法。");
                $('#login-alert').css('visibility','visible');
                return false;
            }
            $('#login-alert').html("");
            $('#login-alert').css('visibility','hidden');

            $.ajax({
                type: 'POST',
                url: '/fpc/register/',
                dataType: 'text',
                data: {
                    username:username,
                    email:email,
                    password:hex_md5(hex_md5(password)+username),
                },
                success: function (data) {
                    if(data =="EXIST_USER")
                    {
                        $('#login-alert').html("用户名已经被注册。");
                        $('#login-alert').css('visibility','visible');
                        return false;
                    }
                    if(data =="EXIST_EMAIL")
                    {
                        $('#login-alert').html("邮箱已经被注册。");
                        $('#login-alert').css('visibility','visible');
                        return false;
                    }
                    if(data =="ERROR_EMAIL")
                    {
                        $('#login-alert').html("不支持此类邮箱。");
                        $('#login-alert').css('visibility','visible');
                        return false;
                    }
                    if(data !="true")
                    {
                        $('#login-alert').html("注册失败，请联系管理员。");
                        $('#login-alert').css('visibility','visible');
                        return false;
                    }
                    $('#login-alert').html("注册成功，正在跳转登录页。");
                    $('#login-alert').css('visibility','visible');

                    window.setTimeout(
                            function(){
                                location.href = "/login.html";
                            },3000);
                    //window.open("/login.html","_self")
                }
            });
        }


        $('#submit-login').bind({
            'click':function(){
                register_Check();
            }
        });

    });
</script>
