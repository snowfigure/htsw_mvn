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
                <a href="/admin/editPassword.html">
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
