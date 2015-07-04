<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>综合管理平台 - ${systemConfig['WEBNAME']!}</title>
    <link rel="stylesheet" type="text/css" href="/assets/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/assets/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/assets/amazeui_2.3.0/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="/assets/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="/assets/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/assets/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="text-align:left;padding: 15px">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="am-icon-inbox am-icon-sm"></span><strong class="am-text-primary am-text-lg"> 系统参数配置</strong>
            </h3>
        </div>
        <div class="panel-body">
            <div class="am-g">
                <div style="clear: both"></div>
                <table id="config_dg"></table>
                <br/>
                <div id='detail'>
                    <form id="form" method="post" style="margin: 10px 20px">
                        <input class="webConfig" type="hidden" name="webConfig.k" readonly id="_k"/>
                        <div>
                            <label for="name">　编号:</label>
                            <input class="webConfig" type="text" name="webConfig.id" readonly id="_id"/>
                        </div>
                        <div>
                            <label for="name">关键词:</label>
                            <input class="webConfig" type="text" name="webConfig.des" readonly id="_des"/>
                        </div>
                        <div>
                            <label for="name">　　值:</label>
                            <input class="webConfig" type="text" name="webConfig.val" id="_val"/>
                        </div>

                    </form>

                </div>
            </div>
        </div>
        <div class="panel-footer">

            <p><span class="am-icon-tag"></span> 修改规范</p>

            <p></p>

            <p>1、系统配置参数关键字的值请酌情修改，关键字修改实时生效；</p>

            <p>2、请勿随意尝试更改关键字名称；</p>

            <p>3、如有任何问题，请联系开发人员。</p>

            <p></p>

            <div style="clear: both"></div>
        </div>
    </div>


</body>
<script type="text/javascript">
    $(function () {
        $('#config_dg').datagrid({
            title:' ',
            url: '/admin/webconfig/list?type=${type!}',
            columns: [[
                {field: 'id', title: 'id', width: $(this).width() * 0.1, hidden: true},
                {field: 'des', title: '关键字', width: $(this).width() * 0.13},
                {field: 'val', title: '值', width: $(this).width() * 0.36},
                {field: 'k', title: 'KEY', width: $(this).width() * 0.2},
                {field: 'update_time', title: '更新时间', width: $(this).width() * 0.2}
            ]],
            singleSelect: true,//是否单选
            rownumbers: true,//行号
            onDblClickRow: function (index, row) {
                detail("/admin/webconfig/edit/", "编辑", row);
            },
            pagination: true //分页控件
        });
//设置分页控件
        var pt = $('#config_dg').datagrid('getPager');
        $(pt).pagination({
            pageSize: 20,//每页显示的记录条数，默认为10
            pageList: [20, 50, 100],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        });


        $("#detail").dialog({}).dialog("close");

        function detail(submiturl, title, row) {
            $('#form').form({
                url: submiturl,
                success: function (data) {
                    if (data == "true") {
                        $("#config_dg").datagrid("reload");
                        $('#form').form("clear");
                        if (row) {
                            $("#detail").dialog("close");
                        }
                    } else {
                        $.messager.alert('错误', '出现未知的错误<br/>操作失败！', 'info');
                    }
                }
            });
            if (row) {
                $('#form').form('load', {
                    'webConfig.id': row.id,
                    'webConfig.des': row.des,
                    'webConfig.val': row.val,
                    'webConfig.k': row.k
                });
            }
            $("#detail").dialog({
                title: title,
                width: 320,
                height: 200,
                top: '150px',
                closed: false,
                cache: false,
                buttons: [{
                    text: '保存',
                    handler: function () { /** 新增对话框中的保存按钮 */
                        if ($('#nav.name').val() == "undefined") {
                            $.messager.alert('错误', '请输入名称', 'info');
                        } else {
                            $("form").submit();
                        }
                    }
                },
                    {
                        text: '关闭',
                        handler: function () {
                            /** 新增对话框中的关闭按钮 */
                            $("#detail").dialog("close");
                            $('#form').form("clear");
                        }
                    }]
            });
        }

    });

</script>
</html>


