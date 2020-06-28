<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2019/12/23
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>

<html>

<head>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
    <style>
        .w-e-text-container {
            height: 40rem !important;
        }
        .formclass{
            font-size: 25px;
        }

        .titleinput{
            width: 500px;
            height: 25px;
        }
    </style>
</head>

<body>
<form class="formclass" action="writeblog.action" method="POST">
    标题:<input class="titleinput" type="text" name="title">
    <br>
    <br>
    <div id="editor">
    </div>
    <input hidden type="text" id="blogtext" name="blogtext">
    <input class="" type="button" onclick="finishtext()" value="完成">
    <input class="" type="submit" value="发表">
</form>


<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript" src="assets/js/wangEditor.min.js"></script>
<!-- 富文本 过滤word粘贴过来的字符串 -->
<script type="text/javascript" src="assets/js/jquery.wordFilter.js"></script>

<script type="text/javascript">
    var E = window.wangEditor;
    var editor = new E('#editor');

    // 自定义菜单配置
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
        'video',  // 插入视频
        'code',  // 插入代码
        'undo',  // 撤销
        'redo'  // 重复
    ];

    // 关闭粘贴样式的过滤
    editor.customConfig.pasteFilterStyle = true;

    // 忽略粘贴内容中的图片
    editor.customConfig.pasteIgnoreImg = false;

    // 自定义处理粘贴的文本内容
    editor.customConfig.pasteTextHandle = function (content) {
        //用来过滤word粘贴过来的字符串
        return returnHtml(content);
    }
    // 将图片大小限制为 3M
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
    // 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
    // editor.customConfig.uploadImgServer = '/upload';  // 上传图片到服务器
    editor.customConfig.uploadImgShowBase64 = true;      // 使用 base64 保存图片
    //上传图片的错误提示
    editor.customConfig.customAlert = function (info) {
        alert(info);
    }

    //自定义上传图片事件
    editor.customConfig.customUploadImg = function (files, insert) {
        var name = files[0].name; //文件对象
        var suffix = name.substr(name.indexOf(".")); //文件后缀名

    }

    editor.create();

    //设置内容 创建编辑器之后，使用editor.txt.html(...)设置编辑器内容
    // editor.txt.html('<p>用 JS 设置的内容</p>');

    //追加内容
    // editor.txt.append('<p>追加的内容</p>');

    //清空内容
    // editor.txt.clear();

    //读取内容
    // editor.txt.html(); //读取 html
    // editor.txt.text()  //读取 text
    // document.getElementById("blogtext").value=editor.txt.text();

    function finishtext() {
        document.getElementById("blogtext").value=editor.txt.text();
    }

</script>

</body>

</html>



