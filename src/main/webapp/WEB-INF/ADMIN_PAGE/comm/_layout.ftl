<#macro layout>
<!DOCTYPE html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>恒通商务后台管理系统 - </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="/img/icon.jpg">
    <link rel="apple-touch-icon-precomposed" href="/img/icon.jpg">
    <link rel="stylesheet" href="/assets/amazeui_2.3.0/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/assets/amazeui_2.3.0/css/admin.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->

    <#include '/WEB-INF/ADMIN_PAGE/comm/_header.ftl'/>

<div class="am-cf admin-main">
    <#include '/WEB-INF/ADMIN_PAGE/comm/_sidebar.ftl'/>

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">404</strong>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12">
                <#nested>
            </div>
        </div>
    </div>
    <!-- content end -->

</div>

<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
    <hr>
    <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/assets/amazeui_2.3.0/js/polyfill/rem.min.js"></script>
<script src="/assets/amazeui_2.3.0/js/polyfill/respond.min.js"></script>
<script src="/assets/amazeui_2.3.0/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/assets/amazeui_2.3.0/js/jquery.min.js"></script>
<script src="/assets/amazeui_2.3.0/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="/assets/amazeui_2.3.0/js/app.js"></script>
</body>
</html>
</#macro>