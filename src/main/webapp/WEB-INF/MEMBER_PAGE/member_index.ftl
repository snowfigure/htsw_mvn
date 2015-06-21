<#include '/WEB-INF/MEMBER_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/MEMBER_PAGE/comm/_member_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content" style="margin-top: -17px">

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">个人贷款情况</h3>
                </div>
                <div class="panel-body">
                    <div class="btn btn-primary col-sm-3" style="text-align: left">总申请：${APPLY_TOTAL !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div style="clear: both"></div><br>

                    <div class="btn btn-danger col-sm-3" style="text-align: left">申请失败：${APPLY_STATUS_1 !} 笔</div>
                    <div class="col-sm-1"></div>

                    <div style="clear: both"></div><br>
                    <div class="btn btn-info col-sm-3" style="text-align: left">等待资料审核：${APPLY_STATUS_2 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div class="btn btn-info col-sm-3" style="text-align: left">等待面签：${APPLY_STATUS_3 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div class="btn btn-info col-sm-3" style="text-align: left">等待资金发放：${APPLY_STATUS_4 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div style="clear: both"></div><br>
                    <div class="btn btn-success col-sm-3" style="text-align: left">申请成功：${APPLY_STATUS_6 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div class="btn btn-success col-sm-3" style="text-align: left">资金已发放：${APPLY_STATUS_5 !} 笔</div>
                    <div class="col-sm-1"></div>
                    <div class="btn btn-success col-sm-3" style="text-align: left">还款已结束：${APPLY_STATUS_6 !} 笔</div>
                    <div class="col-sm-1"></div>

                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-body">
                    <p>标签颜色定义</p>

                    <p>
                        <span class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        客户贷款总申请次数统计
                    </p>

                    <p>
                        <span class="btn btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        客户贷款申请已拒绝统计
                    </p>

                    <p>
                        <span class="btn btn-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        客户贷款申请成功统计（包括资金已发放、贷款已还清两类）
                    </p>

                    <p>
                        <span class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        客户贷款申请信息处理中统计（包括 资金申请资料等待审核、等待用户到公司面签、等待资金下发 三类）
                    </p>


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