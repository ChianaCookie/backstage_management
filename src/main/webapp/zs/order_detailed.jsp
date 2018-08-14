<%--
  Created by IntelliJ IDEA.
  User: 10432
  Date: 2018-08-13
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css"/>
    <link href="<%=request.getContextPath()%>/bootstrap/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/typeahead-bs2.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/H-ui.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/jquery.easy-pie-chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/lrtk.js" type="text/javascript" ></script>
    <title>订单详细</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Order_Details_style">
        <div class="Numbering">订单编号:<b>NJHDXJ201509-001</b></div></div>
    <div class="detailed_style">
        <!--收件人信息-->
        <div class="Receiver_style">
            <div class="title_name">收件人信息</div>
            <div class="Info_style clearfix">
                <div class="col-xs-3">
                    <label class="label_name" > 收件人姓名： </label>
                    <div class="o_content">张孝全</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" > 收件人电话： </label>
                    <div class="o_content">16543432343</div>
                </div>

            </div>
        </div>
        <!--订单信息-->
        <div class="product_style">
            <divp class="title_name">产品信息</divp>
            <div class="Info_style clearfix">
                <div class="product_info clearfix">
                    <a href="#" class="img_link"><img src="" /></a>
                    <span>
      <a href="#" class="name_link"></a>
      <b></b>
      <p>数量：2</p>
      <p>价格：<b class="price"><i>￥</i>56</b></p>
      <%--<p>状态：<i class="label label-success radius"></i></p>--%>
      </span>


            </div>
        </div>
        <!--总价-->
        <div class="Total_style">
            <div class="Info_style clearfix">
                <div class="col-xs-3">
                    <label class="label_name" > 支付方式： </label>
                    <div class="o_content">在线支付</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" > 支付状态： </label>
                    <div class="o_content">等待付款</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" > 订单生成日期： </label>
                    <div class="o_content">2016-7-5</div>
                </div>
                <div class="col-xs-3">
                    <label class="label_name" > 发货日期： </label>
                    <div class="o_content">2016-7-19</div>
                </div>
            </div>
            <div class="Total_m_style"><span class="Total">总数：<b>10</b></span><span class="Total_price">总价：<b>345</b>元</span></div>
        </div>


        <div class="Button_operation">
            <button onclick="article_save_submit();"  class="btn btn-primary radius" type="submit"><i class="icon-save "></i>返回上一步</button>

        </div>


    </div>
</div>
</body>
<script>

    function article_save_submit(){
        location.href="<%=request.getContextPath()%>/zs/Orderform.jsp"
    }
</script>
</html>
