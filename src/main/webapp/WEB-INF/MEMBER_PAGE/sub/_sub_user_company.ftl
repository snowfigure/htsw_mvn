<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseCompany">
                工作单位信息
            </a>
        </h4>
    </div>
    <div id="collapseCompany" class="panel-collapse collapse">
        <div class="panel-body">

            <form class="form-horizontal" role="form" id="user_Company_form">
                <input type="hidden" id="user_Company.id" value="${USER_COMPANY.id!}">

                <div class="form-group">
                    <label for="user_Company.name" class="col-sm-2 control-label">工作单位名称</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_Company.name" placeholder="请输入工作单位名称"
                               value="${USER_COMPANY.name!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Company.name" class="col-sm-2 control-label">前工作单位名称</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_Company.pre_company" placeholder="请输入前工作单位名称"
                               value="${USER_COMPANY.pre_company!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Company.company_type_id" class="col-sm-2 control-label">单位性质</label>

                    <div class="col-sm-4">
                        <select class="form-control" id="user_Company.company_type_id"
                                dataval="${USER_COMPANY.company_type_id!}">

                        </select>
                    </div>

                    <label for="user_Company.company_belong_id" class="col-sm-2 control-label">所属行业</label>

                    <div class="col-sm-4">
                        <select class="form-control" id="user_Company.company_belong_id"
                                dataval="${USER_COMPANY.company_belong_id!}">

                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Company.department" class="col-sm-2 control-label">部门</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.department" placeholder="请输入部门"
                               value="${USER_COMPANY.department!}">
                    </div>

                    <label for="user_Company.job_title" class="col-sm-2 control-label">职务名称</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.job_title" placeholder="请输入职务名称"
                               value="${USER_COMPANY.job_title!}">
                    </div>
                </div>


                <div class="form-group">
                    <label for="user_Company.job_type_id" class="col-sm-2 control-label">职位类别</label>

                    <div class="col-sm-4">
                        <select class="form-control" id="user_Company.job_type_id"
                                dataval="${USER_COMPANY.job_type_id!}">

                        </select>
                    </div>
                    <label for="user_Company.job_type_other" class="col-sm-2 control-label">其它类型职位</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.job_type_other" placeholder="其它类型职位填写"
                               value="${USER_COMPANY.job_type_other!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Company.join_time" class="col-sm-2 control-label">入职时间</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.join_time" placeholder="2012-11"
                               value="${USER_COMPANY.join_time!}">
                    </div>

                    <label for="user_Company.company_telephone" class="col-sm-2 control-label">单位电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.company_telephone"
                               placeholder="区号-总机-分机" value="${USER_COMPANY.company_telephone!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Company" class="col-sm-2 control-label">现单位地址</label>

                    <div class="col-sm-3">
                        <select class="form-control" id="user_Company.company_address_province"
                                dataval="${USER_COMPANY.company_address_province!}">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Company.company_address_city"
                                dataval="${USER_COMPANY.company_address_city!}">

                        </select>
                    </div>
                    <div class="col-sm-3">
                        <select class="form-control" id="user_Company.company_address_town"
                                dataval="${USER_COMPANY.company_address_town!}">

                        </select>
                    </div>
                    <div class="col-sm-2">
                    </div>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="user_Company.company_address_detail"
                               placeholder="现单位地址" value="${USER_COMPANY.company_address_detail!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Company.salary_give_type" class="col-sm-2 control-label">工资发放形式</label>

                    <div class="col-sm-4">
                        <select class="form-control" id="user_Company.salary_give_type_id"
                                dataval="${USER_COMPANY.salary_give_type_id!}">

                        </select>
                    </div>
                    <label for="user_Company.salary_give_day" class="col-sm-2 control-label">每月发薪日</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.salary_give_day" placeholder="请输入每月发薪日"
                               value="${USER_COMPANY.salary_give_day!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Company.salary_base" class="col-sm-2 control-label">每月基本月薪</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.salary_base" placeholder="请输入基本月薪（元）"
                               value="${USER_COMPANY.salary_base!}">
                    </div>
                    <label for="user_Company.other_input" class="col-sm-2 control-label">其它收入</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.other_input" placeholder="请输入其它收入（元）"
                               value="${USER_COMPANY.other_input!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Company.gjj_company" class="col-sm-2 control-label">公积金（公司缴纳）</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.gjj_company"
                               placeholder="请输入公司缴纳公积金（元）" value="${USER_COMPANY.gjj_company!}">
                    </div>
                    <label for="user_Company.gjj_personal" class="col-sm-2 control-label">公积金（个人缴纳）</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Company.gjj_personal"
                               placeholder="请输入个人缴纳公积金（元）" value="${USER_COMPANY.gjj_personal!}">
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_Company.ssc_id" class="col-sm-2 control-label">社会保障卡号</label>

                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="user_Company.ssc_id" placeholder="请输入社会保障卡号"
                               value="${USER_COMPANY.ssc_id!}">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-3">
                        <div class="alert alert-info" id="user_Company_save_alert"
                             style="margin: 0 ;visibility: hidden"></div>
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="form-control btn-danger" id="user_Company_save"
                               value="保&nbsp;&nbsp;&nbsp;&nbsp;存">
                    </div>
                    <div class="col-sm-3"></div>
                </div>

            </form>


        </div>
    </div>
</div>


