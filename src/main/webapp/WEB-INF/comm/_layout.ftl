<#macro layout>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${systemConfig['WEBNAME']!} - ${title!}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="keywords" content="${systemConfig['KEYWORDS']!}"/>
    <meta name="description" content="${systemConfig['DESCRIPTION']!}"/>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/layout.css" rel="stylesheet">

    <link href="/assets/imgflash/style.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/imgflash/blue.css" rel="stylesheet" type="text/css" id="style_color"/>
    <!--[if lt IE 9]>
    <script src="/assets/ext/html5shiv.js"></script>
    <script src="/assets/ext/respond.min.js"></script>
    <![endif]-->
<#-- base href="${CPATH}" /
<#include "/WEB-INF/comm/_baidu_tongji.ftl"/> -->
</head>
<body>
<div class="header">
    <div id="top-content">
        <div id="logo">
            <a href="#">
                <img src="/assets/img/logo.jpg">
            </a>
        </div>
        <div id="user">
            <a href="login.html">
                <input type="button" value="登陆">
            </a>
            <a href="register.html">
                <input type="button" value="注册">
            </a>
        </div>
        <div id="div-clear"></div>
    </div>
</div>

<div class="front-menu">
    <div id="menu-content">
        <a href="/index.html">首页</a>
        <a href="/index">产品介绍</a>
        <a href="/aboutUs.html">关于我们</a>
        <a href="/qaOnline.html">意见反馈</a>
    </div>
</div>

<div class="front-content">
    <#nested>
</div>

<div class="front-footer" id="footer">
    <div id="footer-content">
        <div id="footer-left">
            <div>
                <a>新手入门</a>
                <a href="/aboutUs.html">关于我们</a>
                <a href="/aboutUs.html">联系方式</a>
                <a href="/joinUs.html">人才招聘</a>
                <a href="/privacy.html">免责声明</a>
                <a href="/privacy.html">隐私声明</a>
                <a href="/qaOnline.html">意见反馈</a>
            </div>
            <div>
                <div id="company">
                    <span><a href="${systemConfig['WEBURL']!}">${systemConfig['COMPANYNAME']!}</a></span> &nbsp;
                </div>
                <div id="copyright">
                    <span>${systemConfig['WEBCOPYRIGHT']!} &nbsp;  ${systemConfig['ICP']!}</span>
                </div>
            </div>

        </div>
        <div id="footer-right">
            <div>客服热线</div>
            <div id="hot-line">${systemConfig['HOTLINE']!}</div>
            <div>客服邮箱&nbsp;${systemConfig['EMAIL']!}</div>
        </div>
        <div id="div-clear"></div>
    </div>

</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/assets/ext/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/ext/_ext.js"></script>
<script src="/assets/ext/slider.js"></script>
<script type="text/javascript">
    $(function () {
        $('.front-content #main-content #left-nav ul').bind({
            'mouseover': function () {
                $(this).css('background-color', '#E60012');
                $(this).css('color', 'white');
            },
            'mouseout': function () {
                $(this).css('background-color', '#E9E8E8');
                $(this).css('color', 'black');

                $('.front-content #main-content #left-nav a #${pageFlag!}').css('background-color', '#E60012');
                $('.front-content #main-content #left-nav a #${pageFlag!}').css('color', 'white');
            }
        });

        $('.front-content #main-content #left-nav a #${pageFlag!}').css('background-color', '#E60012');
        $('.front-content #main-content #left-nav a #${pageFlag!}').css('color', 'white');

    });
</script>
</body>
</html>
</#macro>