<%--
  Created by IntelliJ IDEA.
  User: 樂大大
  Date: 2018/8/10
  Time: 17:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/bootstrap/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css"/>
    <link href="<%=request.getContextPath()%>/bootstrap/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/ace.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/bootstrap-table.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/font/css/font-awesome.min.css" />
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap-table.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap-table-locale-all.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap-table-zh-CN.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="<%=request.getContextPath()%>/bootstrap/text/javascript" src="js/H-ui.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/typeahead-bs2.min.js"></script>
    <%--    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/jquery.dataTables.min.js"></script>
        <script src="<%=request.getContextPath()%>/bootstrap/assets/js/jquery.dataTables.bootstrap.js"></script>--%>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/assets/js/jquery.easy-pie-chart.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/lrtk.js" type="text/javascript" ></script>


    <title>日志查询</title>
</head>
<body>
        <div class="list_right_style">
            <%--<div class="search_style">--%>

                <%--<ul class="search_content clearfix">--%>
                    <%--<li><label class="l_f">订单编号</label><input id="orderNumber" type="text" class="text_add" placeholder="订单订单编号" style=" width:250px"></li>--%>
                    <%--<li style="width:90px;"><button type="button" onclick="queryOrderTypeClassification()" class="btn_search"><i class="fa fa-search"></i>查询</button></li>--%>
                    <%--<input type="hidden" id="typeid">--%>
                <%--</ul>--%>
            <%--</div>--%>
            <!--订单列表展示-->
            <div class="box box-success">
                <div class="box-body">
                    <!-- 关键在这个参数class="text-nowrap" ，不要让内容自动换行 加上即可-->
                    <table id="LogTypeTable"  class=" text-nowrap"></table>
                </div>
            </div>
            <!--数量统计-->
            <%--<input type="hidden" id="courseTotal">--%>
            <%--<input type="hidden" id="typeOfTextTotal">--%>
            <%--<input type="hidden" id="skillClassTotal">--%>

        </div>




<script type="text/javascript">

    $(function(){
        $('#LogTypeTable').bootstrapTable('refresh')
        $('#LogTypeTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'<%=request.getContextPath()%>/log/querydsq',
            method: "post",
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
            pageNumber:1,
            pageSize:20,//默认每页条数
            //search:true,//是否显示搜索框
            //searchText:'试试',//初始化搜索文字
            showColumns:false,//是否显示 内容列下拉框
            showToggle:false,//是否显示 切换试图（table/card）按钮
            showPaginationSwitch:false,//是否显示 数据条数选择框
            showRefresh:false,//是否显示刷新按钮
            singleSelect : true,//单选
            detailView:false,//设置为 true 可以显示详细页面模式。
            showFooter:false,//是否显示列脚
            clickToSelect: true, //是否启用点击选中行
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            sidePagination:'client',//分页方式：client客户端分页，server服务端分页（*
            striped:true,
//            queryParams:function(params) {
//
//                var typeid =$("#typeid").val();
//                var ordernumber =$("#orderNumber").val();
//                params.typeid=typeid;
//                params.ordernumber=ordernumber;
//
//                return params;
//
//            },
            columns:[
                {field:'sss',title:"编号",width:200,
                    formatter: function (value, row, index) {
                        return index + 1;
                    }
                },
                {field:'classname',title:'类名',width:200},
                {field:'methodname',title:'方法名',width:200},
                {field:'createTime',title:'时间',width:200,
                    formatter: function(value,row,index){
                        var unixTimestamp = new Date( row.createTime*1000 ) ;
                        commonTime = unixTimestamp.toLocaleString();
                        return commonTime;
                    }
                },
            ]
        });

    })


</script>

</body>
</html>
