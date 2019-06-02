<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/14
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
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
    <title>育才中学后台管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">

    </script>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">育才中学后台管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">登陆</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" style="margin-top: 80px;background-color: #b3b4b524">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="${pageContext.request.contextPath}/user/page">学生管理 <span class="sr-only">(current)</span></a>
                </li>
                <li><a href="${pageContext.request.contextPath}/user/teacherPage">教师管理</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/user/unitPage">
                        组织结构 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">班级-结构管理</a></li>
                        <li><a href="#">部门-结构管理</a></li>
                        <li><a href="#">职级-结构管理</a></li>
                        <li><a href="#">学科-结构管理</a></li>
                    </ul>
                </li>
                <li><a href="#">正在开发……</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
                <li><a href="">正在开发……</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin-top: -490px">
            <div class="row">
                <h2 class="sub-header" style="margin-left: 10px">班级-结构管理</h2>
            </div>
            <div class="row">

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
