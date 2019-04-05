<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>新增</title>
    <script type="text/javascript">
        function altRows(id) {
            if (document.getElementsByTagName) {

                var table = document.getElementById(id);
                var rows = table.getElementsByTagName("tr");

                for (i = 0; i < rows.lengtd; i++) {
                    if (i % 2 == 0) {
                        rows[i].className = "evenrowcolor";
                    } else {
                        rows[i].className = "oddrowcolor";
                    }
                }
            }
        }

        window.onload = function () {
            altRows('alternatecolor');
        }

        function addUser(){
            var ajax = {
                contentType: "application/json;charset=UTF-8",
                url: "./addUser",
                data:{},
                type:"post",
                dataType:"json",
                success: function () {

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
    <form>
        <table class="altrowstable" id="alternatecolor">
            <tr>
                <td>昵称</td>
                <td><input name="loginName"/></td>
            </tr>
            <tr>
                <td>年级</td>
                <td><input name="grade"/></td>
            </tr>
            <tr>
                <td>班级</td>
                <td><input name="classNum"/></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input name="realName"/></td>
            </tr>
            <tr>
                <td>年龄</td>
                <td><input name="age"/></td>
            </tr>
            <tr>
                <td>性别</td>
                <td><input name="sex"/></td>
            </tr>
        </table>
        <button onclick="addUser()">提交</button>
    </form>
</div>
</body>
</html>
