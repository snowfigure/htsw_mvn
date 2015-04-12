<#include '/WEB-INF/comm/_layout.ftl'/>
<@layout >

<!-- 开始页面容器 -->
<div class="page-container">
    <!-- 开始运行滑块 -->
    <div class="fullwidthbanner-container slider-main">
        <div class="fullwidthabnner">
            <ul id="revolutionul" style="display:none;">
                <li data-transition="fade" data-slotamount="8" data-masterspeed="300" data-delay="6400">
                    <a href="#"> <img src="/img/bg6.jpg" alt=""></a>
                </li>
                <li data-transition="fade" data-slotamount="8" data-masterspeed="300" data-delay="6400">
                    <a href="#"><img src="/img/bg8.jpg" alt=""></a>
                </li>
                <li data-transition="fade" data-slotamount="8" data-masterspeed="300" data-delay="6400">
                    <a href="#"><img src="/img/bg9.jpg" alt=""></a>
                </li>
            </ul>
            <div class="tp-bannertimer tp-bottom" style="visibility: hidden"></div>
            <!--进度条-->
        </div>
    </div>
    <!-- END  运行滑块 -->
</div>
<!-- END 页面内容 -->



</@layout>
<!-- 开始页级（仅对当前页面所需的JavaScript代码）-->
<script type="text/javascript" src="/assets/jquery_ext/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="/assets/jquery_ext/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="/assets/jquery_ext/jquery.bxslider.min.js"></script>
<script src="/assets/imgflash/app.js"></script>
<script src="/assets/imgflash/index.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        App.init();
        App.initBxSlider();
        Index.initRevolutionSlider();
    });
</script>