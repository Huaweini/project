<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String appPath = request.getContextPath(); %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>登录</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function checkLogin() {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/checkLogin",
                data: $('#saveForm').serialize(),
                type: "post",
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    if (data != null || data != "") {
                        window.location.href = "${pageContext.request.contextPath}/user/page";
                    }
                }
            }
            $.ajax(ajax)
        }
    </script>
</head>
<body>
<div>
    <div style=" width: 50%; margin: 0 600px; padding-top: 300px;">
        <h1 style="margin-left: 150px">
            育才中学后台管理系统
        </h1>
    </div>
    <div style="width: 50%;margin: 0 600px;padding-top: 50px;">
        <form class="form-horizontal" id="saveForm" method="post">
            <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input style="width: 50%" type="text" class="form-control"
                           placeholder="用户名" name="loginName">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input style="width: 50%" type="password" class="form-control"
                           placeholder="密码" name="password">
                </div>
            </div>
        </form>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-default" onclick="checkLogin()">登录</button>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
