<%--
  Created by IntelliJ IDEA.
  User: 18315
  Date: 2018/8/12
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程新增</title>
</head>
<body>
<form id = "add_form_id">
    <table align="center" style="border-collapse:separate; border-spacing:0px 10px;">
        <tr>
            <th>课程编号：</th>
            <td><input type="text" name = "curriculumnumber" class = "form-control" placeholder="请输入课程编号"></td>
        </tr>
        <tr>
            <th>课程名称：</th>
            <td><input type="text" name = "curriculumname" class = "form-control" placeholder="请输入课程名称"></td>
        </tr>
        <tr>
            <th>课程价格：</th>
            <td><input type="text" name = "curriculumprice" class = "form-control" placeholder="请输入价格"></td>
        </tr>
        <tr>
            <th>课程来源：</th>
            <td>
                <div class="bs-example">
                        <label class="btn btn-default ">
                            <select name="curriculumfrom">
                                <option value="">请选择
                                <option value="1">中国
                                <option value="2">英国
                                <option value="3">法国
                            </select>
                        </label>
                </div>
            </td>
        </tr>
        <tr>
            <th>课程种类：</th>
            <td>
                <div class="bs-example">
                    <label class="btn btn-default ">
                        <select name="curriculumtype">
                            <option value="">请选择
                            <option value="1">文种类
                            <option value="2">技巧类
                        </select>
                    </label>
                </div>
            </td>
        </tr>

    </table>

</form>
<script>



    $("#curricul").datetimepicker({
        format: "yyyy-mm-dd hh:ii:ss",//显示格式
        language: 'zh-CN',//显示中文
        autoclose: true,//选中自动关闭
        todayBtn: true,//显示今日按钮
    });

</script>

</body>
</html>
