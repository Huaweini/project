<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>修改</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        function edit() {
            var id = $('#userid').val;
            var loginName = $('.loginName').val;
            var grade = $('.grade').val;
            var classNum = $('.classNum').val;
            var realName = $('.realName').val;
            var age = $('.age').val;
            var sex = $('.sex').val;

            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "${pageContext.request.contextPath}/user/editUser",
                data: {
                    "id":id,
                    "loginName":loginName,
                    "grade":grade,
                    "classNum":classNum,
                    "realName":realName,
                    "age":age,
                    "sex":sex
                },
                type: "post",
                dataType: "json",
                success: function () {

                },
            }
            $.ajax(ajax)
        }

    </script>
</head>
<body>
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
                        <c:forEach var="user" items="${list}" varStatus="status">
                        <tr>
                            <td>昵称</td>
                            <td><input name="loginName" type="text" class="loginName"
                                       value="${user.loginName}"/></td>
                        </tr>
                        <tr>
                            <td>年级</td>
                            <td><input name="grade" type="text" class="grade"
                                       value="${user.grade}"/></td>
                        </tr>
                        <tr>
                            <td>班级</td>
                            <td><input name="classNum" type="text" class="classNum"
                                       value="${user.classNum}"/></td>
                        </tr>
                        <tr>
                            <td>姓名</td>
                            <td><input name="realName" type="text" class="realName"
                                       value="${user.realName}"/></td>
                        </tr>
                        <tr>
                            <td>年龄</td>
                            <td><input name="age" type="text" class="age"
                                       value="${user.age}"/></td>
                        </tr>
                        <tr>
                            <td>性别</td>
                            <td><input name="sex" type="text" class="sex"
                                       value="${user.sex}"/></td>
                        </tr>
                        </c:forEach>
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
</body>
</html>
