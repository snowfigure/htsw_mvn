<#include '/WEB-INF/nav/_nav_layout.ftl'/><@layout info>
<div class='content'>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/0.ftl'/> </div>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/1.ftl'/> </div>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/2.ftl'/> </div>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/3.ftl'/> </div>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/4.ftl'/> </div>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/5.ftl'/> </div>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/6.ftl'/> </div>
    <div class='col-xs-12 col-sm-12 col-md-12 col-lg-12' id='links'><#include '/WEB-INF/nav/7.ftl'/> </div>
</div></@layout>
<script>$(function () {
    $('li').bind('click', function () {
        $('li').each(function () {
            $(this).removeClass('active');
        });
        $(this).addClass('active');
    });
});</script>