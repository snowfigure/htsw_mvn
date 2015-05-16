<#include '/WEB-INF/EMPLOYEE_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/EMPLOYEE_PAGE/comm/_emeployee_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content" style="margin-top: -17px ">

            <div class="btn-group">
                <a id="EM_0" class="btn btn-default " href="/employee/dealLog/0">&nbsp;&nbsp;&nbsp;所有申请记录&nbsp;&nbsp;&nbsp;</a>
                <a id="EM_1" class="btn btn-default " href="/employee/dealLog/1">&nbsp;&nbsp;&nbsp;申请已拒绝&nbsp;&nbsp;&nbsp;</a>
                <a id="EM_2" class="btn btn-default" href="/employee/dealLog/2">&nbsp;&nbsp;等待资料审核&nbsp;&nbsp;</a>
                <a id="EM_3" class="btn btn-default" href="/employee/dealLog/3">&nbsp;&nbsp;等待用户面签&nbsp;&nbsp;</a>
                <a id="EM_4" class="btn btn-default" href="/employee/dealLog/4">&nbsp;&nbsp;等待资金发放</a>
                <a id="EM_5" class="btn btn-default" href="/employee/dealLog/5">&nbsp;&nbsp;&nbsp;申请已通过&nbsp;&nbsp;&nbsp;</a>
                <a id="EM_6" class="btn btn-default" href="/employee/dealLog/6">&nbsp;&nbsp;&nbsp;贷款已还清&nbsp;&nbsp;&nbsp;</a>

            </div>
            <div style="clear: both"></div>
            <br/>


            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">我的处理业务 </h3>
                </div>
                <div class="panel-body">
                    <div class="panel-group" id="accordion" >
                        <#list V_APPLY_SHORT_LIST as APPLY>

                            <div class="panel panel-${APPLY.valid_intro!}">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <a class="col-sm-9"
                                                data-toggle="collapse" data-parent="#accordion"
                                           href="#collapse_${APPLY.id!}_apply">
                                        ${APPLY.product!}：${APPLY.money!}元
                                        </a>

                                        <div class="col-sm-3">
                                        ${APPLY.apply_time!}
                                        </div>

                                        <div style="clear: both"></div>

                                    </h4>
                                </div>
                                <div id="collapse_${APPLY.id!}_apply" class="panel-collapse collapse">
                                    <div class="panel-body" style="font-size: 15px">
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4 control-label" style="text-align: right">产品类型：</label>
                                            <span class="col-sm-8">${APPLY.product!}</span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4 control-label" style="text-align: right">贷款金额：</label>
                                            <span class="col-sm-8">${APPLY.money!} 元</span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">申请期限：</label>
                                            <span class="col-sm-8">${APPLY.use_time!}</span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">最高月还款：</label>
                                            <span class="col-sm-8">${APPLY.month_payment!} 元</span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">借款用途：</label>
                                            <span class="col-sm-8">${APPLY.use_for!} ${APPLY.use_for_other!} </span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">&nbsp;</label>
                                            <span class="col-sm-8">&nbsp;</span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">还款方式：</label>
                                            <span class="col-sm-8">${APPLY.pay_way!}</span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">还款来源：</label>
                                            <span class="col-sm-8">${APPLY.pay_source!} </span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">申请日期：</label>
                                            <span class="col-sm-8">${APPLY.apply_time!} </span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4" style="text-align: right">申请状态：</label>
                                            <span class="col-sm-8">${APPLY.valid_status!} </span>
                                        </div>
                                        <div style="clear: both"></div>
                                        <br/>

                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3">
                                            <a target="_blank" class="btn btn-default"
                                               onclick="showLog('${APPLY._apply_id_!}')">审核日志</a>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3">
                                            <a target="_blank" type="button" class="btn btn-default"
                                               href="/employee/applyDeal/${APPLY._apply_id_!}">
                                                处理申请单
                                            </a>
                                        </div>
                                        <div class="col-sm-1"></div>
                                        <div class="col-sm-3">
                                            <a target="_blank" type="button" class="btn btn-default"
                                               href="/employee/applyDetail/${APPLY._apply_id_!}">打印申请单</a>
                                        </div>

                                    </div>
                                </div>
                            </div>


                        </#list>
                    </div>
                    <div style="clear: both"></div>
                    <div class="col-sm-2"></div>
                    <div class="col-sm-8" style="text-align: center">
                        <#include '/WEB-INF/COMM_LAYOUT/_paginate.ftl'/>
                    </div>

                    <@paginate currentPage=currentPage totalPage=totalPage actionUrl="/employee/dealLog/${STATUS!}-" />
                    <div style="clear: both"></div>
                </div>
            </div>


        </div>
        <div id="div-clear"></div>
    </div>
    <div id="div-clear"></div>
</div>
<div id="div-clear"></div>

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

</@layout>

<script type="text/javascript">
    $(document).ready(function () {
         $("#EM_${STATUS!}").addClass("active");
    });


    function showLog(apply_id) {
        $.ajax({
            type: "post",
            url: "/employee/getApplyLog/" + apply_id,
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



</script>
