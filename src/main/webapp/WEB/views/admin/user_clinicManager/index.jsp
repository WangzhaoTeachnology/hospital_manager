<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="x-ua-compatible" content="IE=9" /> 
		<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/calendar/5e2922d339d9e/css/calendar.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/calendar/5e2922d339d9e/css/amazeui.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/calendar/5e2922d339d9e/css/timedropper.css">


		<!-- 引入Bootstrap核心样式文件 -->
		<link href="${pageContext.request.contextPath}/static/admin/boostrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css">
		<!-- 引入jQuery核心js文件 -->
		<script language="javascript" src="${pageContext.request.contextPath}/static/admin/boostrap/js/jquery-1.11.3.min.js"></script>
		<!-- 引入BootStrap核心js文件 -->
		<script src="${pageContext.request.contextPath}/static/admin/boostrap/js/bootstrap.min.js"></script>
	</head>

<body>
		<div class="row" style="padding-left: 310px;margin-top: 20px;">
			<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6" style="border: 0px solid  red;margin-left: -300px; ">
				<div class="input-group">
					<div class="input-group-btn">
						<button id="appear_btn" type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">姓名<span
								class="caret"></span></button>
						<ul class="dropdown-menu" id="menuls">
							<c:forEach items="${users}" var="user">
								<input  type="hidden" value="${user.id}" name="${user.name}"/>
								<li>
									<a href="#">${user.name}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<input type="text" placeholder="按照条件进行搜索" id="searchvalue"  value="" class="form-control" aria-label="...">
				</div>
			</div>
			<div class="col-lg-6 col-sm-6  col-md-6 col-xs-6">
				<input type="button"  name="search" width="60px" height="30px"
					   class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
			</div>
		</div>

		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
			<div class="modal-dialog" role="document" id="maininfo" style="width: 300px;height: 400px;">

			</div>
		</div>

		<div id="div1"></div>

		<!--录入信息口-->
		<div class="am-modal am-modal-no-btn  hd_info_modal" tabindex="-1" id="calendar-modal-1">
		  <div class="am-modal-dialog radius">
		    <div class="am-modal-hd">新增例外
		      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		    </div>
		    <div class="am-modal-bd">
		      <div class="am-margin-sm">
		      	<form action="" class="am-form am-form-inline" id="workform">
		      	  <div class="hd-work-type">
		      	  	<div class="hd-work-block">
			      	  	<label class="hd-type-label" >类型:</label>
			      	  	<div class="hd-type-select">
			      	  		<select data-am-selected class="am-u-sm-10" id="hd-type-option">
							  <option value="workday" selected>工作时间</option>
							  <option value="freeday" >非工作日</option>
							  <option value="lawday" >法定假日</option>
							  <option value="tradeday" >调休日</option>
							</select>
			      	  	</div>
		      	  	</div>
		      	  	<div class="stone">

					</div>
		      	  	
		      	  </div>

					<div class="stone" style="padding-left: 15px;">
						<div class="form-horizontal" style="border: 0px solid red;">
							<div class="form-group">
								<label class="hd-type-label ">姓名:</label>
								<div class="col-sm-6 col-lg-6 col-xs-6 col-md-6">
									<input type="text" name="username" class="form-control" readonly="readonly"  id="username" placeholder="" />
								</div>
							</div>

							<div class="form-group">
								<label class="hd-type-label ">上午:</label>
								<div class="col-sm-6 col-lg-6 col-xs-6 col-md-6">
									<input type="text" value="9:00-12:00" name="morning" class="form-control" readonly="readonly" id="morning" placeholder="9:00-12:00"/>
								</div>
							</div>

							<div class="form-group">
								<label class="hd-type-label ">下午:</label>
								<div class="col-sm-6 col-lg-6 col-xs-6 col-md-6">
									<input type="text"  value="13:00-17:00" name="afternoon" class="form-control" readonly="readonly" id="afternoon"  placeholder="13:00-17:00"/>
								</div>
							</div>


							<div class="form-group">
								<label class="hd-type-label ">地点:</label>
								<div class="col-sm-6 col-lg-6 col-xs-6 col-md-6">
									<input type="text" name="address" class="form-control" id="address" />
								</div>
							</div>

						</div>
					</div>

		      	 <div class="hd-work-date">
		      	 	  <div class="hd-work-block">
			      	 	  	<label for="hd-start-date" class="am-form-label">时间:</label>
					      	<div class="am-form-group am-form-icon">
				      	  		<i class="am-icon-calendar"></i>
						    	<input id="hd-start-date" type="text" class="am-form-field" name="startime" placeholder="开始日期"  data-am-datepicker readonly required>
							</div>
		      	 	  </div>
		      	  	  <div class="hd-work-block">
			      	  	  <label for="hd-end-date" class="am-form-label">至</label>
						  <div class="am-form-group am-form-icon">
						    <i class="am-icon-calendar"></i>
						    <input id="hd-end-date" type="text" class="am-form-field" name="endtime" placeholder="结束日期" data-am-datepicker readonly required>
						  </div>
		      	  	  </div>
		      	  	  
		      	  </div>
				  <div class="hd-work-btns">
				  	<button type="button" class="am-btn am-btn-secondary" id="calendar_confirm_btn">添加</button>
				  	<button type="button" class="am-btn am-btn-default" onClick="close_modal();">取消</button>
				  </div>
				  <div class="stone"></div>
				</form>
		      </div>
		    </div>
		  </div>
		</div>






	</body>
	<script src="${pageContext.request.contextPath}/static/calendar/5e2922d339d9e/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/static/calendar/5e2922d339d9e/js/amazeui.min.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/calendar/5e2922d339d9e/js/timedropper.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/calendar/5e2922d339d9e/js/calendar.js" charset="utf-8"></script>
	<script type="text/javascript">
			/*日历*/
			loading_calendar("div1","cn");

	</script>
</html>