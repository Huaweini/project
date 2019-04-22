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
        var page = ${page.page};//当前页
        var size = ${page.size};//每页显示的条数
        var total = ${page.total};//数据总条数

        function lastpage() {
            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "./changePage",
                data: {},
                type: "post",
                dataType: "json",
                success: function () {
                    window.location.reload()
                }
            }
            $.ajax(ajax)
        }

        function nextpage() {
            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "./changePage",
                data: {},
                type: "post",
                dataType: "json",
                success: function () {
                    window.location.reload()
                }
            }
            $.ajax(ajax)
        }

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
            console.log(id);
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
                <li class="active"><a href="#">学生管理 <span class="sr-only">(current)</span></a></li>
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
            <h2 class="sub-header">学生管理</h2>
            <div>
                <!-- 按钮触发模态框 -->
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">新增</button>
            </div>
            <div class="table-responsive">
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
                    <c:forEach var="user" items="${page.res}" varStatus="status">
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
                                <button type="button" class="btn btn-danger" onclick="del(${user.id})">删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <form>
                <input type="hidden" id="page" value="${page.page}">
                <a href="${pageContext.request.contextPath}/user/page?${page.page-1}">上一页</a>
                <input name="page" type="text" value="${page.page + 1}">
                <span>总共 ${page.total} 条数据</span>
                <a href="${pageContext.request.contextPath}/user/page?${page.page+1}">下一页</a>

                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="/user/page?${page.page-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li>
                            <a href="/user/page?${page.page+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <span style="text-align: right">总共 ${page.total} 条数据</span>
                    </ul>
                </nav>
            </form>
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
                                <td><input name="sex" type="text"/></td>
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


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </body>
    </html>
