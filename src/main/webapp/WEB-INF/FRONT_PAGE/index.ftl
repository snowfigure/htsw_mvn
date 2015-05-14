<#include '/WEB-INF/COMM_LAYOUT/_layout.ftl'/>
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


<div class="jgzj index-slide">
    <div class="w-1000 h-430 jgzj-cont index-slide-item">
        <div id="jgzj_p" class="ban02">
            <p class="top">贷款额度高、范围大</p>

            <p class="bottom">贷款额度最低x万元，最高xx万元，</p>

            <p class="bottom" style="font-size: 15px">精英贷、工薪贷、恒楼贷、商户贷、企业贷，总有一款适合你。</p>
        </div>
    </div>
</div>


<div class="sstx index-slide">
    <div class="w-1000 h-430 sstx-cont index-slide-item">
        <div id="sstx_p" class="ban02">
            <p class="top">手续简单，下款快</p>

            <p class="bottom">最快x天到账，手续超简单，速度超快。</p>
        </div>
    </div>
</div>


<div class="yyqt index-slide">
    <div class="w-1000 h-430 yyqt-cont index-slide-item">
        <div id="yyqt_p" class="ban02">
            <p class="top">利息低、零手续费</p>

            <p class="bottom">最低0.xx%月利，年利率低至x.xx%的信用贷，</p>

            <p class="bottom">0手续费，打破行规，完全免费。</p>
        </div>
    </div>
</div>




</@layout>
<!-- 开始页级（仅对当前页面所需的JavaScript代码）-->
<script type="text/javascript" src="/assets/ext/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript" src="/assets/ext/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="/assets/ext/jquery.bxslider.min.js"></script>
<script src="/assets/imgflash/app.js"></script>
<script src="/assets/imgflash/index.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function () {
        App.init();
        App.initBxSlider();
        Index.initRevolutionSlider();
    });
</script>