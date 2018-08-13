<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap/css/bootstrap-theme.min.css"
            rel="stylesheet">
    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap/css/bootstrap.min.css"
            rel="stylesheet">
    <script src="${pageContext.request.contextPath}/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap/js/bootstrap.min.js"></script>

    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap-fileinput/css/fileinput.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap-fileinput/js/fileinput.js"></script>
    <!-- bootstrap-treeview -->
    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap-treeview/dist/bootstrap-treeview.min.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script>
    <!-- bootstrap.addtabs -->
    <link
            href="${pageContext.request.contextPath}/jquery/bootStrap-addTabs/bootstrap.addtabs.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/jquery/bootStrap-addTabs/bootstrap.addtabs.js"></script>
    <!-- bootstrap-table -->
    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap-table/dist/bootstrap-table.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap-table/dist/bootstrap-table.js"></script>
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script>

    <!-- new bootstrap-datetimepicker -->
    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <!-- bootstrap-dialog -->
    <link
            href="${pageContext.request.contextPath}/jquery/bootstrap-dialog/dist/css/bootstrap-dialog.min.css"
            rel="stylesheet">
    <script
            src="${pageContext.request.contextPath}/jquery/bootstrap-dialog/dist/js/bootstrap-dialog.min.js"></script>
    <style type="text/css">
        .row1{
            padding-top: 100px;
        }

    </style>
</head>
<body>
<div class="panel panel-warning">
    <form id="usersel" class="form-inline" >
        <label>  课程名称：  </label><input type="text" name="curriculumname" id="curriculumnameid" class="form-control">
        <button id="btn_search" onclick="search_list()" type="button" class="btn btn-default list-group-item-success">
            <span class="" ></span>搜索
        </button>
    </form>
</div>
<table class="table" id="file-table"></table>
<div id="toolbar" class="btn-group">
    <button id="btn_add" onclick="add_curriculum()" type="button" class="btn btn-default list-group-item-success">
        <span class="glyphicon glyphicon-plus" ></span>添加课程
    </button>
    <button id="btn_delete" onclick="delAll()" type="button" class="btn btn-default">
        <span class="" aria-hidden="true"></span>删除课程
    </button>
</div>

<script type="text/javascript">

    function search_list(){
        $("#file-table").bootstrapTable("refresh",{offset:1})
    }

    $("#file-table").bootstrapTable({
        url:"<%=request.getContextPath()%>/Curriculum/queryCurriculum",
        striped:true,				//改变行颜色
        undefinedText: "-", //查找的字段没有发现时的显示内容
        height: $(window).height() - 100, //自定义表格的高度
        toolbar: '#toolbar',
        pagination: true,		   //开启分页
        pageNumber:1,              //初始化加载第几页,默认第1页
        pageSize: 3,               //每页几条数据,超过总条数右下角将没分页
        pageList: [3, 8, 10, 15],    //每页条数,设置为All将展示全部记录,超过总条数底部将不显示条数下拉框
        contentType:"application/x-www-form-urlencoded;charset=UTF-8",	//必须的否则条件查询时会乱码
        sidePagination: "server",  //分页方式:client客户端分页,server服务端分页
        queryParams:function(params){
            var name =$("#curriculumnameid").val();
            params.curriculumname=name;
            return params;
        },
        columns: [{
            checkbox: true
        },{
            field: 'curriculumnumber',
            title: '编号'
        }, {
            field: 'curriculumname',
            title: '课程名称'
        }, {
            field: 'curriculumprice',
            title: '课程价格'
        }, {
            field: 'curriculumfrom',
            title: '课程来源',
            formatter:function(value,row,index){
                if(value == 1){
                    return "中国";
                }else if(value == 2){
                    return "英国";
                }else{
                    return "美国";
                }
            }
        }, {
            field: 'curriculumtime',
            title: '创建时间',
            formatter:function(value,row,index){
                var date =new Date(value);
                var localdate=date.toLocaleDateString();
                return localdate;
            }
        }, {
            field: 'curriculumstatus',
            title: '审核状态',
            formatter:function(value,row,index){
                if(value == 1){
                    return "审核中"
                }else if(value == 2){
                    return "审核通过"
                }else if(value == 3){
                    return "驳回"
                }
            }
        },{
            field: 'curriculumtype',
            title: '课程类型',
            formatter:function(value,row,index){
                if(value == 1){
                    return "文种类型"
                }else if(value == 2){
                    return "技巧类型"
                }
            }
        }, {
            field: '',
            title: '操作',
            formatter:function(value,row,index){
                return '<a href="#" onclick="updateState(\''+row.curriculumid+'\')">审核</a>'+'&nbsp;&nbsp'+'<a href="#" onclick="updateStates(\''+row.curriculumid+'\')"><font color="red">驳回</font></a>';
            }
        },]
    })
    function add_curriculum(){
        BootstrapDialog.show({
            title : '新增课程 ',
            message: $('<div></div>').load("<%=request.getContextPath()%>/lly/examine/addcurriculum.jsp"),
            buttons : [ {// 设置关闭按钮
                label : '关闭',
                action : function(dialogItself) {
                    dialogItself.close();
                }
            }, {// 设置关闭按钮
                label : '保存',
                action : function(dialogItself) {
                    $.ajax({
                        url:"<%=request.getContextPath()%>/Curriculum/addcurriculum",
                        type:"post",
                        data:$("#add_form_id").serialize(),
                        success:function(result){
                            if(result == 1){
                                alert("新增成功！！");
                            }
                            $("#file-table").bootstrapTable("refresh",{offset:1})
                            dialogItself.close();

                        },
                        error:function(){
                            alert("请求失败！！！");
                        }
                    })

                }
            } ],
        });
    }
    function getIdSelections() {
        return $.map($("#file-table").bootstrapTable('getSelections'), function(row) {
            return row.curriculumid;
        });
    }

    function delAll(){
        var ids = getIdSelections();
        if(ids.length > 0){
            if(confirm("你确定要删除这"+ids.length+"个数据吗？")){
                $.ajax({
                    url:"<%=request.getContextPath()%>/Curriculum/deletecurriculum?ids="+ids,
                    type:"post",
                    dataType:"json",
                    success:function(result){
                        if(result == 1){
                            alert("删除成功！！");
                        }
                        $("#file-table").bootstrapTable("refresh",{offset:1})
                    },
                    error:function(){
                        $.messager.alert('提示','请求失败！','info');
                    }
                });
            }
        }else{
            alert("请选择一行数据进行删除！！")
        }
    }

    function updateState(curriculumid){
     if(curriculumid!=null && curriculumid!=""){
         $.ajax({
             url:"<%=request.getContextPath()%>/Curriculum/updatecurriculumbyid?curriculumid="+curriculumid,
             data:{curriculumid:curriculumid},
             type:"post",
             dataType:"text",
             async:false,
             success: function (result) {
                if (result==1){

                    alert("审核通过")
                    $("#file-table").bootstrapTable("refresh",{offset:1})

                }

             },
             error: function () {
                 alert("幸福是回来敲门的！")
             }

         });

     }

    }
    function updateStates(curriculumid){
        if(curriculumid!=null && curriculumid!=""){
            $.ajax({
                url:"<%=request.getContextPath()%>/Curriculum/updatecurriculumbyids?curriculumid="+curriculumid,
                data:{curriculumid:curriculumid},
                type:"post",
                dataType:"text",
                async:false,
                success: function (result) {
                    if (result==1){

                        alert("您上传的视频不符合法律规范,给与驳回!!!!!")
                        $("#file-table").bootstrapTable("refresh",{offset:1})

                    }

                },
                error: function () {
                    alert("幸福是回来敲门的！")
                }

            });

        }

    }


</script>
</body>
