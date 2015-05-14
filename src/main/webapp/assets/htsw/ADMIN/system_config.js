/**
 * Created with IntelliJ IDEA.
 * User: snowfigure
 * Date: 15-4-3
 * Time: 下午9:39
 * To change this template use File | Settings | File Templates.
 */


$(function () {

    $('#config_dg').datagrid({
        url: '/admin/webconfig/list',
        columns: [[
            {field: 'id', title: 'id', width: $(this).width() * 0.1, hidden: true},
            {field: 'des', title: '关键字', width: $(this).width() * 0.13},
            {field: 'val', title: '值', width: $(this).width() * 0.2},
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
            width: 350,
            height: 200,
            top: '250px',
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
