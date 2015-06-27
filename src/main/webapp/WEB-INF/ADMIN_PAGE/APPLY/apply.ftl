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
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="easyui-layout" style="text-align:left;padding: 15px">
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
                <span class="am-icon-inbox am-icon-sm"></span><strong class="am-text-primary am-text-lg"> 申请管理</strong>
        </h3>
    </div>
    <div class="panel-body">
        <div style="clear: both"></div>
        <div class="form-horizontal" role="form" >
                        <div class="col-sm-4">
                            <label for="status" >申请状态：</label>
                            <select id="status" class="easyui-combobox" style="width:220px;height: 25px">
                                <option value="0">全部状态</option>
                                <option value="1">申请已拒绝</option>
                                <option value="2">用户新申请【等待资料审核】</option>
                                <option value="3">资料已通过【等会用户面签】</option>
                                <option value="4">面签已通过【等待资金下发】</option>
                                <option value="5">资金下发中【申请已经通过】</option>
                                <option value="6">申请已结束【贷款已经还清】</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <label for="apply_user_name">申请用户：</label>
                            <input id="apply_user_name" class="easyui-textbox" data-options="iconCls:'icon-user'" style="width:150px;height: 25px">
                        </div>
                        <div class="col-sm-3">
                            <label for="deal_user_name">处理人员：</label>
                            <input id="deal_user_name" class="easyui-textbox" data-options="iconCls:'icon-user'" style="width:150px;height: 25px">
                        </div>
                        <div class="col-sm-2">
                        <a id="btn_search_clear" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-clear'" style="width:100px">重置</a>
                        </div>
                        <div class="col-sm-4"></div>

                        <div class="col-sm-3">
                            <label  for="start_time">开始时间：</label>
                            <input id="start_time" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"></input>
                        </div>
                        <div  class="col-sm-3">
                            <label for="end_time">结束时间：</label>
                            <input id="end_time" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser"></input>
                        </div>
                        <div class="col-sm-2">
                            <a id="btn_search_submit" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:100px">查询</a>
                        </div>
                    </div>
                <div style="clear: both"></div>
                <table id="apply__dg"></table>
                <br/>


                <!-- 模态框（Modal） -->
                <div class="modal fade" id="log_modal" tabindex="-1" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog" style="width: 900px">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close"
                                        data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <h4 class="modal-title" id="log_title">
                                    审核日志详情
                                </h4>
                            </div>
                            <div class="modal-body" id="log_detail">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal -->
                </div>


        </div>

    </div>
</body>

<script type="text/javascript">
    function myformatter(date){
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
    }
    function myparser(s){
        if (!s) return new Date();
        var ss = (s.split('-'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
    }
</script>
<script type="text/javascript">
    $(function () {

        function showLog(apply_id) {
            $.ajax({
                type: "post",
                url: "/admin/apply/getApplyLog/" + apply_id,
                dataType: 'json',
                success: function (data) {
                    var html =
                            "<table>" +
                            "<tr>" +
                            "<th style='width: 200px'>处理时间</th>" +
                            "<th style='width: 550px'>处理信息</th>" +
                            "<th style='width: 150px'>操作人</th> " +
                            "</tr>";

                    for (var i = 0; i < data.length; i++) {
                        var log = data[i];
                        html +=
                                "<tr>" +
                                "<td style='width: 150px'>" + log.deal_time + "</td>" +
                                "<td style='width: 550px'>" + log.deal_log + "</td>" +
                                "<td style='width: 150px'>" + log.name + "</td> " +
                                "</tr>";
                    }
                    html += "</table>";
                    $("#log_detail").html(html);

                    $('#log_modal').modal('show');
                }
            });

        }




        $("#btn_search_submit").click(function(){
           $('#apply__dg').datagrid('load');
        });
        $("#btn_search_clear").click(function(){
            $("#status").combobox('setValue',"0");
            $("#apply_user_name").textbox('setText',"");
            $("#deal_user_name").textbox('setText',"");
            $("#start_time").datebox('setValue',"");
            $("#end_time").datebox('setValue',"");

            $('#apply__dg').datagrid('load');
        });

        var columns = [[
            {field: 'apply_id', title: 'id', width: $(this).width() * 0.1, hidden: true},
            {field: '_apply_id_', title: '_apply_id_', width: $(this).width() * 0.1, hidden: true},
            {field: 'apply_user_uname', title: '申请人(登陆名)', width: $(this).width() * 0.08},
            {field: 'apply_user_name', title: '申请人(真实姓名)', width: $(this).width() * 0.08},
            {field: 'apply_product_type_name', title: '申请类型', width: $(this).width() * 0.08},
            {field: 'money', title: '申请金额', width: $(this).width() * 0.06},
            {field: 'apply_use_time_type_name', title: '使用时间', width: $(this).width() * 0.06},
            {field: 'apply_use_for_type_name', title: '支出类型', width: $(this).width() * 0.08},
            {field: 'month_payment', title: '月还款额', width: $(this).width() * 0.06},
            {field: 'apply_pay_way_type_name', title: '还款方式', width: $(this).width() * 0.06},
            {field: 'deal_user_name', title: '处理人', width: $(this).width() * 0.08},
            {field: 'apply_valid_status_type_name', title: '申请状态', width: $(this).width() * 0.14},
            {field: 'apply_time', title: '申请时间', width: $(this).width() * 0.10}
        ]];





        $('#apply__dg').datagrid({
            title:' ',
            url: '/admin/apply/search',
            columns: columns,
            singleSelect: true,//是否单选
            rownumbers: true,//行号
            onBeforeLoad:function (param) {
                param.status =  $("#status").combobox('getValue');
                param.apply_user_name = $("#apply_user_name").textbox('getText');
                param.deal_user_name =  $("#deal_user_name").textbox('getText');
                param.start_time = $("#start_time").datebox('getValue');
                param.end_time =   $("#end_time").datebox('getValue');
            },
            toolbar: [{
                text: "审核日志",
                iconCls: 'icon-tip',
                handler: function () {
                    var row = $('#apply__dg').datagrid("getSelected");
                    if (row == null) {
                        $.messager.alert('错误', '请选择一条记录！', 'info');
                        return;
                    }
                    showLog(row._apply_id_);
                }
            }
            ],
            pagination: true //分页控件
        });

        //设置分页控件
        var pt = $('#apply__dg').datagrid('getPager');
        $(pt).pagination({
            pageSize: 10,//每页显示的记录条数，默认为10
            pageList: [10, 20, 50, 100],//可以设置每页记录条数的列表
            beforePageText: '第',//页数文本框前显示的汉字
            afterPageText: '页    共 {pages} 页',
            displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
        });
    });
</script>
</html>