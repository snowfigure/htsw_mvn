<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/assets/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/assets/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/assets/amazeui_2.3.0/css/amazeui.css">
    <link rel="stylesheet" type="text/css" href="/assets/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" src="/assets/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/assets/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body  style="text-align:left;padding: 15px">
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            <span class="am-icon-user am-icon-sm"></span><strong class="am-text-primary am-text-lg"> 用户管理</strong>
        </h3>
    </div>
    <div class="panel-body">
        <div style="clear: both"></div>
        <div class="form-horizontal" role="form" >
            <div class="col-sm-3">
                <label for="user_uname">用户登陆名称：</label>
                <input id="user_uname" class="easyui-textbox" data-options="iconCls:'icon-user'" style="width:150px;height: 25px">
            </div>
            <div class="col-sm-3">
                <label for="user_name">用户真实姓名：</label>
                <input id="user_name" class="easyui-textbox" data-options="iconCls:'icon-user'" style="width:150px;height: 25px">
            </div>
            <div class="col-sm-3">
                <label for="user_email">用户注册邮箱：</label>
                <input id="user_email" class="easyui-textbox" data-options="iconCls:'icon-user'" style="width:150px;height: 25px">
            </div>
            <div class="col-sm-3">
                <a id="btn_search_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px">查询</a>
            </div>

            <div class="col-sm-3">
                <label for="user_enable">用户是否可用：</label>
                <select id="user_enable" class="easyui-combobox" style="width:150px;height: 25px">
                    <option value="0">全部状态</option>
                    <option value="1">用户可用</option>
                    <option value="2">用户已禁用</option>
                </select>
            </div>


            <div class="col-sm-3">
                <label for="user_enable">邮箱是否审核：</label>
                <select id="user_email_check" class="easyui-combobox" style="width:150px;height: 25px">
                    <option value="0">全部状态</option>
                    <option value="1">邮箱已审核</option>
                    <option value="2">邮箱未审核</option>
                </select>
            </div>

        </div>



        <div style="clear: both"></div>
        <br/>
        <table id="userInfo_dg"></table>
        <div style="clear: both"></div>




    </div>
    <div class="panel-footer">
        <p><span class="am-icon-tag"></span> 修改规范</p>

        <p></p>

        <p>1、请勿随意删除客户信息；</p>


        <p>3、用户登录名<span style="color: red">唯一且不可变更</span>。</p>

        <p>3、如有任何问题，请联系开发人员。</p>

        <p></p>
    </div>
</div>


<script src="/assets/ext/md5.js"></script>
<script type="text/javascript">
    $(function () {

        $("#btn_search_submit").click(function(){
            $('#userInfo_dg').datagrid('load');
        });

        function manager(op_type, op_text) {
            var row = $('#userInfo_dg').datagrid("getSelected");
            if (row == null) {
                $.messager.alert('错误', '请选择一条记录！', 'info');
                return;
            }
            $.messager.confirm('确认操作', '确认' + op_text + '[' + row.username + "]记录", function (r) {
                if (r) {
                    $.ajax({
                        type: 'POST',
                        url: '/admin/userInfo/employeeManager/' + row.id + "-" + op_type,

                        success: function (data) {
                            if (data == "true") {
                                $.messager.alert('成功', '[' + op_text + ']成功！', 'info');
                                $("#userInfo_dg").datagrid("reload");
                            } else {
                                $.messager.alert('错误', '出现未知的错误<br/>操作失败！', 'info');
                            }
                        }
                    });//$.ajax
                }
            });//$.messager.confirm

        }


        var columns = [[
            {field: 'id', title: 'id', width: $(this).width() * 0.1, hidden: true},
            {field: 'username', title: '登录名', width: $(this).width() * 0.12},
            {field: 'nickname', title: '昵称', width: $(this).width() * 0.08, hidden: true},
            {field: 'realname', title: '真实姓名', width: $(this).width() * 0.12},
            {field: 'role_name', title: '分类', width: $(this).width() * 0.04, hidden: true},
            {field: 'email', title: '邮箱', width: $(this).width() * 0.15},
            {field: 'create_time', title: '注册时间', width: $(this).width() * 0.12},
            {field: 'last_login_time', title: '最后登录时间', width: $(this).width() * 0.12},
            {field: 'last_login_ip', title: '最后登录IP地址', width: $(this).width() * 0.12},
            {field: 'enable_text', title: '是否可用', width: $(this).width() * 0.10}
        ]];


        var cos_toolbar = [
            {
                text: "禁用客户",   iconCls: 'icon-remove',
                handler: function () {  manager("disable", "禁用");   }
            },
            {
                text: "取消客户禁用",  iconCls: 'icon-undo',
                handler: function () {   manager("enable", "恢复");    }
            },
            {
                text: "重置密码",           iconCls: 'icon-redo',
                handler: function () {   manager("clear_psd", "重置密码");  }
            }
        ];


        $('#userInfo_dg').datagrid({
            title:' ',
            url: '/admin/userInfo/member',
            columns: columns,
            singleSelect: true,//是否单选
            rownumbers: true,//行号
            onBeforeLoad:function (param) {
                param.user_uname = $("#user_uname").textbox('getText');
                param.user_name =  $("#user_name").textbox('getText');
                param.user_email =  $("#user_email").textbox('getText');
                param.user_enable =  $("#user_enable").combobox('getValue');
                param.user_email_check =  $("#user_email_check").combobox('getValue');
            },
            toolbar: cos_toolbar,
            pagination: true //分页控件
        });


        //设置分页控件
        var pt = $('#userInfo_dg').datagrid('getPager');
        $(pt).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10, 20, 50, 100],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        });

    });
</script>
</body>
</html>
