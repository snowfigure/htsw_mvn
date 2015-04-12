<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="/assets/ueditor/themes/default/css/umeditor.min.css" type="text/css" rel="stylesheet">
    <link href="/assets/ueditor/ueditor.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="/assets/easyui/jquery.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/ueditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/ueditor/umeditor.min.js"></script>
    <script type="text/javascript" src="/assets/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body>
<!--style给定宽度可以影响编辑器的最终宽度-->
<div id="article_content" style="margin: 0px 10px">
    <div style="margin: 0px auto;width: 200px;text-align: center;">
        <h1></h1>
    </div>
    <script type="text/plain" id="myEditor" style="width:100%;height:240px;"></script>
    <div class="clear"></div>
</div>

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
        $('.edui-btn-fullscreen').click();
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
                    $('h1').html(data.title);
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