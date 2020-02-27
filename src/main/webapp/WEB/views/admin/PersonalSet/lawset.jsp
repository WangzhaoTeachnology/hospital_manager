<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>个人设置</title>
<link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css">
<SCRIPT language=JavaScript type=text/JavaScript>
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}
</SCRIPT>
    <script language="javascript"  src="${pageContext.request.contextPath}/static/login/js/jquery-1.8.3.min.js" ></script>
<style type="text/css">
<!--
.style1 {font-size: 14px}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15" height="23"><img src="${pageContext.request.contextPath}/static/admin/images/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title">个人设置</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
<td width="79%" class="td_page style1">--<a href="${pageContext.request.contextPath}/admin/selectAdminInfo">基本信息</a>--用户密码修改--</td>
</table>
<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center">
    <tr>
        <td width="481" class="td_form02" colspan="2"><div align="left"><input name="username" type="hidden" id="username"  value="${user.name}"/></div></td>
    </tr>
  <tr> 
    <td width="272" class="td_form01"><div align="right">旧密码：</div></td>
    <td width="481" class="td_form02"><div align="left"><input name="textfield" type="password" class="input" id="oldPassword" size="30"></div></td>
 </tr>
   <tr> 
    <td width="272" class="td_form01"><div align="right">新密码：</div></td>
    <td width="481" class="td_form02"><input name="textfield" type="password" class="input" id="newPassword" size="30"><div align="left" id="newdiv">（8--20位有效字符）</div></td>
 </tr>
   <tr> 
    <td width="272" class="td_form01"><div align="right">密码确认：</div></td>
    <td width="481" class="td_form02"><input name="textfield" type="password" class="input" id="password" size="30"><div align="left" id="olddiv">（8--20位有效字符）</div></td>
 </tr>
</table>

<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
  
  <tr>
    <td >
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="Submit" type="submit" class="buttonface02" value="确定" onClick="submitToUpdatePassword()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <input name="Submit" type="reset" class="buttonface02" value="取消"  onclick="resetData()"/>
    </td>
  </tr>
</table>

<script type="text/javascript">

    $(function () {
        $("#newPassword").keyup(function () {
            var  newPassword=$("#newPassword").val();
            var div_newpassword=$("#newdiv");
            if (newPassword.length>=8&&newPassword.length<=20){
                div_newpassword.text("");
            } else{
                div_newpassword.text("（8--20位有效字符）");
            }
        });
        $("#password").keyup(function () {
            var  newPassword=$("#password").val();
            var div_newpassword=$("#olddiv");
            if (newPassword.length>=8&&newPassword.length<=20){
                div_newpassword.text("");
            } else{
                div_newpassword.text("（8--20位有效字符）");
            }
        });
    });


    function  resetData() {
          $("#oldPassword").val("");
          $("#newPassword").val("");
          $("#password").val("");
    }
   function submitToUpdatePassword() {
       var  oldPassword=$("#oldPassword").val();
       var  newPassword=$("#newPassword").val();
       var  password=$("#password").val();
       var  username=$("#username").val();
       //alert("oldPassword"+oldPassword+","+"newPassword"+","+newPassword+","+"password"+","+password+","+username);
       if (oldPassword!=null&&newPassword!=null&&password!=null
           &&(oldPassword!=""&&newPassword!=""&&password!="")&&username!=null&&username!=""){
             if (newPassword.length>=8||newPassword<=20&&oldPassword.length>=8||oldPassword<=20){
                 if (password==newPassword){
                  //   alert("进入！");
                     $.ajax({
                         type:"GET",
                         url:"${pageContext.request.contextPath}/admin/updateAdminPasswordBySession",
                         data:{"oldPassword":oldPassword,"newPassword":newPassword,"password":password,"username":username},
                         dataType:"JSON",
                         success:function (data) {
                             if (data!=null&&data!=""){
                                 var type=data.type;
                                 if (type=='success'){
                                     alert("修改密码成功!");
                                     window.location.href="${pageContext.request.contextPath}/admin/selectAdminInfo";
                                 }
                                 else if (type=='fail'){
                                     alert("修改密码失败!");
                                 }
                             }
                         },error:function (data) {
                             if (data!=null&&data!=""){
                                 alert("响应数据有误！");
                             }
                         }
                     });
                 } else{
                     alert("你输入的新密码与确认的密码，不一致，请你重新输入数据!");
                 }
             }
       }
       else{
           alert("请输入密码，不能为空!");
       }
   }
</script>
</body>
</html>