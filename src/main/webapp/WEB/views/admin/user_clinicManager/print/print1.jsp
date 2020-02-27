<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/
 html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/page/index.css">
    <title>window调用打印接口</title>
    <style>
        #pr{width:100px;height:40px;line-height:40px;text-align:center;background:#ccc;}
        .box{width:600px;background:red;}
    </style>

</head>

<body>
<div class="box">
    <h1>要打印的内容</h1>
    <p>测试内容zhg</p>
</div>
<div id="pr">点击打印</div>

</body>

</html>
<script>
    function $(selector){
        return document.querySelector(selector);
    }
    //获取整个页面
    $("#pr").onclick =function(){
        window.print();
    }

    /* 实现打印全部页面（也可以打印局部页面 - 看需求） ----
   	   我是只打印baby里边的内容
   	   获取我们定义的id
   	*/
    $("#pr").onclick =function(){
        var oldHtml = $("body").innerHTML;
        var printbox = $(".box").innerHTML;
        $("body").innerHTML = printbox;
        window.print();
        $("body").innerHTML = oldHtml;
        location.reload();//刷新当前页面，很重要

    }
</script>