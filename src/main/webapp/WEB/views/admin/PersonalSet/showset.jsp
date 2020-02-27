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
<style type="text/css">
<!--
.style1 {font-size: 14px}
.style2 {color: #333333}
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



<c:if test="${userInfo.role.name=='超级管理员'}">
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <td width="79%" class="td_page style1">--基本信息-- <a href="${pageContext.request.contextPath}/admin/onclickToUpdatePassword" class="style2">用户密码修改</a>--</td>
    </table>
    <table width="95%" border="0" cellpadding="2" cellspacing="0" align="center">
        <tr>
            <td width="272" class="td_form01"><div align="right">用户名称：</div></td>
            <td width="481" class="td_form02"><div align="left">${userInfo.username}</div></td>
        </tr>
        <tr>
            <td width="272" class="td_form01"><div align="right">真实性名：</div></td>
            <td width="481" class="td_form02"><div align="left">${userInfo.name}</div></td>
        </tr>

        <tr>
            <td width="272" class="td_form01"><div align="right">性别：</div></td>

            <td width="481" class="td_form02"><div align="left">
                <c:if test="${userInfo.sex==0}">
                    男
                </c:if>
                <c:if test="${userInfo.sex==1}">
                    女
                </c:if>
            </div></td>
        </tr>

        <tr>
            <td width="272" class="td_form01"><div align="right">出生日期：</div></td>
            <td width="481" class="td_form02"><div align="left">${userInfo.birthday}</div></td>
        </tr>

        <tr>
            <td width="272" class="td_form01"><div align="right">上次登录时间: </div></td>
            <td width="481" class="td_form02"><div align="left">${userInfo.lastime}</div></td>
        </tr>
        <tr>
            <td width="272" class="td_form01"><div align="right">备注：</div></td>
            <td width="481" class="td_form02"><div align="left">${userInfo.remark}</div></td>
        </tr>
    </table>
</c:if>
<c:if test="${userInfo.role.name=='门诊工作人员'}">

</c:if>

<c:if test="${userInfo.role.name=='医生'}">

</c:if>
<br>
<br>
</body>
</html>