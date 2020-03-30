<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>医生管理</title>
    <meta charset="utf-8">
    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>医生基本信息</title>
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
                        <td valign="bottom" class="title">医生管理</td>
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
                                    <c:forEach items="${third}" var="third">
                                        <c:if test="${third.name=='添加' && third.status==1}">
                                            <input data-toggle="modal" data-target="#exampleModalScrollable" type="button" id="add" name="add" class="btn btn-info" value="添加"/>
                                        </c:if>
                                        <c:if test="${third.name=='编辑' && third.status==1}">
                                            <input  data-toggle="modal"   type="button"   id= "update" name="update" class="btn btn-success" value="编辑"/>
                                        </c:if>
                                        <c:if test="${third.name=='删除' && third.status==1}">
                                            <input type="button"  id="delete" name="delete" class="btn btn-primary" value="删除"/>
                                        </c:if>
                                    </c:forEach>
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
                                                    <li><a href="#">性别</a></li>
                                                    <li><a href="#">职称</a></li>
                                                    <li role="separator" class="divider"></li>
                                                    <li><a href="#">真实姓名</a></li>
                                                </ul>
                                        </div>
                                        <input type="text" placeholder="按照条件进行搜索" value="${search}" id="searchvalue" class="form-control" aria-label="...">
                                    </div>
                                </div>
                                <div class="col-lg-4 col-sm-4  col-md-4 col-xs-4">
                                    <input type="button"  name="search" width="60px" height="30px"
                                           class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
                                    <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
                <br>

                <c:if test="${userInfo!=null}">
                  <%--    <table width="95%" border="0" cellpadding="2" cellspacing="0" class="table01">--%>
                          <table class="table table-bordered"   style="height: 24px;width: 1580px;">
                            <tr class="active">
                                <td>
                                       选择
                                </td>
                                <td<%-- class="td_top"--%>>照片</td>
                                <td >真实姓名</td>
                                <td >姓名</td>
                                <td >性别</td>
                                <td>擅长</td>
                                <td >职称</td>
                                <td >毕业学校</td>
                                <td >查看详情</td>
                            </tr>
                        <c:forEach items="${userInfo}" var="doctor">
                            <tr>
                              <%--  <td class="td_01">
                                <span class="td01">
                                  <input name="checkbox" type="checkbox" value="${doctor.id}" >
                               </span>
                            </td>
                                <td class="td_01"><a><img src="${pageContext.request.contextPath}${doctor.url}" width="70px" height="50px"></a></td>
                                <td class="td_01">${doctor.realname}</td>
                                <td class="td_01">${doctor.name}</td>
                                <td class="td_01">${doctor.sex}</td>
                                <td class="td_01">${doctor.strength}</td>
                                <td class="td_01">${doctor.prat}</td>
                                <td class="td_01">${doctor.school}</td>
                                <td class="td_01">
                                    <button data-toggle="modal" data-target="#detailDoctor" type="button" value="${doctor.id}" name="detail"  style="width: 80px;" class="btn btn-default" >查看详情</button>
                                </td>--%>


                                <td>
                                    <span >
                                      <input name="checkbox" type="checkbox" value="${doctor.id}" >
                                   </span>
                                </td>
                                <td ><a><img src="${pageContext.request.contextPath}${doctor.url}" width="70px" height="50px"></a></td>
                                <td >${doctor.realname}</td>
                                <td>${doctor.name}</td>
                                <td >${doctor.sex}</td>
                                <td >${doctor.strength}</td>
                                <td >${doctor.prat}</td>
                                <td >${doctor.school}</td>
                                <td >
                                    <button data-toggle="modal" data-target="#detailDoctor" type="button" value="${doctor.id}" name="detail"  style="width: 80px;" class="btn btn-default" >查看详情</button>
                                </td>
                            </tr>
                        </c:forEach>
                     </table>
                </c:if>
                 <c:if test="${userInfo==null}">
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
                    <a href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${pageBean.currentPage-1}&&search=${search}&&conditon=${condition}&&menuid=${menuid}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>


            <!-- 显示每一页 -->
            <c:forEach begin="1" end="${pageBean.totalPage }" var="page">
                <!-- 判断是否是当前页 -->
                <c:if test="${page==pageBean.currentPage }">
                    <li class="active"><a href="javascript:void(0);">${page }</a></li>
                </c:if>
                <c:if test="${page!=pageBean.currentPage }">
                    <li><a href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${page}&&search=${search}&&conditon=${condition}&&menuid=${menuid}">${page}</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${pageBean.currentPage+1}&&search=${search}&&conditon=${condition}&&menuid=${menuid}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </div>
<%--<c:if test="${userInfo!=null}">
    <c:choose>
        <c:when test="${search!=null&&search!=''}">
            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>
                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                            &lt;%&ndash; 这个是中间的情况&ndash;%&gt;
                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>


                            &lt;%&ndash;  当数据只有一个的时候，第一页与最后一页是重复的：为了避免这种情况的发生，加上!=1&ndash;%&gt;
                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/employee/searchDoctorsInfoByCondition?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>
        </c:when>


        <c:otherwise>

            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${1}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>
                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                            &lt;%&ndash; 这个是中间的情况&ndash;%&gt;
                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>


                            &lt;%&ndash;  当数据只有一个的时候，第一页与最后一页是重复的：为了避免这种情况的发生，加上!=1&ndash;%&gt;
                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${page.totalPage}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?currentPage=${page.totalPage}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>
        </c:otherwise>
    </c:choose>
</c:if>--%>




    <!-- 点击添加按钮 -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document" id="addUserInfo">
            <form id="addform"   enctype="multipart/form-data"  method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">添加医生人员个人信息</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <input type="hidden" value="${menuid}" name="menuid"/>
                    </div>

                    <div class="modal-body" style="align-content: center;" id="addDoctorsInfo">

                    </div>

                    <div class="modal-footer">
                        <input type="reset"   class="btn btn-secondary" data-dismiss="modal"  value="关闭"/>
                        <input type="submit"  id="addbtn" class="btn btn-primary"  value="确认"/>
                    </div>
                </div>
            </form>
        </div>
    </div>


    <!-- 这个是点击详情查询数据 -->
    <div class="modal fade" id="detailDoctor" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">医生详细信息</h4>
                </div>
                <div class="modal-body" id="detailDoctorContent">

                </div>
                <div class="modal-footer">
                    <button type="button"  class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button"  id="updateButton" class="btn btn-primary">确认</button>
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
                        <h5 class="modal-title" id="update_exampleModalScrollableTitle">修改医生个人信息</h5>
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

        //点击详情信息，查看医生的详细信息
        $("button[name='detail']").click(function () {
            var id=$(this).val();
          //  alert(id);
            $("#detailDoctorContent").html("");
            if(id!=null&&id!=""){
                $.ajax({
                   type:"GET",
                   url:"${pageContext.request.contextPath}/admin/employee/selectDoctorInfoBId",
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
                                   "\t\t\t</div>\n" ;


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
        });


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

        //添加数据的按钮
       $("#add").click(function () {
             $.ajax({
                 type:"GET",
                 dataType:"JSON",
                 url:"${pageContext.request.contextPath}/admin/employee/beforeSelectInfoAddDoctorInfo",
                 success:function (data) {
                     if (data!=null&&data!=""){
                         var  content="";
                        // var  roles=data.roles;
                         var  allAppoint_categorys=data.allAppoint_categorys;

                         content+=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 100px;\">\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"name\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"name\" class=\"form-control\" id=\"name\" placeholder=\"姓名\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +
                             "\n" +
                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"realname\" class=\"col-sm-2 control-label\">真实姓名</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"realname\" class=\"form-control\" id=\"realname\" placeholder=\"真实姓名\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +

                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"password\" class=\"col-sm-2 control-label\">照片</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                  <input type=\"file\" name=\"file\"/>" +
                             "                            </div>\n" +
                             "                        </div>\n" +

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
                             "                                <input type=\"radio\"  id=\"male\" name=\"male\" value=\"男\"   checked=\"checked\">男\n" +
                             "                                <input type=\"radio\"  id=\"female\"  name=\"female\"  value=\"女\" > 女\n" +
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
                             "                            <label for=\"prat\" class=\"col-sm-2 control-label\">职称</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"prat\" class=\"form-control\" id=\"prat\" placeholder=\"输入职称\" >\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +

                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"school\" class=\"col-sm-2 control-label\">学校</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <input type=\"text\" name=\"school\" class=\"form-control\" id=\"school\" placeholder=\"输入学校的信息\">\n" +
                             "                            </div>\n" +
                             "                        </div>\n" +

                             "                        <div class=\"form-group\">\n" +
                             "                            <label for=\"strength\" class=\"col-sm-2 control-label\">擅长</label>\n" +
                             "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                             "                                <textarea  type=\"text\" name=\"strength\" class=\"form-control\" id=\"strength\" placeholder=\"输入该医生的擅长\" ></textarea>"+
                             "                            </div>\n" +
                             "                        </div>\n" ;


                                                 content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                                                               "\t\t\t\t\t\t<label class=\"col-sm-2 control-label\">门诊类型</label>\n" +
                                                                "\t\t\t\t\t\t<div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                                                "\t\t\t\t\t\t    <select class=\"form-control\"  name='appoint' id='appoint'>\n" +
                                                                                    "<option value='0'>请选择门诊</option>";
                                                                                       if (allAppoint_categorys.length!=0){
                                                                                           for(var i=0;i<allAppoint_categorys.length;i++){
                                                                                               content+=  "<option value='"+allAppoint_categorys[i].id+"'>"+allAppoint_categorys[i].name+"</option>";
                                                                                           }
                                                                                       }
                                                          content+="\t\t\t\t\t\t    </select>\n" +
                                                                 "\t\t\t\t\t\t</div>\n" +
                                                            "\t\t\t\t\t</div>\n";

                                                 content+= "\t\t\t\t\t<div class=\"form-group\" >\n" +
                                                     "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                                                     "\t\t\t\t\t\t<div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\" >\n" +
                                                     "\t\t\t\t\t\t    <select class=\"form-control\" id='offices' name='offices'>\n" +
                                                                              "<option value='0'>请选择科室</option>"+
                                                     "\t\t\t\t\t\t    </select>\n" +
                                                     "\t\t\t\t\t\t</div>\n" +
                                                     "\t\t\t\t\t</div>\n" ;

                                           content+="</div>";
                         $("#addDoctorsInfo").html(content);

                       //这个函数还是利用register.jsp页面里面的为病人注册信息的函数
                         $("#appoint").change(function () {
                             var find = $(this).find("option:selected").val();
                             $.ajax({
                                 type:"GET",
                                 url:"${pageContext.request.contextPath}/admin/userForPatient/getOfficesByAppoint_category",
                                 data:{"id":find},
                                 dataType:"JSON",
                                 success:function (data) {
                                     if (data!=null&&data!=""){
                                         var  type=data.type;
                                         //   alert("进入");
                                         if (type=='success'){
                                             var data_offices=data.officesByAppoint_category;
                                             if (data_offices!=null&&data_offices!=""){
                                                 $("#offices").empty();
                                                 $("#offices").append( "<option value='0'>请选择科室</option>");
                                                 for (var i=0;i<data_offices.length;i++){
                                                     $("#offices").append("<option value='"+data_offices[i].id+"'>"+data_offices[i].name+"</option>");
                                                 }
                                             }

                                         } else if (type=='fail'){
                                             alert("根据这个选择的门诊，查询科室数据失败");
                                         } else if (type=='init'){
                                             alert("请选择门诊");
                                         }
                                     }
                                 },error:function (data) {
                                     alert("选择门诊的类别，响应出科室的数据失败 ");
                                 }
                             });
                         });


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
            var formData = new FormData($("#addform")[0]);
           // alert(formData);
          $.ajax({
                 url:"${pageContext.request.contextPath}/admin/employee/addDoctorInfo",
                 type:"POST",
                 data:formData,
                 dataType:"JSON",
                 async: false,
                 cache: false,
                 contentType: false,
                 processData: false,
                 success:function (data) {
                   if(data!=null&&data!=""){
                       var type=data.type;
                       var  menuid=data.menuid;
                       alert(menuid);
                       if (type=='success'){
                           alert("添加数据成功");
                           if (menuid!=null&&menuid!=""){
                               window.location.href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?menuid="+menuid;
                           }
                       } else if (type=='fail'){
                          alert("添加数据失败");
                       }else if (type=='upload'){
                           alert("上传图片失败");
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
        var  menuid=$("input[name='menuid']").val();
        //alert(checkbox.length);
        if (checkboxs.length==0){
            alert("请你选择选项再删除信息");
            return;
        } else if(checkboxs.length>0&&menuid!=""&&menuid!=null){
            for (var i=0;i<checkboxs.length;i++){ //删除你选中所有的数据
                var id=checkboxs[i].value;
                if (id!=null&&id!=""){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/admin/employee/deleteDoctorInfoById",
                        type:"GET",
                        data:{"id":id,"menuid":menuid},
                        dataType:"JSON",
                        success:function (data) {
                            var  type=data.type;
                            var  menuid=data.menuid;
                            if (data!=null&&data!=""){
                                if (type=='success'){
                                    alert("删除成功");
                                    if (menuid!=null&&menuid!=""){
                                        window.location.href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?menuid="+menuid;
                                    }
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
            url:"${pageContext.request.contextPath}/admin/employee/beforUpdateFindDoctorInfo",
            data:{"id":uid,"menuid":menuid},
            dataType:"JSON", //这个表示ajax请求后，返回数据的类型，为json类型
            success:function (data) {
                //alert(data);
                if (data!=null&&data!=""){
                    //医生的详情信息
                    var  doct=data.doctor;
                    var  type=data.type;
                      if (type=='success'){
                          //门诊的详细信息

                          var  str=doct.birthday;
                          var content="\t\t\t\t<div class=\"form-horizontal\" style=\"border: 0px solid red;height:auto;width:700px;\">\n" +
                              "                   \n" +
                              "\t \t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"inputEmail3\" class=\"col-sm-2 control-label\">真实姓名</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t\t" +
                                           "<input type=\"hidden\" name=\"did\" value='"+doct.id+"' readonly='readonly' class=\"form-control\" >"+
                                           "<input type=\"text\" name=\"realname\" value='"+doct.realname+"' class=\"form-control\" id=\"inputEmail3\" >\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t\n" ;

                          content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"name\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" value='"+doct.name+"' name=\"name\" id=\"name\"  />\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n";

                          content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">照片</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                            " <img src='${pageContext.request.contextPath}"+doct.url+"' width='70px' height='70px'  />\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n";


                          content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">密码</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\"  value='"+doct.password+"' name=\"password\" id=\"inputPassword3\"  />\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n";

                          content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">性别</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" value='"+doct.sex+"'  name=\"sex\" >\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n" ;

                          content+="<div class=\"form-group\">\n" +
                              "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">擅长</label>\n" +
                              "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t                <textarea   class=\"form-control\"  name=\"strength\" id=\"strength\">"+doct.strength+"</textarea>\n" +
                              "\t\t\t            </div>\n" +
                              "\t\t\t     </div>\n" ;

                          content+="<div class=\"form-group\">\n" +
                              "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">出生日期</label>\n" +
                              "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t    \t<input type=\"date\" class=\"form-control\"   value='"+doct.birthday+"' name=\"birthday\" id=\"birthday\"  />\n" +
                              "\t\t\t            </div>\n" +
                              "\t\t\t     </div>\n" ;

                          content+="<div class=\"form-group\">\n" +
                              "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">专业</label>\n" +
                              "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t                <input   class=\"form-control\"  name=\"profession\"  value='"+doct.profession+"'   id=\"profession\">" +
                              "\t\t\t            </div>\n" +
                              "\t\t\t     </div>\n" ;


                          content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">职称</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"prat\" id=\"prat\"  value="+doct.prat+"  >\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n" ;

                          content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">毕业学校</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"school\" id=\"school\"  value="+doct.school+" />\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n" ;

                          content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">门诊类型</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                             " <input type=\"text\" class=\"form-control\" name=\"app_categoryid\" id=\"app_categoryid\"  value="+doct.appoint_category.name+" readonly=\"readonly\" />";
                          content+="\t\t\t\t\t " +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n";

                          content+= "\t\t\t\t\t<div class=\"form-group\" >\n" +
                              "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\" >\n" ;
                               content+=  " <input type=\"text\" class=\"form-control\" name=\"office_id\" id=\"office_id\"  value="+doct.offices.name+" readonly=\"readonly\" />"+
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>\n" ;

                          content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                              "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">角色</label>\n" +
                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                              "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"school\" id=\"school\"  value="+doct.role.name+" readonly=\"readonly\" />\n" +
                              "\t\t\t\t\t\t</div>\n" +
                              "\t\t\t\t\t</div>" ;



                          $("#updatemain").html(content);
                          var datetime=document.querySelector("input[name='birthday']");
                          datetime.value=str;
                          $("#update").removeAttr("data-target");

                      }
                }
                else if (type=='fail'){
                    alert("点击详情查看医生信息失败");
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
            url:"${pageContext.request.contextPath}/admin/employee/updateDoctorInfoById",
            dataType:"JSON",
            data:$('#updateform').serialize(),//一次性获取所有的数据
            success:function (data) {
                 if (data!=null&&data!=""){
                     var  type=data.type;
                     var menuid=data.menuid;
                  //   alert(menuid);
                     if (type == 'success'){
                         alert("修改数据成功");
                         if (menuid!=null&&menuid!=""){
                             window.location.href="${pageContext.request.contextPath}/admin/employee/selectDoctorsInfo?menuid="+menuid;
                         }
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
