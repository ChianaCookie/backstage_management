
<%--
  Created by IntelliJ IDEA.
  User: 18315
  Date: 2018/8/12
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<html>
<head>
    <title>整改课程</title>
</head>
<body>
<form id = "update_form_id">
    <input type = "hidden" name = "curriculumid" value = "${curriculum.curriculumid}">
    <table align="center" style="border-collapse:separate; border-spacing:0px 10px;">
        <tr>
            <th>课程编号：</th>
            <td><input type="text" name = "curriculumnumber" class = "form-control" value="${curriculum.curriculumnumber}"></td>
        </tr>
        <tr>
            <th>课程名称：</th>
            <td><input type="text" name = "curriculumname" class = "form-control" value="${curriculum.curriculumname}"></td>
        </tr>
        <tr>
            <th>课程价格：</th>
            <td><input type="text" name = "curriculumprice" class = "form-control" value="${curriculum.curriculumprice}"></td>
        </tr>
        <tr>
            <th>课程来源：</th>
            <td>
                <div class="bs-example">
                    <label class="btn btn-default ">
                        <select name="curriculumfrom">
                            <option value="">请选择
                            <option value="1"
                                    <c:if test="${curriculum.curriculumfrom==1}">selected</c:if>
                        >中国
                            <option value="2"
                                    <c:if test="${curriculum.curriculumfrom==2}">selected</c:if>
                        >英国
                            <option value="3"
                                    <c:if test="${curriculum.curriculumfrom==3}">selected</c:if>
                        >法国
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
                            <option value="1"
                                    <c:if test="${curriculum.curriculumtype==1}">selected</c:if>
                        >文种类
                            <option value="2"
                                    <c:if test="${curriculum.curriculumtype==2}">selected</c:if>
                        >技巧类
                        </select>
                    </label>
                </div>
            </td>
        </tr>

    </table>

</form>
</body>
</html>
