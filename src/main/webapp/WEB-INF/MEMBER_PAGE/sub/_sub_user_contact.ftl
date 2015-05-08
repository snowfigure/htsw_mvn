<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseContact">
                联系人信息
            </a>
        </h4>
    </div>
    <div id="collapseContact" class="panel-collapse collapse">
        <div class="panel-body">

            <form class="form-horizontal" role="form" id="user_Contact_form">
                <input type="hidden" id="user_Contact.id" value="${USER_CONTACT.id!}">

                <div class="alert alert-success">配偶联系信息</div>
                <div id="div-clear"></div>
                <div class="form-group">
                    <label for="user_Contact.spouse_name" class="col-sm-2 control-label">姓名</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.spouse_name" placeholder="请输入配偶姓名"
                               value="${USER_CONTACT.spouse_name!}">
                    </div>

                    <label for="user_Contact.spouse_telephone" class="col-sm-2 control-label">移动电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.spouse_telephone"
                               placeholder="请输入配偶移动电话" value="${USER_CONTACT.spouse_telephone!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Contact.spouse_company" class="col-sm-2 control-label">单位名称</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.spouse_company" placeholder="请输入配偶单位名称"
                               value="${USER_CONTACT.spouse_company!}">
                    </div>

                    <label for="user_Contact.spouse_company_telephone" class="col-sm-2 control-label">单位电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.spouse_company_telephone"
                               placeholder="请输入配偶单位电话" value="${USER_CONTACT.spouse_company_telephone!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Contact.spouse_company_address" class="col-sm-2 control-label">单位地址</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="user_Contact.spouse_company_address"
                               placeholder="请输入配偶的单位地址" value="${USER_CONTACT.spouse_company_address!}">
                    </div>
                </div>

                <!-- ====================================================================================   -->

                <div class="alert alert-info">直系亲属联系信息</div>
                <div id="div-clear"></div>
                <div class="form-group">
                    <label for="user_Contact.relative_name" class="col-sm-2 control-label">姓名</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.relative_name" placeholder="请输入直系亲属姓名"
                               value="${USER_CONTACT.relative_name!}">
                    </div>

                    <label for="user_Contact.relative_telephone" class="col-sm-2 control-label">移动电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.relative_telephone"
                               placeholder="请输入直系亲属移动电话" value="${USER_CONTACT.relative_telephone!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Contact.relative_relation" class="col-sm-2 control-label">亲属关系</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.relative_relation"
                               placeholder="请输入你们之间的亲属关系" value="${USER_CONTACT.relative_relation!}">
                    </div>

                    <label for="user_Contact.relative_house_telephone" class="col-sm-2 control-label">住宅电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.relative_house_telephone"
                               placeholder="请输入直系亲属的住宅电话" value="${USER_CONTACT.relative_house_telephone!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Contact.relative_house_address" class="col-sm-2 control-label">住宅地址</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="user_Contact.relative_house_address"
                               placeholder="请输入直系亲属的住宅地址" value="${USER_CONTACT.relative_house_address!}">
                    </div>
                </div>

                <!-- ====================================================================================   -->
                <div class="alert alert-success">同事联系信息</div>
                <div id="div-clear"></div>
                <div class="form-group">
                    <label for="user_Contact.workmate_name" class="col-sm-2 control-label">姓名</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.workmate_name" placeholder="请输入同事姓名"
                               value="${USER_CONTACT.workmate_name!}">
                    </div>

                    <label for="user_Contact.workmate_telephone" class="col-sm-2 control-label">移动电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.workmate_telephone"
                               placeholder="请输入同事移动电话" value="${USER_CONTACT.workmate_telephone!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Contact.workmate_company_department" class="col-sm-2 control-label">单位电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.workmate_company_department"
                               placeholder="请输入同事的单位电话" value="${USER_CONTACT.workmate_company_department!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Contact.workmate_company_department" class="col-sm-2 control-label">部门</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.workmate_company_department"
                               placeholder="请输入同事部门" value="${USER_CONTACT.workmate_company_department!}">
                    </div>
                    <label for="user_Contact.workmate_jobs" class="col-sm-2 control-label">职务</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.workmate_jobs" placeholder="请输入同事职务"
                               value="${USER_CONTACT.workmate_jobs!}">
                    </div>
                </div>

                <!-- ====================================================================================   -->

                <div class="alert alert-info">其他联系人的联系信息</div>
                <div id="div-clear"></div>
                <div class="form-group">
                    <label for="user_Contact.other_name" class="col-sm-2 control-label">姓名</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.other_name" placeholder="请输入联系人姓名"
                               value="${USER_CONTACT.other_name!}">
                    </div>

                    <label for="user_Contact.other_telephone" class="col-sm-2 control-label">移动电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.other_telephone"
                               placeholder="请输入联系人移动电话" value="${USER_CONTACT.other_telephone!}">
                    </div>
                </div>

                <div class="form-group">
                    <label for="user_Contact.other_relation" class="col-sm-2 control-label">关系</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.other_relation"
                               placeholder="请输入你们之间的关系" value="${USER_CONTACT.other_relation!}">
                    </div>

                    <label for="user_Contact.other_house_telephone" class="col-sm-2 control-label">住宅电话</label>

                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="user_Contact.other_house_telephone"
                               placeholder="请输入联系人的住宅电话" value="${USER_CONTACT.other_house_telephone!}">
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-3">
                        <div class="alert alert-info" id="user_Contact_save_alert"
                             style="margin: 0 ;visibility: hidden"></div>
                    </div>
                    <div class="col-sm-6">
                        <input type="button" class="form-control btn-danger" id="user_Contact_save"
                               value="保&nbsp;&nbsp;&nbsp;&nbsp;存">
                    </div>
                    <div class="col-sm-3"></div>
                </div>

            </form>


        </div>
    </div>
</div>


