<#include '/WEB-INF/ADMIN_PAGE/comm/_layout.ftl'/>
<@layout >
<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统参数配置</strong>
    </div>
</div>

<div class="am-g">
    <div class="am-u-sm-12">
        <table id="config_dg"></table>
        <div id='detail'>
            <br/>
            <form id="form" method="post" style="margin: 10px 20px">
                <input class="webConfig" type="hidden" name="webConfig.k" readonly id="_k"  />
                <div>
                    <label for="name">　编号:</label>
                    <input class="webConfig" type="text" name="webConfig.id" readonly id="_id"  />
                </div>
                <div>
                    <label for="name">关键词:</label>
                    <input class="webConfig" type="text" name="webConfig.des" readonly id="_des"  />
                </div>
                <div>
                    <label for="name">　　值:</label>
                    <input class="webConfig" type="text" name="webConfig.val" id="_val"  />
                </div>

            </form>

        </div>
    </div>
    <div style="clear: both"></div>
    <div class="am-panel am-panel-default admin-sidebar-panel">
        <div class="am-panel-bd">
            <p><span class="am-icon-tag"></span> 修改规范</p>
            <p> </p>
            <p>1、系统配置参数关键字的值请酌情修改，关键字修改实时生效；</p>
            <p>2、请勿随意尝试更改关键字名称；</p>
            <p>3、如有任何问题，请联系开发人员。</p>
            <p> </p>
        </div>
    </div>
</div>

</@layout>
<script type="text/javascript" src="/assets/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/assets/htsw/ADMIN/system_config.js"></script>
