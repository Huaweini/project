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
    <link rel="icon" href="../../favicon.ico">

    <title>新增</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]>
    <script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="../bootstrap-3.3.7-dist/js/jquery-3.2.1.js"></script>
    <script type="text/javascript">
        function addUser(){
            var ajax = {
                url: "${pageContext.request.contextPath}/user/addUser",
                data:$('#saveForm').serializeArray(),
                type:"post",
                dataType:"json",
                success: function (data) {

                },
            }
            $.ajax(ajax)
        }
    </script>


</head>
<body>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" style="margin-top: -490px">
    <h2 class="sub-header">新增</h2>
</div>
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
        <buttom type="button" class="btn btn-default">提交</buttom>
    </form>
</div>
</body>
</html>
