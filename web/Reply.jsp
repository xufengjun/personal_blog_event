<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/22
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reply</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
%>
<form action="sendemail.action" method="post">
    <input name="email" type="text" value="<%=email%>"><br>
    <textarea name="message"></textarea><br>
    <input type="submit" value="发送">
</form>

</body>
</html>
