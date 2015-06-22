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
    <#--<link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->
    <link href="http://apps.bdimg.com/libs/bootstrap/3.1.1/css/bootstrap.css" rel="stylesheet">


</head>

<body>

<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="../browser.html" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->


<div class="am-cf admin-main">
    <!-- content start -->
    <div class="admin-content"  style="min-height: 580px">
        <div class="am-cf am-padding">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                            <strong class="am-text-primary am-text-lg"></strong>
                    </h3>
                </div>
                <div class="panel-body">
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
                <div class="panel-footer">
                    <div style="float: right;width: 40%;text-align: right;padding-right: 20px">
                        <button class="btn btn-danger" id="article_save">&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;</button>
                    </div>
                    <div style="clear: both"></div>
                </div>

            </div>
            <div style="clear: both"></div>
        </div>


    </div>
</div>
<script type="text/javascript" charset="utf-8" src="http://apps.bdimg.com/libs/jquery/1.11.1/jquery.min.js"></script>


<#--<script type="text/javascript" charset="utf-8" src="/assets/easyui/jquery.min.js"></script>-->

<script type="text/javascript" charset="utf-8" src="/assets/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/amazeui_2.3.0/js/amazeui.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<#--<script src="/assets/bootstrap/js/bootstrap.min.js"></script>-->
<script src="http://apps.bdimg.com/libs/bootstrap/3.1.1/js/bootstrap.min.js"></script>

</body>
</html>
<script type="text/javascript">

    $(function () {
        var ueditor = UE.getEditor('myEditor');
        ueditor.addListener('blur', function () {
            $('#focush2').html('编辑器失去焦点了')
        });
        ueditor.addListener('focus', function () {
            $('#focush2').html('')
        });
        ueditor.addListener("ready", function () {
            $.ajax({
                type: 'POST',
                url: '/admin/article/edit/',
                dataType: 'json',
                data: {
                    aid:${aid!},
                    type: 'load'
                },
                success: function (data) {
                    UE.getEditor('myEditor').setContent(data.content, false);
                    $('strong').html(data.title);
                }
            });
        });

        $('#article_save').bind({
            'click': function () {
                var progress = $.AMUI.progress;
                progress.start();
                progress.inc();
                if (!UE.getEditor('myEditor').hasContents()) return;
                var content = UE.getEditor('myEditor').getContent();
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
                        progress.done(true);
                    }
                });
            }
        });


    });
</script>