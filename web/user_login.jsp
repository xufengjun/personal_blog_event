<%--
  Created by IntelliJ IDEA.
  User: 2065423432
  Date: 2019/12/20
  Time: 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<title>登陆界面</title>
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
        background-color: rgba(152, 242, 242, 0.15);
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
<form name="myform" onsubmit="return checkUserInfo()" action="login.action" method="post">
    <div class="container">
        <div class="right">
            <h2>用户登陆</h2>
            <p>用 户 名：<input type="text" name="username" ></p>
            <p>密　　码: <input type="password" name="password"></p>
            <!--<p>确认密码: <input type="password" name="psw2" id="psw2"></p>-->
            <!--<p>邮　　箱:<input type="text" name="mail" id="mail"></p>-->
            <p><button type="submit" value="0" >登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;陆</button></p>
            <p><a href="manager_login.jsp" ><button type="button" value="1" >管理员登陆</button></a></p>
        </div>
    </div>
</form>


</body>
</html>
