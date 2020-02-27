<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户管理</title>
<link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" language="JavaScript1.2" src="${pageContext.request.contextPath}/static/admin/js/stm31.js"></script>
<script>
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left) 
{
  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  if(scrollbars=="no")
 {parameter+=",scrollbars=no";}
  else
 {parameter+=",scrollbars=yes";}
  window.open(theURL,winName,parameter);
}
</script>
<SCRIPT language=JavaScript type=text/JavaScript>
function selectAllByChk(chk,checkbox) {     
	var size = checkbox.length;
    if(size == null){
        checkbox.checked =chk.checked;
    }
    else{
        for (var i = 0; i < checkbox.length; i++) {
            checkbox[i].checked =chk.checked;
          //这个是将所有的name=‘checkbox’，然后全选，把这个全选的状态赋值给每一个checkbox
        }
	}
}

</SCRIPT>
</head>
<%--这个网页的上进行三个角色的判断admin-user-doctor--%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
          <tr>
            <td width="15"><img src="${pageContext.request.contextPath}/static/admin/images/index_32.gif" width="9" height="9"></td>
            <td valign="bottom" class="title">用户管理</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <form action="">
  <tr>
    <td align="center"><br>
    <table width="95%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="td_page">姓名：<input name="queryName" type="text" alt="姓名|0|s" id=10 next=15 onFocus="{obtainFocus(this),this.select()}" onKeyPress="gotoNextInput(this)" class="input"  size="40" >
          <div style="display:none">
            <input type="text">
            </div>
              <input name="simple" type="button"  id=15  next=20   class="buttonface02" value="  查询  "  >
         <%-- <input name="advance" type="button" id=20 class="buttonface"  value="高级查询">
          <input name="doctor" type="radio" value="医生"/> 医生
          <input name="user" type="radio" value="挂号人员"/>挂号人员
          <input name="viewsys" type="button"  class="buttonface" onClick="javascript:window.location.href='syslist.htm'" value="查看系统管理员">--%>
          </td>
        </tr>
      </table>
        <br>
   <%--   <table width="95%"  border="0" cellspacing="2" cellpadding="0">
        <tr>
          <td align="right"><input name="Submit" type="button" class="buttonface" onClick="windowOpen('rolelist2.htm','','','340','270','no','50','50')" value="分配角色">
            <input name="Submit" type="button" class="buttonface"  value="分配系统管理员">
            <input name="Submit" type="button" class="buttonface" onClick="javascript:window.location.href='userpms.htm'" value="查看用户权限">
            </td>
          </tr>
        </table>--%>
        <table width="95%" border="0" cellpadding="2" cellspacing="0" class="table01">
          <tr>
            <td class="td_top">
              <input name="chk" type="checkbox" id="chk" onClick="selectAllByChk(chk,checkbox)" value="checkbox0">
            </td>
            <td class="td_top">姓名</td>
            <td class="td_top">真实姓名</td>
            <td class="td_top">密码</td>
            <td class="td_top">出生日期</td>
            <td class="td_top">性别</td>
            <td class="td_top">专业</td>
            <td class="td_top">性别</td>
            <td class="td_top">工作</td>
            <td class="td_top">毕业学校</td>
            <td class="td_top">部门</td>
            <td class="td_top">角色</td>
          <%--  <td class="td_top">角色</td>这个角色可以点击这个具体的用户的信息可以修改--%>
            </tr>
          <tr>
            <td class="td_01"><span class="td01">
              <input name="checkbox" type="checkbox" id="checkbox" value="checkbox01">
              </span></td>
            <td class="td_01"><a href="modifyinfo.htm">李董</a></td>
            <td class="td_01">人事部</td>
            <td class="td_01">男</td>
            <td class="td_01">1972-10-20</td>
            <td class="td_01">主任科员</td>
            <td class="td_01">人事部</td>
            <td class="td_01">男</td>
            <td class="td_01">1972-10-20</td>
            <td class="td_01">主任科员</td>
            <td class="td_01">主任科员</td>
            <td class="td_01">主任科员</td>
            </tr>
     <%--     <tr>
            <td class="td_02"><input type="checkbox" name="checkbox" value="checkbox"></td>
            <td class="td_02"><a href="modifyinfo.htm">王峰</a></td>
            <td class="td_02">管理信息部</td>
            <td class="td_02">男</td>
            <td class="td_02">1972-11-14</td>
            <td class="td_02">主任科员</td>
            </tr>--%>
          </table>
        </td></tr>
  </form>
</table>

<%--分页程序--%>
  <table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
    <tr>
      <td height="30" align="right"><img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1 页 1 条记录</td>
    </tr>
  </table>
</center>
</body>
</html>
