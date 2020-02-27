<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/win_center.js"></script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/static/admin/images/index_02.gif">
  <tr>
    <td width="40"><img src="${pageContext.request.contextPath}/static/admin/images/index_01.jpg" width="260" height="40"></td>
    <td align="right" valign="bottom"><table border="0" cellspacing="7" cellpadding="0">
      <tr>
        <td width="50" valign="bottom"><img src="${pageContext.request.contextPath}/static/admin/images/index_05.gif" width="20" height="16" align="absbottom"><a href="#" class="a02">后退</a></td>
        <td width="50" valign="bottom"><img src="${pageContext.request.contextPath}/static/admin/images/index_07.gif" width="20" height="16" align="absbottom"><a href="#" class="a02">前进</a></td>
        <td width="50" valign="bottom"><img src="${pageContext.request.contextPath}/static/admin/images/index_09.gif" width="20" height="16" align="absbottom"><a href="main.jsp" target="mainFrame" class="a02">首页</a></td>
        <td width="50" valign="bottom"><img src="${pageContext.request.contextPath}/static/admin/images/index_11.gif" width="20" height="16" align="absbottom"><a  onclick="if_quit()"  target="_top" class="a02">退出</a></td>

        </tr>
    </table></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="8"><img src="${pageContext.request.contextPath}/static/admin/images/spacer.gif" width="1" height="1"></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" background="${pageContext.request.contextPath}/static/admin/images/index_21.gif">
<form name="form1" method="post" action="">
  <tr>
    <td width="20" height="30">&nbsp;</td>
    <td class="F02">
      <c:if test="${admin!=null&&admin!=''}">
         <img src="${pageContext.request.contextPath}/static/admin/images/index_23.gif" width="26" height="30" align="absmiddle">${role}&nbsp;&nbsp;${admin.username}&nbsp;&nbsp;&nbsp;你好!
      </c:if>
      <c:if test="${user!=null&&user!=''}">
        <img src="${pageContext.request.contextPath}/static/admin/images/index_23.gif" width="26" height="30" align="absmiddle">${role}&nbsp;&nbsp;${user.username}&nbsp;&nbsp;&nbsp;你好!
      </c:if>
      <c:if test="${doctor!=null&&doctor!=''}">
        <img src="${pageContext.request.contextPath}/static/admin/images/index_23.gif" width="26" height="30" align="absmiddle">${role}&nbsp;&nbsp;${doctor.name}&nbsp;&nbsp;&nbsp;你好!
      </c:if>
    </td>
    <td align="right" class="F02"><a href="online/online.html" target="mainFrame" class="a01">当前在线</a> ｜ <a href="schedule/index.htm" target="mainFrame" class="a01">日程安排</a> ｜ <a href="grdingzhi/index1.htm" target="mainFrame" class="a01">个人定制</a> ｜ <a href="../html/collection/PersonalCollection.html" target="mainFrame" class="a01">个人收藏夹</a>｜ <a href="../html/message/message.htm" target="mainFrame" class="a01">站内消息[2]</a>｜ <a href="../html/bbs/bbs.html" target="mainFrame" class="a01">论坛</a></td>
    <td width="14" class="F02"></td>
  </tr>
</form>
</table>
<script>
  function  if_quit() {
    if (confirm("你确定要退出吗?")){
        //window.location.href="${pageContext.request.contextPath}/admin/logout";
    //  window.top.location.href="${pageContext.request.contextPath}/admin/logout";
      window.parent.location.href="${pageContext.request.contextPath}/admin/logout";
      //window.event.returnValue = false;
    }
  }
  </script>
</body>
</html>


