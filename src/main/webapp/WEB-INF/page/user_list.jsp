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

    <link  href="../bootstrap-3.3.7-dist/css/bootstrap.min.css"
           rel="stylesheet">
    <script src="../bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script
            src="../bootstrap-3.3.7-dist/js/bootstrap.min.js">
    </script>

    <script type="text/javascript">
        function altRows(id){
            if(document.getElementsByTagName){

                var table = document.getElementById(id);
                var rows = table.getElementsByTagName("tr");

                for(i = 0; i < rows.length; i++){
                    if(i % 2 == 0){
                        rows[i].className = "evenrowcolor";
                    }else{
                        rows[i].className = "oddrowcolor";
                    }
                }
            }
        }

        window.onload=function(){
            altRows('alternatecolor');
        }
    </script>


    <!-- CSS goes in the document HEAD or added to your external stylesheet -->
    <style type="text/css">
        table.altrowstable {
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #a9c6c9;
            border-collapse: collapse;
        }
        table.altrowstable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
        table.altrowstable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #a9c6c9;
        }
        .oddrowcolor{
            background-color:#d4e3e5;
        }
        .evenrowcolor{
            background-color:#c3dde0;
        }
    </style>


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

        function edit(userId) {
            var id = $('.userId').val;
            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "./editUserList",
                data: {"id":id},
                type: "post",
                dataType: "json",
                success: function () {

                },
            }
            $.ajax(ajax)
        }

        function goUrl() {
            window.location.href="${pageContext.request.contextPath}/user/addUserList"
        }


    </script>
</head>
<body>
    <div>
        <div>
            <button onclick="goUrl()">新增</button>
        </div>
    <table class="altrowstable" id="alternatecolor">
        <thead>
            <tr>
                <th>编号</th>
                <th>昵称</th>
                <th>年级</th>
                <th>班级</th>
                <th>姓名</th>
                <th>年龄</th>
                <th>性别</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${page.res}" varStatus="status">
            <tr>
                <td class=".userId">${user.id}</td>
                <td>${user.loginName}</td>
                <td>${user.grade}</td>
                <td>${user.classNum}</td>
                <td>${user.realName}</td>
                <td>${user.age}</td>
                <td>${user.sex}</td>
                <td>
                    <span  onclick="edit(${user.id})">修改</span>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
<form>
    <input type="hidden" id="page" value="${page.page}">
    <a href="/user/page?${page.page-1}">上一页</a>
    <input name="page" type="text" value="${page.page + 1}">
    <span>总共 ${page.total} 条数据</span>
    <a href="/user/page?${page.page+1}">下一页</a>
</form>


</body>
</html>
