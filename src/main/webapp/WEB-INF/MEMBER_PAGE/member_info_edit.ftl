<#include '/WEB-INF/MEMBER_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/MEMBER_PAGE/comm/_member_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content">


            <div class="panel-group" id="accordion" style="text-align: left;margin-top: -20px">
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_info.ftl'/>
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_bank.ftl'/>
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_house_car.ftl'/>
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_company.ftl'/>
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_enterprise.ftl'/>
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_contact.ftl'/>
            </div>
            <div class="panel panel-primary">
                <div class="panel-body">
                    <p>注意事项：</p>

                    <p>1、个人信息、银行与征信信息必须全部准确的填写完整；</p>

                    <p>2、房产、车辆和工作单位信息，按实填写；</p>

                    <p>3、如果您是私营企业主，请按实填写私营企业信息；</p>

                    <p>4、请您准确并如实的填写上述信息，不如实填写将会影响您的贷款处理和下发效率。</p>

                    <p>5、填写完整后，请记得分别保存，谢谢您的配合。</p>

                    <p>6、如果提示<span style="color: red">保存失败</span>，请检查输入的<span style="color: red">数据是否合理</span>。</p>
                </div>
            </div>
        </div>
        <div id="div-clear"></div>
    </div>
    <div id="div-clear"></div>
</div>
<div id="div-clear"></div>
</@layout>
<script src="/assets/htsw/MEMBER/function.js"></script>
