<#include '/WEB-INF/MEMBER_PAGE/comm/_layout.ftl'/>
<@layout >
<div id="main-content">
    <#include '/WEB-INF/MEMBER_PAGE/comm/_member_nav.ftl'/>
    <div id="right-article">
        <div id="right-article-content">


            <div class="panel-group" id="accordion" style="text-align: left">
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_info.ftl'/>
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_bank.ftl'/>
                <#include '/WEB-INF/MEMBER_PAGE/sub/_sub_user_house_car.ftl'/>
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