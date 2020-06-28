<%--
  Created by IntelliJ IDEA.
  User: 2065423432
  Date: 2019/12/24
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form name="manageuser" action="select.action" method="post">

    <table align="center" border="1" width="400px">
        <input type="submit" name="select" value="查看用户">
        <tr>
            <td align="center" colspan="6">用户列表</td>
        </tr>

        <s:iterator value="#session.userlist" >
            <tr>
                <td align="center" ><s:property  value="id"/> </td>
                <td align="center"><s:property value="username"/> </td>
                <td align="center"><a href="delete.action?id=<s:property value="id"/>">删除</a> </td>
            </tr>
        </s:iterator>
    </table>

</form>

</body>
</html>
