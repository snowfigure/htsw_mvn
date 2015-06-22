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
    <script type="text/javascript" src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
</head>
<body class="easyui-layout" style="padding: 5px">
    <div id="tt" class="easyui-tabs" style="width:100%;height:100%;">
        <div title="用户组成分类统计" style="overflow:auto;padding:20px;">
            <div id="user_zc" style="height:500px;"></div>
        </div>
        <div title="客户活跃度统计" style="overflow:auto;padding:20px;">
            <div id="member_act" style="height:500px;"></div>
        </div>
        <#--<div title="客户申请统计" style="overflow:auto;padding:20px;">-->
            <#--<div id="member_apply" style="height:500px;"></div>-->
        <#--</div>-->
    </div>
</body>



<script>
    var myChart_user_zc = echarts.init(document.getElementById('user_zc'));
    var myChart_member_act = echarts.init(document.getElementById('member_act'));
    var myChart_member_apply = echarts.init(document.getElementById('member_apply'));
    var option_user_zc = {
        title : {
            text: '用户组成分类统计',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:['管理员','业务员','客户']
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
                name:'用户组成',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:${admin!}, name:'管理员'},
                    {value:${employee!}, name:'业务员'},
                    {value:${member!}, name:'客户'}

                ]
            }
        ]
    };
    //活跃度统计
    var option_member_act = {
        title : {
            text: '客户活跃度统计',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:['注册未激活','激活未申请','激活已申请']
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
                name:'客户活跃度',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:${member_unChecked!}, name:'注册未激活'},
                    {value:${member_apply!}, name:'激活未申请'},
                    {value:${member_unApply!}, name:'激活已申请'}
                ]
            }
        ]
    };
    <#--var option_member_apply = {-->
        <#--title : {-->
            <#--text: '客户申请统计',-->
            <#--x:'center'-->
        <#--},-->
        <#--tooltip : {-->
            <#--trigger: 'item',-->
            <#--formatter: "{a} <br/>{b} : {c} ({d}%)"-->
        <#--},-->
        <#--legend: {-->
            <#--orient : 'vertical',-->
            <#--x : 'left',-->
            <#--data:['无申请','1次','2-5次','6-10次','11-20次','20-50次','50次以上']-->
        <#--},-->
        <#--toolbox: {-->
            <#--show : true,-->
            <#--feature : {-->
                <#--mark : {show: true},-->
                <#--dataView : {show: true, readOnly: false},-->
                <#--magicType : {-->
                    <#--show: true,-->
                    <#--type: ['pie', 'funnel'],-->
                    <#--option: {-->
                        <#--funnel: {-->
                            <#--x: '25%',-->
                            <#--width: '50%',-->
                            <#--funnelAlign: 'left',-->
                            <#--max: 1548-->
                        <#--}-->
                    <#--}-->
                <#--},-->
                <#--restore : {show: true},-->
                <#--saveAsImage : {show: true}-->
            <#--}-->
        <#--},-->
        <#--calculable : true,-->
        <#--series : [-->
            <#--{-->
                <#--name:'客户申请次数',-->
                <#--type:'pie',-->
                <#--radius : '55%',-->
                <#--center: ['50%', '60%'],-->
                <#--data:[-->
                    <#--{value:${money_0_1w!}, name:'无申请'},-->
                    <#--{value:${money_1_5w!}, name:'1次'},-->
                    <#--{value:${money_5_10w!}, name:'2-5次'},-->
                    <#--{value:${money_10_20w!}, name:'6-10次'},-->
                    <#--{value:${money_20_50w!}, name:'11-20次'},-->
                    <#--{value:${money_50_100w!}, name:'20-50次'},-->
                    <#--{value:${money_100w!}, name:'50次以上'}-->
                <#--]-->
            <#--}-->
        <#--]-->
    <#--};-->
    myChart_user_zc.setOption(option_user_zc);
    myChart_member_act.setOption(option_member_act);
//    myChart_apply_money.setOption(option_apply_money);
</script>


</html>