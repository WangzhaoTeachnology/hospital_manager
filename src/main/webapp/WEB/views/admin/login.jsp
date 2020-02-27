<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>医疗管理系统后台登录页面</title>
<link href="${pageContext.request.contextPath}/static/login/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/static/login/js/jquery2.js"></script>
<script src="${pageContext.request.contextPath}/static/login/js/cloud.js" type="text/javascript"></script>
<script language="javascript" src="${pageContext.request.contextPath}/static/login/js/js.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/static/login/js/cloud.js"></script>
<script language="javascript"  src="${pageContext.request.contextPath}/static/login/js/jquery-1.8.3.min.js" ></script>
</head>

<body style="background-color:#1c77ac; background-image: url('${pageContext.request.contextPath}/style/login/images/light.png'); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
<div id="mainBody">
  <div id="cloud1" class="cloud"></div>
  <div id="cloud2" class="cloud"></div>
</div>
<div class="logintop"> <span>欢迎医疗管理系统后台系统</span>
  <ul>
    <li><a href="#">返回首页</a></li>
  </ul>
</div>
<div class="loginbody"> <span class="systemlogo"></span>
  <div class="loginbox">
    <ul>
      <li>
        <input name="username" type="text"  id="username" class="loginuser" value="admin"  />
      </li>
      <li>
        <input name="password" type="password"  id="password"  class="loginpwd" value="密码" />
      </li>
      <li>
      <%-- <input name="" type="text" class="loginy" placeholder="输入验证码"/><label><img src="${pageContext.request.contextPath}/static/login/images/images.jpg" /></label>--%>
        <select name="rolename" class="loginy" id="rolename">
          <option value="请选择角色" class="loginy">请选择角色</option>
          <c:forEach  items="${roles}" var="role">
             <option value="${role.name}" class="loginy">${role.name}</option>
          </c:forEach>
        </select>
      </li>
      <li>
      <%--  <input type="date" id="test_date"/>--%>
        <input name="btnlogin"  id="btnlogin" type="button" class="loginbtn" value="登录" />
      </li>
    </ul>
  </div>
</div>
<div class="loginbm">版权所有： 阳光心健 © Copyright 2014 - 2015.</div>
</body>
<script type="text/javascript">
  $(function () {
    //var username = $("input[name='username']").val();
    var  username=$("#username");
    var  password=$("#password");
    var  user_value=null;
    var password_value=null;
    if (username!=null&&username!=""){
         username.focus(function(){
           user_value=username.val();
           username.val("");
           //alert(user_value);
         });
      /*   username.blur(function () {
            username.val(user_value);
         });*/
    }

    if (password!=null&&password!=""){
      password.focus(function(){
        password_value=password.val();
        password.val("");
        //alert(user_value);
      });
    /*  password.blur(function () {
        password.val(password_value);
      });*/
    }





  /*  因为一上来执行这个代码的时候是先将这个admin，和密码这两个数据先存放起来，然后
    在点击这个事件的时候，将这个input标签里面的数据清空，然后移出鼠标的话，重新显示这个admin的字体
    所以就要把这个数据先存放起来，然后再读取
    怎样把这个数据存放起来的，所以将这个数据的变量存放为全局的变量
    所以需要在 $(function ()函数里面写
    将一个按钮的两个不同的事件，可以使用这个全局变量*/
   /* function  onFocusUserName(parameter) {
      //alert(username);
      if (parameter!=null&&parameter!="") {
         $("#parameter").val("");
      }
    }
    function onBlurUserName (parameter) {
      if (parameter!=null&&parameter!="") {
          $("#parameter").val(username);
      }
    }*/
  });


  $("#btnlogin").click(function () {
    if ($("#username").val()=="admin"||$("#password").val()=="密码"){
         alert("不能使用提示的用户名和密码，请输入用户名和密码!");
    }
    else{
          if ($("#username").val().trim()==""||$("#username").val().trim()==null){
            alert("请输入用户名！");
          }
          else if ($("#password").val().trim()==""||$("#password").val().trim()==null){
            alert("请输入密码！");
          }
         else if($("select[name='rolename'] option:selected").val()=="请选择角色"){
              alert("请选择角色!");
          }
          else{
            // alert($("select[name='rolename'] option:selected").val());
            //   alert($("#rolename option:selected").val());
            if ($("#username").val().trim()!=""&&($("#password").val().trim()!="")&&$("select[name='rolename'] option:selected").val()!="") {
              $.ajax({
                type:"POST",
                data:{"username":$("#username").val(),"password":$("#password").val(),"rolename":$("select[name='rolename'] option:selected").val()},
                dataType:"JSON",
                url:"${pageContext.request.contextPath}/admin/login",
                success:function (data) {
                  if (data!=null&&data!=""){
                    var  info=data.type;
                    if (info!=null&&info!=""){
                      if (info=='username'){
                        alert("该用户名不存在！，请重新输入");
                      } else if (info=='password'){
                        alert("你输入的密码时错误，请重新输入密码！");
                      }else if(info=='success'){
                          window.location.href="${pageContext.request.contextPath}/admin/indexToMainPage";
                      }
                    }
                  }
                },error:function (data) {
                    alert("响应数据出现错误！");
                }

              });
            }
          }

    }
  });
</script>
</html>
