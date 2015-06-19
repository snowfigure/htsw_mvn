<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>恒通商务 - 系统综合管理平台</title>
    <link rel="stylesheet" type="text/css" href="/assets/easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="/assets/easyui/prettify.css">
    <script type="text/javascript" src="/assets/ext/prettify.js"></script>
    <script type="text/javascript" src="/assets/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#tt').tabs({
                onLoad: function (panel) {
                    var plugin = panel.panel('options').title;
                    panel.find('textarea[name="code-' + plugin + '"]').each(function () {
                        var data = $(this).val();
                        data = data.replace(/(\r\n|\r|\n)/g, '\n');
                        if (data.indexOf('\t') == 0) {
                            data = data.replace(/^\t/, '');
                            data = data.replace(/\n\t/g, '\n');
                        }
                        data = data.replace(/\t/g, '    ');
                        var pre = $('<pre name="code" class="prettyprint linenums"></pre>').insertAfter(this);
                        pre.text(data);
                        $(this).remove();
                    });
                    prettyPrint();
                }
            });
        });
        function open1(plugin) {
            if ($('#tt').tabs('exists', plugin)) {
                $('#tt').tabs('select', plugin);
            } else {
                $('#tt').tabs('add', {
                    title: plugin,
                    href: plugin + '.php',
                    closable: true,
                    extractor: function (data) {
                        data = $.fn.panel.defaults.extractor(data);
                        var tmp = $('<div></div>').html(data);
                        data = tmp.find('#content').html();
                        tmp.remove();
                        return data;
                    }
                });
            }
        }
    </script>

</head>


<body class="easyui-layout" style="text-align:left">
<div region="north" border="false" style="background:#666;text-align:center">

</div>
<div region="west" split="true" title="Plugins" style="width:250px;padding:5px;">
    <ul class="easyui-tree">
        <li iconCls="icon-layout"><span>Layout</span>
            <ul>
                <li iconCls="icon-gears"><a class="e-link" href="#" onclick="open1('panel')">panel</a></li>
                <li iconCls="icon-gears"><a class="e-link" href="#" onclick="open1('tabs')">tabs</a></li>
                <li iconCls="icon-gears"><a class="e-link" href="#" onclick="open1('accordion')">accordion</a></li>
                <li iconCls="icon-gears"><a class="e-link" href="#" onclick="open1('layout')">layout</a></li>
            </ul>
        </li>
    </ul>
</div>
<div region="center">
    <div id="tt" class="easyui-tabs" fit="true" border="false" plain="true">
        <div title="welcome" href="/index.html"></div>
    </div>
</div>

</body>


</html>