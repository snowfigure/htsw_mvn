<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${systemConfig['WEBNAME']!} - ${title!}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/png" href="/img/icon.jpg">
    <meta name="keywords" content="${systemConfig['KEYWORDS']!}"/>
    <meta name="description" content="${systemConfig['DESCRIPTION']!}"/>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/htsw/detail.css" rel="stylesheet">
    <link href="/assets/htsw/layout.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/assets/ext/html5shiv.js"></script>
    <script src="/assets/ext/respond.min.js"></script>
    <![endif]-->
</head>
<body>


<div style="width: 970px;margin: 10px auto;">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">处理意见</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <textarea class="form-control" rows="3" id="logs"
                          placeholder="请先输入处理意见，再进行处理操作。最少10字，最多120字。"></textarea>
            </div>
            <div style="clear: both"></div>
            <div class="btn-group">
                <a id="EM_1" class="btn btn-default" >&nbsp;&nbsp;&nbsp;拒绝申请&nbsp;&nbsp;&nbsp;</a>
                <a id="EM_11" class="btn btn-default disabled" >&nbsp;&nbsp;&nbsp;恢复申请&nbsp;&nbsp;&nbsp;</a>
                <a id="EM_2" class="btn btn-default" >&nbsp;&nbsp;资料审核通过&nbsp;&nbsp;</a>
                <a id="EM_3" class="btn btn-default" >&nbsp;&nbsp;用户面签通过&nbsp;&nbsp;</a>
                <a id="EM_4" class="btn btn-default" >&nbsp;&nbsp;资金已发放</a>
                <a id="EM_5" class="btn btn-default" >&nbsp;&nbsp;&nbsp;贷款已还清&nbsp;&nbsp;&nbsp;</a>
                <a id="EM_0" class="btn btn-default" >&nbsp;&nbsp;&nbsp;撤销上一步&nbsp;&nbsp;&nbsp;</a>
                <a id="EM_99" class="btn btn-default"  arget="_blank"
                   href="/employee/applyDetail/${_apply_id_!}">&nbsp;&nbsp;&nbsp;打印申请单&nbsp;&nbsp;&nbsp;</a>

            </div>
            <div style="clear: both"></div>
        </div>
    </div>



</div>
<iframe width="100%" height="100%"
        marginheight="0" marginwidth="0"  scrolling="no"
        id="iframepage" name="iframepage" onLoad="iFrameHeight()"
        src="/employee/applyDetail/${_apply_id_!}">

</iframe>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/assets/ext/jquery-2.0.0.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="/assets/ext/_ext.js"></script>
<script type="text/javascript" language="javascript">

    function iFrameHeight() {
        var ifm = document.getElementById("iframepage");
        var subWeb = document.frames ? document.frames["iframepage"].document :
                ifm.contentDocument;
        if (ifm != null && subWeb != null) {

            ifm.height = subWeb.body.scrollHeight;
        }
    }

    $(document).ready(function () {
        var _status = ${status!};
        for(var i=2;i<=5;i++){
            if(i!=_status){
                $("#EM_" + i).addClass("disabled");
            }
        }
        //资料待审核状态则不可以撤销上一步
        //撤销上一步是为了防止业务员误操作
        if(_status==2 || _status==1){
            $("#EM_0").addClass("disabled");
        }
        if(_status==1){
            $("#EM_1").addClass("disabled");
            $("#EM_11").removeClass("disabled");
        }
        //资金已经发放或者贷款已经还清则不可以拒绝申请
        if(_status>4){
            $("#EM_1").addClass("disabled");
        }

        /*
        * 0:拒绝操作（2等待资料审核、3等待面签、4等待资金发放，三个状态下均可直接拒绝）
        * 1：操作前进一步
        * -1：操作后退一步
        * -2:恢复申请到最初状态
        * */
        function changeStatus(diff){

            var apply_logs = $("#logs").val();

            if(apply_logs == null || apply_logs == undefined || apply_logs == ""){
                alert("请输入审核意见，谢谢合作。");
                return;
            }

            $.ajax({
                type: 'POST',
                url: '/employee/applyChangeStatus/' ,
                dataType: 'text',
                data:{
                    diff:diff,
                    deal_log:apply_logs,
                    _apply_id_:'${_apply_id_!}'
                },
                success: function (data){
                    alert(data);
                    window.location.reload();
                }
            });
        }


        $("#EM_1").click(function(){
            changeStatus(0);
        });
        $("#EM_11").click(function(){
            changeStatus(-2);
        });
        $("#EM_2").click(function(){
            changeStatus(1);
        });
        $("#EM_3").click(function(){
            changeStatus(1);
        });
        $("#EM_4").click(function(){
            changeStatus(1);
        });
        $("#EM_5").click(function(){
            changeStatus(1);
        });
        $("#EM_0").click(function(){
            changeStatus(-1);
        });


    });



</script>
</body>
</html>