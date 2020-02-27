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
    <title>药品查询</title>
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
                        <td valign="bottom" class="title">药品查询</td>
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
                                <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4" style="border: 0px solid  red;margin-left: 2px; ">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button id="appear_btn" type="button" class="btn btn-default dropdown-toggle"
                                                    data-toggle="dropdown"
                                                    aria-haspopup="true" aria-expanded="false">药品类别<span
                                                    class="caret"></span></button>
                                            <ul class="dropdown-menu" id="menuls">
                                                <c:forEach items="${productCategory}" var="category">
                                                    <li id="${category.id}"><a href="#">${category.name}</a></li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <input type="text" placeholder="按照药品名称查询" id="searchvalue" class="form-control" aria-label="...">
                                    </div>
                                </div>

                                  <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                                     <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4" style="position: relative;">
                                        <input type="button"  name="search" width="60px" height="30px"
                                               class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
                                        </div>
                                    </div>
                            </div>
                            <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                            <input name="doctorid" type="hidden" value="${doctor.id}" id="doctorid"/>
                            <input name="condition" type="hidden" value="${condition}" id="condition"/>
                       </td>
                    </tr>
                </table>
           <br>


<%--                private Integer id;
                private String url;
                private  String name;
                private  Category_Product category_product;
                private String detail; //这个是药品的详情
                private Float price; //价格
                private int number;  //这个是现有的数量，这个是药房仓库用到的，医生开处方详情时候，用不到这个信息
                private  String content; //这个药品的适用症
                private String use;   //这个是使用量，剂量
                private String component; //成分
                private  String comment; //注意事项，可有可无
                private  String standards;--%>

                <c:if test="${list!=null}">
                    <table width="95%" border="0" cellpadding="2"  style="border: 0px solid red;" cellspacing="0" class="table01" id="tableInfo">
                        <tr>
                            <td class="td_top">图片</td>
                            <td class="td_top">名称</td>
                            <td class="td_top">价格</td>
                            <td class="td_top">数量</td>
                            <td class="td_top">适用症</td>
                            <td class="td_top">使用方法</td>
                            <td class="td_top">成分</td>
                          <%--  <td class="td_top">注意事项</td>--%>
                        </tr>
                        <c:forEach items="${list}" var="info">
                            <tr class="content">
                                <td class="td_01" ><img src="${pageContext.request.contextPath}${info.url}" style="width: 150px;height: 122px;" /></td>
                                <td class="td_01" >${info.name}</td>
                                <td class="td_01">${info.price}</td>
                                <td class="td_01">${info.number}</td>
                                <td class="td_01">${info.content}</td>
                                <td class="td_01">${info.use}</td>
                                <td class="td_01">${info.component}</td>
                           <%--     <td class="td_01">${info.comment}</td>--%>
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

<c:if test="${list!=null}">
            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${1}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>

                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${1}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${1}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage+1}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage-1}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage+1}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>

                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage-1}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.totalPage}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.totalPage}&&menuid=${menuid}&&value=${search}&&condition=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>
<%--
            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${1}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>

                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>

                            &lt;%&ndash; 这个是中间的情况&ndash;%&gt;
                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>


                            &lt;%&ndash;  当数据只有一个的时候，第一页与最后一页是重复的：为了避免这种情况的发生，加上!=1&ndash;%&gt;
                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.totalPage}&&menuid=${menuid}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?currentPage=${page.totalPage}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>--%>
</c:if>
</center>
</body>
<script type="text/javascript">

    $(function () {
        var id='';
        $("#menuls li").click(function () {
             id = $(this).attr("id");
            var  value=$(this).text()+"<span class=\"caret\"></span>";
            if (value!=null&&value!=""){
                $("#appear_btn").html(value);
                var str="按照"+$(this).text()+"条件搜索";
                $("#searchvalue").attr("placeholder",str);

            }
        });

        $("input[name='search']").click(function () {
            var value = $("#searchvalue").val();
            window.location.href="${pageContext.request.contextPath}/admin/doctor/doctorsfindProducts?value="+value+"&&condition="+id;
        });
    });



</script>
</html>
