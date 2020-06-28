<%--
  Created by IntelliJ IDEA.
  User: 2065423432
  Date: 2019/12/20
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册界面</title>
    <style type="text/css">
        body{
            background-color: rgba(223, 255, 231, 0.8);

        }
        .container{
            border-radius: 25px;
            box-shadow: 0 0 20px #222;
            width: 380px;
            height: 400px;
            margin: 0 auto;
            margin-top: 200px;
            background-color: rgba(152, 242, 242, 0.23);
        }
        .right {
            position: relative;
            left: 40px;
            top: 20px;

        }
        input{
            width: 180px;
            height: 25px;
        }

        button{
            background-color: rgba(230, 228, 236, 0.93);
            border: none;
            color: #110c0f;
            padding: 10px 70px;
            text-align: center;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            margin-top: 30px;
            margin-left: 50px;
        }

    </style>
</head>
<body >
<form name="myform" onsubmit="return checkUserInfo()" action="register.action" method="post">
    <h2 align="center">个人博客注册</h2>
    <div class="container">
        <div class="right">
            <h2>用户注册</h2>
            <p>用 户 名：<input type="text" name="username" id="name"></p>
            <p>密　　码: <input type="password" name="password" id="password"></p>
            <p>确认密码: <input type="password" name="psw2" id="psw2"></p>
            <p>邮　　箱:<input type="text" name="mail" id="mail"></p>
            <%--<input type="checkbox" name="agree" style="margin-left:1px;display:inline-block;" value="1"/>--%>
            <%--<span style="font-size:10px;">我已阅读并同意《用户注册协议》</span>--%>
            <p><button type="submit" value="注册" >立即注册</button></p>
        </div>
    </div>
</form>


</body>
<script>
    function checkUserInfo() {
        if(document.myform.userName.value==""){
            alert("用户名不能为空！");
            return false;
        }
        if (document.myform.password.value==""){
            alert("密码不能为空！");
            return false;
        }
        if(document.myform.password.value !==document.myform.psw2.value){
            alert("密码不一致！！！");
            return false;
        }
    }
</script>
</html>

