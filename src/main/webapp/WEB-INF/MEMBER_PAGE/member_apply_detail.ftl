<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${systemConfig['WEBNAME']!} - ${title!}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" type="image/png" href="/img/icon.jpg">
    <meta name="keywords" content="${systemConfig['KEYWORDS']!}"/>
    <meta name="description" content="${systemConfig['DESCRIPTION']!}"/>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/assets/htsw/detail.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/assets/ext/html5shiv.js"></script>
    <script src="/assets/ext/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div class="front-content">
    <div><img src="/img/logo3.png" style="height: 45px;margin-left: 5px;margin-bottom: 13px"></div>
    <div style="font-size: 20px;font-weight: 900;margin: -37px auto 19px;width:960px;text-align: center;"><b>借款服务申请表</b>
    </div>
    <div id="content-table">
        <div class="key" style="width: 161px;">您申请的产品类型</div>
        <div class="value" style="width: 466px;">${V_APPLY.product_html!}&nbsp;</div>
        <div class="key" style="width: 160px;">您申请的贷款额度</div>
        <div class="value" style="width: 141px;text-align: center">${V_APPLY.money!}&nbsp;&nbsp;元</div>
        <div id="clear"></div>

        <div class="key" style="width: 161px;">您的申请期限</div>
        <div class="value" style="width: 466px;">${V_APPLY.use_time_html!}&nbsp;</div>
        <div class="key" style="width: 160px;">您可接受的最高月还款额</div>
        <div class="value" style="width: 141px;text-align: center">${V_APPLY.month_payment!}&nbsp;&nbsp;元</div>
        <div id="clear"></div>

        <div class="key" style="width: 162px;padding: 13px 0 14px 3px">您的借款用途</div>
        <div class="value" style="width: 783px;padding: 7px 0 6px 6px">
        ${V_APPLY.use_for_html!}<u>&nbsp;&nbsp;${V_APPLY.use_for_other!}&nbsp;&nbsp;</u>
        </div>
        <div id="clear"></div>

        <div class="key" style="width: 161px;">还款方式</div>
        <div class="value" style="width: 466px;">${V_APPLY.pay_way_html!}&nbsp;</div>
        <div class="key" style="width: 160px;">还款来源</div>
        <div class="value" style="width: 141px;text-align: center">${V_APPLY.pay_source!}&nbsp;</div>
        <div id="clear"></div>

        <div class="value" style="width: 947px;font-weight: 800;padding-bottom: 6px">您的个人信息</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">姓名</div>
        <div class="value" style="width: 108px;text-align: center">${V_USER_INFO.realname!}&nbsp;</div>
        <div class="key" style="width: 60px;">性别</div>
        <div class="value" style="width: 106px;">${V_USER_INFO.gender_html!}&nbsp;</div>
        <div class="key" style="width: 92px;">联系方式</div>
        <div class="value" style="width: 174px;">${V_USER_INFO.telephone!}&nbsp;</div>
        <div class="key" style="width: 92px;">手机服务密码</div>
        <div class="value" style="width: 158px;text-align: center">${V_USER_INFO.telephone_psd!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">婚姻状况</div>
        <div class="value" style="width: 190px;">${V_USER_INFO.marry_status_html!}&nbsp;</div>
        <div class="key" style="width: 76px;">身份证号码</div>
        <div class="value" style="width: 288px;">${V_USER_INFO.idcard!}&nbsp;</div>
        <div class="key" style="width: 92px;">身份证有效期</div>
        <div class="value" style="width: 158px;text-align: center">${V_USER_INFO.idcard_endtime!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">子女数目</div>
        <div class="value" style="width: 190px;text-align: center">${V_USER_INFO.children!}&nbsp;&nbsp;人</div>
        <div class="key" style="width: 76px;">供养人数</div>
        <div class="value" style="width: 189px;text-align: center">${V_USER_INFO.provide_num!}&nbsp;&nbsp;人</div>
        <div class="key" style="width: 109px;">每月家庭支出</div>
        <div class="value" style="width: 240px;text-align: center">${V_USER_INFO.family_month_use!}&nbsp;&nbsp;元</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;;padding-bottom: 5px">最高学历</div>
        <div class="value" style="width: 832px;padding-bottom: 5px">${V_USER_INFO.degree_html!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">户籍所在地</div>
        <div class="value" style="width: 87px;text-align: right;border-right: 0">${V_USER_INFO.huji_province!}</div>
        <div class="value" style="width: 10px;border-right: 0;">省</div>
        <div class="value" style="width: 65px;text-align: right;border-right: 0">${V_USER_INFO.huji_town!}</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">市</div>
        <div class="value"
             style="width: 82px;text-align: right;border-right: 0;border-left:0 ">${V_USER_INFO.huji_city!}</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">区</div>
        <div class="value" style="width: 520px;border-left:0 ;">${V_USER_INFO.hukou_area_detail!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">现住宅地址</div>
        <div class="value" style="width: 87px;text-align: right;border-right: 0">${V_USER_INFO.address_province!}</div>
        <div class="value" style="width: 10px;border-right: 0;">省</div>
        <div class="value" style="width: 65px;text-align: right;border-right: 0">${V_USER_INFO.address_city!}</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">市</div>
        <div class="value"
             style="width: 82px;text-align: right;border-right: 0;border-left:0 ">${V_USER_INFO.address_town!}</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">区</div>
        <div class="value" style="width: 379px;border-left:0 ;border-right: 0;">${V_USER_INFO.address_area_detail!}
            &nbsp;</div>
        <div class="value" style="width: 133px;border-left:0 ;">□ 与户口所在地一致</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">住宅电话</div>
        <div class="value" style="width: 255px;">${V_USER_INFO.address_telephone!}&nbsp;</div>
        <div class="key" style="width: 110px;">现住宅居住时间</div>
        <div class="value" style="width: 156px;">${V_USER_INFO.address_arrive_time!}&nbsp;</div>
        <div class="key" style="width: 110px;">来本市的时间</div>
        <div class="value" style="width: 173px;">${V_USER_INFO.city_arrive_time!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">QQ账号</div>
        <div class="value" style="width: 255px;">${V_USER_INFO.qq_number!}&nbsp;</div>
        <div class="key" style="width: 110px;">微信账号</div>
        <div class="value" style="width: 453px;">${V_USER_INFO.wechat_number!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">下款卡银行账号</div>
        <div class="value" style="width: 255px;">${V_USER_BANK.bank_card_no!}&nbsp;</div>
        <div class="key" style="width: 110px;">开户行</div>
        <div class="value" style="width: 453px;">${V_USER_BANK.back_name!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">信用卡张树</div>
        <div class="value" style="width: 140px;">${V_USER_BANK.credit_card_number!}&nbsp;</div>
        <div class="key" style="width: 110px;">信用卡最高额度</div>
        <div class="value" style="width: 156px;">${V_USER_BANK.credit_card_limit!}&nbsp;</div>
        <div class="key" style="width: 76px;">其它负债</div>
        <div class="value" style="width: 121px;">${V_USER_BANK.other_debt!}&nbsp;</div>
        <div class="key" style="width: 62px;">月还款</div>
        <div class="value" style="width: 125px;">${V_USER_BANK.month_payment!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">征信登录名</div>
        <div class="value" style="width: 140px;">${V_USER_BANK.credit_score_username!}&nbsp;</div>
        <div class="key" style="width: 110px;">登陆密码</div>
        <div class="value" style="width: 156px;">${V_USER_BANK.credit_score_password!}&nbsp;</div>
        <div class="key" style="width: 76px;">查询码</div>
        <div class="value" style="width: 121px;">${V_USER_BANK.credit_score_search_code!}&nbsp;</div>
        <div class="key" style="width: 62px;">激活码</div>
        <div class="value" style="width: 125px;">${V_USER_BANK.credit_score_active_code!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">电费单户号</div>
        <div class="value" style="width: 140px;">${V_USER_BANK.electricity_bill_no!}&nbsp;</div>
        <div class="key" style="width: 110px;">户名</div>
        <div class="value" style="width: 156px;">${V_USER_BANK.electricity_bill_house_name!}&nbsp;</div>
        <div class="key" style="width: 76px;">被执行记录</div>
        <div class="value" style="width: 322px;">${V_USER_BANK.electricity_bill_record!}&nbsp;</div>
        <div id="clear"></div>

        <div class="value" style="width: 947px;font-weight: 800;padding-bottom: 6px">您的房产及车辆信息</div>
        <div id="clear"></div>

        <div class="key" style="width: 111px;padding: 9px 0 10px 3px">房产类型</div>
        <div class="value" style="width: 833px;padding: 3px 0 3px 7px">
        ${V_USER_HOUSE.house_type_html!}&nbsp;（ 租金<u>&nbsp;&nbsp;${V_USER_HOUSE.house_rent!}&nbsp;&nbsp;</u>元/月 ）
        </div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">房产购买时间</div>
        <div class="value" style="width: 173px;">${V_USER_HOUSE.buy_time!}&nbsp;</div>
        <div class="key" style="width: 110px;">购买价格</div>
        <div class="value" style="width: 138px;">${V_USER_HOUSE.buy_price!}&nbsp;&nbsp;万元</div>
        <div class="key" style="width: 110px;">建筑面积</div>
        <div class="value" style="width: 74px;"><u>&nbsp;${V_USER_HOUSE.size!}&nbsp;</u>平方米</div>
        <div class="key" style="width: 92px;">产权比例</div>
        <div class="value" style="width: 93px;"><u>&nbsp;&nbsp;${V_USER_HOUSE.percent!}&nbsp;&nbsp;</u>%</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">房产地址</div>
        <div class="value" style="width: 87px;text-align: right;border-right: 0">${V_USER_HOUSE.address_province!}</div>
        <div class="value" style="width: 10px;border-right: 0;">省</div>
        <div class="value" style="width: 65px;text-align: right;border-right: 0">${V_USER_HOUSE.address_city!}</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">市</div>
        <div class="value"
             style="width: 82px;text-align: right;border-right: 0;border-left:0 ">${V_USER_HOUSE.address_town!}</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">区</div>
        <div class="value" style="width: 379px;border-left:0 ;border-right: 0;">
            &nbsp;${V_USER_HOUSE.address_detail!}</div>
        <div class="value" style="width: 133px;border-left:0 ;">□ 与现住宅地址一致</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">贷款年限</div>
        <div class="value" style="width: 173px;">${V_USER_HOUSE.loan_year!}&nbsp;&nbsp;年</div>
        <div class="key" style="width: 110px;">月供</div>
        <div class="value" style="width: 138px;">${V_USER_HOUSE.month_payment!}&nbsp;&nbsp;元</div>
        <div class="key" style="width: 110px;">贷款余额</div>
        <div class="value" style="width: 273px;">${V_USER_HOUSE.load_left!}&nbsp;&nbsp;&nbsp;万</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">车辆情况</div>
        <div class="value" style="width: 633px;">${V_USER_CAR.intro!}&nbsp;</div>
        <div class="key" style="width: 92px;">购买时间</div>
        <div class="value" style="width: 93px;">${V_USER_CAR.buy_time!}&nbsp;</div>
        <div id="clear"></div>

        <div class="value" style="width: 947px;font-weight: 800;padding-bottom: 6px">您的工作信息</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">工作单位名称</div>
        <div class="value" style="width: 222px;">${V_USER_COMPANY.name!}&nbsp;</div>
        <div class="key" style="width: 75px;">单位性质</div>
        <div class="value" style="width: 521px;">${V_USER_COMPANY.company_type_html!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 111px;padding: 16px 0 18px 3px">职位级别</div>
        <div class="value" id="job_type" style="width: 834px;padding: 3px 0 3px 6px">
        ${V_USER_COMPANY.job_type_html!}<u>&nbsp;${V_USER_COMPANY.job_type_other!}&nbsp;</u>
        </div>
        <div id="clear"></div>

        <div class="key" style="width: 111px;padding: 11px 0 13px 3px">所属行业</div>
        <div class="value" style="width: 834px;padding: 6px 0 4px 6px">
        ${V_USER_COMPANY.company_belong_html!}
        </div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">部门</div>
        <div class="value" style="width: 205px;">${V_USER_COMPANY.department!}&nbsp;</div>
        <div class="key" style="width: 110px;">职务名称</div>
        <div class="value" style="width: 90px;">${V_USER_COMPANY.job_title!}&nbsp;</div>
        <div class="key" style="width: 110px;">前单位名称</div>
        <div class="value" style="width: 289px;">${V_USER_COMPANY.pre_company!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">现单位入职时间</div>
        <div class="value" style="width: 205px;">${V_USER_COMPANY.join_time!}&nbsp;</div>
        <div class="key" style="width: 110px;">单位电话</div>
        <div class="value" style="width: 503px;">${V_USER_COMPANY.company_telephone!}&nbsp;</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">现单位地址</div>
        <div class="value" style="width: 87px;text-align: right;border-right: 0">${V_USER_COMPANY.address_p!}
            &nbsp;</div>
        <div class="value" style="width: 10px;border-right: 0;">省</div>
        <div class="value" style="width: 65px;text-align: right;border-right: 0">${V_USER_COMPANY.address_c!}
            &nbsp;</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">市</div>
        <div class="value"
             style="width: 82px;text-align: center;border-right: 0;border-left:0 ">${V_USER_COMPANY.address_t!}
            &nbsp;</div>
        <div class="value" style="width: 10px;border-right: 0;border-left:0;">区</div>
        <div class="value" style="width: 520px;border-left:0 ;">&nbsp;${V_USER_COMPANY.company_address_detail!}</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">工资发放形式</div>
        <div class="value" style="width: 205px;">${V_USER_COMPANY.name!}&nbsp;</div>
        <div class="key" style="width: 110px;">每月基本薪金</div>
        <div class="value" style="width: 90px;">${V_USER_COMPANY.salary_base!}&nbsp;元</div>
        <div class="key" style="width: 110px;">其它收入（月均）</div>
        <div class="value" style="width: 88px;">${V_USER_COMPANY.other_input!}&nbsp;元</div>
        <div class="key" style="width: 93px;">每月发薪日</div>
        <div class="value" style="width: 94px;">${V_USER_COMPANY.salary_give_day!}&nbsp;日</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">公积金缴纳金额</div>
        <div class="value" style="width: 419px;">公司缴纳<u>&nbsp;&nbsp;${V_USER_COMPANY.gjj_company!}&nbsp;&nbsp;</u>元&nbsp;&nbsp;个人缴纳<u>
            &nbsp;&nbsp;${V_USER_COMPANY.gjj_personal!}&nbsp;&nbsp;</u>元
        </div>
        <div class="key" style="width: 110px;">社会保障卡号</div>
        <div class="value" style="width: 289px;">${V_USER_COMPANY.ssc_id!}&nbsp;</div>
        <div id="clear"></div>

        <div class="value" style="width: 947px;font-weight: 800;padding-bottom: 6px">*如果您是私营企业主，请补充填写以下内容</div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;;padding-bottom: 4px">企业类型</div>
        <div class="value" style="width: 832px;padding-bottom: 4px">${V_USER_ENTERPRISE.enterprise_type_html!}<u>
            &nbsp;${V_USER_ENTERPRISE.type_other!}&nbsp;</u></div>
        <div id="clear"></div>

        <div class="key" style="width: 110px;">企业成立时间</div>
        <div class="value" style="width: 155px;">${V_USER_ENTERPRISE.establish_time!}&nbsp;</div>
        <div class="key" style="width: 77px;">股份占比</div>
        <div class="value" style="width: 75px;">${V_USER_ENTERPRISE.percent!}&nbsp;%</div>
        <div class="key" style="width: 76px;">员工人数</div>
        <div class="value" style="width: 105px;">${V_USER_ENTERPRISE.employee!}&nbsp;人</div>
        <div class="key" style="width: 76px;">经营场所</div>
        <div class="value" style="width: 226px;">${V_USER_ENTERPRISE.place_type_html!}</div>
        <div id="clear"></div>


        <div class="key" style="width: 110px;">企业每月净利润</div>
        <div class="value" style="width: 155px;">${V_USER_ENTERPRISE.month_profit!}&nbsp;</div>
        <div class="key" style="width: 77px;">经营场所</div>
        <div class="value" style="width: 270px;">${V_USER_ENTERPRISE.place_type_html!}（月租金<u>
            &nbsp;${V_USER_ENTERPRISE.place_rent!}&nbsp;</u>元）
        </div>
        <div class="key" style="width: 79px;padding-left: 1px">租赁到期日期</div>
        <div class="value" style="width: 226px;">${V_USER_ENTERPRISE.place_rent_endtime!}&nbsp;</div>
        <div id="clear"></div>

        <div class="value" style="width: 947px;font-weight: 800;padding-bottom: 5px">联系人信息</div>
        <div id="clear"></div>

        <div class="key" style="width: 108px;padding: 13px 0 13px 6px">配偶</div>
        <div class="value" style="width: 841px;padding:0;border: 0;">
            <div class="value" style="width: 57px;text-align: center">姓名</div>
            <div class="value" style="width: 90px;text-align: center">${V_USER_CONTACT.spouse_name!}&nbsp;</div>
            <div class="key" style="width: 92px;">移动电话</div>
            <div class="value" style="width: 172px;">${V_USER_CONTACT.spouse_telephone!}&nbsp;</div>
            <div class="key" style="width: 93px;">单位名称</div>
            <div class="value" style="width: 291px;">${V_USER_CONTACT.spouse_company!}&nbsp;</div>
            <div id="clear"></div>

            <div class="value" style="width: 57px;text-align: center">单位电话</div>
            <div class="value" style="width: 368px;">${V_USER_CONTACT.spouse_company_telephone!}&nbsp;</div>
            <div class="key" style="width: 93px;">单位地址</div>
            <div class="value" style="width: 291px;">${V_USER_CONTACT.spouse_company_address!}&nbsp;</div>
            <div id="clear"></div>
        </div>
        <div id="clear"></div>

        <div class="key" style="width: 108px;padding: 13px 0 13px 6px">直系亲属</div>
        <div class="value" style="width: 841px;padding:0;border: 0;">
            <div class="value" style="width: 57px;text-align: center">姓名</div>
            <div class="value" style="width: 90px;text-align: center">${V_USER_CONTACT.relative_name!}&nbsp;</div>
            <div class="key" style="width: 92px;">移动电话</div>
            <div class="value" style="width: 172px;">${V_USER_CONTACT.relative_telephone!}&nbsp;</div>
            <div class="key" style="width: 93px;">亲属关系</div>
            <div class="value" style="width: 291px;">${V_USER_CONTACT.relative_relation!}&nbsp;</div>
            <div id="clear"></div>

            <div class="value" style="width: 57px;text-align: center">住宅电话</div>
            <div class="value" style="width: 368px;">${V_USER_CONTACT.relative_house_telephone!}&nbsp;</div>
            <div class="key" style="width: 93px;">住宅地址</div>
            <div class="value" style="width: 291px;">${V_USER_CONTACT.relative_house_address!}&nbsp;</div>
            <div id="clear"></div>
        </div>
        <div id="clear"></div>


        <div class="key" style="width: 108px;padding: 13px 0 13px 6px">同事</div>
        <div class="value" style="width: 841px;padding:0;border: 0;">
            <div class="value" style="width: 57px;text-align: center">姓名</div>
            <div class="value" style="width: 90px;text-align: center">${V_USER_CONTACT.workmate_name!}&nbsp;</div>
            <div class="key" style="width: 92px;">移动电话</div>
            <div class="value" style="width: 172px;">${V_USER_CONTACT.workmate_telephone!}&nbsp;</div>
            <div class="value" style="width: 389px;text-align: center">&nbsp;</div>
            <div id="clear"></div>

            <div class="value" style="width: 57px;text-align: center">单位电话</div>
            <div class="value" style="width: 368px;">${V_USER_CONTACT.workmate_company_telephone!}&nbsp;</div>
            <div class="key" style="width: 93px;">部门</div>
            <div class="value" style="width: 90px;">${V_USER_CONTACT.workmate_company_department!}&nbsp;</div>
            <div class="key" style="width: 93px;">职务</div>
            <div class="value" style="width: 94px;">${V_USER_CONTACT.workmate_jobs!}&nbsp;</div>
            <div id="clear"></div>
        </div>
        <div id="clear"></div>

        <div class="key" style="width: 108px;padding: 13px 0 13px 6px">其他联系人</div>
        <div class="value" style="width: 841px;padding:0;border: 0;">
            <div class="value" style="width: 57px;text-align: center">姓名</div>
            <div class="value" style="width: 90px;text-align: center">${V_USER_CONTACT.other_name!}&nbsp;</div>
            <div class="key" style="width: 92px;">移动电话</div>
            <div class="value" style="width: 172px;">${V_USER_CONTACT.other_telephone!}&nbsp;</div>
            <div class="key" style="width: 93px;">关系</div>
            <div class="value" style="width: 291px;">${V_USER_CONTACT.other_relation!}&nbsp;</div>
            <div id="clear"></div>

            <div class="value" style="width: 57px;text-align: center">住宅电话</div>
            <div class="value" style="width: 766px;">${V_USER_CONTACT.other_house_telephone!}&nbsp;</div>
            <div id="clear"></div>
        </div>
        <div id="clear"></div>

        <div class="key" style="width: 176px;">以上联系人是否知晓此项借款</div>
        <div class="value" style="width: 73px;text-align: center">配偶:</div>
        <div class="value" style="width: 89px;">□是 &nbsp;&nbsp;□否</div>
        <div class="value" style="width: 90px;text-align: center">直系亲属:</div>
        <div class="value" style="width: 89px;">□是 &nbsp;&nbsp;□否</div>
        <div class="value" style="width: 90px;text-align: center">同事:</div>
        <div class="value" style="width: 89px;">□是 &nbsp;&nbsp;□否</div>
        <div class="value" style="width: 90px;text-align: center">其他联系人:</div>
        <div class="value" style="width: 93px;">□是 &nbsp;&nbsp;□否</div>
        <div id="clear"></div>

        <div class="key" style="width: 955px;padding: 0">
            <div style="width: 950px;text-align: center;font-weight: bold;margin-top: 5px">特别声明</div>
            <div style="font-weight: normal;padding-top: 8px;line-height:133%;padding-bottom: 6px">
                &nbsp;本借款申请人承诺：1、本申请表填写内容真实，如有不实，本人愿意承担相应法律责任。2、借款资金不会以任何形式进入证券市场，或用于股本权益性投资；不用于国家明令禁止或限制的经营活动；不用于房产地项目开发。
                本人授权恒通信用管理有限公司（以下简称“贵公司”）在任何依法成立的征信机构及银行了解和查询本人财产、个人信用记录等信息，并同意贵公司：
                1、收集本人的有关资料作为本次借款申请之用；
                2、有权处理本人所有相关个人信息及资料（包括但不限于将本人的个人信息、个人信贷交易记录以及其它相关信息报送相关依法成立的征信机构）；
                3、贵公司有权同意或拒绝本人的借款申请且无须提供任何理由及无须退回所有申请资料副本给本人。
            </div>
        </div>
        <div id="clear"></div>

        <div class="value" style="width: 156px;padding: 14px 0 15px 6px">借款人签字：</div>
        <div class="value" style="width: 322px;text-align: center;padding: 14px 0 15px 6px">&nbsp;</div>
        <div class="value" style="width: 156px;padding: 14px 0 15px 6px">申请日期：</div>
        <div class="value" style="width: 294px;text-align: center;padding: 14px 0 15px 6px">&nbsp;</div>
        <div id="clear"></div>


        <div class="key" style="width: 951px;font-weight: 800;padding-bottom: 5px;text-align: center">工作人员填写</div>
        <div id="clear"></div>

        <div class="key" style="width: 80px;padding: 5px 0 5px 4px;">客户来源</div>
        <div class="value" style="width: 560px;padding: 5px 0 5px 4px;">&nbsp;</div>
        <div class="key" style="width: 65px;padding: 5px 0 5px 4px;">团队经理：</div>
        <div class="value" style="width: 68px;padding: 5px 0 5px 4px;">&nbsp;</div>
        <div class="key" style="width: 65px;padding: 5px 0 5px 4px;">客户经理：</div>
        <div class="value" style="width: 88px;padding: 5px 0 5px 4px;">&nbsp;</div>
        <div id="clear"></div>

    </div>
</div>
</body>
</html>