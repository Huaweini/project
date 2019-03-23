<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/14
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

    <script>
        function submitForm() {
            var number = $("#num").val();
            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "./toTestPage",
                data: {
                    number
                },
                type: "post",
                dataType: "json",
                success: function (user) {
                    console.log(user);
                },
            }
            $.ajax(ajax)
        }
    </script>
</head>
<body>
    <form>
        <input name="addnum" type="text" id="num">
        <button type="button" onclick="submitForm()">提交</button>
    </form>
    <table>
        <thead>
        <tr>
            <th>编号</th>
            <th>昵称</th>
            <th>密码</th>
            <th>姓名</th>
            <th>组织代号</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${list}" varStatus="status">
            <tr>
                <td>${user.id}</td>
                <td>${user.loginName}</td>
                <td>${user.password}</td>
                <td>${user.realName}</td>
                <td>${user.groupId}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</body>
</html>
