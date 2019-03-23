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
    <title>用户列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>

    <script>
        var page = ${page.page};//当前页
        var size = ${page.size};//每页显示的条数
        var total = ${page.total};//数据总条数

        function lastpage() {
            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "./changePage",
                data: {

                },
                type: "post",
                dataType: "json",
                success: function () {
                    window.location.reload()
                },
            }
            $.ajax(ajax)
        }

        function nextpage() {
            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "./changePage",
                data: {

                },
                type: "post",
                dataType: "json",
                success: function () {
                    window.location.reload()
                },
            }
            $.ajax(ajax)
        }

    </script>
</head>
<body>
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
        <c:forEach var="user" items="${page.res}" varStatus="status">
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
<form>
    <input type="hidden" id="page" value="${page.page}">
    <a href="/user/page?${page.page-1}">上一页</a>
    <input name="page" type="text" value="${page.page + 1}">
    <span>总共 ${page.total} 条数据</span>
    <a href="/user/page?${page.page+1}">下一页</a>
</form>


</body>
</html>
