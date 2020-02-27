<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/static/admin/js/tree.js"></script>
</head>
<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center" valign="top" class="td03">
			<table width="90%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="25" class="F01">
						<p><img src="${pageContext.request.contextPath}/static/admin/images/index_35.gif" width="12" height="16" align="absmiddle"><strong>人民医院医疗管理系统</strong></p>
					</td>
				</tr>
				<tr>
					<td height="2" background="${pageContext.request.contextPath}/static/admin/images/index_39.gif"><img src="${pageContext.request.contextPath}/static/admin/images/spacer.gif" width="1" height="1"></td>
				</tr>
			</table>
			<table width="90%" border="0" cellpadding="0" cellspacing="0" class="td01">
				<tr>
					<td width="12">&nbsp;</td>
					<td width="628">
						<p><img src="${pageContext.request.contextPath}/static/admin/images/spacer.gif" width="1" height="1"><img src="${pageContext.request.contextPath}/static/admin/images/index_35.gif" width="12" height="16" align="absmiddle"><strong>快速通道</strong></p>
						<tr>
							<td background="${pageContext.request.contextPath}/static/admin/images/index_41.gif">&nbsp;</td>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<c:forEach items="${top}" var="top" varStatus="vs">
										<tr>
											<td>
												<table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
														<td width="19"><img id="top_${vs.count}" onClick="menu('menu_${vs.count}','top_${vs.count}');" src="${pageContext.request.contextPath}/static/admin/images/tree_03.gif" width="19" height="20"></td>
														<td width="19"><img src="${pageContext.request.contextPath}/static/admin/images/tree_27.gif" width="19" height="20"></td>
														<td nowrap>${top.name}</td>
													</tr>
												</table>
												<div id="menu_${vs.count}" style="display: none;">
													<c:forEach items="${second}" var="second" varStatus="sub_vs">
														<c:if test="${second.parentid==top.menuid}">
															<table width="100%" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td width="19"><img src="${pageContext.request.contextPath}/static/admin/images/tree_06.gif" width="19" height="20"></td>
																	<td width="19"><img src="${pageContext.request.contextPath}/static/admin/images/tree_07.gif" width="19" height="20"></td>
																	<td width="19"><img src="${pageContext.request.contextPath}/static/admin/images/tree_08.gif" width="19" height="20"></td>
																	<td nowrap>
																		<a href="${second.url}?menuid=${second.menuid}" target="mainFrame" class="a03" >${second.name}</a>
																	</td>
																</tr>
															</table>
														</c:if>
													</c:forEach>
												</div>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
							<td width="67" background="${pageContext.request.contextPath}/static/admin/images/index_43.gif">&nbsp;</td>
						</tr>
						<tr>
							<td><img src="${pageContext.request.contextPath}/static/admin/images/index_50.gif" width="12" height="12"></td>
							<td background="${pageContext.request.contextPath}/static/admin/images/index_51.gif"><img src="${pageContext.request.contextPath}/static/admin/images/spacer.gif" width="1" height="1"></td>
							<td><img src="${pageContext.request.contextPath}/static/admin/images/index_53.gif" width="12" height="12"></td>
						</tr>
			</table>
			<br>
			</td>
			</tr>
</table>
</body>
</html>
