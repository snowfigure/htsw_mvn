<#include '/WEB-INF/ADMIN_PAGE/comm/_layout.ftl'/>
<@layout >
<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">参数配置</strong>
    </div>
</div>

<div class="am-g">
    <div class="am-u-sm-12">
        <div id='detail'>
            <form id="form" method="post" style="margin: 10px 20px">
                <input type="hidden" name="nav.id"/>
                <div>
                    <label for="name" style="width:50px">名　 　称:</label>
                    <input class="nav" type="text" name="nav.name" data-options="required:true"/>
                </div>
                <div>
                    <label for="name" style="width:50px">分　 　类:</label>
                    <input id="cc" class="easyui-combobox" name="nav.pid"
                           data-options="valueField:'id',textField:'name',url:'/nav/nav_plist'">
                </div>
                <div>
                    <label for="name">网站 地址:</label>
                    <input class="nav" type="text" name="nav.url" id="_url"  />
                </div>
                <div>
                    <label for="name">网站 介绍:</label>
                    <textarea class="nav" type="text" name="nav.info" id="_info"  rows="4" maxlength="20"></textarea>
                </div>
                <div>
                    <label for="name" style="width:50px">是否 常用:</label>
                    <input class="easyui-combobox" name="nav.iscomm"  data-options="valueField: 'id',textField: 'name',data: [{id: 1,name: '常用链接'},{id: 0,name: '非常用链接'}]" />
                </div>
            </form>

        </div>
        <table id="nav_dg"></table>
    </div>
</div>

</@layout>
<script type="text/javascript" src="/assets/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/assets/cms/system_config.js"></script>
