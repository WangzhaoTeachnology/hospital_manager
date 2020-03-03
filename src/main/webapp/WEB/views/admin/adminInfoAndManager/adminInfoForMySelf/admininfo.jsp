<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="utf-8">
		<!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<!-- 引入Bootstrap核心样式文件 -->
		<link href="${pageContext.request.contextPath}/static/admin/boostrap/css/bootstrap.min.css" rel="stylesheet">
		<!-- 引入jQuery核心js文件 -->
		<script src="${pageContext.request.contextPath}/static/admin/boostrap/js/jquery-1.11.3.min.js"></script>
		<!-- 引入BootStrap核心js文件 -->
		<script src="${pageContext.request.contextPath}/static/admin/boostrap/js/bootstrap.min.js"></script>
	</head>
	<body>


<%--	id
	username
	password
	name
	birthday
	sex
	count
	lastime
	remark
	role_id--%>

	<div class="container">
			  <div class="row" style="border: 0px solid red;margin: auto;">
				  <c:if test="${admin!=null}">
					  <form class="form-horizontal" style="margin-top: 40px;">
						  <div class="form-group">
							  <label for="name" class="col-sm-2 control-label">真实姓名</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="name" value="${admin.name}" readonly="readonly" class="form-control" id="name" placeholder="真实姓名">
							  </div>
						  </div>

						  <div class="form-group">
							  <label for="username" class="col-sm-2 control-label">姓名</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="name" value="${admin.username}" class="form-control" readonly="readonly" id="username" placeholder="姓名">
							  </div>
						  </div>

						  <div class="form-group">
							  <label for="password" class="col-sm-2 control-label">密码</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="password"  value="${admin.password}" readonly="readonly" class="form-control" id="password" placeholder="输入密码">
							  </div>
						  </div>
						  <div class="form-group">
							  <label  class="col-sm-2 control-label">性别</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="hidden" id="hidden_sex" name="hidden_sex" value="${admin.sex}" />
								  <input type="radio" id="male" name="sex" value="0" readonly="readonly" >男
								  <input type="radio" id="female" name="sex" value="1" readonly="readonly" > 女
							  </div>
						  </div>


						  <div class="form-group">
							  <label for="birthday" class="col-sm-2 control-label">出生日期</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="hidden" name="birthday" value="${admin.birthday}" class="form-control" id="hidden_birthday" >
								  <input type="date" name="birthday" readonly="readonly" class="form-control" id="birthday" >
							  </div>
						  </div>


						  <div class="form-group">
							  <label for="lastime" class="col-sm-2 control-label">上次登录时间</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="lastime" readonly="readonly" value="${admin.lastime}" class="form-control" id="lastime" />
							  </div>
						  </div>

						  <div class="form-group">
							  <label for="count" class="col-sm-2 control-label">登录次数</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="count" readonly="readonly" class="form-control" value="${admin.count}" id="count" />
							  </div>
						  </div>

						 <%-- <div class="form-group">
							  <label for="prat" class="col-sm-2 control-label">职称</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="prat" class="form-control" readonly="readonly" value="${doctor.prat}" id="prat" placeholder="输入职称的信息" />
							  </div>
						  </div>
						  <div class="form-group">
							  <label for="office" class="col-sm-2 control-label">科室</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="office" class="form-control" readonly="readonly"  value="${doctor.offices.name}" id="office" placeholder="输入科室的信息" />
							  </div>
						  </div>--%>
						<%--  <div class="form-group">
							  <label for="appointment" class="col-sm-2 control-label">门诊</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="appointment" class="form-control" readonly="readonly" value="${doctor.appoint_category.name}" id="appointment" placeholder="输入门诊的信息" />
							  </div>
						  </div>--%>
						 <%-- <div class="form-group">
							  <label for="role" class="col-sm-2 control-label">角色</label>
							  <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
								  <input type="text" name="role"  value="${doctor.role.name}" class="form-control" id="role" >
							  </div>
						  </div>--%>

							  <%--		<div class="form-group">
                                          <label for="role" class="col-sm-2 control-label" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> 查看权限</label>
                                          <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                                              <div class="collapse" id="collapseExample">
                                                  <div class="well">
                                                      Link with href
                                                  </div>
                                              </div>
                                          </div>
                                      </div>--%>

						    <div class="form-group" style="text-align: center;">
									<div class="col-sm-4 col-lg-4 col-xs-4 col-md-4" style="text-align: center;margin-left: 167px;">
										<button type="button" data-toggle="modal" data-target="#_updateexampleModalScrollable"  id="update" class="btn btn-primary">修改</button>
										  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
										<button type="reset"  class="btn btn-secondary" data-dismiss="modal">重置</button>
									</div>
							 </div>
					  </form>
				  </c:if>
			  </div>
			</div>

<!-- 点击编辑按钮 -->
<div class="modal fade"  id="_updateexampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="update_exampleModalScrollableTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable" role="document" >
		<form id="updateform">
			<div class="modal-content" style="width: 635px;height: 435px;">
				<div class="modal-header">
					<h5 class="modal-title" id="update_exampleModalScrollableTitle">修改管理员个人信息</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body"  id="updatemain" style="height: 320px;">

				</div>

				<div class="modal-footer">
					<button type="button"  class="btn btn-secondary" data-dismiss="modal">关闭</button>
					<button type="button"  id="updatebtn" class="btn btn-primary">确认</button>
				</div>
			</div>
		</form>
	</div>
</div>
	</body>
	<script>

		$(function () {

			var  birthday=$("#hidden_birthday").val();
			$("#birthday").val(birthday);
			//	alert(birthday);
			var  sex=$("#hidden_sex").val();
			if (sex!=null&&sex!=""){
				if (sex=='0'){
					$("#male").attr("checked",true);
					$("#_male").attr("checked",true);
				} else if(sex=='1'){
					$("#female").attr("checked",true);
					$("#_female").attr("checked",true);
				}
			}
			$("#update").click(function () {
				var  content="<form class=\"form-horizontal\" style=\"margin-top: 40px;\">\n" +
						"\t\t\t\t\t\t  <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label for=\"name\" class=\"col-sm-2 control-label\">真实姓名</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"hidden\" name=\"id\" value=\"${admin.id}\" class=\"form-control\" id=\"_id\" >\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"text\" name=\"name\" value=\"${admin.name}\" class=\"form-control\" id=\"name\" placeholder=\"真实姓名\">\n" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>\n" +

						"\t\t\t\t\t\t  <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label for=\"username\" class=\"col-sm-2 control-label\">姓名</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"text\" name=\"username\" value=\"${admin.username}\" class=\"form-control\" id=\"username\" placeholder=\"姓名\">\n" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>\n" +
						"\n" +
						"\t\t\t\t\t\t  <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label for=\"password\" class=\"col-sm-2 control-label\">密码</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"text\" name=\"password\"  value=\"${doctor.password}\" class=\"form-control\" id=\"_password\" placeholder=\"输入密码\">\n" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>\n" +

						"\t\t\t\t\t\t  <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label  class=\"col-sm-2 control-label\">性别</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"radio\" id=\"_male\" name=\"sex\"  readonly=\"readonly\" >男" +
						"\t\t\t\t\t\t\t\t  <input type=\"radio\" id=\"_female\" name=\"sex\" readonly=\"readonly\" > 女" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>\n" +
						"\n" +

						"\n" +
						"\t\t\t\t\t\t  <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label for=\"birthday\" class=\"col-sm-2 control-label\">出生日期</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"date\" name=\"birthday\" class=\"form-control\" readonly=\"readonly\"  id=\"_birthday\" >\n" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>\n" +
						"\n" +
						"\n" +
						"           <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label for=\"lastime\" class=\"col-sm-2 control-label\">上次登录时间</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"text\" name=\"lastime\" readonly=\"readonly\" value=\"${admin.lastime}\" class=\"form-control\" id=\"lastime\" />\n" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>\n" +
						"\n" +
						"\t\t\t\t\t\t  <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label for=\"count\" class=\"col-sm-2 control-label\">登录次数</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"text\" name=\"count\" readonly=\"readonly\" class=\"form-control\" value=\"${admin.count}\" id=\"count\" />\n" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>"+


					/*	"\t\t\t\t\t\t  <div class=\"form-group\">\n" +
						"\t\t\t\t\t\t\t  <label for=\"role\" class=\"col-sm-2 control-label\">角色</label>\n" +
						"\t\t\t\t\t\t\t  <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
						"\t\t\t\t\t\t\t\t  <input type=\"text\" name=\"role\"  value=\"\" class=\"form-control\" id=\"role\" >\n" +
						"\t\t\t\t\t\t\t  </div>\n" +
						"\t\t\t\t\t\t  </div>\n" +*/
						"\t\t\t\t\t  </form>";
				$("#updatemain").html(content);

				if (sex!=null&&sex!=""){
					if (sex=='0'){
						$("#_male").attr("checked",true);
					} else if(sex=='1'){
						$("#_female").attr("checked",true);
					}
				}
				$("#_birthday").val(birthday);
				$("#updatebtn").click(function () {
					//alert($("#id").val()+$("#name").val()+$("#password").val());
                   $.ajax({
					   url:"${pageContext.request.contextPath}/admin/doctor/updateDoctorInfoById",
					   type:"GET",
					   data:{"id":$("#_id").val(),"name":$("#_name").val(),"password":$("#_password").val()},
					   dataType:"JSON",
					   success:function (data) {
						    if (data!=null&&data!=""){
						    	var  type=data.type;
						    	if (type=='success'){
                                       alert("修改数据成功");
									window.location.href="${pageContext.request.contextPath}/admin/doctor/findDoctorInfoById";
								} else if(type=='fail'){
						    		alert("修改失败");
								}else if (type=='error'){
						    		 alert("传递数据出现错误");
								}
							}
					   },error:function (data) {
						   alert("修改医生个人信息响应数据失败");
					   }

				   });
				});


			});


		});
	</script>
</html>



