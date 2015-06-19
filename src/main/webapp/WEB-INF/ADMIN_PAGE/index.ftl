<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>恒通商务后台管理系统 - </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <link rel="icon" type="image/png" href="/img/icon.jpg">
    <link rel="apple-touch-icon-precomposed" href="/img/icon.jpg">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/amazeui_2.3.0/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/assets/amazeui_2.3.0/css/admin.css">
    <link href="/assets/ueditor/themes/default/css/ueditor.min.css" type="text/css" rel="stylesheet">
    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
    <div class="admin-content"  style="min-height: 580px">

        <div style="clear: both"></div>

        <div class="am-cf am-padding">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="am-icon-home am-icon-sm"></span>
                        <strong class="am-text-primary am-text-lg"> 首页</strong>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="am-g">
                        <div class="am-u-sm-12">


                        </div>

                    </div>

                </div>

            </div>
            <div style="clear: both"></div>
        </div>


    </div>
</div>
<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
    <hr>

    <p class="am-padding-left">© 2015 恒通商务信息咨询有限公司</p>
</footer>
<script type="text/javascript" charset="utf-8" src="/assets/easyui/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/ueditor/ueditor.all.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/amazeui_2.3.0/js/amazeui.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
<script type="text/javascript">

    $(function () {

        var $fullText = $('.admin-fullText');
        $('#admin-fullscreen').on('click', function() {
            $.AMUI.fullscreen.toggle();
        });

        $(document).on($.AMUI.fullscreen.raw.fullscreenchange, function() {
            $.AMUI.fullscreen.isFullscreen ? $fullText.text('关闭全屏') : $fullText.text('开启全屏');
        });






    });
</script>