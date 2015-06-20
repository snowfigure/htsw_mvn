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
<body>


<div class="am-cf admin-main">

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="am-icon-user am-icon-sm"></span>
                        <strong class="am-text-primary am-text-lg"> 用户管理</strong>
                    </h3>
                </div>
                <div class="panel-body">
                    <div class="am-g">
                        <div class="am-u-sm-12">
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

                        </div>
                    </div>

                </div>


            </div>
            <div style="clear: both"></div>
        </div>

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
        <div style="clear: both"></div>
        <div class="am-g">
            <div style="clear: both"></div>
            <div class="am-panel am-panel-default admin-sidebar-panel">
                <div class="am-panel-bd">
                    <p><span class="am-icon-tag"></span> 修改规范</p>

                    <p></p>

                    <p>1、可以添加新业务员账号、禁用已有业务员账号、修改业务员密码；</p>

                    <p>2、请勿随意删除管理员和客户信息；</p>

                    <p>3、默认初始化密码是<span style="color: red">1234567890</span>； </p>

                    <p>4、新建业务员和重置业务员密码时，业务员登陆密码是<span style="color: red">默认密码</span>；</p>

                    <p>5、用户登录名<span style="color: red">唯一且不可变更</span>。</p>

                    <p>6、如有任何问题，请联系开发人员。</p>

                    <p></p>
                </div>
            </div>
        </div>
    </div>
    <!-- content end -->

</div>


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="/assets/easyui/jquery.easyui.min.js"></script>
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/ext/md5.js"></script>
<script type="text/javascript">
    $(function () {

        $("#btn_search_submit").click(function(){
            $('#userInfo_dg').datagrid('load');
        });

        function employeeManager(op_type, op_text) {
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

        var emp_toolbar = [
            {/** 点击新增按钮 */
                text: "添加业务员",   iconCls: 'icon-add',
                handler: function () { detail("/admin/userInfo/employeeRegister/", "新增业务员"); }
            },
            {
                text: "禁用业务员",      iconCls: 'icon-remove',
                handler: function () { employeeManager("disable", "禁用"); }
            },
            {
                text: "恢复业务员",          iconCls: 'icon-undo',
                handler: function () { employeeManager("enable", "恢复");  }
            },
            {
                text: "重置密码",           iconCls: 'icon-redo',
                 handler: function () {   employeeManager("clear_psd", "重置密码");  }
            }
        ];

        var cos_toolbar = [
            {
                text: "禁用客户",   iconCls: 'icon-remove',
                handler: function () {  employeeManager("disable", "禁用");   }
            },
            {
                text: "取消客户禁用",  iconCls: 'icon-undo',
                handler: function () {   employeeManager("enable", "恢复");    }
            }
        ];



        var type = "${type!}";
        var url =  '/admin/userInfo/${type!}';
        if (type == "employee") {
            $('#userInfo_dg').datagrid({
                url:url,
                columns: columns,
                singleSelect: true,//是否单选
                rownumbers: true,//行号
                onBeforeLoad:function (param) {
                    param.user_uname = $("#user_uname").textbox('getText');
                    param.user_name =  $("#user_name").textbox('getText');
                    param.user_email =  $("#user_email").textbox('getText');
                },
                toolbar: emp_toolbar,
                pagination: true //分页控件
            });
        } else if (type == "member"){
            $('#userInfo_dg').datagrid({
                url: url,
                columns: columns,
                singleSelect: true,//是否单选
                rownumbers: true,//行号
                onBeforeLoad:function (param) {
                    param.user_uname = $("#user_uname").textbox('getText');
                    param.user_name =  $("#user_name").textbox('getText');
                    param.user_email =  $("#user_email").textbox('getText');
                },
                toolbar: cos_toolbar,
                pagination: true //分页控件
            });
        } else {
            $('#userInfo_dg').datagrid({
                url: url,
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
        }


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


        function detail(submiturl, title, row) {
            $('#form').form({
                url: submiturl,
                success: function (data) {
                    if (data == "true") {
                        $("#userInfo_dg").datagrid("reload");
                        $('#form').form("clear");
                        if (row) {
                            $("#detail").dialog("close");
                        }
                    } else {
                        $.messager.alert('错误', '出现未知的错误<br/>操作失败！<br/>原因：' + data, 'info');
                    }
                }
            });
            if (row) {
                $('#form').form('load', {
                    'id': row.id,
                    'username': row.username,
                    'email': row.email,
                    'realname': row.realname
                });
            }
            $("#detail").dialog({
                title: title,
                width: 300,
                height: 220,
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
</script>
</body>
</html>
