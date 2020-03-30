<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>病历查询</title>
    <meta charset="utf-8">
    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>病历查询</title>
    <!-- 引入Bootstrap核心样式文件 -->
    <link href="${pageContext.request.contextPath}/static/admin/boostrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css">
    <!-- 引入jQuery核心js文件 -->
    <script language="javascript"
            src="${pageContext.request.contextPath}/static/admin/boostrap/js/jquery-1.11.3.min.js"></script>
    <!-- 引入BootStrap核心js文件 -->
    <script src="${pageContext.request.contextPath}/static/admin/boostrap/js/bootstrap.min.js"></script>

    <link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" language="JavaScript1.2"
            src="${pageContext.request.contextPath}/static/admin/js/stm31.js"></script>
    <script>
        function windowOpen(theURL, winName, features, width, hight, scrollbars, top, left) {
            var parameter = "top=" + top + ",left=" + left + ",width=" + width + ",height=" + hight;
            if (scrollbars == "no") {
                parameter += ",scrollbars=no";
            } else {
                parameter += ",scrollbars=yes";
            }
            window.open(theURL, winName, parameter);
        }
    </script>



    <script type="text/javascript">
        $(function () {
           $('#modal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        });
    </script>


</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="25" align="center" valign="bottom" class="td06">
                <table width="98%" border="0" cellspacing="3" cellpadding="0">
                    <tr>
                        <td width="15"><img src="${pageContext.request.contextPath}/static/admin/images/index_32.gif"
                                            width="9" height="9"></td>
                        <td valign="bottom" class="title">病历查询</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center">
                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="td_page">
                            <div class="row">
                                <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                                  <%--  <c:forEach items="${third}" var="third">
                                        <c:if test="${third.name=='添加' && third.status==1}">--%>
                                         <%--   <input data-toggle="modal" data-target="#exampleModalScrollable" type="button" id="add" name="add" class="btn btn-info" value="添加"/>--%>
                                  <%--      </c:if>
                                        <c:if test="${third.name=='编辑' && third.status==1}">--%>
                                            <input  data-toggle="modal"   type="button"   id= "update" name="update" class="btn btn-success" value="编辑"/>
                                      <%--  </c:if>
                                        <c:if test="${third.name=='删除' && third.status==1}">--%>
                                            <input type="button"  id="delete" name="delete" class="btn btn-primary" value="删除"/>
                                    <%--    </c:if>
                                    </c:forEach>--%>
                                </div>
                                <div class="col-lg-4 col-sm-4  col-md-4 col-xs-4" style="border: 0px solid  red;margin-left: -300px; ">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button id="appear_btn" type="button" class="btn btn-default dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">姓名 <span
                                                    class="caret"></span></button>
                                                <ul class="dropdown-menu" id="menuls">
                                                    <li><a href="#">姓名</a></li>
                                                    <li><a href="#">编号</a></li>
                                                </ul>
                                        </div>
                                        <input type="text" placeholder="按照条件进行搜索" id="searchvalue" class="form-control" aria-label="...">
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-4  col-md-4 col-xs-4">
                                    <input type="button"  name="search" width="60px" height="30px"
                                           class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <br>

                <c:if test="${list!=null}">
                    <table class="table table-bordered" style="width: 1580px;">
                        <tr class="active" style="text-align: center;">
                            <td >
                                选择
                                <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                            </td>
                            <td >病历编号</td>
                            <td >病人姓名</td>
                            <td >病人诊断</td>
                            <td>医生姓名</td>
                            <td >日期时间</td>
                        </tr>

                        <c:forEach items="${list}" var="history">
                            <tr>
                                <td>
                                <span >
                                  <input name="checkbox" type="checkbox" value="${history.id}" >
                               </span>
                                </td>
                                <td >${history.id}</td>
                                <td >${history.patient.name}</td>
                                <td >${history.content}</td>
                                <td >${history.doctor.realname}</td>
                                <td >${history.datetime}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>

                <c:if test="${list==null}">
                    <table  border="0" cellpadding="2" cellspacing="0" style="margin: auto;">
                        <tr>
                            <td>
                                <img src="${pageContext.request.contextPath}/static/admin/images/timg.jpg" width="700px" height="700px"/>
                            </td>
                        </tr>
                    </table>
                </c:if>
            </td>
        </tr>
    </table>


    <!--分页 -->
    <div style="width: 380px; margin: 0 auto; margin-top: 50px;position: relative;">
        <ul class="pagination" style="text-align: center; margin-top: 10px;right: -496px;position: absolute;">
            <!-- 上一页 -->
            <c:if test="${pageBean.currentPage==1 }">
                <li class="disabled">
                    <a href="javascript:void(0);" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${pageBean.currentPage!=1 }">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${pageBean.currentPage-1}&&menuid=${menuid}&&search=${search}&&condition=${condition}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>


            <!-- 显示每一页 -->
            <c:forEach begin="1" end="${pageBean.totalPage}" var="page">
                <!-- 判断是否是当前页 -->
                <c:if test="${page==pageBean.currentPage}">
                    <li class="active"><a href="javascript:void(0);">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageBean.currentPage}">
                    <li><a href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${page}&&menuid=${menuid}&&search=${search}&&condition=${condition}">${page}</a></li>
                </c:if>
            </c:forEach>


            <!-- 下一页 -->
            <c:if test="${pageBean.currentPage==pageBean.totalPage }">
                <li class="disabled">
                    <a href="javascript:void(0);" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

            <c:if test="${pageBean.currentPage!=pageBean.totalPage }">
                <li>
                    <a href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${pageBean.currentPage+1}&&menuid=${menuid}&&search=${search}&&condition=${condition}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>

<%--    <c:if test="${list!=null}">
        <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
            <tr>
                <td height="30" align="right">
                    <a href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                        <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                    </a>

                    <c:if test="${page.currentPage==1}">
                        <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                        </a>
                        <c:choose>
                            <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                    <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                    <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:if>

                    <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                        <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                        </a>
                        <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                        </a>
                    </c:if>

                    <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                        <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                        </a>
                        <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                        </a>
                    </c:if>
                    <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                        <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                    </a>
                    　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                </td>
            </tr>
        </table>
    </c:if>--%>





    <!-- 点击添加按钮 -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document" id="addUserInfo">
            <form id="addform">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">添加挂号人员个人信息</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <input type="hidden" value="${menuid}" name="menuid"/>
                    </div>

                    <div class="modal-body" style="align-content: center;" id="bodymain">

                    </div>

                    <div class="modal-footer">
                        <button type="button"   class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button"  id="addbtn" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <!-- 点击编辑按钮 -->
    <div class="modal fade"  id="_updateexampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="update_exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document" >
            <form id="updateform">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update_exampleModalScrollableTitle">修改病历信息</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <input type="hidden" value="${menuid}" name="menuid"/>
                    </div>

                    <div class="modal-body" style="align-content: center;" id="updatemain">

                    </div>

                    <div class="modal-footer">
                        <button type="button"  class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button"  id="updatebtn" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</center>
</body>
<script type="text/javascript">
    $(function () {

        //只能选择一个的功能：
        var inputs = $("input[name='checkbox']");
         inputs.click(function () {
            if(this.checked || this.checked=='checked'){
                inputs.removeAttr("checked");
                //这里需注意jquery1.6以后必须用prop()方法
                //$(this).attr("checked",true);
                $(this).prop("checked", true);
            }
        });



        //双击输入框
        $("#searchvalue").dblclick(function () {
            var  menuid=$("#menuid").val();
            if (menuid!=null&&menuid!=""){
                window.location.href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?search="+search+"&&menuid="+menuid+"&&condition="+conditon;
            }
        });


        //获取下面的li里面的数据，而这个ul li这个标签自带下来列表，所以不用下拉下来的事件，
        //只要点击事件
        $("#menuls li").click(function () {
            var  value=$(this).text()+"<span class=\"caret\"></span>";
           // alert(value);
            if (value!=null&&value!=""){
                $("#appear_btn").html(value);
                var str="按照"+$(this).text()+"条件搜索";
                $("#searchvalue").attr("placeholder",str);
            }
        });


        //点击自动搜索按钮
        $("input[name='search']").click(function () {
            var  search=$("#searchvalue").val();
            var  conditon= $("#appear_btn").text();
            var  index=-1;
            var  menuid=$("#menuid").val();

            if (search!=null&&search!=""){
                window.location.href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory?search="+search+"&&menuid="+menuid+"&&condition="+conditon;
            }
        });

        //添加数据的按钮
       $("#add").click(function () {
             $.ajax({
                 type:"GET",
                 dataType:"JSON",
                 url:"${pageContext.request.contextPath}/admin/user/addBeforeFindUserInfo",
                 success:function (data) {
                     if (data!=null&&data!=""){
                         var  content="";
                         var  roles=data.roles;
                         var  departments=data.department;

                        // alert(roles+departments);
                         content+=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 100px;\">\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"username\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"username\" class=\"form-control\" id=\"username\" placeholder=\"姓名\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"name\" class=\"col-sm-2 control-label\">真实姓名</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"name\" class=\"form-control\" id=\"name\" placeholder=\"真实姓名\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"password\" class=\"col-sm-2 control-label\">密码</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"password\" class=\"form-control\" id=\"password\" placeholder=\"输入密码\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"birthday\" class=\"col-sm-2 control-label\">出生日期</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"date\" name=\"birthday\" class=\"form-control\" id=\"birthday\" >\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label  class=\"col-sm-2 control-label\">性别</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\" style=\"margin-left: -70px;\">\n" +
                             "                                <input type=\"radio\"  id=\"male\" name=\"sex\" value=\"0\"   checked=\"checked\">男\n" +
                             "                                <input type=\"radio\"  id=\"female\"  name=\"sex\"  value=\"1\" > 女\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"profession\" class=\"col-sm-2 control-label\">专业</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"profession\" class=\"form-control\" id=\"profession\" placeholder=\"输入专业信息\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"job\" class=\"col-sm-2 control-label\">职业</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"job\" class=\"form-control\" id=\"job\" placeholder=\"输入职业\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"school\" class=\"col-sm-2 control-label\">学校</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"school\" class=\"form-control\" id=\"school\" placeholder=\"输入学校的信息\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" ;
                                                            content+= "<input type='hidden'   class=\"form-control\" value='2' name='role' placeholder='挂号人员' /></div></div>";
                                                            content+="<div class=\"form-group\">\n" +
                                                                     "<label  class=\"col-sm-2 control-label\">部门</label>\n" +
                                                                     " <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                                                     " <select class=\"form-control\" name=\"department\">";
                                                                 for (var i=0;i<departments.length;i++){
                                                                     content+=" <option value="+departments[i].id+">"+departments[i].name+"</option>";
                                                                 }
                                                                 content+=" </select>\n" +
                                                                          "</div>\n" +
                                                                       " </div>\n" +
                                                                     "</div>";

                         $("#bodymain").html(content);
                     }
                 },error:function (data) {
                     var content= "<div class=\"form-group\">\n" +
                                      "<div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                         "<img src='${pageContext.request.contextPath}/static/admin/boostrap/images/timg.gif' width='100%' height='100%'>"+
                                      " </div>\n" +
                                    "</div>\n" ;
                     $("#bodymain").html(content);
                       alert("数据响应出现问题");
                 }
             });
       });


       //添加数据函数
        $("#addbtn").click(function () {

            $.ajax({
                 url:"${pageContext.request.contextPath}/admin/user/addUserInfo",
                 type:"GET",
                 data:$('#addform').serialize(),
                 dataType:"JSON",
                 success:function (data) {
                   if(data!=null&&data!=""){
                       var type=data.type;
                       var  menuid=data.menuid;
                       if (type=='success'){
                           alert("添加数据成功");
                           if (menuid!=null&&menuid!=""){
                               window.location.href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?menuid="+menuid;
                           }
                       } else if (type=='fail'){
                          alert("添加数据失败");
                       }
                   }
                },error:function (data) {
                     alert("数据响应失败");
                }
             });
        });

    });


    //删除数据的函数
    $("#delete").click(function () {
       var checkboxs=$("input[name='checkbox']:checked");//得到的数据都是选中的数据
        //var  menuid=$("input[name='menuid']").val();
        //alert(checkbox.length);
        if (checkboxs.length==0){
            alert("请你选择选项再删除信息");
            return;
        } else if(checkboxs.length>0){
            for (var i=0;i<checkboxs.length;i++){ //删除你选中所有的数据
                var id=checkboxs[i].value;
                if (id!=null&&id!=""){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/admin/doctor/deleteHistoryById",
                        type:"GET",
                        data:{"id":id},
                        dataType:"JSON",
                        success:function (data) {
                            var  type=data.type;

                            if (data!=null&&data!=""){
                                if (type=='success'){
                                    alert("删除成功");
                                    window.location.href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory";
                                 /*   if (menuid!=null&&menuid!=""){
                                        window.location.href="/admin/user/clinicUserInfo?menuid="+menuid;
                                    }*/
                                } else {
                                    alert("删除失败");
                                }
                            }
                        },error:function (data) {
                            alert("响应数据失败");
                        }
                    });
                }
            }
        }
    });

    //这个是自动触发函数，也就是数据回显函数
  $("#update").dblclick(function () {
        var checkboxs=$("input[name='checkbox']:checked");//得到的数据都是选中的数据
        var  menuid=$("input[name='menuid']").val();
        var uid=checkboxs[0].value;
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/admin/doctor/findHistoryById",
            data:{"id":uid},
            dataType:"JSON",
            success:function (data) {
                if (data!=null&&data!=""){

                    var person=data.history.patient;
                    var doctor=data.history.doctor;
                    var  history=data.history;
                    var  content=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 100px;\">\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"id\" class=\"col-sm-2 control-label\">病历编号</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\">\n" +
                        "                                <input type=\"text\" name=\"id\" class=\"form-control\" value="+ history.id +"  placeholder=\"病历编号\" readonly='readonly' />\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +

                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"content\" class=\"col-sm-2 control-label\">诊断内容:</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\">\n" +
                        "                                <textarea  type=\"text\" name=\"content\" class=\"form-control\" id=\"content\" style='height: 80px;' >"+history.content+"</textarea>"+
                        "                            </div>\n" +
                        "                        </div>\n" +

                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"realname\" class=\"col-sm-2 control-label\">医生姓名:</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\">\n" +
                        "                                <input type=\"text\" name=\"realname\" class=\"form-control\" id=\"realname\" value= "+ doctor.realname + "  readonly='readonly'>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +

                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"name\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\">\n" +
                        "                                <input type=\"text\" name=\"name\" class=\"form-control\" id=\"name\"  value= "+person.name +" readonly='readonly' >\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +

                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"sex\" class=\"col-sm-2 control-label\">性别</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\">\n" +
                        "                                <input type=\"text\" name=\"sex\" class=\"form-control\"  value= "+ person.sex + " id=\"sex\" readonly='readonly' >\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +

                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"telephone\" class=\"col-sm-2 control-label\">电话</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\">\n" +
                        "                                <input type=\"text\" name=\"telephone\" class=\"form-control\"  value= "+ person.telephone +" id=\"telephone\" readonly='readonly'>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +

                        "                        <div class=\"form-group\">\n" +
                        "                            <label  class=\"col-sm-2 control-label\">地址</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\" >\n" +
                        "                                <input type=\"text\" name=\"address\" class=\"form-control\"  value= "+ person.address +" id=\"address\" readonly='readonly'>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +

                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"work\" class=\"col-sm-2 control-label\">职业</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\">\n" +
                        "                                <input type=\"text\" name=\"work\" class=\"form-control\" value= "+ person.work + " id=\"work\" readonly='readonly'  placeholder=\"输入工作信息\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"datetime\" class=\"col-sm-2 control-label\">诊断时间:</label>\n" +
                        "                            <div class=\"col-sm-7 col-lg-7 col-xs-7 col-md-7\" >\n" +
                        "                                <input type=\"date\" name=\"datetime\" class=\"form-control\" id=\"datetime\" value= "+ history.datetime + " readonly='readonly' >\n" +
                        "                            </div>\n" +
                        "                        </div></div>" ;

                    $("#updatemain").html(content);
                    $("#update").removeAttr("data-target");

                }
            },error:function (data) {
                alert("响应数据失败");
            }
        });
    });


    //这个是手动点击触发的函数
    $("#update").click(function () {
        var checkboxs=$("input[name='checkbox']:checked");//得到的数据都是选中的数据
        if (checkboxs.length==0){
            alert("编辑之前请你选择一项数据");
            return;
        } else{
            $("#update").attr("data-target","#_updateexampleModalScrollable");
            $("#update").trigger("dblclick");
        }
    });


    //修改函数
    $("#updatebtn").click(function () {
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/admin/doctor/updateHistoryById",
            dataType:"JSON",
            data:$('#updateform').serialize(),
            success:function (data) {
                 if (data!=null&&data!=""){
                     var  type=data.type;
                     var menuid=data.menuid;
                     if (type == 'success'){
                         alert("修改数据成功");
                         window.location.href="${pageContext.request.contextPath}/admin/doctor/doctorsFindHistory";
                       /*  if (menuid!=null&&menuid!=""){
                             window.location.href="/admin/doctor/doctorsFindHistory?menuid="+menuid;
                         }*/
                     } else if (type == 'fail') {
                         alert("修改数据失败");
                     }
                 } 
            },error:function (data) {
                 alert("响应数据失败");
            }
        });
    });


</script>
</html>
