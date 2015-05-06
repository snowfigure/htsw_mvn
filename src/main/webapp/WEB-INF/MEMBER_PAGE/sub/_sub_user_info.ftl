<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseOne">
                个人基本信息
            </a>
        </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse">
        <div class="panel-body">

            <form class="form-horizontal" role="form" id="user_Info_form">
                <div class="form-group">
                    <label for="user_Info.realname" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.realname" placeholder="请输入真实姓名">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.gender" class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="user_Info.gender">
                            <option value="-1"> - </option>
                            <option value="1">男</option>
                            <option value="0">女</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.telephone" class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.telephone" placeholder="请输入常用联系方式（手机）">
                    </div>
                    <label for="user_Info.telephone_psd" class="col-sm-2 control-label">手机服务密码</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="user_Info.telephone_psd" placeholder="请输入手机服务密码">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.marry_status_id" class="col-sm-2 control-label">婚姻状况</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="user_Info.marry_status_id">
                            <option value="-1"> - </option>
                            <option value="0">未婚</option>
                            <option value="1">已婚</option>
                            <option value="2">离异</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.idcard" class="col-sm-2 control-label">身份证号码</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.idcard" placeholder="请输入18位身份证号码">
                    </div>

                    <label for="user_Info.idcard_endtime" class="col-sm-2 control-label">身份证号码有效期</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.idcard_endtime" placeholder="有效期（2030.10.20）">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.children" class="col-sm-2 control-label">子女数量</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.children" placeholder="子女数量">
                    </div>

                    <label for="user_Info.provide_num" class="col-sm-2 control-label">供养人数</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.provide_num" placeholder="供养人数">
                    </div>

                </div>

                <div class="form-group">
                    <label for="user_Info.family_month_use" class="col-sm-2 control-label">家庭月支出</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="user_Info.family_month_use" placeholder="家庭月支出">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.degree_id" class="col-sm-2 control-label">最高学历</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="user_Info.degree_id">

                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info" class="col-sm-2 control-label">户籍所在地</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Info.huji_provence">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Info.huji_city">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Info.huji_town">

                        </select>
                    </div>
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="user_Info.hukou_area_detail" placeholder="详细地址">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info" class="col-sm-2 control-label">现住宅地址</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Info.address_provence">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Info.address_city">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Info.address_town">

                        </select>
                    </div>
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="user_Info.address_area_detail" placeholder="现住宅地址">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.address_telephone" class="col-sm-2 control-label">住宅电话</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.address_telephone" placeholder="0518-########">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Info.address_arrive_time" class="col-sm-2 control-label">住宅居住时间</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.address_arrive_time" placeholder="2012-11">
                    </div>
                    <label for="user_Info.city_arrive_time" class="col-sm-2 control-label">来本市时间</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.city_arrive_time" placeholder="2012-11">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Info.qq_number" class="col-sm-2 control-label">QQ</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.qq_number" placeholder="请输入QQ号码">
                    </div>
                    <label for="user_Info.wechat_number" class="col-sm-2 control-label">微信</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Info.wechat_number" placeholder="微信账号（如：hengtong）">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-6">
                        <input type="button" class="form-control btn-danger" id="user_Info_save" value="保&nbsp;&nbsp;&nbsp;&nbsp;存">
                    </div>
                    <div class="col-sm-3"></div>
                </div>
            </form>


        </div>
    </div>
</div>


