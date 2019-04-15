<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>新增</title>
    <link  href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"
           rel="stylesheet">
    <script src="../bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script
            src="../bootstrap-3.3.7-dist/js/bootstrap.min.js">
    </script>
    <script type="text/javascript">

        function addUser(){
            console.info($('#saveForm').serializeArray())
            var ajax = {
                url: "${pageContext.request.contextPath}/user/addUser",
                data:$('#saveForm').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                    console.log(data)
                },
            }
            $.ajax(ajax)
        }
    </script>


    <!-- CSS goes in tde document HEAD or added to your external stylesheet -->
    <style type="text/css">
        table.altrowstable {
            font-family: verdana, arial, sans-serif;
            font-size: 11px;
            color: #333333;
            border-widtd: 1px;
            border-color: #a9c6c9;
            border-collapse: collapse;
        }

        table.altrowstable td {
            border-widtd: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }

        table.altrowstable td {
            border-widtd: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }

        .oddrowcolor {
            background-color: #d4e3e5;
        }

        .evenrowcolor {
            background-color: #c3dde0;
        }
    </style>
</head>
<body>
<div>
    <form id="saveForm">
        <table class="altrowstable" id="alternatecolor">
        <c:forEach var="user" items="${page.res}" varStatus="status">
            <tr>
                <td>昵称</td>
                <td><input name="loginName" type="text"
                value="${user.loginName}"/></td>
            </tr>
            <tr>
                <td>年级</td>
                <td><input name="grade" type="text"
                value="${user.grade}"/></td>
            </tr>
            <tr>
                <td>班级</td>
                <td><input name="classNum" type="text"
                value="${user.classNum}"/></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input name="realName" type="text"
                value="${user.realName}"/></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input name="age" type="text"
                value="${user.age}"/></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input name="sex" type="text"
                value="${user.sex}"/></td>
            </tr>
        </c:forEach>
        </table>
        <input onclick="addUser()" type="button" value="提交"/>
    </form>
</div>
</body>
</html>
