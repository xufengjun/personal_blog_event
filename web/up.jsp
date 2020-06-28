<%--
  Created by IntelliJ IDEA.
  User: 2065423432
  Date: 2019/12/24
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        label {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
            cursor: pointer;
        }
        /*隐藏默认样式*/
        input[id=file] {
            margin-left: -2000px;
            height: 0;
        }
    </style>

</head>
<body>
<div>
    <label id="upFile">
        <form action="uploade2.action" method="post" enctype="multipart/form-data">
            <input type="file" name="upload"/>
            <input type="submit" value="确认上传"/>
        </form></label>

</div>
<div>
    <p id="fileName"></p>
</div>

    <%--<form action="uploade2.action" method="post" enctype="multipart/form-data">--%>
        <%--<input type="file" name="upload"/>--%>
        <%--<input type="submit" value="确认上传"/>--%>
    <%--</form>--%>
</body>
</html>
