<div class="panel panel-primary" style="margin-top: -30px">
    <div class="panel-heading">
        <h4 class="panel-title">贷款申请</h4>
    </div>
    <div class="panel-body">

        <form class="form-horizontal" role="form" id="apply_form">
            <input type="hidden" id="apply.id" value="${USER_APPLY.id!}">

            <div class="form-group">
                <label for="apply.product_id" class="col-sm-2 control-label">产品类型</label>

                <div class="col-sm-4">
                    <select class="form-control" id="apply.product_id" dataval="${USER_APPLY.product_id!}"
                            validate="true">

                    </select>
                </div>

                <label for="apply.realname" class="col-sm-2 control-label">借款金额</label>

                <div class="col-sm-4">
                    <input type="text" class="form-control" id="apply.money" placeholder="请输入借款金额（元）"
                           value="${USER_APPLY.money!}" validate="true">
                </div>

            </div>

            <div class="form-group">
                <label for="apply.use_time_id" class="col-sm-2 control-label">申请期限</label>

                <div class="col-sm-4">
                    <select class="form-control" id="apply.use_time_id" dataval="${USER_APPLY.use_time_id!}"
                            validate="true">

                    </select>
                </div>

                <label for="apply.month_payment" class="col-sm-2 control-label">最高月还款</label>

                <div class="col-sm-4">
                    <input type="text" class="form-control" id="apply.month_payment" placeholder="请输入最高月还款（元）"
                           value="${USER_APPLY.month_payment!}" validate="true">
                </div>

            </div>

            <div class="form-group">
                <label for="apply.use_for_id" class="col-sm-2 control-label">借款用途</label>

                <div class="col-sm-4">
                    <select class="form-control" id="apply.use_for_id" dataval="${USER_APPLY.use_for_id!}"
                            validate="true">

                    </select>
                </div>

                <label for="apply.use_for_other" class="col-sm-2 control-label">其它借款用途</label>

                <div class="col-sm-4">
                    <input type="text" class="form-control" id="apply.use_for_other" placeholder="其它借款用途"
                           value="${USER_APPLY.use_for_other!}">
                </div>

            </div>


            <div class="form-group">
                <label for="apply.pay_way_id" class="col-sm-2 control-label">还款方式</label>

                <div class="col-sm-4">
                    <select class="form-control" id="apply.pay_way_id" dataval="${USER_APPLY.pay_way_id!}"
                            validate="true">

                    </select>
                </div>

                <label for="apply.pay_source" class="col-sm-2 control-label">还款来源</label>

                <div class="col-sm-4">
                    <input type="text" class="form-control" id="apply.pay_source" placeholder="请输入还款来源"
                           value="${USER_APPLY.pay_source!}" validate="true">
                </div>

            </div>

            <div class="form-group">
                <div class="col-sm-3">
                    <div class="alert alert-info" id="apply_save_alert"
                         style="margin: 0 ;visibility: hidden"></div>
                </div>
                <div class="col-sm-6">
                    <input type="button" class="form-control btn-primary" id="apply_save"
                           value="${USER_APPLY_SAVE!}">
                </div>
                <div class="col-sm-3">

                </div>
            </div>
            <div class="col-sm-12">
                <p>注意事项：</p>

                <p>1、贷款申请之前，请在<a href="/member/edit.html" target="_blank">“信息编辑”</a>页面填写完整所有信息（私营企业信息选填）；</p>

                <p>2、为提高申请通过率，请如实准确的填写申请信息，否则会影响您贷款审核效率；</p>

                <p>3、如果借款用途为“其它”类型的，请在“其它借款用途”输入框中填写您的借款用途，谢谢合作。</p>

                <p>4、每个人同时只能申请1笔贷款，若需要申请多笔贷款，请<a href="/contact.html" target="_blank">联系我们</a></p>

                <p>5、贷款申请帮助请参考：
                    <a href="/products.html" target="_blank">产品介绍</a>、
                    <a href="/fresher.html" target="_blank">新手入门</a>、
                    <a href="/zifei.html" target="_blank">资费说明</a>、
                    <a href="/commques.html" target="_blank">常见问题</a>
                </p>
            </div>

        </form>


    </div>
</div>


