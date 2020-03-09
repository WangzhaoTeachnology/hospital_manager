var aim_div="";//目标div 放置日历的位置
var m=0;//使用标识,之前页面记录的几列
var n=0;//使用标识,根据页面宽度决定日历分为几列
var language="cn";//语言选择
var month_arry;
var week_arry;
var month_cn=new Array("一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月");//月
var month_en=new Array("January","February","March","April","May","June","July","August","September","October","November","December");//月
var week_cn=new Array("日","一","二","三","四","五","六");//星期
var week_en=new Array("Su","Mo","Tu","We","Th","Fr","Sa");//星期

function loading_calendar(id,lan){
	aim_div="#"+id;
	language=lan;
	if(lan=="cn"){
		month_arry=month_cn;
		week_arry=week_cn;
		//alert("week_arry="+week_arry);
	}else{
		month_arry=month_en;
		week_arry=week_en;
	}
	//开始
	$(aim_div).fullYearPicker({
		disabledDay : '',
		value : [ /* '2016-6-25', '2016-8-26'  */],
		cellClick : function(dateStr, isDisabled) {
			/* console.log("单击日期:"+dateStr); */
			//alert("dateStr="+dateStr);
			/* arguments[0] */
		}
	});	
}





(function() {
	window.onload=function(){

    /*  alert("$(\".fullYearPicker .picker .month-container table  tbody tr td\")"+$(".fullYearPicker .picker .month-container table  tbody tr td").length);
		$(".fullYearPicker .picker .month-container table  tbody tr td").each(function(index,element){

		});*/

    var  value=null;

		$("select[name='role_category']").change(function () {
			var id = $(this).find("option:selected").val();
			if (id!=null&&id!=""&&parseInt(id)!=0){
				$.ajax({
					type:"GET",
					data:{"id":id},
					dataType:"JSON",
					url:"/admin/user/findUsersByCategory",
					success:function (data) {
						if (data!=null&&data!=""){
							var type=data.type;
							if (type=='success'){
								$("#menuls").html("");
								if (parseInt(id)==1){
									var admin=data.admins;
									if (admin!=null&&admin!=""){
										for (var i=0;i<admin.length;i++){
											var   content="\t<input  type=\"hidden\" value='"+admin[i].id+"' name='"+admin[i].name+"' />\n" +
												"\t\t\t\t\t\t\t\t\t\t<li>\n" +
												"\t\t\t\t\t\t\t\t\t\t<a href=\"#\">"+admin[i].name+"</a>\n" +
												"\t\t\t\t\t\t\t\t\t\t</li>";
											$("#menuls").append(content);
										}

									}
								} else if (parseInt(id)==2){
									var users=data.users;
									if (users!=null&&users!=""){
										for (var i=0;i<users.length;i++){
											var content="\t<input  type=\"hidden\" value='"+users[i].id+"' name='"+users[i].name+"' />\n" +
												"\t\t\t\t\t\t\t\t\t\t<li>\n" +
												"\t\t\t\t\t\t\t\t\t\t<a href=\"#\">"+users[i].name+"</a>\n" +
												"\t\t\t\t\t\t\t\t\t\t</li>";
											$("#menuls").append(content);
										}

									}
								} else  if (parseInt(id)==3){
									var doctors=data.doctors;
									if (doctors!=null&&doctors!=""){
										for (var i=0;i<doctors.length;i++){
											var content="\t<input  type=\"hidden\" value='"+doctors[i].id+"' name='"+doctors[i].name+"' />\n" +
												"\t\t\t\t\t\t\t\t\t\t<li>\n" +
												"\t\t\t\t\t\t\t\t\t\t<a href=\"#\">"+doctors[i].name+"</a>\n" +
												"\t\t\t\t\t\t\t\t\t\t</li>";
											$("#menuls").append(content);
										}
									}
								}
								//这个是下拉列表的获取具体的用户的名字
								$("#menuls li").click(function () {
									value=$(this).text().trim();
									if (value!=null&&value!=""){
										//  alert(value);
										$("#searchvalue").val(value);          //这个填充的该用户的姓名
										$("input[name='username']").val(value);//填充到添加的表单里面
									}
								});
							} else if (type='fail'){
								alert("响应用户失败");
							}
						}
					}
				})
			}
		});

		$(".fullYearPicker .picker .month-container table  tbody tr td").each(function (i,e) {
			var  dest;var id;
			//这个是利用each循环给所有的标签全部都绑定了mouseover事件
			//但是只有有input标签的td标签，才会触发ajax查询数据的操作
			$(this).mouseover(function () {
				if ($(this).find("input").length>0){
					 id= $(this).find("input:eq(0)").val();
					//alert("有input标签"+id);
					dest=$(this).children("input:eq(0)");
					//alert("dest"+dest);
					$(this).children("input:eq(0)").attr("data-toggle","modal").attr("data-target","#exampleModal").attr("type","button");
					//加上按钮的属性为了，触发这个函数的，
					$(this).children("input:eq(0)").trigger("click");
					dest.click(function () {
						$("#maininfo").html("");
						//alert("trigger  _click");
						$.ajax({
							type:"GET",
							url:"/admin/user/findUserWorkInfoById",
							data:{"id":id},
							dataType:"JSON",
							success:function (data) {
								if (data!=null&&data!=""){
									//<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>
									var  work=data.work;
									var user=data.user;
									var  info;

									info="\t\t<div class=\"modal-content\">\n" +
										"\t\t\t\t\t<div class=\"modal-header\">\n" +
										"\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\" id='close'>&times;</span></button>\n" +
										"\t\t\t\t\t\t<h4 class=\"modal-title\" id=\"exampleModalLabel\">工作表详细信息</h4>\n" +
										"\t\t\t\t\t</div>\n" +
										"\t\t\t\t\t<div class=\"modal-body\">\n" +
										"\t\t\t\t\t\t<form>\n" +
										"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
										"\t\t\t\t\t\t\t\t<label for=\"recipient-name\" class=\"control-label\">姓名:</label>\n" +
										"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\"  readonly='readonly'  name='username' value="+user.name+" id=\"recipient-name\">\n" +
										"\t\t\t\t\t\t\t</div>\n" +
										"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
										"\t\t\t\t\t\t\t\t<label for=\"morningtime\" class=\"control-label\">上午:</label>\n" +
										"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\"  readonly='readonly' name='morning' value="+work.morning+" id=\"morningtime\">\n" +
										"\t\t\t\t\t\t\t</div>\n" +
										"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
										"\t\t\t\t\t\t\t\t<label for=\"afternoontime\" class=\"control-label\">下午:</label>\n" +
										"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\"  readonly='readonly'  name='afternoon' value="+work.afternoon+" id=\"afternoontime\">\n" +
										"\t\t\t\t\t\t\t</div>\n" +
										"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
										"\t\t\t\t\t\t\t\t<label for=\"addressinfo\" class=\"control-label\">地点:</label>\n" +
										"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name='address' value="+work.address+" id=\"addressinfo\">\n" +
										"\t\t\t\t\t\t\t</div>\n" +
										"\t\t\t\t\t\t</form>\n" +
										"\t\t\t\t\t</div>\n" +
										"\t\t\t\t\t<div class=\"modal-footer\">\n" +
										  " \t\t\t\t\t<button type=\"button\" class=\"btn btn-primary\"  value='"+work.id+"' id='edit'> 编辑</button>"+
										"\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\"  value='"+work.id+"' data-dismiss=\"+modal\" id='delete'>删除</button>\n" +
										"\t\t\t\t\t</div>\n" +
										"\t\t\t\t</div>";
									$("#maininfo").html(info);
									$(this).children("input:eq(0)").removeAttr("data-toggle","modal").removeAttr("data-target","#exampleModal").removeAttr("type","button");
									//$(this).children("input:eq(0)").removeAttr("data-toggle","modal").removeAttr("data-target","#exampleModal");

									$("#edit").click(function () {
										var id=$(this).val();
										if (id!=null&&id!=""){
                                           // var  username=$("input[name='username']").val();
                                           // var  morning=$("input[name='morning']").val();
											//var  afternoon=$("input[name='afternoon']").val();
											var  address=$("input[name='address']").val();
											$.ajax({
												type:"GET",
												url:"/admin/user/editWorkInfoById",
												data:{"id":id,"address":address},
												dataTypa:"JSON",
												success:function (data) {
													if(data!=null&&data!=""){
														var  type=data.type;
														if (type=='success'){
															alert("编辑成功");
															//window.location.href="/admin/user/";
														}else if (type=='fail'){
															alert("编辑失败");
														}
													}
												},error:function (data) {
													alert("修改工作信息失败!");
												}
											});
										}
									});
									$("#delete").click(function () {
										var id=$(this).val();
										if (id!=null&&id!=""){
											$.ajax({
												type:"GET",
												data:{"id":id},
												dataType:"JSON",
												url:"/admin/user/deleteWorkInfoById",
												success:function (data) {
													if (data!=null&&data!=""){
														var  type=data.type;
														if (type=='success'){
															alert("删除成功");
															$("#close").trigger("click");
															$("input[name='search']").trigger("click");

														}
													}
												}
											});
										}
									});

								}
							},error:function (data) {
								alert("响应数据失败");
							}
						});
					});
				}
			});






		/*	if (dest!=null&&dest!="") {
				dest.click(function () {
					alert("trigger  _click");
					$.ajax({
						type:"GET",
						url:"/admin/user/findUserWorkInfoById",
						data:{"id":id},
						dataType:"JSON",
						success:function (data) {
							if (data!=null&&data!=""){
								//<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>
								var  work=data.work;
								var  info;
								info="\t\t<div class=\"modal-content\">\n" +
									"\t\t\t\t\t<div class=\"modal-header\">\n" +
									"\t\t\t\t\t\t<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>\n" +
									"\t\t\t\t\t\t<h4 class=\"modal-title\" id=\"exampleModalLabel\">New message</h4>\n" +
									"\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t<div class=\"modal-body\">\n" +
									"\t\t\t\t\t\t<form>\n" +
									"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
									"\t\t\t\t\t\t\t\t<label for=\"recipient-name\" class=\"control-label\">姓名:</label>\n" +
									"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" value="+work.user.username+" id=\"recipient-name\">\n" +
									"\t\t\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
									"\t\t\t\t\t\t\t\t<label for=\"morningtime\" class=\"control-label\">上午:</label>\n" +
									"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" value="+work.morning+" id=\"morningtime\">\n" +
									"\t\t\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
									"\t\t\t\t\t\t\t\t<label for=\"afternoontime\" class=\"control-label\">下午:</label>\n" +
									"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" value="+work.afternoon+" id=\"afternoontime\">\n" +
									"\t\t\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t\t\t<div class=\"form-group\">\n" +
									"\t\t\t\t\t\t\t\t<label for=\"addressinfo\" class=\"control-label\">地点:</label>\n" +
									"\t\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" value="+work.address+" id=\"addressinfo\">\n" +
									"\t\t\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t\t</form>\n" +
									"\t\t\t\t\t</div>\n" +
									"\t\t\t\t\t<div class=\"modal-footer\">\n" +
									"\t\t\t\t\t\t<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n" +
									"\t\t\t\t\t</div>\n" +
									"\t\t\t\t</div>";
								$("#maininfo").html(info);

							}
						},error:function (data) {
							alert("响应数据失败");
						}
					});
				});
			}*/
		});


		  window.onresize = change;  
		  change();
		  var m_type=$("#hd-type-option").val();//设置高亮显示的样式
		  //alert("m_type="+m_type);
		 // select_month(1,1,1,m_type); //设置月份
		  //select_month(6,1,1,m_type);
		//  setYearMenu(2020);   //设置年份


		//这个是下拉列表的获取具体的用户的名字
	/*	$("#menuls li").click(function () {
			value=$(this).text().trim();
			if (value!=null&&value!=""){
				//  alert(value);
				$("#searchvalue").val(value);          //这个填充的该用户的姓名
				$("input[name='username']").val(value);//填充到添加的表单里面
			}
		});*/


		//加上一个定时器，如果有人清除这个搜素框里面的数据，
		// 那么这个username的input文本框里面的数据也要清除
		setInterval(function () {
			var value_search = $("#searchvalue").val();
			if (value_search==null||value_search==""){
				$("input[name='username']").val("");
			}
		},1);

		$("input[name='search']").click(function () {
			//alert("$(\".fullYearPicker .picker .month-container .selected\")"+$(".fullYearPicker .picker .month-container .selected").length);
			//$(".fullYearPicker .picker .month-container .selected").removeClass("selected");
			//$(".month-container .selected").removeClass("selected");

			//这个是清除掉选中的样式
			var obj=  $(".fullYearPicker .picker  .month-container .workday");
		//	alert("obj="+obj);
			if(obj!=null){
				obj.removeClass("workday");
			}


			var id=$("input[name="+value+"]").val();//这个是得到该用户的id
			//alert("id="+id);
			var value_search = $("#searchvalue").val();
			//alert("value_search="+value_search);
			if (value_search==null||value_search==""){
				alert("搜素框不能为空");
				return;
			}
			//alert("id="+id);

			//虽然把数据，也就是用户名字，存放到搜索框里面，但是这个
			//搜索的内容，仍然按照这个id作为条件，查询的

			if (id!=null&&id!=""){
				$.ajax({
					type:"POST",
					url:"/admin/user/searchUserWorkInfoById",
					data:{"id":id},
					dataType:"JSON",
					success:function (data) {
						if (data!=null&&data!=""){
							var  work=data.info;
							/*
							思路：
							因为在jsp页面上，添加工作表的时间的时候，是点击一个日期，或者拖拽式，选择一个日期的范围
							然后点击添加到后台的数据库里面
							读取数据的时候，是从后台读取数据，有几条数据，那么读取几条
							最终显示是按照循环的方式，将读取数据高亮显示在页面上，所以这种方式
							在插入添加数据的时候：
							1：可以避免添加重复的数据
							2：将读取数据高亮显示在页面上的时候，可以不用将结束时间减开始时间，而是利用
							循环的方式，将固定的日期高亮显示在页面上*/

							if (work!=null&&work!=""){     //这样做的可以在work为数据的时候，这个work.length;不会报错！
								//alert("length="+work.length);
								//alert(work);
								for (var i=0;i<work.length;i++){
									var  id=work[i].id;
									console.log("id="+id);
									var  startime=work[i].startime;
									var strings = startime.split("-");
									console.log(strings);
								//	console.log(strings[0]+"_"+strings[1]+"_"+strings[2]);
									var start_month=parseInt(strings[1]);
									console.log("start_month="+start_month);
									var  start_day=parseInt(strings[2]);
									console.log("start_day="+start_day);
									var  endtime=work[i].endtime;
									var strings1 = endtime.split("-");
									var  end_month=parseInt(strings1[1]);
									var end_day=parseInt(strings1[2]);
									console.log("end_day="+end_day);
								//	select_month(start_month,start_day,end_day,m_type);
								//	select_monthById
									console.log("m_type="+m_type);
									select_monthById(start_month,start_day,end_day,m_type,id);
								}

								var picker = $(".fullYearPicker .picker  .month-container .workday");
								//alert("picker="+picker);
								var index = picker[0].work;
								//alert("index="+index);
								//alert("picker.length="+picker.length);
								//alert($(".fullYearPicker .picker  .month-container .workday").length);
							//	alert("$(\".fullYearPicker .picker .month-container .workday\")="+$(".fullYearPicker .picker .month-container .workday").length);
							   //alert("\t$(\".fullYearPicker .picker .month-container table  tbody tr td workday\")="+$(".fullYearPicker .picker .month-container table  tbody tr  .workday").length);

							}
						}
					}
				});
			}
		});

		/*$(".fullYearPicker .picker .month-container table  tbody tr td workday")
		$(".fullYearPicker .picker .month-container .workday").mouseover(function () {
			alert("shangqu1");
		});
*/


		//因为点击二级菜单的时候，没有办法将查询的数据，返回显示在js里面，
		//但是我们可以然后这个初始化的函数，调用一个ajax函数，让其自动的返回数据，然后把这个数据，遍历select_month，函数，显示在页面上
/*
		var id=$("input[name="+value+"]").val();
		$.ajax({
             type:"GET",
             url:"/admin/user/requestloadUserWorkInfo",
             dataType:"JSON",
			 data:{"id":4},
             success:function (data) {
                    if (data!=null&&data!=""){
                          var  info=data.info;
                          alert(info.id);
                          for (var i=0;i<info.length;i++){
                                 alert(info[i].id);
                        }
                    }
             },error:function (data) {
                 alert("响应数据失败");
             }
         });
*/


		/*窗口添加按钮*/
		$("#calendar_confirm_btn").click(function(){

			//var start_date=$("#hd-start-date").val();
			//start_date=start_date.split("-")[1]+"-"+start_date.split("-")[2];
			//var end_date=$("#hd-end-date").val();
			//end_date=end_date.split("-")[1]+"-"+end_date.split("-")[2];
			//alert(start_date+end_date);
			var m_type=$("#hd-type-option").val();
			/*drap_select(start_date,end_date,"workday");*/
			//	drap_select(start_date,end_date,m_type);
			//console.log("start_date="+start_date);
			//console.log("end_date="+end_date);
			var startime=$("input[name='startime']").val();
			var endtime=$("input[name='endtime']").val();
			var  monrning=$("#morning").val();
			var  afternoon=$("#afternoon").val();

			//这个是判断你有没有选择这个下拉列表框，如果你选择了，会自动将数据填充到搜索框和添加弹跳出来的文本框
			var  username=$("input[name='username']").val();
			var  address=$("#address").val();
			var user_id=$("input[name="+value+"]").val();
			//console.log("user_id="+user_id);
			//console.log("morning="+monrning+"afternoon="+afternoon+"username="+username);
			if (username==null|| username==""){
				alert("请你选择数据到搜索框里面");
				return;
			}
			if (address==""||address==null){
				alert("请填写工作地点");
				return;
			}
			$.ajax({
				type:"GET",
				url:"/admin/user/addUserWorkInfo",
				data:{"user_id":user_id,"startime":startime,"endtime":endtime,"morning":monrning,"afternoon":afternoon,"address":address},
				dataType:"JSON",
				success:function (data) {
					if (data!=null&&data!=""){
						alert("添加数据成功");
						$("input[name='search']").trigger("click");
					}
				},error:function (data) {
					alert("响应数据失败");
				}
			});
			close_modal();
		});


	} ;
	
	function change(){
		var obj=$(aim_div);
		var m_obj=$(".fullYearPicker .month-container");
		var width=obj.width();
		var class_width="month-width-";
		n=parseInt(width/200);
		if(n==5)n=4;
		if(n>6)n=6;

		if(n!=m){
			m_obj.removeClass(class_width+m);
			m_obj.addClass(class_width+n);
			m=n;
		}
	};

	function changeHandle(){
		m=0;
		change();
		
	}
	
	//设置年份菜单
	function setYearMenu(year){
		$(".year .left_first_year").text(year-1+"");
		$(".year .left_sencond_year").text(year-2+"");
		$(".year .cen_year").text(year);
		$(".year .right_first_year").text(year+1+"");
		$(".year .right_sencond_year").text(year+2+"");
	}
	
	
	//设置开始日期和结束日期
	function setDateInfo(start_date,end_date){
		$("#hd-start-date").datepicker('setValue', start_date);
		$("#hd-end-date").datepicker('setValue',end_date);
	}
	
	
	
	function tdClass(i, disabledDay, sameMonth, values, dateStr) {
		
		var cls = i == 0 || i == 6 ? 'weekend' : '';
		if (disabledDay && disabledDay.indexOf(i) != -1)
			cls += (cls ? ' ' : '') + 'disabled';
		if (!sameMonth){
			cls += (cls ? ' ' : '') + 'empty';
		}else{
			cls += (cls ? ' ' : '') + 'able_day';
		}
		if (sameMonth && values && cls.indexOf('disabled') == -1
				&& values.indexOf(',' + dateStr + ',') != -1)
			cls += (cls ? ' ' : '') + 'selected';
		return cls == '' ? '' : ' class="' + cls + '"';
	}
	function renderMonth(year, month, clear, disabledDay, values) {
		
		var d = new Date(year, month - 1, 1), s = "<div class='month-container'>"+'<table cellpadding="3" cellspacing="1" border="0"'
				+ (clear ? ' class="right"' : '')
				+ '>'
				+ '<tr><th colspan="7" class="head"  index="'+month+'">' /* + year + '年'  */
				+month_arry[month-1] 
				+ '</th></tr>'
				+ '<tr><th class="weekend">'+week_arry[0]+'</th><th>'+week_arry[1]+'</th><th>'+week_arry[2]+'</th><th>'+week_arry[3]+'</th><th>'+week_arry[4]+'</th><th>'+week_arry[5]+'</th><th class="weekend">'+week_arry[6]+'</th></tr>';
		var dMonth = month - 1;
		var firstDay = d.getDay(), hit = false;
		s += '<tr>';
		for (var i = 0; i < 7; i++)
			if (firstDay == i || hit) {
				s += '<td'
						+ tdClass(i, disabledDay, true, values, year
								+ '-' + month + '-' + d.getDate())
						+ '>' + d.getDate() + '</td>';
				d.setDate(d.getDate() + 1);
				hit = true;
			} else
				s += '<td' + tdClass(i, disabledDay, false)
						+ '>&nbsp;</td>';
		s += '</tr>';
		for (var i = 0; i < 5; i++) {
			s += '<tr>';
			for (var j = 0; j < 7; j++) {
				s += '<td'
						+ tdClass(j, disabledDay,
								d.getMonth() == dMonth, values, year
										+ '-' + month + '-'
										+ d.getDate())
						+ '>'
						+ (d.getMonth() == dMonth ? d.getDate()
								: '&nbsp;') + '</td>';
				d.setDate(d.getDate() + 1);
			}
			s += '</tr>';
		}
		return s + '</table></div>' + (clear ? '<br>' : '');
	}
	function getDateStr(td) {
		//console.log("----"+td.parentNode.parentNode.rows[0].cells[0].getAttribute('index')+"-"+ td.innerHTML);
		return td.parentNode.parentNode.rows[0].cells[0].getAttribute('work.jsp')+"-"+ td.innerHTML;
	}
	function renderYear(year, el, disabledDay, value) {
		
		el.find('td').unbind();
		var s = '', values = ',' + value.join(',') + ',';
		for (var i = 1; i <= 12; i++)
			s += renderMonth(year, i, false, disabledDay, values);
			s+="<div class='date_clear'></div>";
		el
				.find('div.picker')
				.html(s)
				.find('td')
				.click(/*单击日期单元格*/
						/* 
						function() {
							if (!/disabled|empty/g.test(this.className))
								$(this).toggleClass('selected');
							if (this.className.indexOf('empty') == -1
									&& typeof el.data('config').cellClick == 'function')
								el
										.data('config')
										.cellClick(
												getDateStr(this),
												this.className
														.indexOf('disabled') != -1);
						} */);
		changeHandle();
		day_drap_listen();
	}
	//监听日期拖在
	function day_drap_listen(){
		var is_drap=0;
		var start_date="";
		var end_date="";
		$(".fullYearPicker .picker table td").mousedown(function(event){
			/*判断是左键才触发  */
			if(event.button==0&&($(this).html()!="&nbsp;")){
				is_drap=1;
				start_date=getDateStr($(this)[0]);
				/*console.log("开始值:"+start_date); */
			}

		});
		$(".fullYearPicker .picker table td").mouseup(function(event){
			/*判断是左键才触发  */
			if(event.button==0&&($(this).html()!="&nbsp;")){
				is_drap=0;
				end_date=getDateStr($(this)[0]);
				/* console.log("结束值:"+end_date); */
				if(checkDate(start_date, end_date)){
					open_modal(start_date, end_date);
				}else{
					open_modal(end_date, start_date);
				}
			}
			
			
		});
		$(".fullYearPicker .picker table td").mouseover(function(){
			var day=$(this).html();
			if(is_drap==1&&day!="&nbsp;"){
				var min_date=getDateStr($(this)[0]);
				drap_select(start_date,min_date,"selected");
				/*console.log("拖拽中:"+min_date); */
			}
		});
	}
	/*根据日期判断大小 开始值小于结束值返回true  */
	function checkDate(start, end){
		var rs=false;
		var start_month=parseInt(start.split("-")[0]);
		var start_day=parseInt(start.split("-")[1]);
		var end_month=parseInt(end.split("-")[0]);
		var end_day=parseInt(end.split("-")[1]);
		if(start_month==end_month){
			if(start_day<end_day){
				rs=true;
			}
		}else if(start_month<end_month){
			rs=true;
		}
		return rs;
	}
/*	/!*窗口添加按钮*!/
	$("#calendar_confirm_btn").click(function(){

		//var start_date=$("#hd-start-date").val();
		//start_date=start_date.split("-")[1]+"-"+start_date.split("-")[2];
		//var end_date=$("#hd-end-date").val();
		//end_date=end_date.split("-")[1]+"-"+end_date.split("-")[2];
		//alert(start_date+end_date);
		var m_type=$("#hd-type-option").val();
		/!*drap_select(start_date,end_date,"workday");*!/
	//	drap_select(start_date,end_date,m_type);
		console.log("start_date="+start_date);
		console.log("end_date="+end_date);
		var startime=$("input[name='startime']").val();
		var endtime=$("input[name='endtime']").val();
		var  monrning=$("#morning").val();
		var  afternoon=$("#afternoon").val();
		var  username=$("#username").val();
		var  address=$("#address").val();
		var search = $("#searchvalue").val();
		console.log("morning="+monrning+"afternoon="+afternoon+"username="+username);
		if (search==null||search!=""){
			alert("请你选择数据到搜索框里面");
			return;
		}
        if (address==""||address==null){
        	alert("请填写工作地点");
        	return;
		}

		$.ajax({
           type:"GET",
			url:"/admin/user/addUserWorkInfo",
			data:{"username":username,"startime":startime,"endtime":endtime,"morning":monrning,"afternoon":afternoon,"address":address},
			dataType:"JSON",
			success:function (data) {
				if (data!=null&&data!=""){
					alert("添加数据成功");
				}
			},error:function (data) {
				alert("响应数据失败");
			}
		});


		close_modal();
	});*/
	
	/*拖拽选着  */
	function drap_select(start,end,new_class){
		
		//alert("stsart="+start);//01-01
		//alert("ends="+end);//01-01
		//alert("new_class="+new_class);
		var max=60;//当天数要选择到最后一天取一个大于所以月份的值
		/* console.log("选择:"+start+","+end); */
		//清除选中单元格的样式
		$(".month-container .selected").removeClass("selected");
		var start_month=parseInt(start.split("-")[0]);
		var start_day=parseInt(start.split("-")[1]);
		var end_month=parseInt(end.split("-")[0]);
		var end_day=parseInt(end.split("-")[1]);
		/* console.log("start_month:"+start_month);
		console.log("start_day:"+start_day);
		console.log("end_month:"+end_month);
		console.log("end_day:"+end_day); */
		if(start_month==end_month){
			if(start_day<end_day){
				select_month(start_month, start_day, end_day,new_class);
			}else{
				select_month(start_month, end_day, start_day,new_class);
			}
		}else if(start_month<end_month){
			select_month(start_month, start_day, max,new_class);
			for(var i=start_month+1;i<end_month;i++){
				select_month(i, 1, max,new_class);
			}
			select_month(end_month, 1, end_day,new_class);
		}else if(start_month>end_month){
			select_month(start_month, 1, start_day,new_class);
			for(var i=end_month+1;i<start_month;i++){
				select_month(i, 1, max,new_class);
			}
			select_month(end_month, end_day, max,new_class);
		}
		
	}



	/*按月加载样式*/
	function select_monthById(month,start,end,new_class,id){

		//alert("month="+month);//这个是月份的参数
		//alert("start="+start);//这个是点击开始的该月的初始化的日期
		//alert("end="+end);//这个是结束化的日期
		//alert("newclass="+new_class);//这个样式

		month=month-1;
		//alert("month="+month);
		$(".fullYearPicker .picker .month-container:eq("+month+") td").each(function(){
			var num=$(this).text();
			//如果这个选择的日期，的开始时间与结束时间，与
			//该月的所有的日期比价，将在选择的开始日期和结束日期之中范围的日期
			//置为高亮显示
			if(num>=start&&num<=end){
				/* $(this).addClass("selected"); */
				//这个是选中的高亮显示

				//alert("num="+num);
				$(this).addClass(new_class);
				//alert($(this));
				$(this).append("<input hidden='type' value="+id+"  />");
			}
		});
	}
	/*按月加载样式*/
	function select_month(month,start,end,new_class){
		
		  //alert("month="+month);//这个是月份的参数
		  //alert("start="+start);//这个是点击开始的该月的初始化的日期
		  //alert("end="+end);//这个是结束化的日期
		//alert("newclass="+new_class);//这个样式

		month=month-1;
		//alert("month="+month);
		$(".fullYearPicker .picker .month-container:eq("+month+") td").each(function(){
			var num=$(this).text();
			//如果这个选择的日期，的开始时间与结束时间，与
			//该月的所有的日期比价，将在选择的开始日期和结束日期之中范围的日期
			//置为高亮显示
			if(num>=start&&num<=end){   
				/* $(this).addClass("selected"); */
				//这个是选中的高亮显示
		
				//alert("num="+num);
				$(this).addClass(new_class);
			}
		});
	}
	
	function open_modal(start_date,end_date){
		var year=$("#cen_year").text();
		start_date=year+"-"+start_date;
		end_date=year+"-"+end_date;
		if(start_date!=null){
			setDateInfo(start_date,end_date);
		}
		
		$("#calendar-modal-1").modal();
		$(".month-container .selected").removeClass("selected");
	}
	
	//@config：配置，具体配置项目看下面
	//@param：为方法时需要传递的参数
	$.fn.fullYearPicker = function(config, param) {
		if (config === 'setDisabledDay' || config === 'setYear'
				|| config === 'getSelected'
				|| config === 'acceptChange') {//方法
			var me = $(this);
			if (config == 'setYear') {//重置年份
				me.data('config').year = param;//更新缓存数据年份
				me.find('div.year a:first').trigger('click', true);
			} else if (config == 'getSelected') {//获取当前当前年份选中的日期集合（注意不更新默认传入的值，要更新值请调用acceptChange方法）
				return me.find('td.selected').map(function() {
					return getDateStr(this);
				}).get();
			} else if (config == 'acceptChange') {//更新日历值，这样才会保存选中的值，更换其他年份后，再切换到当前年份才会自动选中上一次选中的值
				
				//alert(me.data('config'));
				//console.log("me.data('config')="+me.data('config'));
				me.data('config').value = me
						.fullYearPicker('getSelected');
			} else {
				me.find('td.disabled').removeClass('disabled');
				me.data('config').disabledDay = param;//更新不可点击星期
				if (param) {
					me
							.find('table tr:gt(1)')
							.find('td')
							.each(
									function() {
										if (param
												.indexOf(this.cellIndex) != -1)
											this.className = (this.className || '')
													.replace(
															'selected',
															'')
													+ (this.className ? ' '
															: '')
													+ 'disabled';
									});
				}
			}
			return this;
		}
		//@year:显示的年份
		//@disabledDay:不允许选择的星期列，注意星期日是0，其他一样
		//@cellClick:单元格点击事件（可缺省）。事件有2个参数，第一个@dateStr：日期字符串，格式“年-月-日”，第二个@isDisabled，此单元格是否允许点击
		//@value:选中的值，注意为数组字符串，格式如['2016-6-25','2016-8-26'.......]
		config = $.extend({
			year : new Date().getFullYear(),
			disabledDay : '',
			value : []
		}, config);
		return this
				.addClass('fullYearPicker')
				.each(
						function() {
							var me = $(this), year = config.year|| new Date().getFullYear(), newConifg = {
								cellClick : config.cellClick,
								disabledDay : config.disabledDay,
								year : year,
								value : config.value
							};
							me.data('config', newConifg);
							
							me.append('<div class="year">'
													+'<table>'
													+'<th class="year-operation-btn"><a href="#"  class="am-icon-chevron-left"></a></th>'
													+'<th class="left_sencond_year year_btn">'+ ''+'</th>'
													+'<th class="left_first_year year_btn">'+ ''+'</th>'
													+'<th id="cen_year" class="cen_year year_btn">'+ year+'</th>'
													+'<th class="right_first_year year_btn">'+ ''+'</th>'
													+'<th class="right_sencond_year year_btn">'+ ''+'</th>'
													+'<th class="year-operation-btn"><a href="#" class="next am-icon-chevron-right"></a></th>'
													+'</table>'
													+'<div class="stone"></div></div><div class="picker"></div>')
									.find('.year-operation-btn')
									.click(
											function(e, setYear) {
												if (setYear)
													year = me.data('config').year;
												else
													$(this).children("a").attr("class")== 'am-icon-chevron-left' ? year--: year++;
												setYearMenu(year);
												renderYear(
														year,
														$(this).closest('div.fullYearPicker'),
														newConifg.disabledDay,
														newConifg.value);
												document.getElementById("cen_year").firstChild.data=year;
												return false;
											});
							setYearMenu(year);
							
							//年份选择
							$(".year .year_btn").click(function(){
								var class_name=$(this).attr("class");
								if(class_name.indexOf("cen_year")<0){
									var year=parseInt($(this).text());
									setYearMenu(year);
									renderYear(year, me, newConifg.disabledDay,newConifg.value);
								}
							});
							renderYear(year, me, newConifg.disabledDay,
									newConifg.value);
							
						});
	};
})();


function close_modal(){
	$("#calendar-modal-1").modal('close');
	
}


	