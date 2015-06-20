<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>综合管理平台 - ${systemConfig['WEBNAME']!}</title>
    <link rel="stylesheet" type="text/css" href="/assets/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="/assets/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="/assets/amazeui_2.3.0/css/amazeui.css">
    <script type="text/javascript" src="/assets/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="/assets/easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout" style="text-align:left">
<div region="north" border="false" style="overflow: hidden;height: 50px">
    <div id="header-inner">
        <header class="am-topbar admin-header">
            <div class="am-topbar-brand">
                <img src="/assets/img/logo_admin.jpg" height="40"/>
                <small>后台管理平台</small>
            </div>

            <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
                    data-am-collapse="{target: '#topbar-collapse'}">
                <span class="am-sr-only">导航切换</span>
                <span class="am-icon-bars"></span>
            </button>

            <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

                <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
                    <li>
                        <a>
                            <span >欢迎管理员：</span> ${user['username']!}
                        </a>
                    </li>
                    <li>
                        <a href="#" onclick="editPsd()">
                            <span class="am-icon-pencil"></span> 修改密码
                        </a>
                    </li>
                    <li>
                        <a href="/fpc/logout">
                            <span class="am-icon-power-off"></span> 退出
                        </a>
                    </li>
                    <li class="am-hide-sm-only">
                        <a href="javascript:;" id="admin-fullscreen">
                            <span class="am-icon-arrows-alt"></span>
                            <span class="admin-fullText">开启全屏</span>
                        </a>
                    </li>
                </ul>
            </div>
        </header>

    </div>


</div>
<div data-options="region:'west',split:true,title:'模块导航'"
     style="width:150px;padding:5px;">
    <ul id='nav'></ul>
</div>
<div data-options="region:'center',title:'欢迎使用后台'" id="content">
    <div id='tabs'>
        <div id='main' title="首页">
            主要区域
        </div>
    </div>
</div>
</body>


<script type="application/javascript">
    function editPsd(){
        if ($('#tabs').tabs("exists",  "修改密码")) {
            $('#tabs').tabs("select", "修改密码");
        } else {
            var content = '<iframe class="ajaxPageIframe" scrolling="auto" frameborder="0"  src="editPassword.html" style="width:100%;"></iframe>';
            $('#tabs').tabs('add', {
                title: '修改密码',
                content: content,
                closable: true
            });
            var height = $(window).height();
            $(".ajaxPageIframe").attr("height", height - 150);
        }
    }
    $(function () {
        function reinitIframe() {
            var iframe = document.getElementById(".ajaxPageIframe");
            /* 填写要设置的frame的ID */
            try {
                var bHeight = iframe.contentWindow.document.body.scrollHeight;
                var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
                iframe.height =  Math.max(bHeight, dHeight);
            } catch (ex) {
            }
        }

        $(window).resize(function () {
            var height = $(this).height();
            $(".ajaxPageIframe").attr("height", height - 188);
        });

        $(".ajaxPageIframe").ready(function () {
            var height = $(window).height();
            $(".ajaxPageIframe").attr("height", height - 188);
        });


        $('#tabs').tabs({
            border: false
        });
        $('#nav').tree({
            url: "/assets/htsw/menu.json",
            loadFilter: function (data) {
                console.log(data);
                return data.list;
            },
            onClick: function (node) {
                if (node.url) {
                    if ($('#tabs').tabs("exists", node.text)) {
                        $('#tabs').tabs("select", node.text);
                    } else {
                        var content = '<iframe class="ajaxPageIframe" scrolling="auto" frameborder="0"  src="' + node.url + '" style="width:100%;"></iframe>';
                        $('#tabs').tabs('add', {
                            title: node.text,
                            content: content,
                            closable: true
                        });
                        var height = $(window).height();
                        $(".ajaxPageIframe").attr("height", height - 150);
                    }
                }
            }
        });
    });
</script>


</html>