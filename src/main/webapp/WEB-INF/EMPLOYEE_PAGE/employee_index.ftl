<#include '/WEB-INF/EMPLOYEE_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/EMPLOYEE_PAGE/comm/_emeployee_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content" style="margin-top: -17px">

            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">平台贷款业务处理统计</h3>
                </div>
                <div class="panel-body">
                    <div class="btn btn-primary col-sm-3" style="text-align: left">平台总待处理：${WAIT_TOTAL !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div class="btn btn-primary col-sm-3" style="text-align: left">今日总待处理：${WAIT_TOTAL_TODAY !} 笔</div>
                    <div class="col-sm-1"></div>




                    <div style="clear: both"></div><br>


                </div>
            </div>

            <div class="panel panel-info">
                <div class="panel-heading">
                    <h3 class="panel-title">业务员（${user['username']!}）贷款业务处理统计</h3>
                </div>
                <div class="panel-body">

                    <div class="btn btn-primary col-sm-3" style="text-align: left">本人已接收：${EMPLOYEE_DEAL_TOTAL !} 笔</div>
                    <div class="col-sm-1"></div>

                    <div class="btn btn-danger col-sm-3" style="text-align: left">本人已拒绝：${EMPLOYEE_DEAL_1 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div style="clear: both"></div><br>

                    <div class="btn btn-success col-sm-3" style="text-align: left">资料审核通过：${EMPLOYEE_DEAL_3 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div class="btn btn-success col-sm-3" style="text-align: left">面签审核通过：${EMPLOYEE_DEAL_4 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div class="btn btn-success col-sm-3" style="text-align: left">资金发放通过：${EMPLOYEE_DEAL_5 !} 笔</div>
                    <div class="col-sm-1"></div>


                    <div class="col-sm-1"></div>

                </div>
            </div>

        </div>
        <div id="div-clear"></div>
    </div>
    <div id="div-clear"></div>
</div>
<div id="div-clear"></div>
</@layout>
<script src="/assets/htsw/MEMBER/load.js"></script>
<script src="/assets/htsw/MEMBER/save.js"></script>