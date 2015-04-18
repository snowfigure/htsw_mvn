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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/assets/amazeui_2.3.0/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/assets/amazeui_2.3.0/css/admin.css">
    <link href="/assets/ueditor/themes/default/css/umeditor.min.css" type="text/css" rel="stylesheet">
    <link href="/assets/ueditor/ueditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/assets/easyui/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="/assets/ueditor/lang/zh-cn/zh-cn.js"></script>
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

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">404</strong>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12">
                <!--style给定宽度可以影响编辑器的最终宽度-->
                <div id="article_content" style="margin: 0px 10px">
                    <div style="margin: 0px auto;width: 200px;text-align: center;">
                        <#--<h1></h1>-->
                    </div>
                    <script type="text/plain" id="myEditor" style="width:100%;height:240px;"></script>
                    <div class="clear"></div>
                </div>
              </div>
        </div>
    </div>
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
<script type="text/javascript">

    $(function () {
        var um = UM.getEditor('myEditor');
        um.addListener('blur', function () {
            $('#focush2').html('编辑器失去焦点了')
        });
        um.addListener('focus', function () {
            $('#focush2').html('')
        });
        $('.edui-btn-drafts').attr('data-original-title', '保存');
//        $('.edui-btn-fullscreen').click();
        loadContent();


        $('.edui-btn-drafts').bind({
            'click': function () {
                saveContent();
            }
        });

        function loadContent() {
            $.ajax({
                type: 'POST',
                url: '/admin/article/edit/',
                dataType: 'json',
                data: {
                    aid:${aid!},
                    type: 'load'
                },
                success: function (data) {
                    UM.getEditor('myEditor').setContent(data.content, false);
                    //$('h1').html(data.title)
                    $('strong').html(data.title);
                }

            });
        }

        function saveContent() {
            if (!UM.getEditor('myEditor').hasContents()) return;
            var content = UM.getEditor('myEditor').getContent();
            $.ajax({
                type: 'POST',
                url: '/admin/article/edit/',
                dataType: 'json',
                data: {
                    aid:${aid!},
                    type: 'save',
                    content: content
                },
                success: function (data) {
                    loadContent();
                }

            });
        }
    });
</script>