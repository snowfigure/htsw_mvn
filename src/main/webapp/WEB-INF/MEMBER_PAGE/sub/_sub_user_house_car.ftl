<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseHouseCar">
                房产、车辆等信息
            </a>
        </h4>
    </div>
    <div id="collapseHouseCar" class="panel-collapse collapse">
        <div class="panel-body">

            <form class="form-horizontal" role="form" id="user_House_form">
                <div class="form-group">
                    <label for="user_House.type_id" class="col-sm-2 control-label">房产类型</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="user_House.type_id">

                        </select>
                    </div>
                    <label for="user_House.house_rent" class="col-sm-2 control-label">租房月租</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_House.house_rent" placeholder="房产为租房需填写（元）">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_House.buy_time" class="col-sm-2 control-label">购买时间</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_House.buy_time" placeholder="请输入购买时间（2008-11）">
                    </div>
                    <label for="user_House.buy_price" class="col-sm-2 control-label">购买价格</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_House.buy_price" placeholder="请输入购买价格（万元）">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_House.size" class="col-sm-2 control-label">建筑面积</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_House.size" placeholder="请输入建筑面积（平方米）">
                    </div>
                    <label for="user_House.percent" class="col-sm-2 control-label">产权比例</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_House.percent" placeholder="请输入产权比例（%）">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_House.address_id" class="col-sm-2 control-label">房产地址</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_House.address_provence">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_House.address_city">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_House.address_town">

                        </select>
                    </div>
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="user_House.address_detail" placeholder="房产详细地址">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_House.loan_year" class="col-sm-2 control-label">贷款年限</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_House.loan_year" placeholder="请输入贷款年限（年）">
                    </div>
                    <label for="user_House.month_payment" class="col-sm-2 control-label">贷款月供</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_House.month_payment" placeholder="请输入贷款月供（元）">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_House.load_left" class="col-sm-2 control-label">贷款余额</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_House.load_left" placeholder="请输入贷款余额（万元）">
                    </div>
                </div>


                <div class="form-group">
                    <label for="user_Car.address_id" class="col-sm-2 control-label">车辆情况</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Car.have_car_type">
                            <option>无</option>
                            <option>全款购买</option>
                            <option>按揭购买</option>
                        </select>
                    </div>
                    <div class="col-sm-5">
                        <input type="text" class="form-control" id="user_Car.buy_total_loan" placeholder="全款金额或按揭月租（万元）">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Car.buy_time" class="col-sm-2 control-label">车辆购买时间</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Car.buy_time" placeholder="请输入车辆购买时间（2012-11）">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input type="button" class="form-control btn-danger" id="user_House_save" value="保&nbsp;&nbsp;&nbsp;&nbsp;存">
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </form>


        </div>
    </div>
</div>


