<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseEnterprise">
                私营企业信息（选填）
            </a>
        </h4>
    </div>
    <div id="collapseEnterprise" class="panel-collapse collapse">
        <div class="panel-body">

            <form class="form-horizontal" role="form" id="user_Enterprise_form">
                <input type="hidden" id="user_Enterprise.id" value="${USER_ENTERPRISE.id!}">

                <div class="form-group">
                    <label for="user_Enterprise.type_id" class="col-sm-2 control-label">企业类型</label>

                    <div class="col-sm-4">
                        <select class="form-control" id="user_Enterprise.type_id" dataval="${USER_ENTERPRISE.type_id!}">

                        </select>
                    </div>

                    <label for="user_Enterprise.type_other" class="col-sm-2 control-label">其它类型</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Enterprise.type_other"
                               placeholder="请输入企业类型（其它类型企业填写）" value="${USER_ENTERPRISE.type_other!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Enterprise.establish_time" class="col-sm-2 control-label">企业成立时间</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Enterprise.establish_time"
                               placeholder="请输入成立时间（2011-12）" value="${USER_ENTERPRISE.establish_time!}">
                    </div>

                    <label for="user_Enterprise.percent" class="col-sm-2 control-label">股份占比</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Enterprise.percent" placeholder="请输入股份占有百分比（%）"
                               value="${USER_ENTERPRISE.percent!}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="user_Enterprise.place_type_id" class="col-sm-2 control-label">经营场所</label>

                    <div class="col-sm-4">
                        <select class="form-control" id="user_Enterprise.place_type_id"
                                dataval="${USER_ENTERPRISE.place_type_id!}">

                        </select>
                    </div>

                    <label for="user_Enterprise.place_rent" class="col-sm-2 control-label">租用月租金</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Enterprise.place_rent"
                               placeholder="月租金（租用类型填写：元）" value="${USER_ENTERPRISE.place_rent!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Enterprise.place_rent_endtime" class="col-sm-2 control-label">租赁到期日</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Enterprise.place_rent_endtime"
                               placeholder="请填写租赁到期日（2011-12-12）" value="${USER_ENTERPRISE.place_rent_endtime!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Enterprise.employee" class="col-sm-2 control-label">员工人数</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Enterprise.employee" placeholder="请输入员工人数"
                               value="${USER_ENTERPRISE.employee!}">
                    </div>

                    <label for="user_Enterprise.month_profit" class="col-sm-2 control-label">企业月净利润</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Enterprise.month_profit"
                               placeholder="请输入企业月净利润（元）" value="${USER_ENTERPRISE.month_profit!}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-3">
                        <div class="alert alert-info" id="user_Enterprise_save_alert"
                             style="margin: 0 ;visibility: hidden"></div>
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="form-control btn-danger" id="user_Enterprise_save"
                               value="保&nbsp;&nbsp;&nbsp;&nbsp;存">
                    </div>
                    <div class="col-sm-3"></div>
                </div>

            </form>


        </div>
    </div>
</div>


