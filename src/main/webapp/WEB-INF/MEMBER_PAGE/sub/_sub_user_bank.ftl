<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseBank">
                银行、征信等信息
            </a>
        </h4>
    </div>
    <div id="collapseBank" class="panel-collapse collapse">
        <div class="panel-body">

            <form class="form-horizontal" role="form" id="user_Bank_form">
                <input type="hidden" id="user_Bank.id" value="${USER_BANK.id!}">
                <div class="form-group">
                    <label for="user_Bank.bank_card_no" class="col-sm-2 control-label">下款银行账户</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_Bank.bank_card_no" placeholder="请输入下款银行账户"
                               value="${USER_BANK.bank_card_no!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Bank.back_name" class="col-sm-2 control-label">下款卡开户行</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_Bank.back_name" placeholder="请输入下款卡开户行"
                               value="${USER_BANK.back_name!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Bank.credit_card_number" class="col-sm-2 control-label">信用卡张数</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.credit_card_number" placeholder="请输入信用卡张数"
                               value="${USER_BANK.credit_card_number!}">
                    </div>
                    <label for="user_Bank.credit_card_limit" class="col-sm-2 control-label">单卡最高额度</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.credit_card_limit"
                               placeholder="请输入单卡最高额度（元）" value="${USER_BANK.credit_card_limit!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Bank.other_debt" class="col-sm-2 control-label">其它负债</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.other_debt" placeholder="请输入其它负债（元）"
                               value="${USER_BANK.other_debt!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Bank.month_payment" class="col-sm-2 control-label">月还款</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.month_payment" placeholder="请输入月还款金额（元）"
                               value="${USER_BANK.month_payment!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Bank.credit_score_username" class="col-sm-2 control-label">征信登录名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.credit_score_username"
                               placeholder="请输入征信登录名" value="${USER_BANK.credit_score_username!}">
                    </div>
                    <label for="user_Bank.credit_score_password" class="col-sm-2 control-label">征信登录密码</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="user_Bank.credit_score_password"
                               placeholder="请输入征信登录密码" value="${USER_BANK.credit_score_password!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Bank.credit_score_search_code" class="col-sm-2 control-label">查询码</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.credit_score_search_code"
                               placeholder="请输入征信查询码" value="${USER_BANK.credit_score_search_code!}">
                    </div>
                    <label for="user_Bank.credit_score_active_code" class="col-sm-2 control-label">激活码</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.credit_score_active_code"
                               placeholder="请输入征信激活码" value="${USER_BANK.credit_score_active_code!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Bank.electricity_bill_no" class="col-sm-2 control-label">电费单户号</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.electricity_bill_no" placeholder="请输电费单户号"
                               value="${USER_BANK.electricity_bill_no!}">
                    </div>
                    <label for="user_Bank.electricity_bill_house_name" class="col-sm-2 control-label">户名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Bank.electricity_bill_house_name"
                               placeholder="请输入户名" value="${USER_BANK.electricity_bill_house_name!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Bank.electricity_bill_record" class="col-sm-2 control-label">被执行记录</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_Bank.electricity_bill_record"
                               placeholder="请输入被执行记录" value="${USER_BANK.electricity_bill_record!}">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3">
                        <div class="alert alert-info" id="user_Bank_save_alert"
                             style="margin: 0 ;visibility: hidden"></div>
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="form-control btn-danger" id="user_Bank_save" value="保&nbsp;&nbsp;&nbsp;&nbsp;存">
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </form>


        </div>
    </div>
</div>


