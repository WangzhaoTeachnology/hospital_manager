<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>挂号管理</title>
    <meta charset="utf-8">
    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>病人基本信息</title>
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
       /* function selectAllByChk(chk, checkbox) {
            var size = checkbox.length;
            if (size == null) {
                checkbox.checked = chk.checked;
            } else {
                for (var i = 0; i < checkbox.length; i++) {
                    checkbox[i].checked = chk.checked;
                    //这个是将所有的name=‘checkbox’，然后全选，把这个全选的状态赋值给每一个checkbox
                }
            }
        }*/

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
                        <td valign="bottom" class="title">挂号管理</td>
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
                       <%-- 挂号修改, 门诊退号,--%>
                        <td class="td_page">
                            <div class="row">
                                <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                                    <c:forEach items="${third}" var="third">
                                        <c:if test="${third.name=='修改' && third.status==1}">
                                            <input data-toggle="modal" type="button" id="update" name="update" class="btn btn-info" value="修改"/>
                                        </c:if>
                                        <c:if test="${third.name=='退号' && third.status==1}">
                                            <input  data-toggle="modal"   type="button"   id= "delete" name="delete" class="btn btn-success" value="退号"/>
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
                                                    <li role="separator" class="divider"></li>
                                                    <li><a href="#">真实姓名</a></li>
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


                <table width="95%" border="0" cellpadding="2" cellspacing="0" class="table01">
                    <tr>
                        <td class="td_top">
                           <%-- <input name="chk" type="checkbox" id="chk" onClick="selectAllByChk(chk,checkbox)"
                                   value="checkbox0">--%>
                            <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                            选择
                        </td>
                        <td class="td_top">病人姓名</td>
                        <td class="td_top">就诊编号</td>
                        <td class="td_top">挂号费用</td>
                        <td class="td_top">挂号时间</td>
                        <td class="td_top">门诊名称</td>
                        <td class="td_top">科室名称</td>
                        <td class="td_top">医生姓名</td>
                        <td class="td_top">挂号类型</td>
                        <td class="td_top">查看详情</td>
                    </tr>
                    <c:forEach items="${list}" var="info">
                        <tr class="content">
                            <td class="td_01">
                                <span class="td01">
                                     <input name="checkbox"  value="${info.id}" type="checkbox" />
                               </span>
                            </td>
                            <td class="td_01">
                                <a>
                                        ${info.patient.name}
                                </a>
                            </td>
                            <td class="td_01">${info.number}</td>
                            <td class="td_01">${info.fee}</td>
                            <td class="td_01">${info.datetime}</td>
                            <td class="td_01">${info.appoint_category.name}</td>
                            <td class="td_01">${info.offices.name}</td>
                            <td class="td_01">${info.doctor.name}</td>
                            <td class="td_01">${info.status==0? '初诊':'复诊'}</td>
                            <td class="td_01"> <button data-toggle="modal" data-target="#myModal" type="button" value="${info.id}" id="detail" class="btn btn-default">查看详情</button></td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>

    <c:choose>
        <c:when test="${search!=null&&search!=''}">
            <%--分页程序--%>
            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>

                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                            <%-- 这个是中间的情况--%>
                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>


                            <%--  当数据只有一个的时候，第一页与最后一页是重复的：为了避免这种情况的发生，加上!=1--%>
                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>
        </c:when>


        <c:otherwise>
            <%--分页程序--%>
            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${1}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>

                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                            <%-- 这个是中间的情况--%>
                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>


                            <%--  当数据只有一个的时候，第一页与最后一页是重复的：为了避免这种情况的发生，加上!=1--%>
                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${page.totalPage}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfo?currentPage=${page.totalPage}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>
        </c:otherwise>
    </c:choose>



    <!-- 这个是点击详情查询数据 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">病人挂号详细信息</h4>
                </div>
                <div class="modal-body" id="maincontent">

                </div>

                <div class="modal-footer">
                    <button type="button"  class="btn btn-primary" id="print" >打印</button>
                </div>
            </div>
        </div>
    </div>



    <!-- 这个是修改回显数据 -->
    <div class="modal fade" id="updatemyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="">修改病人挂号详细信息</h4>
                </div>
                <div class="modal-body" id="updatemain">

                </div>

                <div class="modal-footer">
                    <button type="button"  class="btn btn-primary"  id="updateButton">确认</button>
                </div>
            </div>
        </div>
    </div>


<%--这个是挂号的信息打印--%>
   <div id="box" style="visibility: hidden;">
        <!--startprint-->
        <table  class="table table-striped" style="margin: auto;width:500px;height: 600px;" id="tableUserInfo">
        </table>
        <!--endprint-->
    </div>
</center>
</body>
<script type="text/javascript">


    //获取整个页面
    $("#print").click(function(){
       var  str=$("#box").html();
      //  var  bdhtml=window.document.body.innerHTML;
        var bdhtml=str;
        var   sprnstr="<!--startprint-->"; //开始打印标识字符串有17个字符
        var    eprnstr="<!--endprint-->"; //结束打印标识字符串*/
        var  prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); //从开始打印标识之后的内容
        prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
        window.document.body.innerHTML=prnhtml; //把需要打印的指定内容赋给body.innerHTML
        window.print(); //调用浏览器的打印功能打印指定区域
        window.document.body.innerHTML=bdhtml;//重新给页面内容赋值；
        location.reload();
     /*   经过实验证明一个问题：只有在浏览器上显示的html，的标签才能正常的打印·出来，不然不可能打印出来
        尽管你可以得到这个隐藏的标签的数据，但是仍然不可能打印出来*/
    });


    $(function () {

        //只能选择一个checkbox的功能





       //双击一行，按照id，查询详细数据
        //获取表格中具体的表格，一般采用find，这个函数
        $("#detail").click(function () {
             var id=$(this).val();
          // var id= $(this).find("input:eq(0)").val();
            //var id=$(this).find("td:eq(0)").find("input:eq(1)").val();
           //  alert(id);
            // var  btn=$(this).find("td:eq(0)").find("input:eq(0)");
              if (id!=null&&id!=""){
                    //自动用程序双击
                 // $(this).find("td:eq(0)").find("input:eq(1)").attr("data-target","#findDetailexampleModalScrollable");
                  //$(this).find("td:eq(0)").find("input:eq(0)").trigger("dblclick");
                    //  alert("come in");
                      $.ajax({
                          type:"GET",
                          url:"${pageContext.request.contextPath}/admin/userForPatient/selectPatientNumberInfoById",
                          data:{"id":id},
                          dataType:"JSON",
                          success:function (data) {
                              var type=data.type;
                              if (type=='success') {
                                  var json_appointment=data.appointment;
                                  var _patient=json_appointment.patient;
                                  var _user=json_appointment.user;
                                  var  _appoint_category=json_appointment.appoint_category;
                                  var _offices=json_appointment.offices;
                                  var _doctor=json_appointment.doctor;
                                  var _strStatus;
                                  if (json_appointment.status==0){
                                      _strStatus="初诊";
                                  } else if (json_appointment.status==1) {
                                      _strStatus="复诊";
                                  }
                                  var  content=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 100px;\">\n" +
                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"username\" class=\"col-sm-2 control-label\">病人姓名</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"username\" class=\"form-control\" value="+ _patient.name +" readonly='readonly'  id=\"username\" placeholder=\"姓名\">\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"number\" class=\"col-sm-2 control-label\">就诊编号</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"number\" class=\"form-control\" readonly='readonly' id=\"number\"  value= "+json_appointment.number +" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"fee\" class=\"col-sm-2 control-label\">挂号费用</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"fee\" class=\"form-control\" id=\"fee\"  readonly='readonly' value= "+json_appointment.fee +" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"datetime\" class=\"col-sm-2 control-label\">挂号日期</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"datetime\" class=\"form-control\" readonly='readonly' value= "+ json_appointment.datetime + " id=\"datetime\">\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"status\" class=\"col-sm-2 control-label\">挂号类型</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"status\" class=\"form-control\" readonly='readonly' id=\"status\" value= "+ _strStatus +" />" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"offices\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"offices\" class=\"form-control\" readonly='readonly'  value= "+_offices.name + " id=\"offices\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"address\" class=\"col-sm-2 control-label\">科室位置</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"address\" class=\"form-control\"  readonly='readonly'  value= "+ json_appointment.address +" id=\"address\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"time\" class=\"col-sm-2 control-label\">就诊时间段</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"time\" class=\"form-control\" readonly='readonly' value= "+ json_appointment.time +" id=\"time\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"doctorname\" class=\"col-sm-2 control-label\">医生姓名</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"doctorname\" class=\"form-control\"  readonly='readonly' value= "+ _doctor.realname +" id=\"doctorname\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"strength\" class=\"col-sm-2 control-label\">医生擅长</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <textarea  type=\"text\" name=\"strength\" class=\"form-control\" readonly='readonly'  id=\"strength\" >"+_doctor.strength+"</textarea>\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"user\" class=\"col-sm-2 control-label\">操作人员</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"user\" class=\"form-control\" readonly='readonly' value= "+ _user.name +" id=\"user\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +
                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"commmet\" class=\"col-sm-2 control-label\">备注</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"commmet\" class=\"form-control\" readonly='readonly' value= "+ json_appointment.comment +" id=\"commmet\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>" +
                                      "</div>";

                                var  tableInfo="\n" +
                                    "            <tr>\n" +
                                    "                <td colspan=\"2\"><h4>医院挂号详细信息表</h4></td>\n" +
                                    "            </tr><tr>\n" +
                                      "            <td>病人姓名</td>\n" +
                                      "            <td>"+ _patient.name+"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>就诊编号</td>\n" +
                                      "            <td>"+json_appointment.number +"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>挂号费用</td>\n" +
                                      "            <td>"+json_appointment.fee +"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>挂号日期</td>\n" +
                                      "            <td>"+ json_appointment.datetime + "</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>挂号类型</td>\n" +
                                      "            <td>"+ _strStatus +"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>科室类型</td>\n" +
                                      "            <td> "+_offices.name + "</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>科室位置</td>\n" +
                                      "            <td>"+ json_appointment.address +"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>就诊时间段</td>\n" +
                                      "            <td>"+ json_appointment.time +"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>医生姓名</td>\n" +
                                      "            <td>"+ _doctor.realname +"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>医生擅长</td>\n" +
                                      "            <td>"+_doctor.strength+"</td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>操作人员</td>\n" +
                                      "            <td>"+ _user.name +" </td>\n" +
                                      "        </tr>\n" +
                                      "        <tr>\n" +
                                      "            <td>备注</td>\n" +
                                      "            <td>"+ json_appointment.comment +"</td>\n" +
                                      "        </tr>";



                                    $("#tableUserInfo").html(tableInfo);
                                    $("#maincontent").html(content);

                              }else  if (type=='fail'){
                                  alert("查询没有数据");
                              } else if(type=='error'){
                                  alert("这条数据的主键为空，没有办法查询");
                              }
                          },error:function (data) {
                              alert("数据响应失败");
                          }
                      });
              }
        });


        //双击输入框
        $("#searchvalue").dblclick(function () {
            var  menuid=$("#menuid").val();
            if (menuid!=null&&menuid!=""){
                window.location.href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?menuid="+menuid;
            }
        });


        //获取下面的li里面的数据，而这个ul li这个标签自带下来列表，所以不用下拉下来的事件，
        //只要点击事件
        $("#menuls li").click(function () {
            var  value=$(this).text()+"<span class=\"caret\"></span>";
            if (value!=null&&value!=""){
                $("#appear_btn").html(value);
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
                window.location.href="${pageContext.request.contextPath}/admin/user/searchUserInfoByCondition?search="+search+"&&menuid="+menuid+"&&conditon="+conditon;
            }else{
                window.location.href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?menuid="+menuid;
            }

        });
    });





    //这个是自动触发函数，也就是数据回显函数
  $("#update").dblclick(function () {
        var checkboxs=$("input[name='checkbox']:checked");//得到的数据都是选中的数据
        var  menuid=$("input[name='menuid']").val();
        var uid=checkboxs[0].value;
        //alert("uid="+uid);
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/admin/userForPatient/beforeSelectupdatePatientNumberInfoById",
            data:{"id":uid,"menuid":menuid},
            dataType:"JSON", //这个表示ajax请求后，返回数据的类型，为json类型
            success:function (data) {
                if (data!=null&&data!=""){
                    var type=data.type;
                     if (type=='success'){

                         //自动为挂号时间显示：
                         var date=new Date();
                         var year = date.getFullYear();
                         var month = date.getMonth() + 1;
                         var strDate = date.getDate();
                         var  dateHours = date.getHours();
                         var dateMinutes = date.getMinutes();
                         var dateSeconds = date.getSeconds();
                         if (month >= 1 && month <= 9) {
                             month = "0" + month;
                         }
                         if (strDate >= 0 && strDate <= 9) {
                             strDate = "0" + strDate;
                         }
                         if (dateHours >= 0 && dateHours <= 9) {
                             dateHours = "0" + dateHours;
                         }
                         var  str_datetime=year+"-"+month+"-"+strDate+"T"+dateHours+":"+dateMinutes;
                       //  alert(str_datetime);

                         //数据回显，病人，门诊，科室，医生，四个信息
                         var  appointment=data.appointment;
                        // alert("appointment.id="+appointment.id);
                         var  patie=appointment.patient;
                         var  appoint_cat=appointment.appoint_category;
                         var  off=appointment.offices;
                         var  doc=appointment.doctor;
                         //门诊
                         var allAppoint_categorys=data.allAppoint_categorys;

                       // alert(JSON.stringify(patie)+JSON.stringify(appoint_cat)+JSON.stringify(off)+JSON.stringify(doc));
                         //头部
                         var content="\t\t\t\t<div class=\"form-horizontal\" style=\"border: 0px solid red;height:auto;width:700px;\">\n" +
                             "                   \n" +
                             "                      \t \t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputEmail3\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t\t" +
                             "<input type=\"hidden\" name=\"pid\" value='"+appointment.id+"' readonly='readonly' class=\"form-control\" >"+
                             "<input type=\"text\" name=\"username\" value='"+patie.name+"' readonly='readonly' class=\"form-control\" id=\"inputEmail3\" placeholder=\"姓名\">\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t\n" ;


                         content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">就诊编号</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" readonly='readonly' value='"+appointment.number+"' name=\"number\" id=\"inputPassword3\" placeholder=\"就诊编号\" />\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n";

                         content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">挂号时间</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t\t<input type=\"datetime-local\" class=\"form-control\"  readonly='readonly'  name=\"datetime\" id=\"registerDate\" >\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" ;

                         content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">挂号时间</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t\t<input type=\"datetime-local\" class=\"form-control\"   name=\"datetime\" id=\"_date\" >\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" ;


                         content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">挂号费用</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"fee\" id=\"fee\"  value="+appointment.fee+" readonly=\"readonly\" >\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" ;


                         content+="\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">挂号类型</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t\t<input type=\"radio\"   name=\"clinic_type\" value='0'  checked=\"checked\"> 初诊\n" +
                             "\t\t\t\t\t\t\t<input type=\"radio\"    name=\"clinic_type\" value='1'  > 复诊\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" ;


                         content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">门诊类型</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t    <select class=\"form-control\"  name='appoint' id='appoint'>\n" +
                             "<option value='0'>请选择门诊</option>";
                                   for(var i=0;i<allAppoint_categorys.length;i++){
                                     content+=  "<option value='"+allAppoint_categorys[i].id+"'>"+allAppoint_categorys[i].name+"</option>";
                                  }
                         content+="\t\t\t\t\t\t    </select>\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n";

                         content+= "\t\t\t\t\t<div class=\"form-group\" >\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\" >\n" +
                             "\t\t\t\t\t\t    <select class=\"form-control\" id='offices' name='offices'>\n" +
                             "<option value='0'>请选择科室</option>"+
                             "\t\t\t\t\t\t    </select>\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" ;

                         content+="\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">值班医生</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t    <select class=\"form-control\" id='doctors' name='doctors'>\n" +
                             "<option value='0'>请选择医生</option>"+
                             "\t\t\t\t\t\t    </select>\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n";


                         content+="\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"time\" class=\"col-sm-2 control-label\">选择时间段</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t    <select class=\"form-control\" id='times' name='times'>\n" +
                             "<option value='0'>请选择时间段</option>"+
                             "\t\t\t\t\t\t    </select>\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n";


                         content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">医生介绍</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t\t<textarea class=\"form-control\"  placeholder=\"医生详情介绍\"   name=\"introduce\"  id=\"introduce\"  ></textarea>\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" ;


                         content+="\t\t\t\t\t\n" +
                             "\t\t\t\t\t<div class=\"form-group\">\n" +
                             "\t\t\t\t\t\t<label for=\"address\" class=\"col-sm-2 control-label\">就诊地址</label>\n" +
                             "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\"   id=\"addressss\" placeholder='等待查询数据' />\n" +
                             "\t\t\t\t\t\t</div>\n" +
                             "\t\t\t\t\t</div>\n" ;


                              content+="<div class=\"form-group\">\n" +
                             "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">备注(*过敏):</label>\n" +
                             "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                             "\t\t\t                <textarea placeholder=\"是否对药物过敏\"  class=\"form-control\"  name=\"comment\"  id=\"comment\"></textarea>\n" +
                             "\t\t\t            </div>\n" +
                             "\t\t\t     </div>\n" ;


                         $("#registerDate").val("2020-02-09T01:48");
                         $("#registerDate").val(str_datetime);
                         $("#updatemain").html(content);
                         $("#update").removeAttr("data-target");
                         //每次成功的加载数据，要移出这个属性，
                         //因为当你第一次点击成功，跳出一个框子，然后再次不选择，点击
                         //保证不选择点击这个框子，不能跳出来，所以要将这个属性移出！


                         //选择门诊
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


                         //根据科室选择医生
                         $("#offices").change(function () {
                             //这个是按照当前科室的，当前时间，查询上班的医生
                             var id = $(this).find("option:selected").val();
                             $.ajax({
                                 type:"GET",
                                 url:"${pageContext.request.contextPath}/admin/userForPatient/getDoctorByOndayTime",
                                 data:{"id":id},
                                 dataType:"JSON",
                                 success:function (data) {
                                     if (data!=null&&data!=""){
                                         var  type=data.type;
                                         //   alert("进入查询医生");
                                         if (type=='success'){
                                             var doctors=data.doctors;
                                             if (doctors!=null&&doctors!=""){
                                                 $("#doctors").empty();
                                                 $("#doctors").append( "<option value='0'>请选择医生</option>");
                                                 for (var i=0;i<doctors.length;i++){
                                                     $("#doctors").append("<option value='"+doctors[i].id+"'>"+doctors[i].name+"</option>");
                                                 }
                                             }

                                         } else if (type=='fail'){
                                             alert("根据这个选择的科室，查询医生数据失败");
                                         } else if(type=='init'){
                                             alert("请选择科室");
                                         }
                                     }
                                 },error:function(data) {
                                     alert("选择科室类别，响应出医生的数据失败 ");
                                 }
                             });
                         });


                         //根据医生选择该医生看病的时间段
                         //同时也是按照现在挂号的时间，作为查询的条件
                         //正常的逻辑是这样，但是这个在设计的时候，就已经将上午和下午的不同时间段，
                         //作为一天上班的时间规定在相同的地点看病
                         $("#doctors").change(function () {
                             //这个是按照当前医生的id查询详细的信息
                             var id = $(this).find("option:selected").val();
                             $.ajax({
                                 type:"GET",
                                 url:"${pageContext.request.contextPath}/admin/userForPatient/getDoctorsByDetails",
                                 data:{"id":id},
                                 dataType:"JSON",
                                 success:function (data) {
                                     if (data!=null&&data!=""){
                                         var  type = data.type;
                                         // alert("type="+type);
                                         if (type == 'success'){
                                             var work = data.workInfo;

                                             //   alert("work="+work);
                                             var  doct=work.doctor;
                                             //  var doctor = JSON.stringify(work.doctor);// eval("("+data+")");
                                             //  alert("进入医生的详细信息");
                                             // alert("doctor=" + work.doctor);
                                             if (doct!="" && work!=""){

                                                 $("#introduce").empty();
                                                 $("#introduce").text(doct.strength);
                                                 //  alert("doctor.strength" + doct.strength);
                                                 var  add=work.address;
                                                 //alert("work.address"+ add);
                                                 $("#addressss").empty();
                                                 $("#addressss").val(work.address);

                                                 //  alert("work.address"+ work.address);

                                                 $("#times").empty();
                                                 $("#times").append("<option value='"+work.morning+"'>"+work.morning+"</option>");
                                                 $("#times").append("<option value='"+work.afternoon+"'>"+work.afternoon+"</option>");

                                             }

                                         } else if (type=='fail'){
                                             alert("根据这个选择的科室，查询医生数据失败");
                                         } else  if (type=='init'){
                                             alert("请选择医生");
                                         }
                                     }
                                 },error:function(data) {
                                     alert("选择科室类别，响应出医生的数据失败 ");
                                 }
                             });
                         });


                         //选择好数据，然后点击确认修改
                         $("#updateButton").click(function () {
                             //在病人的信息输入完成后，进入到这个挂号的信息
                             //挂号信息

                             var  id=$("input[name='pid']").val();
                             var number=$("input[name='number']").val();
                             //alert(number);
                             var  registerDatetime=$("#registerDatetime").val();
                             var fee=$("input[name='fee']").val();
                             var _type=0; //初，复，这个是挂号类型,默认为初0


                             var  _types=$("input:radio[name='clinic_type']");
                             //    alert(_types.length);
                             if (_types.length>0){
                                 for (var i=0;i<_types.length;i++){
                                     if (_types[i].checked==true){
                                         _type=_types[i].value;
                                     }
                                 }
                             }

                             //   alert("number"+number+"registerDatetime"+registerDatetime+"fee"+fee+"_type"+_type);
                             var appoint=$("#appoint").find("option:selected").val();
                             //门诊类型
                             if (appoint==0){
                                 //因为从门诊类型导医生选择，都是ajax，这一路都是按照数据ajax查询的
                                 //只要你没有选择上一级，而是直接选择下一级的，会没有数据显示的
                                 //所以用户只会一步步的选择，所以不会存在选择了科室名称，而之前没有选择门诊类型，这种情况不会发生
                                 alert("请选择门诊类型");
                                 return;
                             }

                             //科室名称

                             var offices = $("#offices").find("option:selected").val();
                             if (offices==0){
                                 alert("请选择科室名称");
                                 return;
                             }
                             //选择医生

                             var doctors=$("#doctors").find("option:selected").val();
                             if (doctors==0){
                                 alert("请选择医生");
                                 return;
                             }
                             //选择时间段
                             var times=$("#times").find("option:selected").val();

                             var introduce=$("#introduce").val();

                             var  addressss=$("#addressss").val();
                             var comment=$("#comment").val();

                             $.ajax({
                                 type:"GET",
                                 data:{"id":id,"number":number,"registerDatetime":registerDatetime,
                                     "fee":fee,"_type":_type,"appoint":appoint,"office":offices,"doctors":doctors,
                                     "times":times,"introduce":introduce,"addressss":addressss,"comment":comment,"_date":$("#_date").val()},
                                 dataType:"JSON",
                                 url:"${pageContext.request.contextPath}/admin/userForPatient/updatePatientInfoById",
                                 success:function (data) {
                                     if (data!=null&&data!=""){
                                         var  type=data.type;
                                         if (type=='success'){
                                             alert("已经修改成功");
                                             $("#close").trigger("click");
                                         } else if (type=='fail'){
                                             alert("修改失败失败!");
                                         }else if (type=='logout'){
                                             alert("你已经离线，请重新登录");
                                         }
                                     }
                                 },error:function (data) {
                                     alert("在挂号插入挂号信息响应失败！");
                                 }
                             });
                         });
                     } else if (type=='error'){
                         alert("将id传递到后台失败");
                     } else if (type=='fail'){
                         alert("根据id，查询数据失败");
                     }





                }
            },error:function (data) {
                alert("响应数据失败");
            }
        });
    });


    //这个是手动点击触发的函数
    $("#update").click(function () {
/*        问题：当你点击修改按钮的时候，这个input标签有个属性，$("#update").attr("data-target","#_updateexampleModalScrollable");
        只要你点击这个按钮，都会跳出这个框子，这个是boostrap内部的js
        而我想要的效果是：在你选中的checkbox，当你点击修改按钮的时候，跳出这个框子
        而当你未选中的时候，则无论怎么点击都不会跳出这个框子

        以前的思路：
           通过隐藏这个div标签，不管你有没有选中这个checkbox，都会跳出这个框子，然后按照你是不是选中的状态，是不是隐藏还是显示这个框子

        现在的思路：
           1：首先要移出这个$("#update").attr("data-target","#_updateexampleModalScrollable");属性
           2：当你点击修改按钮的时候，判断你有没有选中这个checkbox，选中则，加上这个属性，没有则按照默认的不加这个属性
           3：当判断你已经选中时候，会自动的按照触发器，自动的触发一个函数，这个函数可以将数据查询，然后回显到跳出一个框子
*/

        var checkboxs=$("input[name='checkbox']:checked");//得到的数据都是选中的数据
        if (checkboxs.length==0){
            alert("编辑之前请你选择一项数据");
            return;
        } else{
        //    data-toggle="modal" data-target="#updatemyModal"
            $("#update").attr("data-target","#updatemyModal");
            $("#update").trigger("dblclick");
        }
    });


    //修改函数
    $("#updatebtn").click(function () {
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/admin/user/updateUserInfoById",
            dataType:"JSON",
            data:$('#updateform').serialize(),
            success:function (data) {
                 if (data!=null&&data!=""){
                     var  type=data.type;
                     var menuid=data.menuid;
                  //   alert(menuid);
                     if (type == 'success'){
                         alert("修改数据成功");
                         if (menuid!=null&&menuid!=""){
                             window.location.href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?menuid="+menuid;
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
