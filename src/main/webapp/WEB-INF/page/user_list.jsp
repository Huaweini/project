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
    <title>学生管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
        function addUser() {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/addUser",
                data: $('#saveForm').serializeArray(),
                type: "post",
                dataType: "json",
                success: function (res) {
                    window.alert('添加成功:)')
                    window.location.reload()
                }
            }
            $.ajax(ajax)
        }

        function editPage(id) {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/editUserList",
                data: {
                    "id": id
                },
                type: "post",
                dataType: "json",
                success: function (res) {
                    $("input[name='id']").val(res.id);
                    $("input[name='realName']").val(res.realName);
                    $("input[name='loginName']").val(res.loginName);
                    $("input[name='grade']").val(res.grade);
                    $("input[name='classNum']").val(res.classNum);
                    $("input[name='age']").val(res.age);
                    $("input[name='sex']").val(res.sex);
                }
            }
            $.ajax(ajax)
        }

        function edit() {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/editUser",
                data: $('#saveForm1').serializeArray(),
                type: "post",
                dataType: "json",
                success: function (res) {
                    window.alert('修改成功:)')
                    window.location.reload()
                }
            }
            $.ajax(ajax)
        }

        function del(id) {
            if(confirm("确定删除?")){
                var ajax = {
                    url: "${pageContext.request.contextPath}/user/delUser",
                    data: {
                        "id": id
                    },
                    type: "post",
                    dataType: "json",
                    success: function (res) {
                        window.alert('删除成功:)')
                        window.location.reload()
                    }
                }
                $.ajax(ajax)
            }
        }

        function searchUser() {
            $("#pageNum").val(0);
            $("#searchForm").submit();
        }
        function myTeacher(grade,classNum) {
            var ajax = {
                url: "${pageContext.request.contextPath}/user/myTeacher",
                data: {
                    "grade": grade,
                    "classNum": classNum
                },
                type: "post",
                dataType: "json",
                success: function (res) {
                    $(".tProject").val(res.project);
                }
            }
            $.ajax(ajax)
        }

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
            <a class="navbar-brand" href="#">学生管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Settings</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Help</a></li>
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
                <li><a href="#">正在开发……</a></li>
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
                <h2 class="sub-header" style="margin-left: 10px">学生管理</h2>
                <div class="col-sm-1">
                    <!-- 按钮触发模态框 -->
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">新增</button>
                </div>
                <div class="col-sm-6">
                    <form action="" method="post" id="searchForm">
                        <div class="input-group">
                            <input type="text" class="form-control" name="keyword" value="${keyword}"
                                   placeholder="输入关键字"/>
                            <span class="input-group-btn" style="width: 1px">
                                <button class="btn btn-default" type="button" onclick="searchUser()">查询</button>
                                <input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum}"/>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 table-responsive" style="margin-top: 10px;">
                    <table class="table table-striped">
                        <thead>
                        <tr>
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
                        <c:forEach var="user" items="${page.list}" varStatus="status">
                            <tr>
                                <td>${user.loginName}</td>
                                <td>${user.grade}</td>
                                <td>${user.classNum}</td>
                                <td>${user.realName}</td>
                                <td>${user.age}</td>
                                <td>${user.sex}</td>
                                <td>
                                    <!-- 按钮触发模态框 -->
                                    <button type="button" class="btn btn-info" onclick="editPage(${user.id})"
                                            data-toggle="modal" data-target="#myModal1">修改
                                    </button>
                                    <button type="button" class="btn btn-danger" onclick="del(${user.id})">删除</button>
                                    <button type="button" class="btn btn-primary"
                                            data-toggle="modal" data-target="#myModal2" onclick="myTeacher(${user.grade},${user.classNum})">授课老师
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 显示分页信息 -->
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-6">当前 ${page.pageNum }页,总${page.pages }
                    页,总 ${page.total } 条记录
                </div>
                <!-- 分页条信息 -->
                <div class="col-md-6" style="display: inline">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/user/page?pageNum=1">首页</a></li>
                            <c:if test="${page.hasPreviousPage }">
                                <li><a href="${pageContext.request.contextPath}/user/page?pageNum=${page.pageNum-1}"
                                       aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                </a></li>
                            </c:if>
                            <c:forEach items="${page.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num == page.pageNum }">
                                    <li class="active"><a href="#">${page_Num }</a></li>
                                </c:if>
                                <c:if test="${page_Num != page.pageNum }">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/page?pageNum=${page_Num }">${page_Num }</a>
                                    </li>
                                </c:if>

                            </c:forEach>
                            <c:if test="${page.hasNextPage }">
                                <li><a href="${pageContext.request.contextPath}/user/page?pageNum=${page.pageNum+1 }"
                                       aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/user/page?pageNum=${page.pages}">末页</a>
                            </li>
                            <li class="dropdown" style="display: inline;">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    ${page.pageSize}
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/page?pageSize=10">10</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/page?pageSize=50">50</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/page?pageSize=100">100</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<!--新增页面-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <form id="saveForm">
                        <table class="table table-striped">
                            <tr>
                                <td>昵称</td>
                                <td><input name="loginName" type="text"/></td>
                            </tr>
                            <tr>
                                <td>年级</td>
                                <td><input name="grade" type="text"/></td>
                            </tr>
                            <tr>
                                <td>班级</td>
                                <td><input name="classNum" type="text"/></td>
                            </tr>
                            <tr>
                                <td>姓名</td>
                                <td><input name="realName" type="text"/></td>
                            </tr>
                            <tr>
                                <td>年龄</td>
                                <td><input name="age" type="text"/></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td>
                                    <select name="sex" style="height: 28px;">
                                        <option value="男">
                                            男
                                        </option>
                                        <option value="女">
                                            女
                                        </option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addUser()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!--修改页面-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">修改</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <form id="saveForm1">
                        <table class="table table-striped">
                            <!--id-->
                            <input type="hidden" name="id"/>
                            <tr>
                                <td>昵称</td>
                                <td><input name="loginName" type="text" class="loginName"/></td>
                            </tr>
                            <tr>
                                <td>年级</td>
                                <td><input name="grade" type="text" class="grade"/></td>
                            </tr>
                            <tr>
                                <td>班级</td>
                                <td><input name="classNum" type="text" class="classNum"/></td>
                            </tr>
                            <tr>
                                <td>姓名</td>
                                <td><input name="realName" type="text" class="realName"/></td>
                            </tr>
                            <tr>
                                <td>年龄</td>
                                <td><input name="age" type="text" class="age"/></td>
                            </tr>
                            <tr>
                                <td>性别</td>
                                <td><input name="sex" type="text" class="sex"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="edit()">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div>

<!--授课老师页面-->
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">授课老师</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <td>
                                    学科
                                </td>
                                <td>
                                    老师姓名
                                </td>
                                <td>
                                    职位
                                </td>
                            </tr>
                            <c:forEach var="list" items="${resultMap}" varStatus="status">
                            <tr>
                                <td>${list.project}</td>
                                <td>${list.realName}</td>
                                <td>${list.rank}</td>
                            </tr>
                            </c:forEach>
                        </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
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
