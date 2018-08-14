<%--
  Created by IntelliJ IDEA.
  User: 10432
  Date: 2018-08-11
  Time: 9:13
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


    <title>订单管理</title>
</head>
<body >
<div id="ceshishis" class="margin clearfix" >
    <div class="cover_style" id="cover_style">
        <div class="top_style Order_form" id="Order_form_style" >
            <div class="type_title">购买种类比例
                <div class="btn_style">
                    <a href="javascript:void(0)"  class="xianshi_btn Statistic_btn">显示</a>
                    <a href="javascript:void(0)"  class="yingchan_btn Statistic_btn b_n_btn">隐藏</a>
                </div>
            </div>
            <div class="hide_style clearfix"  >
                <div class="proportion" id="wenzhongceshi"><div id="wenzhong" class="easy-pie-chart percentage" data-percent=""  data-color="#D15B47"><span id="WenZhongLei" class="percent"></span>%</div><span class="name">文种类</span> </div>
                <div class="proportion"> <div class="easy-pie-chart percentage" data-percent=""  data-color="#87CEEB"><span id="JiQiaoLei" class="percent"></span>%</div><span class="name">技巧类</span></div>
            </div>
        </div>
        <!--内容-->
        <div class="centent_style" id="centent_style">
            <div id="covar_list" class="order_list">
                <div id="scrollsidebar" class="left_Treeview">
                    <div class="show_btn" id="rightArrow"><span></span></div>
                    <div class="widget-box side_content" >
                        <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
                        <div class="side_list"><div class="widget-header header-color-green2"><h4 class="lighter smaller">订单类型分类</h4></div>
                            <div class="widget-body">
                                <ul class="b_P_Sort_list">
                                    <li><i class="orange  fa fa-reorder"></i><a href="javascript:transfer('')">全部订单( <span id="courseTotal"></span>)</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:transfer('1')">文种类(<span id="typeOfTextTotal"></span>)</a></li>
                                    <li><i class="fa fa-sticky-note pink "></i> <a href="javascript:transfer('2')">技巧类(<span id="skillClassTotal"></span>)</a> </li>
                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
                <!--左侧样式-->
                <div class="list_right_style">
                    <div class="search_style">

                        <ul class="search_content clearfix">
                            <li><label class="l_f">订单编号</label><input id="orderNumber" type="text" class="text_add" placeholder="订单订单编号" style=" width:250px"></li>
                            <li style="width:90px;"><button type="button" onclick="queryOrderTypeClassification()" class="btn_search"><i class="fa fa-search"></i>查询</button></li>
                        <input type="hidden" id="typeid">
                        </ul>
                    </div>
                    <!--订单列表展示-->
                    <div class="box box-success">
                        <div class="box-body">
                            <!-- 关键在这个参数class="text-nowrap" ，不要让内容自动换行 加上即可-->
                            <table id="OrderTypeTable"  class=" text-nowrap"></table>
                        </div>
                    </div>
                    <!--数量统计-->
                     <%--<input type="hidden" id="courseTotal">--%>
                     <%--<input type="hidden" id="typeOfTextTotal">--%>
                     <%--<input type="hidden" id="skillClassTotal">--%>

                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    $("#startTime").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
    });
    $("#endTime").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
    });
    //打开页面立即开启table表格，查询每种类型课程得的数量
    $(function(){
        proportionalStatistics();
        queryOrderTypeClassification();
    })

    function transfer(typeid){
            $("#typeid").val(typeid);
            queryOrderTypeClassification();

    }
    function proportionalStatistics(){
        $.ajax({
            url:'<%=request.getContextPath()%>/OrderManagement/proportionalStatistics',
            type:'post',
            datatype:'json',
            success:function(result) {
                if (result != null && result != '') {
                    $("#typeOfTextTotal").html(result[0].courseTotal)
                    $("#skillClassTotal").html(result[1].courseTotal)
                    var allKinds = Number(result[0].courseTotal) + Number(result[1].courseTotal)
                    var WenZhongLei = Math.round(Number(result[0].courseTotal) / allKinds * 10000) / 100.00
                    var JiQiaoLei = Math.round(Number(result[1].courseTotal) / allKinds * 10000) / 100.00
                    var test = document.getElementById("wenzhong");
                    $("#wenzhong").attr("data-percent", WenZhongLei)
                    $("#courseTotal").html(allKinds)
                    $("#WenZhongLei").html(WenZhongLei)
                    $("#JiQiaoLei").html(JiQiaoLei)

                }
            }

        })

    }


    function queryOrderTypeClassification(){
        $('#OrderTypeTable').bootstrapTable('refresh')
        $('#OrderTypeTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'<%=request.getContextPath()%>/OrderManagement/queryOrderList',
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
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
            striped:true,
            queryParams:function(params) {

                var typeid =$("#typeid").val();
                var ordernumber =$("#orderNumber").val();
                params.typeid=typeid;
                params.ordernumber=ordernumber;

                return params;

            },
            columns:[
//                {field:'userchek',checkbox:true},
                {field:'ordernumber',title:'订单编号',width:200},
                {field:'productname',title:'产品名称',width:200},
                {field:'productprice',title:'销售价格',width:200},
                {field:'ordertime',title:'订单时间',width:200,},
                {field:'producttype',title:'所属类型',width:200,
                    formatter: function(value,row,index){
                        if(value==1){
                            return "文种类";
                        } if(value==2){
                            return "技巧类";
                        }
                    }
                },
                {field:'orderstatus',title:'状态',width:200,
                    formatter: function(value,row,index){
                        if(value==1){
                            return "待支付";
                        } if(value==2){
                            return "已支付";
                        }if(value==3){
                            return "退款";
                        }
                    }
                },
                {field:'act',title:'操作',width:200,
                    formatter: function(value,row,index){
                        return '<a title="订单详细"  href="order_detailed.jsp"  class="btn btn-xs btn-info order_detailed" ><i class="fa fa-list bigger-120"></i></a>';
                    }
                },
            ]
        });

    }
</script>
</body>
</html>

<script>
    $(function() {
        $("#cover_style").fix({
            float : 'top',
            minStatue : false,
            skin : 'green',
            durationTime :false,
            window_height:30,//设置浏览器与div的高度值差
            spacingw:0,//
            spacingh:0,//
            close_btn:'.yingchan_btn',
            show_btn:'.xianshi_btn',
            side_list:'.hide_style',
            widgetbox:'.top_style',
            close_btn_width:60,
            da_height:'#centent_style,.left_Treeview,.list_right_style',
            side_title:'.b_n_btn',
            content:null,
            left_css:'.left_Treeview,.list_right_style'


        });
    });
    //左侧显示隐藏
    $(function() {
        $("#covar_list").fix({
            float : 'left',
            minStatue : false,
            skin:false,
            //durationTime :false,
            spacingw:50,//设置隐藏时的距离
            spacingh:270,//设置显示时间距
            stylewidth:'220',
            close_btn:'.close_btn',
            show_btn:'.show_btn',
            side_list:'.side_list',
            content:'.side_content',
            widgetbox:'.widget-box',
            da_height:null,
            table_menu:'.list_right_style'
        });
    });
//    //时间选择
//    laydate({
//        elem: '#start',
//        event: 'focus'
//    });
    /*订单-删除*/
    function Order_form_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    /**发货**/
    function Delivery_stop(obj,id){
        layer.open({
            type: 1,
            title: '发货',
            maxmin: true,
            shadeClose:false,
            area : ['500px' , ''],
            content:$('#Delivery_stop'),
            btn:['确定','取消'],
            yes: function(index, layero){
                if($('#form-field-1').val()==""){
                    layer.alert('快递号不能为空！',{
                        title: '提示框',
                        icon:0,
                    })

                }else{
                    layer.confirm('提交成功！',function(index){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style=" display:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="已发货"><i class="fa fa-cubes bigger-120"></i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发货</span>');
                        $(obj).remove();
                        layer.msg('已发货!',{icon: 6,time:1000});
                    });
                    layer.close(index);
                }

            }
        })
    };
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form,.order_detailed').on('click', function(){
        var cname = $(this).attr("title");
        var chref = $(this).attr("href");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe').html(cname);
        parent.$('#iframe').attr("src",chref).ready();;
        parent.$('#parentIframe').css("display","inline-block");
        parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
        //parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
        parent.layer.close(index);

    });

    //初始化宽度、高度
    var heights=$(".top_style").outerHeight()+47;
    $(".centent_style").height($(window).height()-heights);
    $(".page_right_style").width($(window).width()-220);
    $(".left_Treeview,.list_right_style").height($(window).height()-heights-2);
    $(".list_right_style").width($(window).width()-250);
    //当文档窗口发生改变时 触发
    $(window).resize(function(){
        $(".centent_style").height($(window).height()-heights);
        $(".page_right_style").width($(window).width()-220);
        $(".left_Treeview,.list_right_style").height($(window).height()-heights-2);
        $(".list_right_style").width($(window).width()-250);
    })
    //比例
    var oldie = /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase());
    $('.easy-pie-chart.percentage').each(function(){
        $(this).easyPieChart({
            barColor: $(this).data('color'),
            trackColor: '#EEEEEE',
            scaleColor: false,
            lineCap: 'butt',
            lineWidth: 10,
            animate: oldie ? false : 1000,
            size:103
        }).css('color', $(this).data('color'));
    });

    $('[data-rel=tooltip]').tooltip();
    $('[data-rel=popover]').popover({html:true});
</script>
