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
<#--<script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>-->
    <script type="text/javascript" src="/assets/echarts-2.2.4/echarts-all.js"></script>
</head>
<body style="padding: 5px">
    <div id="tt" class="easyui-tabs" style="width:99%;">
        <div title="申请状态分类统计" style="overflow:auto;padding:20px;">
            <div id="apply_status" style="height:500px;"></div>
        </div>
        <div title="申请类型统计" style="overflow:auto;padding:20px;">
            <div id="apply_type" style="height:500px;"></div>
        </div>
        <div title="申请金额统计" style="overflow:auto;padding:20px;">
            <div id="apply_money" style="height:500px;"></div>
        </div>
    </div>
</body>


<script>
    var myChart_apply_status = echarts.init(document.getElementById('apply_status'));
    var myChart_apply_type = echarts.init(document.getElementById('apply_type'));
    var myChart_apply_money = echarts.init(document.getElementById('apply_money'));
    var option_apply_status = {
        title : {
            text: '申请状态分类统计',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:['审核未通过','申请已提交，等待资料审核','资料已审核，等待面签','面签已通过，等待资金发放','资金已发放，请按时还款','还款结束','其他状态']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'申请状态',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:${status_1!}, name:'审核未通过'},
                    {value:${status_2!}, name:'申请已提交，等待资料审核'},
                    {value:${status_3!}, name:'资料已审核，等待面签'},
                    {value:${status_4!}, name:'面签已通过，等待资金发放'},
                    {value:${status_5!}, name:'资金已发放，请按时还款'},
                    {value:${status_6!}, name:'还款结束'},
                    {value:${status_7!}, name:'其他状态'}
                ]
            }
        ]
    }
    //申请类型统计
    var option_apply_type = {
        title : {
            text: '申请类型统计',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:['精英贷','工薪贷','恒楼贷','商户贷','企业贷','新车贷']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'申请类型',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:${type_2!}, name:'精英贷'},
                    {value:${type_3!}, name:'工薪贷'},
                    {value:${type_4!}, name:'恒楼贷'},
                    {value:${type_5!}, name:'商户贷'},
                    {value:${type_6!}, name:'企业贷'},
                    {value:${type_7!}, name:'新车贷'}
                ]
            }
        ]
    }
    var option_apply_money = {
        title : {
            text: '申请金额分布统计',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:['1万以下','1-5万','5-10万','10-20万','20-50万','50-100万','100万以上']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'申请状态',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:${money_0_1w!}, name:'1万以下'},
                    {value:${money_1_5w!}, name:'1-5万'},
                    {value:${money_5_10w!}, name:'5-10万'},
                    {value:${money_10_20w!}, name:'10-20万'},
                    {value:${money_20_50w!}, name:'20-50万'},
                    {value:${money_50_100w!}, name:'50-100万'},
                    {value:${money_100w!}, name:'100万以上'}
                ]
            }
        ]
    }
    myChart_apply_status.setOption(option_apply_status);
    myChart_apply_type.setOption(option_apply_type);
    myChart_apply_money.setOption(option_apply_money);
</script>


</html>