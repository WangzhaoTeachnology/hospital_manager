<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>门诊管理</title>
    <meta charset="utf-8">
    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

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
    <SCRIPT language=JavaScript type=text/JavaScript>
        function selectAllByChk(chk, checkbox) {
            var size = checkbox.length;
            if (size == null) {
                checkbox.checked = chk.checked;
            } else {
                for (var i = 0; i < checkbox.length; i++) {
                    checkbox[i].checked = chk.checked;
                    //这个是将所有的name=‘checkbox’，然后全选，把这个全选的状态赋值给每一个checkbox
                }
            }
        }

    </SCRIPT>


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
                        <td valign="bottom" class="title">门诊管理</td>
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
                                    <input data-toggle="modal" data-target="#exampleModalScrollable" type="button" id="add" name="add" class="btn btn-info" value="添加"/>
                                    <input  data-toggle="modal"   type="button"   id= "update" name="update" class="btn btn-success" value="编辑"/>
                                    <input type="button"  id="delete" name="delete" class="btn btn-primary" value="删除"/>
                               <%--     <c:forEach items="${third}" var="third">
                                        <c:if test="${third.name=='添加' && third.status==1}">
                                            <input data-toggle="modal" data-target="#exampleModalScrollable" type="button" id="add" name="add" class="btn btn-info" value="添加"/>
                                        </c:if>
                                        <c:if test="${third.name=='编辑' && third.status==1}">
                                            <input  data-toggle="modal"   type="button"   id= "update" name="update" class="btn btn-success" value="编辑"/>
                                        </c:if>
                                        <c:if test="${third.name=='删除' && third.status==1}">
                                            <input type="button"  id="delete" name="delete" class="btn btn-primary" value="删除"/>
                                        </c:if>
                                    </c:forEach>--%>
                                </div>
                                <%--<div class="col-lg-4 col-sm-4  col-md-4 col-xs-4" style="border: 0px solid  red;margin-left: -300px; ">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button id="appear_btn" type="button" class="btn btn-default dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">姓名 <span
                                                    class="caret"></span></button>
                                                <ul class="dropdown-menu" id="menuls">
                                                    <li><a href="#">姓名</a></li>
                                                    <li><a href="#">性别</a></li>
                                                    <li><a href="#">职称</a></li>
                                                    <li role="separator" class="divider"></li>
                                                    <li><a href="#">真实姓名</a></li>
                                                </ul>
                                        </div>
                                        <input type="text" placeholder="按照条件进行搜索" value="${search}" id="searchvalue" class="form-control" aria-label="...">
                                    </div>
                                </div>--%>
                            <%--    <div class="col-lg-4 col-sm-4  col-md-4 col-xs-4">
                                    <input type="button"  name="search" width="60px" height="30px"
                                           class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
                                    <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                                </div>--%>
                            </div>
                        </td>
                    </tr>
                  </table>
                <br>
                <c:if test="${lists!=null}">
                      <table width="95%" border="0" cellpadding="2" cellspacing="0" class="table01">
                            <tr>
                                <td class="td_top">
                                       选择
                                </td>
                                <td class="td_top">编号</td>
                                <td class="td_top">名称</td>
                            </tr>
                        <c:forEach items="${lists}" var="clinic">
                            <tr>
                                <td class="td_01">
                                    <span class="td01">
                                      <input name="checkbox" type="checkbox" value="${clinic.id}" />
                                   </span>
                                </td>
                                <td class="td_01">${clinic.id}</td>
                                <td class="td_01">
                                        ${clinic.name}
                                    <input  type="hidden" value="${clinic.name}" id="appointId${clinic.id}"/>
                                </td>
                            </tr>
                        </c:forEach>
                     </table>
                </c:if>
                 <c:if test="${lists==null}">
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

            <%--分页程序--%>
            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>
                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                            <%-- 这个是中间的情况--%>
                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>


                            <%--  当数据只有一个的时候，第一页与最后一页是重复的：为了避免这种情况的发生，加上!=1--%>
                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>





    <!-- 点击添加按钮 -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document" id="addUserInfo">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">添加门诊部门名称</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <input type="hidden" value="${menuid}" name="menuid"/>
                    </div>

                    <div class="modal-body" style="align-content: center;" id="addDoctorsInfo">
                        <div class="form-horizontal" style="border:0px solid red;text-align:center;margin-left: 100px;">
                           <div class="form-group">
                                   <label for="name" class="col-sm-2 control-label">名称</label>
                                      <div class="col-sm-6 col-lg-6 col-xs-6 col-md-6">
                                        <input type="text" name="name" class="form-control" id="name" placeholder="请输入名称" />
                                     </div>
                           </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <input type="reset"   class="btn btn-secondary" data-dismiss="modal"  value="关闭"/>
                        <input type="submit"  id="addbtn" class="btn btn-primary"  value="确认"/>
                    </div>
                </div>
        </div>
    </div>


    <!-- 点击编辑按钮 -->
    <div class="modal fade"  id="_updateexampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="update_exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document" >
            <form id="updateform">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update_exampleModalScrollableTitle">修改门诊信息</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                       <input type="hidden" value="${menuid}" name="menuid"/>
                    </div>

                    <div class="modal-body" style="align-content: center;" id="updatemain">
                   <%--     <div class="form-horizontal" style="border:0px solid red;text-align:center;margin-left: 100px;">
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-6 col-lg-6 col-xs-6 col-md-6">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="请输入名称" />
                                </div>
                            </div>
                        </div>--%>
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

        //添加数据函数
        $("#addbtn").click(function () {
            var name=$("#addDoctorsInfo").find("input[name='name']").val();
            if (name!=null&&name!=""){
                $.ajax({
                    type:"GET",
                    dataType:"JSON",
                    data:{"name":name},
                    url:"${pageContext.request.contextPath}/admin/info/insertAppoint_Category",
                    success:function (data) {
                        if (data!=null&&data!=""){
                            var type=data.type;
                            if (type=='success'){
                                alert("添加成功");
                                window.location.href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers";
                            } else if (type=='fail'){
                                alert("添加失败");
                            } else if (type=='error'){
                                alert("传递数据过去失败");
                            }
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
            } else{
                alert("请你填写好数据!");
            }
        });



        //点击详情信息，查看医生的详细信息
/*        $("#detail").click(function () {
            var id=$(this).val();
          //  alert(id);
            if(id!=null&&id!=""){
                $.ajax({
                   type:"GET",
                   url:"/admin/employee/selectDoctorInfoBId",
                   data:{"id":id},
                   dataType:"JSON",
                   success:function (data) {
                       if (data!=null&&data!=""){
                           var type=data.type;
                           if (type=='success'){
                               //医生的详情信息
                               var  doct=data.doctor;

                               //门诊的详细信息
                               var allAppoint_categorys=data.allAppoint_categorys;

                               var content="\t\t\t\t<div class=\"form-horizontal\" style=\"border: 0px solid red;height:auto;width:700px;\">\n" +
                                   "                   \n" +
                                   "                      \t \t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"inputEmail3\" class=\"col-sm-2 control-label\">真实姓名</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t\t" +
                                   "<input type=\"hidden\" name=\"did\" value='"+doct.id+"' readonly='readonly' class=\"form-control\" >"+
                                   "<input type=\"text\" name=\"realname\" value='"+doct.realname+"' readonly='readonly' class=\"form-control\" id=\"inputEmail3\" >\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t\n" ;

                               content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" readonly='readonly' value='"+doct.name+"' name=\"name\" id=\"inputPassword3\"  />\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n";

                               content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">密码</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" readonly='readonly' value='"+doct.password+"' name=\"password\" id=\"inputPassword3\"  />\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n";

                               content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">性别</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" value='"+doct.sex+"' readonly='readonly'  name=\"sex\" >\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n" ;

                               content+="<div class=\"form-group\">\n" +
                                   "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">擅长</label>\n" +
                                   "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t                <textarea   class=\"form-control\"  name=\"strength\" readonly='readonly'  id=\"strength\">"+doct.strength+"</textarea>\n" +
                                   "\t\t\t            </div>\n" +
                                   "\t\t\t     </div>\n" ;

                               content+="<div class=\"form-group\">\n" +
                                   "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">出生日期</label>\n" +
                                   "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" readonly='readonly' value='"+doct.birthday+"' name=\"birthday\" id=\"comment\"  />\n" +
                                   "\t\t\t            </div>\n" +
                                   "\t\t\t     </div>\n" ;

                               content+="<div class=\"form-group\">\n" +
                                   "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">专业</label>\n" +
                                   "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t                <input   class=\"form-control\"  name=\"strength\"  value='"+doct.profession+"' readonly='readonly'  id=\"profession\">" +
                                   "\t\t\t            </div>\n" +
                                   "\t\t\t     </div>\n" ;


                               content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">职称</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"prat\" id=\"prat\"  value="+doct.prat+" readonly=\"readonly\" >\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n" ;

                               content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">毕业学校</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"school\" id=\"school\"  value="+doct.school+" readonly=\"readonly\" >\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n" ;

                               content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">门诊类型</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t    <select class=\"form-control\"  name='appoint' id='appoint'>\n" +
                                                       "<option value='0'>请选择门诊</option>";
                                                             if (allAppoint_categorys.length!=0){
                                                                 for(var i=0;i<allAppoint_categorys.length;i++){
                                                                     content+=  "<option value='"+allAppoint_categorys[i].id+"'>"+allAppoint_categorys[i].name+"</option>";
                                                                 }
                                                             }
                               content+="\t\t\t\t\t </select>\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n";

                               content+= "\t\t\t\t\t<div class=\"form-group\" >\n" +
                                   "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\" >\n" +
                                   "\t\t\t\t\t\t    <select class=\"form-control\" id='offices' name='offices'>\n" +
                                   "\t\t\t\t\t\t    </select>\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n" ;

                               content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                                   "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">角色</label>\n" +
                                   "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                   "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"school\" id=\"school\"  value="+doct.role.name+" readonly=\"readonly\" >\n" +
                                   "\t\t\t\t\t\t</div>\n" +
                                   "\t\t\t\t\t</div>\n" ;

                               $("#detailDoctorContent").html(content);

                               //这个是查询所有的部门，然后回显时，自动选中对应的下拉列表
                               var _depart_name=doct.appoint_category.name;
                               var val = $("#appoint").find("option");
                               if (val!=null&&val!=""){
                                   for (var i=0;i<val.length;i++){
                                       if(val[i].text == _depart_name){
                                            // val[i].attr("selected", true);//error  ，有bug
                                            $("#appoint option[value='"+i+"']").attr("selected",true); //correct
                                       }
                                   }
                               }

                               //这个是查询科室，然后回显时，自动选中对应的下拉列表
                               var _offices=doct.offices;
                               var _oname=_offices.name;

                               if (_offices!=null&&_offices!=""){
                                    $("#offices").append("<option value='"+_offices.id+"'>"+_offices.name+"</option>");
                               }

                           }
                           else if (type=='fail'){
                               alert("点击详情查看医生信息失败");
                           }
                       }

                   },error:function (data) {
                        alert("点击详情查看医生信息失败！");
                    }
                });
            }
        });*/





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
                window.location.href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?menuid="+menuid;
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
                if (conditon=='性别'){
                    //输入的性别判断是不是只有男或女
                    if ((index=search.indexOf("男")>=0)|| (index=search.indexOf("女")>=0)){
                          //alert(search);
                        //进一步判断是不是同时存在男或女
                       if (search.indexOf("男",index)>=0 || search.indexOf("女",index)>=0) {
                           alert("请输入男或者，不能同时输入男和女");
                           return;
                       }
                    }
                    else{
                        alert("你选择的条件是性别，请输入男或女，或者包含男或女的关键字");

                    }
                }else if (conditon=='姓名') {

                }else if (conditon=='真实姓名'){

                }
                else if (conditon=='职称'){

                }
                window.location.href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?search="+search+"&&menuid="+menuid+"&&conditon="+conditon;
            }else{
                window.location.href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?menuid="+menuid;
            }
        });

    });


    //删除数据的函数
    $("#delete").click(function () {
        var checkboxs=$("input[name='checkbox']:checked");//得到的数据都是选中的数据
       // var  menuid=$("input[name='menuid']").val();
        if (checkboxs.length==0){
            alert("请你选择选项再删除信息");
            return;
        } else if(checkboxs.length>0){
            for (var i=0;i<checkboxs.length;i++){ //删除你选中所有的数据
                var id=checkboxs[i].value;
                if (id!=null&&id!=""){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/admin/info/deleteAppoint_CategoryById",
                        type:"GET",
                        data:{"id":id},
                        dataType:"JSON",
                        success:function (data) {
                            var  type=data.type;
                            var  menuid=data.menuid;
                            if (data!=null&&data!=""){
                                if (type=='success'){
                                    alert("删除成功");
                                   window.location.href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers";
                                } else if (type=='fail') {
                                    alert("删除失败");
                                }
                                else if (type=='error') {
                                    alert("传递id数据过去失败");
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
        var id=checkboxs[0].value;
        var name = $("#appointId"+id).val();
        if (name!=null&&name!=""){
            var content=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 100px;\">\n" +
                "                            <div class=\"form-group\">\n" +
                "                                <label for=\"name\" class=\"col-sm-2 control-label\">名称</label>\n" +
                "                                <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                "                                    <input type=\"text\" name=\"appoinTname\" class=\"form-control\" value='"+name+"' placeholder=\"请输入名称\" />\n" +
                "                                </div>\n" +
                "                            </div>\n" +
                "                        </div>";
            $("#updatemain").html(content);
        }
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
        var checkboxs=$("input[name='checkbox']:checked");
        var  menuid=$("input[name='menuid']").val();
        var id=checkboxs[0].value;
       // var name = $("#appointId"+id).val();
      var name=$("#updatemain").find("input[name='appoinTname']").val();
      if (name!=null&&name!=""){
          $.ajax({
              type:"GET",
              url:"${pageContext.request.contextPath}/admin/info/updateAppointCategoryInfo",
              dataType:"JSON",
              data:{"id":id,"name":name},
              success:function (data) {
                  if (data!=null&&data!=""){
                      var  type=data.type;
                      if (type == 'success'){
                          alert("修改数据成功");
                          window.location.href="${pageContext.request.contextPath}/admin/info/findClinicInfoAndManagers";
                      } else if (type == 'fail') {
                          alert("修改数据失败");
                      }
                      else if (type == 'error') {
                          alert("传递数据过去失败");
                      }
                  }
              },error:function (data) {
                  alert("响应数据失败");
              }
          });
      } else{
          alert("请输入数据，名称不能为空");
      }
    });


</script>

</html>
