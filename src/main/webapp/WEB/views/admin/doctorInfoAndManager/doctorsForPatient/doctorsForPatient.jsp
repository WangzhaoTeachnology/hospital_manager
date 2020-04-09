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
    <title>就诊管理</title>
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
                        <td valign="bottom" class="title">就诊管理</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin: auto;">
        <tr>
            <td align="center">
                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="td_page">
                        <div class="row">
                            <div class="col-lg-5 col-sm-5 col-md-5 col-xs-5" style="position: relative;">
                                <c:forEach items="${third}" var="third">
                                    <c:if test="${third.name=='开处方' && third.status==1}">
                                        <input   data-toggle="modal"   type="button"  id="prescription" name="prescription" class="btn btn-default" value="开处方"/>
                                    </c:if>
                                    <c:if test="${third.name=='查询病历' && third.status==1}">
                                        <input  data-toggle="modal"   type="button"   id= "delete" name="delete" class="btn btn-default" value="查询病历"/>
                                    </c:if>
                                    <c:if test="${third.name=='查询药品' && third.status==1}">
                                        <input  data-toggle="modal"   type="button"  data-toggle="modal" data-target=".bs-example-modal-lg" id= "delete" name="delete" class="btn btn-default" value="查询药品"/>
                                    </c:if>
                                    <c:if test="${third.name=='诊断' && third.status==1}">
                                        <div style="position: absolute;left: 260px;top: 0px;">
                                            <select class="form-control" id="selectPatientByFlag" style="width: 100px;">
                                                <option value="-1">请选择</option>
                                                <option value="0">未诊断</option>
                                                <option value="1">已诊断</option>
                                            </select>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                      <c:forEach items="${third}" var="third">
                            <c:if test="${third.name=='搜索' && third.status==1}">
                                <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4" style="border: 0px solid  red;margin-left: -260px; ">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button id="appear_btn" type="button" class="btn btn-default dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">姓名 <span
                                                    class="caret"></span></button>
                                            <ul class="dropdown-menu" id="menuls">
                                                <li><a href="#">全部</a></li>
                                                <li><a href="#">今天</a></li>
                                                <li><a href="#">姓名</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">挂号编号</a></li>
                                            </ul>
                                        </div>
                                        <input type="text" placeholder="按照条件进行搜索" id="searchvalue" class="form-control" aria-label="...">
                                    </div>
                                </div>

                                <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                                    <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4" style="position: relative;">
                                        <input type="button"  name="search" width="60px" height="30px"
                                               class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
                            </c:if>
                            <c:if test="${third.name=='停止挂号' && third.status==1}">
                                <input type="button"  name="stop" width="60px" height="30px"
                                       class="btn btn-default" id="stop" value="停止挂号" style=" margin-left: -20px;position: absolute;left: 206px; "/>
                            </c:if>
                            <c:if test="${third.name=='时间排序' && third.status==1}">
                                <input type="button"  name="sortbytime" width="60px" height="30px"
                                       class="btn btn-default" value="按时间排序" style=" margin-left: -20px;position: absolute;left: 346px; "/>

                                        </div>
                                    </div>
                                  </div>
                            </c:if>
                      </c:forEach>
                            <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                            <input name="doctorid" type="hidden" value="${doctor.id}" id="doctorid"/>
                            <input name="condition" type="hidden" value="${condition}" id="condition"/>
                       </td>
                    </tr>
                </table>
           <br>


                <c:if test="${list!=null}">
                    <table class="table table-bordered" style="width: 1580px;" id="tableInfo">
                        <tr class="active">
                            <td >选择</td>
                            <td>挂号编号</td>
                            <td >姓名</td>
                            <td >性别</td>
                            <td>就诊序号</td>
                            <td >初/复诊</td>
                            <td >是否诊断</td>
                            <td >挂号时间</td>
                            <td>等候时间</td>
                            <td  style="padding-left: 74px;">操作</td>
                        </tr>
                        <c:forEach items="${list}" var="info">
                            <tr>
                                <td>
                                    <span >
                                          <input name="checkbox"   id="appointid" value="${info.id}" type="checkbox" />
                                          <input name="patientid"   id="patientid${info.id}" value="${info.patient.id}" type="hidden" />
                                          <input name="patientname"   id="patientname${info.id}" value="${info.patient.name}" type="hidden" />
                                   </span>
                                </td>
                                <td >${info.id}</td>
                                <td >${info.patient.name}</td>
                                <td >${info.patient.sex}</td>
                                <td >${info.number}</td>
                                <td >${info.status==0?   '初诊':'复诊'}</td>
                                <td >${info.flag==1?   '已诊断':'未诊断'}</td>
                                <td >
                                        ${info.datetime}
                                    <input type="hidden" value="${info.datetime}" name="${info.id}"/>
                                </td>
                                <td  style="width: 340px;" name="waitime${info.id}">${info.waitime}</td>
                                <td >
                                    <c:if test="${info.flag==1}">
                                        <button  type="button" value="${info.id}" name="confirm" id="confirm${info.id}"  disabled="disabled" class="btn btn-default">接诊</button>
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                    </c:if>
                                    <c:if test="${info.flag==0}">
                                        <button  type="button" value="${info.id}"  name="confirm" id="confirm${info.id}" class="btn btn-default">接诊</button>
                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                    </c:if>
                                    <button data-toggle="modal" data-target="#myModal" type="button" value="${info.id}" name="detail" class="btn btn-default">查看详情</button>
                                </td>
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
                    <a href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${pageBean.currentPage-1}&&menuid=${menuid}&&search=${search}&&condition=${condition}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>


            <!-- 显示每一页 -->
            <c:forEach begin="1" end="${pageBean.totalPage }" var="page">
                <!-- 判断是否是当前页 -->
                <c:if test="${page==pageBean.currentPage }">
                    <li class="active"><a href="javascript:void(0);">${page}</a></li>
                </c:if>
                <c:if test="${page!=pageBean.currentPage }">
                    <li><a href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${page}&&menuid=${menuid}&&search=${search}&&condition=${condition}">${page}</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${pageBean.currentPage+1}&&menuid=${menuid}&&search=${search}&&condition=${condition}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>

<%--<c:if test="${list!=null}">
    <c:choose>
        <c:when test="${search!=null&&search!=''}">
            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>

                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>


                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>



                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&condition=${condition}">
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
                        <a href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${1}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>

                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>


                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>



                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${page.totalPage}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?currentPage=${page.totalPage}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>
        </c:otherwise>
    </c:choose>
</c:if>--%>



   <%-- 注意：如果这个模态框出现，不能弹出来的问题，那么这个一定是这个div标签出现了不能匹配的问题--%>
    <div class="modal fade" id="_myModal_prescription" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button"  id="auto_close" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabe">开处方</h4>
                </div>
                <div class="modal-body">
                    <%--  这个是导航按钮--%>
                    <form class="form-inline" style="margin-left: -454px;margin-top: -23px;">
                        <div class="form-group">
                            <button type="button"  id="addbtn_prescription" class="btn btn-primary navbar-btn">添加</button>
                            <button type="button" class="btn btn-info navbar-btn">删除</button>
                        </div>
                    </form>

                    <div class="row">
                        <%--这个是表格--%>
                        <table class="table table-striped" id="prescribe_Content" style="border: 0px solid red;">
                            <thead>
                            <tr>
                                <td class="active">处方编号</td>
                                <td class="active" colspan="9"  id="prescription_id">32123213435435435</td>
                            </tr>
                            </thead>
                            <tbody id="table_content">
                                    <tr>
                                        <td class="active">选择</td>
                                        <td class="active">编号</td>
                                        <td class="success">药品</td>
                                        <td class="warning">用法</td>
                                        <td class="danger">天/次</td>
                                        <td class="success">次/量</td>
                                        <td class="warning">数量</td>
                                        <td class="success">备注</td>
                                        <td class="active">单价</td>
                                        <td class="active">操作</td>
                                    </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row" style="border: 0px solid red;position: relative;margin-bottom:40px; ">
                        <div class="form-group" style="border: 0px solid red;position: absolute;right: 0px;">
                            <span for="_comment" class="control-label" style="margin-top: -3px;">总价格:￥</span>
                            <span for="_comment" class="control-label" style="margin-top: -3px;" id="totalPrice">5687</span>
                        </div>
                    </div>

                    <div class="row" style="margin-top: -10px;border: 0px solid red;">
                        <div class="form-group">
                            <label for="prescription_content" class="col-sm-2 control-label" style="margin-top: -3px;margin-left: -20px;">诊断内容:</label>
                            <div class="col-sm-10">
                                <textarea   name="prescription_content" id="prescription_content" class="form-control" rows="2" style="width: 440px;height: 100px;" placeholder="请你填写诊断内容"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border: 0px solid red;">
                        <div class="form-group">
                            <label for="doctor_comment" class="col-sm-2 control-label" style="margin-top: -3px;margin-left: -19px;">医嘱:</label>
                            <div class="col-sm-10">
                                <textarea   name="doctor_comment" id="doctor_comment" class="form-control" rows="2" style="width: 440px;height: 100px;" placeholder="请你填写医嘱"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="border: 0px solid red;position: relative;">
                        <div class="form-group" style="border: 0px solid red;position: absolute;right: 0px;">
                            <span for="_comment" class="control-label" style="margin-top: -3px;">诊断时间:</span>
                            <span for="_comment" class="control-label" style="margin-top: -3px;" id="nowtime"></span>
                        </div>
                    </div>

                    <div class="row" style="border: 0px solid red; margin-top: 20px; ">
                        <div style="border:0px solid  red ;">
                            <div  style="border:0px solid  red ;margin-left: -500px ;width:  99px ;">
                                <a class="" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                    查看处方历史
                                </a>
                            </div>
                            <div class="collapse" id="collapseExample">
                                <div class="well" style="padding:0px ;">
                                    <table class="table table-striped" id="table_history_info" style="border: 0px solid red;">
                                        <%-- <thead id="table_history_thead">
                                             <tr>
                                                 <td class="active">处方编号</td>
                                                 <td class="active" colspan="7">32123213435435435</td>
                                             </tr>
                                         </thead>--%>
                                        <%--    <tbody id="table_history">
                                                <tr>
                                                    <td class="active">编号</td>
                                                    <td class="active">药品</td>
                                                    <td class="active">用法</td>
                                                    <td class="active">天数</td>
                                                    <td class="active">数量</td>
                                                    <td class="active">备注</td>
                                                    <td class="active">单价</td>
                                                </tr>
                                            </tbody>--%>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="bottom_close" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="submitPrescirbeAndDetail">确认</button>
                </div>
            </div>
        </div>
    </div>


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

                </div>
            </div>
        </div>
    </div>






   <%--这个是药品查询--%>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">药品查询</h4>
                </div>
                <div class="modal-body">
                    <div class="row" style="position: relative;">
                        <div class="form-group" style="position: absolute;">
                            <label >查询药品类别</label>
                            <input type="email" class="form-control" id="categoryProduct" width="30%" />
                        </div>
                        <div class="form-group" style="position: absolute;">
                            <input type="text" class="form-control" id="search"  />
                            <input type="button" class="form-control" id="btn_search" value="搜索" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
        </div>
     </div>
    </div>


    <!-- 处方详情的添加 -->
    <div class="modal fade" id="add_prescription" tabindex="700" style="z-index: 7000" role="dialog" aria-labelledby="myModalLabe">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 396px;">
                <div class="modal-header">
                    <button type="button" class="close"  id="priscribe_close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLab">添加处方详情</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="prescribeDetail">
                        <div class="form-group">
                            <label for="prescri_id" class="col-sm-2 control-label">编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="prescri_id"  readonly='readonly' name="prescri_id">
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">药品类别</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="category" name="category">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">药品名称</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="product" name="product">
                                    <option value="0">请选择</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">用法</label>
                            <div class="col-sm-10" style="border:0px solid red;position: relative;">
                                <label class="radio-inline" style="position:absolute;left: 17px;">
                                    <input type="radio" name="use" id="inlineRadio1" value="口服"> 口服
                                </label>
                                <label class="radio-inline" style="position:absolute;left: 82px;">
                                    <input type="radio" name="use" id="inlineRadio2" value="外服"> 外服
                                </label>
                                <label class="radio-inline" style="position:absolute;left: 157px;">
                                    <input type="radio" name="use" id="inlineRadio3" value="注射"> 注射
                                </label>
                            </div>
                        </div>

                <%--        <div class="form-group">
                            <label for="use" class="col-sm-2 control-label">用法</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="use" name="use">
                            </div>
                        </div>--%>
                       <%-- 按照每天几次，每次多少量，多少数量的药，到底吃几天，医生不管--%>
                        <div class="form-group">
                            <label for="time" class="col-sm-2 control-label">天/次</label>
                            <div class="col-sm-10" style="position: relative;left: -40px;">
                                <input type="button"  value="+" style="width: 34px;height: 31px;margin-left: 42px;position: absolute;" class="form-control" id="add_time" name="add_time">
                                <input type="text" style="width: 64px;height: 31px;position: absolute;left: 92px;" value="1" class="form-control" id="time" name="time">
                                <input type="button" value="-"  style="width: 34px;height: 31px;position: absolute;left: 158px;" class="form-control" id="minus_time" name="minus_time">
                            </div>
                        </div>
                  <%--      <div class="form-group">
                            <label for="number" class="col-sm-2 control-label">次/量</label>
                            <div class="col-sm-10" style="position: relative;left: -40px;">
                                <input type="button"  value="+" style="width: 34px;height: 31px;margin-left: 42px;position: absolute;" class="form-control" id="add_per" name="add_per">
                                <input type="text" style="width: 64px;height: 31px;position: absolute;left: 92px;" value="1" class="form-control" id="per" name="per">
                                <input type="button" value="-"  style="width: 34px;height: 31px;position: absolute;left: 158px;" class="form-control" id="minus_per" name="minus_per">
                            </div>
                        </div>--%>


                        <div class="form-group">
                            <label for="per" class="col-sm-2 control-label">次/量</label>
                            <div class="col-sm-10" style="width: 83.333333%;">
                                <input type="text" class="form-control" id="per" name="per" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="number" class="col-sm-2 control-label">数量</label>
                            <div class="col-sm-10" style="position: relative;left: -40px;">
                                <input type="button"  value="+" style="width: 34px;height: 31px;margin-left: 42px;position: absolute;" class="form-control" id="add" name="add">
                                <input type="text" style="width: 64px;height: 31px;position: absolute;left: 92px;" value="1" class="form-control" id="number" name="number">
                                <input type="button" value="-"  style="width: 34px;height: 31px;position: absolute;left: 158px;" class="form-control" id="minus" name="minus">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="comment" class="col-sm-2 control-label">备注</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="comment" name="comment">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="price" class="col-sm-2 control-label">单价</label>
                            <div class="col-sm-10">
                                <input type="hidden" class="form-control" id="origin_price" name="price">
                                <input type="text" class="form-control" id="price" name="price">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="prescri_btn">确定</button>
                </div>
            </div>
        </div>
    </div>



    <!-- 这个是填写好处方后，医生填写病例的信息-->
    <div class="modal fade" id="history_patient" tabindex="0" style="z-index: 7000" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 396px;">
                <div class="modal-header">
                    <button type="button" class="close"  id="history_close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="history">填写病人的病例信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="historyDetail">
                        <div class="form-group">
                            <label for="historyId" class="col-sm-2 control-label">编号</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="historyId"  readonly='readonly' name="historyId">
                            </div>
                        </div>

                        <div class="form-group">
                            <label  class="col-sm-2 control-label">病人姓名</label>
                            <div class="col-sm-10">
                                <input type="hidden" class="form-control" value="" id="patient_id" name="patient_id">
                                <input type="text" class="form-control" id="patient_name" name="patient_name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="comment" class="col-sm-2 control-label">内容</label>
                            <div class="col-sm-10">
                                 <textarea   name="history_content" id="history_content" class="form-control" rows="2" style="width: 298px;height: 100px;" placeholder="请你填写病例内容"></textarea>
                            </div>
                        </div>

                        <div class="form-group" style="position: relative;">
                            <div class="form-group" style="border: 0px solid red;position: absolute;right: 15px;">
                                <span for="_comment" class="control-label" style="margin-top: -3px;">诊断时间:</span>
                                <span for="_comment" class="control-label" style="margin-top: -3px;" id="history_nowtime"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="history_close_btn" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="history_btn">确定</button>
                </div>
            </div>
        </div>
    </div>

</center>
</body>
<script type="text/javascript">

//这部分是诊断时间的代码
$(function () {
    var t = null;
    t = setTimeout(time, 1000);//開始运行
    function time() {
        clearTimeout(t);//清除定时器
        dt = new Date();
        var year = dt.getFullYear();
        var month = dt.getMonth() + 1;//(0-11,0代表1月)
        var date = dt.getDate();//获取天
        var num = dt.getDay();//获取星期
        var weekday = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];
        var hour = dt.getHours();//获取时
        var minute = dt.getMinutes();//获取分
        var second = dt.getSeconds();//获取秒
        //分秒时间是一位数字，在数字前补0。
        date = extra(date);
        month = extra(month);
        minute = extra(minute);
        second = extra(second);
        var str= year + " 年 " + month + " 月 " + date + " 日 " + hour + "：" + minute + "：" + second + " " + weekday[num];
        $("#nowtime").html (str);  //这个是处方时间信息
        $("#history_nowtime").html (str); //这个是病例时间信息
        t = setTimeout(time, 1000); //设定定时器，循环运行
    }

});
//补位函数。
function extra(x) {
    //如果传入数字小于10，数字前补一位0。
    if (x < 10) {
        return "0" + x;
    }
    else {
        return x;
    }
}

$(function () {


    //在处方里面，点击添加按钮 ，这个跳出处方详情的页面
    $("#addbtn_prescription").on('click', function () {
        //$('#secondmodal').modal();
        $("#add_prescription").modal();
        //alert("come in");
    });

     setInterval(function () {
         var totalPrice= $("#totalPrice").text();
         var temp=totalPrice;
        var prices = $("input[name='detailprice']");
        var total=0;
        if (prices.length>0){
            for (var i=0;i<prices.length;i++){
                var value=prices[i].value;
                var indexOf = value.indexOf("RMB");
                value=value.substring(0,indexOf);
                total+=parseFloat(value);
            }
            if (total==0){
                $("#totalPrice").text("无");
            }else{
                //因为随时都要添加这个处方的详情的信息，当再次添加处方的详情的时候，
                //上次的总价格，与这个次的总价个，又不同，所以马上比较，发现这个不同，替换
                if (parseFloat(temp)!=total){
                    //total="￥:"+total;
                    $("#totalPrice").text(total);
                }
            }
        }else{
            //如果初次加载或者删除完了后，那么这个为0
            //total="￥:"+total;
            $("#totalPrice").text(total);
        }
         console.log("total="+total);
    },100);



     //这个是医生提交处方信息得函数，以及提交处方信息后，填写病例得信息
    $("#submitPrescirbeAndDetail").click(function () {

        //这个是哪个医生开的处方：
        var doctor_id= $("#doctorid").val();

        //得到的数据都是选中的数据
        var checkboxs=$("input[name='checkbox']:checked");
        var uid=checkboxs[0].value;

        //点击获取挂号的编号：
        var appointid= uid;

        //这个处方是哪个病人的处方：这个是根据挂号编号拼接而成的
        var patient_id=$("#patientid"+appointid).val();


        //这个是处方编号：
        var id= $("#prescription_id").text().trim();

        //这个是诊断内容：
        var prescription_content=$("#prescription_content").val();

        //医嘱：
        var doctor_comment=$("#doctor_comment").val();

        //下面是为了获取医生填写得处方的详情信息
        var obj=$("#table_content");

        var prescri_id=obj.find("input[name='prescrid']");

        var proId=obj.find("input[name='proId']");

        var use=obj.find("input[name='use']") ;
       // alert("use"+JSON .stringify( use ));
        var time=obj.find("input[name='time']");
        var per=obj.find("input[name='per']");
        //var day=obj.find("input[name='day']");//这个字段已经废除！

        var _number=obj.find("input[name='number']");

        var comment=obj.find("input[name='comment']");

        var detailprice=obj.find("input[name='detailprice']");


        //这个是为了获取处方的总的价格，为了提交到缴费单里面
        var totalPrice= $("#totalPrice").text();

        var data =[];
        var count=prescri_id.length;
        //这个判断是为了判断这个处方详情的信息：
        if ((proId.length>0&&use.length>0&&use.length>0&&_number.length>0&&comment.length>0&&detailprice.length)&&
            (proId.length==use.length)&&(use.length==_number.length)&&(comment.length==detailprice.length)
        ){
            var number=prescri_id.length;
            for (var i=0;i<number;i++){
                 var row={id:prescri_id[i].value,product_id:proId[i].value ,number:_number[i].value,use:use[i].value,time:time[i].value,per:per[i].value,comment:comment[i].value};
                 data.push(row);
            }
            //这个是为了判断这个处方的整体信息：
            if (prescription_content != null && prescription_content != "" &&
                doctor_comment!=null&&doctor_comment!=""&&id!=null&&id!=""&&patient_id!=null&&
                patient_id!=""&&doctor_id!=null&&doctor_id!=""
               ){
                //这个函数的提交有两个目的：

               /*
                   成功提交处方的信息后
                  1:将数据插入到处方的详情里面去
                  2:处方提交后，需要药剂师审核，审核通过后，可以自动的生成这个需要的缴费单信息
                   不通过通知医生修改处方信息，就是重回医生端
                  :
                */

                $.ajax({
                    type:"GET",
                    url:"${pageContext.request.contextPath}/admin/doctor/submitPrescriptionInfo",
                    data:{
                        "id":id,"doctor_id":doctor_id,
                        "content":prescription_content,
                        "comment":doctor_comment,"patient_id":patient_id,
                        "data":JSON.stringify(data),
                        "totalPrice":totalPrice
                    },
                    dataType:"JSON",
                    success:function (data) {
                        if (data!=null&&data!=""){
                             //思路：提交完处方后，跳出框让其填写病例史
                             //填写病例后修改这个处方里面的一个字段
                            var type=data.type;
                            if(type=='success') {
                                 alert("处方填写成功");

                                //这个是获取点击病人的信息
                                $("#patient_id").val( $("#patientid"+appointid).val());
                                $("#patient_name").val( $("#patientname"+appointid).val());

                                //病例的id编号
                                var checkboxs=$("input[name='checkbox']:checked");//得到的数据都是选中的数据
                                var  menuid=$("input[name='menuid']").val();
                                var uid=checkboxs[0].value;
                                var date=new Date();
                                var id=uid+date.getTime(); //作为遍历编号id
                                $("#historyId").val(id);

                                //填写完处方后，显示这个病例的框子
                                $("#history_patient").modal("show");


                                //这个是填写好病例的信息，然后提交数据
                                //填写好病历，同时将刚才的处方的编号的信息修改，添加historyid字段的
                                //此时利用  var id= $("#prescription_id").text().trim();这个作为where查询的条件
                                $("#history_btn").click(function () {
                                    var history_content = $("#history_content").val();
                                    if(history_content!=null&&history_content!=""){
                                        var historyId = $("#historyId").val();
                                        var patient_id = $("#patient_id").val();
                                        // var patient_name = $("#patient_name").val();
                                        var prescription_id= $("#prescription_id").text().trim();
                                        if (historyId!=null&&historyId!=""&&
                                            patient_id!=null&&patient_id!=""&&
                                            prescription_id!=null&&prescription_id!=""
                                        ){
                                            $.ajax({
                                                type:"GET",
                                                url:"${pageContext.request.contextPath}/admin/doctor/submitHistoryByDoctor",
                                                data:{"id":historyId,"patient_id":patient_id,"content":history_content,"prescription_id":prescription_id},
                                                dataType:"JSON",
                                                success:function (data) {
                                                    if (data!=null&&data!=""){
                                                        $("#historyId").val("");
                                                        var  type=data.type;
                                                        if (type=='success'){
                                                            alert("病例填写成功");

                                                            $("#table_history_info").html("");
                                                            $("#history_close_btn").trigger("click");
                                                            $("#bottom_close").trigger("click");

                                                        } else if (type=='fail'){
                                                            alert("病例填写失败");
                                                        }
                                                    }
                                                } ,error:function (data) {
                                                    alert("病例数据的填写失败");
                                                }
                                            });
                                        }
                                    }else{
                                        alert("请你填写病例诊断的信息");
                                    }
                                });
                            }else if (type=='fail'){
                                alert("处方填写失败");
                            }
                        }
                    },error:function (data) {
                        alert("处方的信息插入失败");
                    }
                });
            }else {
                alert("请你填写医嘱和诊断的内容");
            }
        }else{
            alert("处方详情的内容有误!");
        }
        //  alert(JSON.stringify(data));
    });




    //这个是点击详情的页面
    $("#prescri_btn").click(function () {

        var prescri_id = $("#prescri_id").val();
        var product = $("select[name='product'] option:selected").text();
        var pro_id = $("select[name='product'] option:selected").val();

         var use= $('input:radio[name="use"]:checked').val();
       // alert("use="+use);
      //  var day=$("#day").val();
        var time=$("#time").val();
        var per=$("#per").val();

        var number=$("#number").val();
        var comment=$("#comment").val();
        var price=$("#price").val();
        if (prescri_id!=null&&prescri_id!=""&&product!=null&&product!="" && !(product=="请选择") && use!=null&&use!=""
           &&number!=null&&number!=""&&comment!=null&&comment!=""&&price!=null&&price!=""&&per!=null&&per!=""&&time!=null&&time!=""
        ){
                  //这个里面td里面的数据是为了给用户看的，但是数据的提交到后台是input里面的数据，
                 //为了方便获取数据，从而将这个td后面加上input标签，存放数据
                 var info="<tr name='detailPrescirbeContent'><td><input type='checkbox'  value='"+prescri_id+"'/></td>" +
                                "<td>"+prescri_id+"</td><input name='prescrid' type='hidden' value='"+prescri_id+"'/>"+
                                " <td>"+product+"</td><input name='proId' type='hidden' value='"+pro_id+"'/>"+
                                " <td>"+use+"</td><input name='use' type='hidden' value='"+use+"'/>"+
                                 " <td>"+time+"</td><input name='time' type='hidden' value='"+time+"'/>"+
                                 " <td>"+per+"</td><input name='per' type='hidden' value='"+per+"'/>"+
                               /* " <td>"+day+"</td><input name='day' type='hidden' value='"+day+"'/>"+*/
                                " <td>"+number+"</td><input name='number' type='hidden' value='"+number+"'/>"+
                                " <td>"+comment+"</td><input name='comment' type='hidden' value='"+comment+"'/>"+
                                " <td >"+price+"</td><input name='detailprice' type='hidden' value='"+price+"'/>" +
                                "<td><button type=\"button\" class=\"close\"  name=\"btn_item_close\">" +
                                    "<span aria-hidden=\"true\">&times;</span></button></td></tr>";
                  // alert(info);
            $("#table_content").append(info);

            //前端jquery删除一行数据元素
            $("button[name='btn_item_close']").click(function () {
                $(this).parent().parent().remove();
            });

            //对于二级模态框，二级模态框关闭，一级就不能滚动了，怎样解决这个问题？？
            //关闭这个二级之前，给这个一级模态框加上滚动的属性，就可以
            $('#prescri_btn').click(function() {
                $('#_myModal_prescription').css({'overflow-y':'scroll'});
            });

            //点击确定，让它自动点击这个关闭按钮
            $("#priscribe_close").trigger("click");

        }else{
            alert("请你填写好数据才能提交");
        }
    });


   //这个是每天服药的次数
    $("#time").blur(function () {
        var time=parseInt($("#time").val());
        if (isNaN(time)){
            time=1;
            $("#time").val(time);
        }
        var selected = $("select[name='product'] option:selected").val();
        if (parseInt(selected)!=0){
            if (time<1){
                alert("数量至少为1");
                return;
             }
        }else {
             alert("请你先选择具体的药品，才能选择具体的数量");
             return;
        }
    });

    //这个每天服药的次数减法
    $("#minus_time").click(function () {
        var selected = $("select[name='product'] option:selected").val();
        if (parseInt(selected)!=0){
            var time=$("#time").val();
            if (check(time)){
                time=parseInt($("#time").val());
                if (time==1){
                    alert("不能继续减少了，最低为1");
                    return;
                }else if (time>1) {
                    time=time-1;
                    $("#time").val(time);
                }
            } else{
                //此时当医生输入选中了药品，但是这个药品的服药次数被修改了为非数字，此时
                //提示用户
                alert("你输入的数量必须为纯数字");
            }
        }else{
            alert("请你先选择具体的药品，才能选择具体的数量");
            return;
        }
    });

    //这个每天服药的次数加法
    $("#add_time").click(function () {
        var time=$("#time").val();
        if (check(time)){
            time=parseInt($("#time").val());
            var selected = $("select[name='product'] option:selected").val();
            if (parseInt(selected)!=0){
                time=parseInt(time)+1;
                $("#time").val(time);
            }else{
                alert("请你先选择具体的药品，才能选择具体的数量");
                return;
            }
        } else{
            alert("你输入的数量必须为纯数字");
        }
    });


    //判断文本框是不是数字的函数
    function check(value){
        var reg=/^[1-9]\d*$|^0$/;
        if(reg.test(value)==true){
            return true;
        }else{
            return false;
        }
    }


        //这个天数的填写
        $("#day").blur(function () {
            var day = $(this).val();
           if (check(day)){
               if (parseInt(day)<1){
                   alert("天数至少为1天");
               }
           } else{
               alert("你输入的天数，必须为数字，不能包含文字");
           }
        });




        //这个是直接输入数量，然后点击文本框
        $("#number").blur(function () {
            //判断isNaN:是为了当你医生是一个傻逼的时候，把这个数量改为空，那么这个为失去焦点的时候，默认给number为1
            //不然在已经选择了药品的情况下，计算出来价格仍然是一个错误值
            var number=parseInt($("#number").val());
            if (isNaN(number)){
                number=1;
                parseInt($("#number").val(number))
            }
            var selected = $("select[name='product'] option:selected").val();
           // alert("selected="+selected);
            if (parseInt(selected)!=0){
                if (number<1){
                    alert("数量至少为1");
                 } else{
                    var price=parseFloat($("#origin_price").val())*number;
                    $("#price").val(price+"RMB");
                }
            }else {
                alert("请你先选择具体的药品，才能选择具体的数量");
                return;
            }
        });

        //这个是点击数据减少
        $("#minus").click(function () {
            var selected = $("select[name='product'] option:selected").val();
            if (parseInt(selected)!=0){
                    var number=$("#number").val();
                if (check(number)){
                    number=parseInt($("#number").val());
                    if (number==1){
                        alert("不能继续减少了，最低为1");
                        return;
                    }else if (number>1) {
                        number=number-1;
                        $("#number").val(number);
                        var price=parseFloat($("#origin_price").val())*number;
                        $("#price").val(price+"RMB");
                    }
                } else{
                    alert("你输入的数量必须为纯数字");
                }
            }else{
                alert("请你先选择具体的药品，才能选择具体的数量");
                return;
            }
        });
      //这个是点击数量增加
        $("#add").click(function () {
            var number=$("#number").val();
            if (check(number)){
                number=parseInt($("#number").val());
                var selected = $("select[name='product'] option:selected").val();
                if (parseInt(selected)!=0){
                    number=parseInt(number)+1;
                    $("#number").val(number);
                    var price=parseFloat($("#origin_price").val())*number;
                    $("#price").val(price+"RMB");
                }else{
                    alert("请你先选择具体的药品，才能选择具体的数量");
                    return;
                }
            } else{
                alert("你输入的数量必须为纯数字");
            }
     });


        //这个是在处方单里面的，添加按钮，触发的函数，添加处方的详情
        $("#addbtn_prescription").click(function () {
            //只要医生一点击这个添加，我默认一个药品的用法
            $("#inlineRadio1").attr("checked",true);

            //alert("come in");
            var checkboxs=$("input[name='checkbox']:checked");
            var  menuid=$("input[name='menuid']").val();
            var uid=checkboxs[0].value;
            $("#prescri_id").val("");//这个是每次点添加详情的时候，清除掉上次的处方详情id编号
            var drid= $("#doctorid").val();
            var date= new Date().getTime();
            var id= $("#doctorid").val()+uid;
            $("#prescription_id").val(id);

            var item_id = $("#doctorid").val()+uid+date;//医生的id加上病人的id为处方的id+加上每次操作的时间的毫秒数据做为每次的处方详情的id编号
          //  alert(id);
          //  var id=uid+drid;//这个为医生的id加上病人的id为处方的id

            $("#prescri_id").val(item_id);//加处方的id，加到处方详情的框里面

            //这个是点击处方里面的，添加按钮，然后医生开处方详情时，查询具体的药品类别
              $.ajax({
                 type:"GET",
                 url:"${pageContext.request.contextPath}/admin/doctor/findProductCategory",
                 dataType:"JSON",
                 success:function (data) {
                     if (data!=null&&data!=""){
                          var type=data.type;
                          if (type=='success'){
                              $("#category").empty();
                              $("#category").append("<option value='0'>请选择</option>");
                              var products=data.products;
                              if (products.length>0){
                                  //alert("come in");
                                  for (var i=0;i<products.length;i++){
                                      $("#category").append("<option value='"+products[i].id+"'>"+products[i].name+"</option>");
                                  }
                              }
                              //这个是根据药品的类别，获得具体的药品
                              $("#category").change(function () {
                                  var id=$(this).val();
                                //  alert("id="+id);
                                  if (id!=0){
                                      $.ajax({
                                          type:"GET",
                                          url:"${pageContext.request.contextPath}/admin/doctor/findProductByCategoryId",
                                          data:{"id":id},
                                          dataType:"JSON",
                                          success:function (data) {
                                              if (data!=null&&data!=""){
                                                  var type=data.type;
                                                  if (type=='success'){
                                                      $("#product").empty();
                                                      $("#product").append("<option value='0'>请选择</option>");
                                                      var prods=data.product;
                                                      if (prods.length>0){
                                                          for (var i=0;i<prods.length;i++){
                                                              $("#product").append("<option value='"+prods[i].id+"'>"+prods[i].name+"</option>");
                                                          }
                                                      }
                                                  }  else if(type=='fail'){
                                                      alert("根据类别查询药品失败");
                                                  }
                                              }
                                          },error:function (data) {
                                              alert("查询药品信息失败");
                                          }
                                      });
                                  }
                              });

                              //这个是根据具体药品的，获得该药品的价格
                              $("#product").change(function () {
                                  var id=$(this).val();
                                  //  alert("id="+id);
                                  if (id!=0){
                                      $.ajax({
                                          type:"GET",
                                          url:"${pageContext.request.contextPath}/admin/doctor/findProductDetailsById",
                                          data:{"id":id},
                                          dataType:"JSON",
                                          success:function (data) {
                                              if (data!=null&&data!=""){
                                                  var type=data.type;
                                                  if (type=='success'){
                                                         var productDetail=data.productDetail;
                                                         $("#origin_price").val(productDetail.price);//这个是原始的单价，隐藏起来，待会要利用它计算
                                                        // $("#price").val(productDetail.price+"RMB"); //这个是显示在页面上单价

                                                      //这个是选择了，具体的药品，马上获得这个number默认的数量，然后，载入马上加载价格是多少
                                                      //而后面的函数是通过操作的事件控制这个数量的多少的
                                                      var number=parseInt($("#number").val());
                                                      //这个样判断是为了当选择好了具体的药品的时候，虽然数量默认为1，但是这个数量被修改为空，也就是默认值被人为改了
                                                      //那么此时给它一个默认值为1
                                                     // alert("number="+number);
                                                      if (isNaN(number)){
                                                          number=1;
                                                          parseInt($("#number").val(number))
                                                          //如果这个不是数字成立，说明这个var number，这个类型不是数字类型，而你在这赋值为数字，这个var，变成了数字类型
                                                          //证明了这个var定义的变量的类型，根据具体的数据类型而动态地变动！
                                                          //alert("不是数字");
                                                      }
                                                      var selected = $("select[name='product'] option:selected").val();
                                                      if (parseInt(selected)!=0&&number>=1){
                                                          var price=parseFloat($("#origin_price").val())*number;
                                                          $("#price").val(price+"RMB");
                                                      }
                                                  }  else if(type=='fail'){
                                                      alert("根据类别查询药品失败");
                                                  }
                                              }
                                          },error:function (data) {
                                              alert("查询药品信息失败");
                                          }
                                      });
                                  }

                              });
                          } else if(type=='fail'){
                              alert("查询药品类别失败");
                          }
                     }
                 },error:function (data) {
                     alert("响应数据失败");
                  }
              });
        });

        //点击一级模态框的关闭按钮的时候
       $("#bottom_close").click(function () {
            $("#prescription").removeAttr("data-target");
        });

        //点击一级模态框的关闭按钮的时候
        $("#auto_close").click(function () {
            $("#prescription").removeAttr("data-target");
        });


        //这个是点击开处方按钮的函数，
        // 这个不仅仅是跳出这个模态框还查询该人以前的处方的信息，然后
        //显示在历史记录上
        $("#prescription").dblclick(function () {
             //这个是清除处方里面的处方详情的内容
            $("#table_content tr").not(':eq(0)').empty();
            $("#doctor_comment").empty();
            $("#prescription_content").empty();

            //这个是清除掉这个历史记录
            $("#table_history_info").empty();
           //得到的数据都是选中的数据
            var checkboxs=$("input[name='checkbox']:checked");

            var uid=checkboxs[0].value;

            var date=new Date();

            if (uid!=null&&uid!=""){
               var id=uid+date.getTime(); //将这个id作为这个处方的编号
               $("#prescription_id").text(id);

               //同时根据这个病人id,查询出此病人的以前的处方信息，加载到处方历史上显示出来
               var patient_id=$("#patientid"+uid).val();
              // alert(patient_id);
               if (patient_id!=null&&patient_id!=""){
                   $.ajax({
                       type:"GET",
                       url:"${pageContext.request.contextPath}/admin/doctor/findPrescriptionsByPatientId",
                       data:{"id":patient_id},
                       dataType:"JSON",
                       success:function (data) {
                           if (data!=null&&data!=""){
                               var type=data.type;
                             //  alert("comie ind");
                               if (type=='success'){
                                   var  prescriptions=data.prescriptions;
                                 //  alert(JSON.stringify(prescriptions));
                                          if (prescriptions!=null&&prescriptions!=""){
                                               for (var i=0;i<prescriptions.length;i++){

                                                   var head="<tr>" +
                                                       "            <td class=\"active\">处方编号</td>\n" +
                                                       "            <td class=\"active\" colspan=\"8\">"+prescriptions[i].id+"</td>\n" +
                                                       "          </tr>\n" +
                                                       "      <tr id='"+prescriptions[i].id+"'>\n" +
                                                       "           <td class=\"active\">编号</td>\n" +
                                                       "            <td class=\"active\">药品</td>\n" +
                                                       "             <td class=\"active\">用法</td>\n" +
                                                       "              <td class=\"active\">天/次</td>\n" +
                                                       "              <td class=\"active\">次/量</td>\n" +
                                                       "             <td class=\"active\">数量</td>\n" +
                                                       "             <td class=\"active\">备注</td>\n" +
                                                       "             <td class=\"active\">单价</td>\n" +
                                                       "</tr>";

                                                   $("#table_history_info").append(head);

                                                   //这个是为了每个处方的处方详情
                                                   var itemprescrips=prescriptions[i].itemprescription;

                                                 if(itemprescrips!=null&&itemprescrips!=""){
                                                       for (var j=0;j<itemprescrips.length;j++){
                                                            var   tbody ="<tr>\n" +
                                                                   "       <td >"+itemprescrips[j].id+"</td>\n" +
                                                                   "       <td >"+itemprescrips[j].product.name+"</td>\n" +
                                                                   "       <td>"+itemprescrips[j].use+"</td>\n" +
                                                                   "       <td >"+itemprescrips[j].time+"</td>\n" +
                                                                   "       <td >"+itemprescrips[j].per+"</td>\n" +
                                                                   "       <td >"+itemprescrips[j].number+"</td>\n" +
                                                                   "       <td >"+itemprescrips[j].comment+"</td>\n" +
                                                                   "       <td>"+(parseInt(itemprescrips[j].number)* parseFloat(itemprescrips[j].product.price))+"</td>" +
                                                                      "</tr>\n";

                                                           $("#table_history_info").append(tbody);
                                                       }
                                                   }
                                               }
                                           }
                               }else if (type=='fail'){
                                   alert("处方历史记录查询失败");
                               }
                           }
                       },error:function (data) {
                           alert("处方历史记录响应失败");
                       }
                   });
               }
           }
        });


        //这个是医生点击处方的按钮触发的函数
        $("#prescription").click(function () {
            var checkboxs=$("input[name='checkbox']:checked");
            if (checkboxs.length==0){
                alert("编辑之前请你选择一项数据");
                return;
            } else{
                 $("#prescription").attr("data-target","#_myModal_prescription");
                 $("#prescription").trigger("dblclick");
            }
        });


        //这个是医生按照时间排序的操作
        $("input[name='sortbytime']").click(function () {
            var search="sort";
            var conditon="排序";
            var  menuid=$("#menuid").val();
            window.location.href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?search="+search+"&&menuid="+menuid+"&&condition="+conditon;
        });






          //这个是医生停止挂号和继续挂号操作的按钮
         $("#stop").click(function () {
            var value=$(this).val();
            var id=$("#doctorid").val();
           // alert("id="+id);
            var status;
           // alert(id);
             if (value=='停止挂号'){
                 //btn btn-default
                 $(this).removeClass("btn btn-default");
                 $(this).addClass("btn btn-danger");
                 $(this).val("继续挂号");
                 status=1;
             } else  if (value=='继续挂号'){
                 $(this).removeClass("btn btn-danger");
                 $(this).addClass("btn btn-default");
                 $(this).val("停止挂号");
                 status=0;
             }
             $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/admin/doctor/updateDoctorWorkInfoById",
                data:{"id":id,"status":status} ,
                 dataType:"JSON",
                 success:function (data) {
                    if (data!=null&&data!=""){
                        var  type=data.type;
                        if (type=='success'){
                            var status=data.status;
                            if (status==1){
                                alert("已经停止挂号!");
                            }else if (status==0){
                                alert("继续正常挂号");
                            }
                        }else if (type=='fail'){
                            alert("操作失败，请你重新操作");
                        }
                    }
                 },error:function (data) {
                     alert("停止挂号函数响应失败");
                 }
             });
         });



       //将数据从后台查询出来，马上按照性别修改数据
        var find = $("#tableInfo").find("input[name='checkbox']");



      //这个是得到的挂号时间与现实时间做差，得到等待的时间，然后让这个时间动态地显示到页面上
     var timer = setInterval(function () {
            if (find!=null&&find!=""){
                for (var i=0;i<find.length;i++){
                    var id=find[i].value;
                    //这个是将获得接诊的按钮，是没有点击接诊的按钮，让他们倒计时，计算时间
                    //而已经点击了的，那么直接通过这个if过滤掉
                    if($("#confirm"+id+"").prop("disabled") == false){
                        var datetime = $("input[name="+id+"]").val();//根据id，拿到这个挂号的时间
                        //alert(datetime);
                        var number = toDateTime(datetime);//转化为毫秒
                        var  now=new Date();
                        var now_long=now.getTime();
                        var number1 = now_long-number;  //与现在时间做差
                        //这个存放这样的逻辑：
                        //1：如果这个病人挂该医生的号的挂号时间，在该医生登录系统查看之前，那么现在的时间减去挂号的时间为负值
                        //那么这个赋值是不能转化为，正常的时间的

                        //2:如果这个病人挂号的时间，在医生登录该系统查看病人的时候之前，那么现在的时间减去以前的时间为正数
                          if(number1 >0){
                              var convertToTime = ConvertToTime(number1); //转化为时间格式
                              $("#tableInfo").find("td[name='waitime"+id+"']").html(convertToTime); //赋值为对应的表格位置
                          }
                          //如果后台数据库被修改了，现在时间与后台时间做差小于0，那么显示时间被修改
                          else {
                              $("#tableInfo").find("td[name='waitime"+id+"']").html("挂号时间被人修改");
                          }
                    }
                }
            }
        },1000);



     //这个是将转化成毫秒的时间，转化为时分秒的格式的数据
        function ConvertToTime(mss) {
            var days = parseInt(mss / (1000 * 60 * 60 * 24));
            var hours = parseInt((mss % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = parseInt((mss % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = (mss % (1000 * 60)) / 1000;
            var str=days + " 天 "+hours + " 小时 "+minutes + " 分钟 "+seconds + " 秒 ";
            //alert(str);
            var  time="";   //注意：var time="",表示这个数据类型为字符串类型，而var time，为无类型，，这两个之间有很大的区别
                if (days>0){
                    time +=days + " 天 ";
                }  if(hours>0){
                    time +=hours + " 小时 ";
                } if (minutes>0){
                    time +=minutes + " 分钟 ";
                }  if (seconds>0){
                    time +=seconds + " 秒 ";
                }
            return time;
        }


        //这个是将得到的date的时间，转化为毫秒
        function toDateTime(time){
            var str=time.split(" ");
            var strDate=str[0].split("-");
            var strTime=str[1].split(":");
           // alert("strDate"+strDate+"  "+"strTime"+strTime);
             var date=new Date(strDate[0],(strDate[1]-parseInt(1)),strDate[2],strTime[0],strTime[1],strTime[2])
             var  long=date.getTime();
           return long;
        }

        //这个是医生点击接诊按钮的时候的函数
        $("button[name='confirm']").click(function () {
             var id=$(this).val();
             var  btn=$(this);     //临时存储，后面要用这个变量
                if(id!=null&&id!=""){
                    var waitime = $("#tableInfo").find("td[name='waitime"+id+"']").text();
                    var  menuid=$("input[name='menuid']").val();
                    //将这个等待的时间，存放到后台里面，然后再次响应页面的时间，将这个数据显示在页面上
                  //  alert("waitime="+waitime);
                    $.ajax({
                        type:"GET",
                        url:"${pageContext.request.contextPath}/admin/doctor/doctorsClickForAppointment",
                        data:{"id":id,"waitime":waitime},
                        dataType:"JSON",
                        success:function (data) {
                            if (data!=null&&data!=""){
                                var type=data.type;
                                if (type=='success'){
                                    var waitime=data.waitime;
                                    if (waitime!=null&&waitime!=""){
                                        $("#tableInfo").find("td[name='waitime"+id+"']").html(waitime);
                                    }
                                   btn.attr("disabled",true);
                                    //将这个按钮同时置为不可用的状态，而上面的定时器是将按钮可用的状态的数据，不断地
                                    //调用，不断地动态显示时间
                                    alert("操作成功");
                                    //这个是医生接诊成功后，再次查询这个页面
                                    window.location.href="${pageContext.request.contextPath}/admin/doctor/findPatientOfAppointment?menuid="+menuid;

                                } else if(type=='fai1'){
                                    alert("接诊操作失败");
                                } else if(type=='error'){
                                    alert("传递数据到后台失败");
                                }
                            }
                        },error:function (data) {
                            alert("从后台响应到前端失败");
                        }
                    });
            }
        });


        //在前端页面选择条件，然后按照条件查询数据，返回前端页面的时候，这个前端页面显示的条件会改成默认的数据
        //显示为仍然是上次请求的数据
        //把从后台传递过来的条件，隐藏起来
          var condition = $("#condition").val();
          if (condition!=null&&condition!=""){
              if(condition=='诊断'){
                  condition="姓名";
              }
              var  value=condition+"<span class=\"caret\"></span>";
                  $("#appear_btn").html(value);
          }



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




       //双击一行，按照id，查询详细数据
        //获取表格中具体的表格，一般采用find，这个函数
        $("button[name='detail']").click(function () {
            //这个是每次点击这个详情的按钮的时候，清除之前的内容
            $("#maincontent").html("");
             var id=$(this).val();
            // alert("id="+id);
              if (id!=null&&id!=""){
                   //  alert("come in");
                      $.ajax({
                          type:"GET",
                          url:"${pageContext.request.contextPath}/admin/doctor/findPatientInfoById",
                          data:{"id":id},
                          dataType:"JSON",
                          success:function (data) {
                              var type=data.type;
                              if (type=='success') {
                                  var appointment=data.appointment;
                                  var  patient=appointment.patient;
                                  var d = new Date();
                                  var  birthday=patient.birthday;
                                   var strings = birthday.split("-");
                                   var year=parseInt(strings[0]);
                                  //获取年 
                                  var fullYear =parseInt(d.getFullYear());
                                  var age=fullYear-year;
                                  var datetime=appointment.datetime;
                                /*  var year = datetime.substring(0,9);
                                  var hours=datetime.substring(10,datetime.length);
                                 var str_datetime=year+" T"+hours;
                                   str_datetime=str_datetime.trim();
                                  alert("str_datetime="+str_datetime);*/

                            /*      var  str_datetime=year+"-"+month+"-"+strDate+"T"+dateHours+":"+dateMinutes;
                                  alert(str_datetime);*/

                                  var  content=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 100px;\">\n" +
                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"username\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"name\" class=\"form-control\" value="+ patient.name +" readonly='readonly'  id=\"name\" placeholder=\"姓名\">\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"number\" class=\"col-sm-2 control-label\">性别</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\" >\n" +
                                                                       "<input type=\"radio\" id=\"male\" name=\"sex\" style='margin-left: -146px;' value=\"0\" />男\n" +
                                                                       " <input type=\"radio\" id=\"female\" name=\"sex\" value=\"1\"  /> 女"+
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"fee\" class=\"col-sm-2 control-label\">就诊编号</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"number\" class=\"form-control\" id=\"fee\"  readonly='readonly' value= "+appointment.number +" />\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"content\" class=\"col-sm-2 control-label\">主诉</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <textarea  type=\"text\" name=\"content\" class=\"form-control\" readonly='readonly'  id=\"content\" >"+appointment.content+"</textarea>\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"age\" class=\"col-sm-2 control-label\">年龄</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"age\" class=\"form-control\" readonly='readonly' value='"+age+"' id=\"age\"  / >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"datetime\" class=\"col-sm-2 control-label\">初/复诊</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"radio\" name=\"status0\" style='margin-left: -146px;'   />初诊\n" +
                                      "                                <input type=\"radio\" name=\"status1\"  />复诊\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"status\" class=\"col-sm-2 control-label\">预约时间</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"date\" name=\"datetime\" class=\"form-control\" readonly='readonly' id=\"datetime\" value= "+ appointment.datetime +" />" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"telephone\" class=\"col-sm-2 control-label\">电话</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"telephone\" class=\"form-control\" readonly='readonly'  value= "+patient.telephone + " id=\"telephone\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"id_number\" class=\"col-sm-2 control-label\">身份证号</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"id_number\" class=\"form-control\"  readonly='readonly'  value= "+ patient.id_number +" id=\"id_number\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"address\" class=\"col-sm-2 control-label\">家庭地址</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"address\" class=\"form-control\" readonly='readonly' value= "+  patient.address +" id=\"address\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"job\" class=\"col-sm-2 control-label\">工作</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"text\" name=\"job\" class=\"form-control\"  readonly='readonly' value= "+ patient.work +" id=\"job\" >\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +

                                      "                        <div class=\"form-group\">\n" +
                                      "                            <label for=\"user\" class=\"col-sm-2 control-label\">婚姻</label>\n" +
                                      "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                      "                                <input type=\"radio\" style='margin-left: -146px;' name=\"marry1\"  />未婚\n" +
                                      "                                <input type=\"radio\"  name=\"marry2\" />已婚\n" +
                                      "                            </div>\n" +
                                      "                        </div>\n" +
                                      "</div>";


                                    $("#maincontent").html(content);


                                 //   alert(patient.is_marray+patient.status);
                                       //婚姻
                                      if (patient.is_marry==1){
                                          $("input[name='marry2']").attr("checked",true);
                                      } else if(patient.is_marry==0){
                                          $("input[name='marry1']").attr("checked",true);
                                      }
                                      //初诊，复诊
                                      if (appointment.status==0){
                                          $("input[name='status0']").attr("checked",true);
                                      } else if(appointment.status==1){
                                          $("input[name='status1']").attr("checked",true);
                                      }
                                      //性别：
                                      if (patient.sex=='男'){
                                          $("#male").attr("checked",true);
                                      } else if(patient.sex=='女'){
                                          $("#female").attr("checked",true);
                                      }
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
      /*  $("#searchvalue").dblclick(function () {
            var  menuid=$("#menuid").val();
            if (menuid!=null&&menuid!=""){
                window.location.href="/admin/doctor/selectPatientNumberInfo?menuid="+menuid;
            }
        });*/


        //获取下面的li里面的数据，而这个ul li这个标签自带下来列表，所以不用下拉下来的事件，
        //只要点击事件
        $("#menuls li").click(function () {
            var  value=$(this).text()+"<span class=\"caret\"></span>";
            if (value!=null&&value!=""){
                $("#appear_btn").html(value);
                var str="按照"+$(this).text()+"条件搜索";
                $("#searchvalue").attr("placeholder",str);
            }
        });


        $("#selectPatientByFlag").change(function () {
            var  id=$(this).val();
            var  menuid=$("#menuid").val();
            var  conditon="诊断";
            var search;
            if(id==0){
                search=0;
            } else if(id==1){
                search=1;
            }
            else if(id==-1){

            }
            window.location.href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?search="+search+"&&menuid="+menuid+"&&condition="+conditon;
        });


        //点击自动搜索按钮
        $("input[name='search']").click(function () {
            var  search=$("#searchvalue").val();
            var  conditon= $("#appear_btn").text();
            var  index=-1;
            var  menuid=$("#menuid").val();
           // alert("menuid="+menuid);
            var  startime=$("#startime").val();
            var  endtime=$("#endtime").val();

            if (search!=null&&search!=""){
                 if (conditon!=null&&conditon!=""){
                     if (conditon=="今天"){
                          alert("你选择今天，作为条件，请清除掉文本框里面的数据，才能进行检索");
                          return;
                     }
                     if (conditon=="全部"){
                         alert("你选择全部，作为条件，请清除掉文本框里面的数据，才能进行检索");
                         return;
                     }
                     //其他的条件。同时这个search不为空，
                     window.location.href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?search="+search+"&&menuid="+menuid+"&&condition="+conditon;
                 }

            }else{
             //   window.location.href="/admin/userForPatient/selectPatientNumberInfo?menuid="+menuid;
                //因为用户在按照今天和全部的条件检索的时候，此时这个用户是不输入任何的数据到文本框里面的，conditon:是可以获取对应的数据的
                // 而后台有search判断不为空，所以在前端的页面加上search默认的数据
                if (conditon=="今天"){
                    search="今天";
                    window.location.href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?search="+search+"&&menuid="+menuid+"&&condition="+conditon;
                } else  if (conditon=="全部"){
                    search="全部";

                    //只有在选择全部的时候，这个按照这个日期查询的话，这个才有意义
                    if (startime!=null&&startime!=""&&endtime!=null&&endtime!=""){
                        var start = new Date(startime.replace(/\-/g, "\/"));
                        var end=new Date(endtime.replace(/\-/g, "\/"));
                        if(start >=end){
                            alert("开始时间不能大于结束时间！");
                            return ;
                        }else{
                            window.location.href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?search="+search+"&&menuid="+menuid+"&&condition="+conditon+"&&startime="+start+"&&endtime="+end;
                            return;
                        }
                    }
                    window.location.href="${pageContext.request.contextPath}/admin/doctor/searchPatientsInfoByCondition?search="+search+"&&menuid="+menuid+"&&condition="+conditon;
                } else{
                    //可能选择了，非今天和全部，但是这个用户没有输入检索的关键字，那么提示它输入关键字，
                    //并且按照conditon条件，提示对应的关键字
                    var info="请你按照"+conditon+"作为检索条件，输入相关的数据，才能搜索";
                    alert(info);
                }
              //  window.location.href="/admin/userForPatient/searchPatientsInfoByCondition?search="+search+"&&menuid="+menuid+"&&conditon="+conditon;
            }
        });
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
