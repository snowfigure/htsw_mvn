<#include '/WEB-INF/EMPLOYEE_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/EMPLOYEE_PAGE/comm/_emeployee_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content" style="margin-top: -17px ">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">【待处理】贷款申请 接收 平台</h3>
                </div>
                <div class="panel-body">
                    <div class="panel-group" id="accordion">
                        <#list V_APPLY_SHORT_LIST as APPLY>

                            <div class="panel panel-${APPLY.valid_intro!}">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        <div class="col-sm-9">
                                            <a data-toggle="collapse" data-parent="#accordion"
                                               href="#collapse_${APPLY.id!}_apply">
                                            ${APPLY.product!}：${APPLY.money!}元
                                            </a>
                                        </div>
                                        <div class="col-sm-3">
                                        ${APPLY.apply_time!}
                                        </div>

                                        <div style="clear: both"></div>

                                    </h4>
                                </div>
                                <div id="collapse_${APPLY.id!}_apply" class="panel-collapse collapse">
                                    <div class="panel-body" style="font-size: 15px">
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4 control-label"
                                                   style="text-align: right">产品类型：</label>
                                            <span class="col-sm-8">${APPLY.product!}</span>
                                        </div>
                                        <div class="col-sm-6 control-label">
                                            <label class="col-sm-4 control-label"
                                                   style="text-align: right">贷款金额：</label>
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

                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-2">
                                            <a target="_blank" type="button" class="btn btn-default"
                                               onclick="applyTake('${APPLY._apply_id_!}')">接受申请单</a>
                                        </div>
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-2"></div>
                                        <div class="col-sm-2">
                                            <a target="_blank" type="button" class="btn btn-default"
                                               href="/employee/applyDetail/${APPLY._apply_id_!}">查看申请单</a>
                                        </div>
                                        <div class="col-sm-2"></div>

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

                    <@paginate currentPage=currentPage totalPage=totalPage actionUrl="/employee/deal/" />
                    <div style="clear: both"></div>
                </div>
            </div>


        </div>
        <div id="div-clear"></div>
    </div>
    <div id="div-clear"></div>
</div>
<div id="div-clear"></div>
</@layout>

<!-- 模态框（Modal） -->
<div class="modal fade" id="alert_modal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="modal_title">
                    操作提示
                </h4>
            </div>
            <div class="modal-body" id="modal_detail">

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

<script type="text/javascript">
    $(document).ready(function () {
        $('#alert_modal').on('hide.bs.modal', function () {
            window.location.reload();
        })
    });
    function applyTake(apply_id) {
        $.ajax({
            type: 'POST',
            url: '/employee/applyTake/',
            dataType: 'text',
            data: {
                apply_id: apply_id
            },
            success: function (data) {
                if (data == "true" || data == "false") {
                    $("#modal_detail").html("申请单接受成功，请前往“处理记录”-“等待资料审核”进行相关处理。");
                }
                else {
                    $("#modal_detail").html(data);
                }
                $('#alert_modal').modal('show');

            }
        });
    }
</script>
