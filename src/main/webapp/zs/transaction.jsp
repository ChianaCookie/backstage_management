<%--
  Created by IntelliJ IDEA.
  User: 10432
  Date: 2018-08-10
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/font-awesome.min.css" />
    <link href="<%=request.getContextPath()%>/bootstrap/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/ace-ie.min.css" />
    <![endif]-->

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/html5shiv.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!-- <![endif]-->
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/dist/echarts-all.js"></script>
    <title>交易</title>
</head>

<body>
<div class=" page-content clearfix">
    <div class="transaction_style">
        <ul class="state-overview clearfix">
            <li class="Info">
                <span class="symbol  blue"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>订单数量</h4><p class="Quantity color_red"><span id="qrderQuantity"></span></p></span>
            </li>
            <li class="Info">
                <span class="symbol terques"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>完成订单</h4><p class="Quantity color_red"><span id="completedOrder"></span></p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>未完成订单</h4><p class="Quantity color_red"><span id="incompleteOrder"></span></p></span>
            </li>
            <li class="Info">
                <span class="symbol yellow"><i class="fa fa-shopping-cart"></i></span>
                <span class="value"><h4>交易失败订单</h4><p class="Quantity color_red"><span id="failedOrder"></span></p></span>
            </li><br/><br/><br/><br/><br/>
            <li class="Info">
                <span class="symbol blue"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>交易金额</h4><p class="Quantity color_red"><span id="transactionAmount"></span></p></span>
            </li>
            <li class="Info">
                <span class="symbol terques"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>成交金额</h4><p class="Quantity color_red"><span id="amountPaid"></span></p></span>
            </li>
            <li class="Info">
                <span class="symbol red"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>待付金额</h4><p class="Quantity color_red"><span id="pendingPayment"></span></p></span>
            </li>
            <li class="Info">
                <span class="symbol yellow"><i class="fa fa-jpy"></i></span>
                <span class="value"><h4>退款金额</h4><p class="Quantity color_red"><span id="refundAmount"></span></p></span>
            </li>
        </ul>

    </div>
    <div class="t_Record">
        <div id="main" style="height:400px; overflow:hidden; width:100%; overflow:auto" ></div>
    </div>
</div>



</body>
<script type="text/javascript">

    $(document).ready(function(){

        $(".t_Record").width($(window).width()-60);
        //当文档窗口发生改变时 触发
        $(window).resize(function(){
            $(".t_Record").width($(window).width()-60);
        });
    });
   $(function () {
       Reportform();
       transactionInformation();
   })
    function transactionInformation(){
       $.ajax({
           url:"<%=request.getContextPath()%>/OrderManagement/queryTransactionInformation",
           type:"post",
           datatype:'json',
           success:function (result) {
               $("#qrderQuantity").html(result.allCount);
               $("#completedOrder").html(result.completeCount);
               $("#incompleteOrder").html(result.uncompleteCount);
               $("#failedOrder").html(result.refundCount);
               $("#transactionAmount").html(result.transacTionamount);
               $("#amountPaid").html(result.alreadyPaid);
               $("#pendingPayment").html(result.pendingPayment);
               $("#refundAmount").html(result.refundAmount);
           },
           error:function(){

           }
       })
    }


        function Reportform() {
            $.ajax({
                url:'<%=request.getContextPath()%>/OrderManagement/queryOrderReportData',
                type:'post',
                datatype:'json',
                success:function(datae) {

            var myChart = echarts.init(document.getElementById("main"));
            option = {
                title : {
                    text: '月购买订单交易记录',
                    subtext: '实时获取用户订单购买记录'
                },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['所有订单','待付款','已付款','退款']
                },
                toolbox: {
                    show : true,
                    feature : {
                        magicType : {show: true, type: ['line', 'bar']},
                        restore : {show: true},
                        saveAsImage : {show: true}
                    }
                },
                calculable : true,
                xAxis : [
                    {
                        type : 'category',
                        data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],

                series : [
                    {
                        name:'所有订单',
                        type:'bar',
                        data:datae.allCount,
//                        markPoint : {
//                            data : [
//                                {type : 'max', name: '最大值'},
//                                {type : 'min', name: '最小值'}
//                            ]
//                        }
                    },
                    {
                        name:'待付款',
                        type:'bar',
                        data:datae.uncompleteCount,
//                        markPoint : {
//                            data : [
//                                {name : '年最高', value : 1182, xAxis: 7, yAxis: 1182, symbolSize:18},
//                                {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
//                            ]
//                        },


                    }
                    , {
                        name:'已付款',
                        type:'bar',
                        data:datae.completeCount,
//                        markPoint : {
//                            data : [
//                                {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
//                                {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
//                            ]
//                        },

                    }, {
                        name:'退款',
                        type:'bar',
                        data:datae.refundAmount,
//                        markPoint : {
//                            data : [
//                                {name : '年最高', value : 172, xAxis: 7, yAxis: 172, symbolSize:18},
//                                {name : '年最低', value : 23, xAxis: 11, yAxis: 3}
//                            ]
//                        },

                    }

                ]
            };

            myChart.setOption(option);
                }

            })
        }


</script>

</html>
