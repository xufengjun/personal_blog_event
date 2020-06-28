<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/22
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MailMessage</title>
</head>
<body>
<table border="1">
    <tr>
        <td>name</td>
        <td>email</td>
        <td>data</td>
        <td>message</td>
        <td>回复</td>
    </tr>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url ="jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone = GMT";
            Connection conn = DriverManager.getConnection(url,"root","123456");

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from MailMessage");
            while (rs.next()){
                String name = rs.getString(1);
                String email = rs.getString(2);
                String data = rs.getString(3);
                String message = rs.getString(4);
    %>
    <tr>
        <td><%=name%></td>
        <td><%=email%></td>
        <td><%=data%></td>
        <td><%=message%></td>

        <td>
            <a href="Reply.jsp?email=<%=email%>">回复</a>
        </td>
        <%--<td>--%>
            <%--<a href="updata.jsp?id=<%=id%>&themename=<%=themename%>>">修改</a>--%>
        <%--</td>--%>
    </tr>

    <%
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>
