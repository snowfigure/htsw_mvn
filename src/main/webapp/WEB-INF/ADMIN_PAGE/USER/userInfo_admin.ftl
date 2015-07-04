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
            <span class="am-icon-user am-icon-sm"></span><strong class="am-text-primary am-text-lg"> 用户管理【管理员】</strong>
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
        </div>



        <div style="clear: both"></div>
        <br/>
        <table id="userInfo_dg"></table>
        <div style="clear: both"></div>


        <div id='detail'>
            <br/>

            <form id="form" method="post" style="margin: 10px 20px">
                <input class="user" type="hidden" name="id" readonly id="_id"/>

                <div>
                    <label for="name">　登录名:</label>
                    <input class="user" type="text" name="username" id="_username"/>
                </div>
                <div>
                    <label for="name">真实姓名:</label>
                    <input class="user" type="text" name="realname" id="_realname"/>
                </div>

                <div>
                    <label for="name">联系邮箱:</label>
                    <input class="user" type="text" name="email" id="_email"/>
                </div>

            </form>

        </div>

    </div>
    <div class="panel-footer">
        <p><span class="am-icon-tag"></span> 修改规范1</p>

        <p></p>

        <p>1、请勿随意删除管理员和客户信息；</p>

        <p>2、用户登录名<span style="color: red">唯一且不可变更</span>。</p>

        <p>3、如有任何问题，请联系开发人员。</p>

        <p></p>
    </div>
</div>


<script type="text/javascript">
    $(function () {

        $("#btn_search_submit").click(function(){
            $('#userInfo_dg').datagrid('load');
        });

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

        var type = "${type!}";
        var url =  '/admin/userInfo/${type!}';

        $('#userInfo_dg').datagrid({
            title:' ',
            url: '/admin/userInfo/admin',
            columns: columns,
            singleSelect: true,//是否单选
            rownumbers: true,//行号
            onBeforeLoad:function (param) {
                param.user_uname = $("#user_uname").textbox('getText');
                param.user_name =  $("#user_name").textbox('getText');
                param.user_email =  $("#user_email").textbox('getText');
            },
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

        $("#detail").dialog({}).dialog("close");

    });
</script>
</body>
</html>
