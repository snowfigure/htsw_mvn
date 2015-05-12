<#include '/WEB-INF/MEMBER_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/MEMBER_PAGE/comm/_member_nav.ftl'/>
    <div id="right-article">
        <h1></h1>

        <div id="right-article-content">
            <div class="panel-group" id="accordion" style="text-align: left;margin-top: -20px">
                <#list V_APPLY_SHORT_LIST as APPLY>

                    <div class="panel panel-${APPLY.valid_intro!}">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#collapse_${APPLY.id!}_apply">
                                ${APPLY.product!}：${APPLY.money!}元 - 结果：${APPLY.valid_status!}

                                </a>
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
                                <div class="col-sm-10"></div>
                                <a target="_blank" type="button col-sm-2" class="btn btn-link"
                                   href="/member/applyDetail/${APPLY._apply_id_!}">查看详情</a>

                            </div>
                        </div>
                    </div>


                </#list>

            </div>
        </div>

    </div>
    <div id="div-clear"></div>
</div>
</@layout>