<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>科室管理</title>
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
                        <td valign="bottom" class="title">科室管理</td>
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
                                </div>
                            </div>
                        </td>
                    </tr>
                  </table>
                <br>
                <c:if test="${lists!=null}">
                      <table class="table table-bordered" style="width: 1580px;">
                            <tr>
                                <td>
                                       选择
                                </td>
                                <td >编号</td>
                                <td >科室名称</td>
                                <td >门诊名称</td>
                            </tr>
                        <c:forEach items="${lists}" var="clinic">
                            <tr>
                                   <td >
                                        <span >
                                          <input name="checkbox" type="checkbox" value="${clinic.id}" />
                                       </span>
                                    </td>
                                    <td >
                                            ${clinic.id}
                                    </td>
                                    <td >
                                            ${clinic.name}
                                        <input  type="hidden" name="${clinic.appoint_category.name}" value="${clinic.name}" id="appointId${clinic.id}"/>
                                    </td>
                                    <td >
                                            ${clinic.appoint_category.name}
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
                    <a href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${pageBean.currentPage-1}&&search=${search}&&conditon=${condition}&&menuid=${menuid}" aria-label="Previous">
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
                    <li><a href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${page}&&search=${search}&&conditon=${condition}&&menuid=${menuid}">${page}</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${pageBean.currentPage+1}&&search=${search}&&conditon=${condition}&&menuid=${menuid}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </div>

<%--            <table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
                <tr>
                    <td height="30" align="right">
                        <a href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
                        </a>
                        <c:if test="${page.currentPage==1}">
                            <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <c:choose>
                                <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                                    <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                        <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:if>


                        <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${page.currentPage+1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>



                        <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                            <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${page.currentPage-1}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                            </a>
                            <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                                <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                            </a>
                        </c:if>
                        <a  href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers?currentPage=${page.totalPage}&&menuid=${menuid}&&search=${search}&&conditon=${condition}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
                        </a>
                        　共 ${page.totalPage} 页 ${page.totalCount} 条记录
                    </td>
                </tr>
            </table>--%>





    <!-- 点击添加按钮 -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document" id="addUserInfo">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">添加科室名称</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <input type="hidden" value="${menuid}" name="menuid"/>
                    </div>

                    <div class="modal-body" style="align-content: center;">
                        <div class="form-horizontal" style="border:0px solid red;text-align:center;margin-left: 100px;" id="addDoctorsInfo">

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
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="update_exampleModalScrollableTitle">修改科室信息</h5>
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
        </div>
    </div>
</center>
</body>
<script type="text/javascript">

    $(function () {
        //这个是点击添加的按钮，
        $("#add").click(function () {
            $("#addDoctorsInfo").html("");
            $.ajax({
               type:"GET",
               url:"${pageContext.request.contextPath}/admin/info/beforeInsertFindInfo",
               dataType:"JSON",
               success:function (data) {
                   if (data!=null&&data!=""){
                       var type=data.type;
                       if (type=='success'){
                             var  allAppoint_categorys=data.allAppoint_category;
                             var content=" <div class=\"form-group\">\n" +
                                 "             <label for=\"officename\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                                 "              <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                 "                 <input type=\"text\" name=\"officename\" class=\"form-control\" id=\"officename\" placeholder=\"请输入科室名称\" />\n" +
                                 "              </div>\n" +
                                 "          </div>";

                               content+="<div class=\"form-group\">\n" +
                                             "<label  class=\"col-sm-2 control-label\">门诊名称</label>\n" +
                                             "<div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                                 " <select class=\"form-control\" name=\"Appoint_category\">";
                                                         for (var i=0;i<allAppoint_categorys.length;i++){
                                                             content+=" <option value="+allAppoint_categorys[i].id+">"+allAppoint_categorys[i].name+"</option>";
                                                         }
                                        content+=" </select>\n" +
                                              "</div>\n" +
                                       " </div>\n" ;
                               $("#addDoctorsInfo").html(content);
                       }
                       else if (type=='fail'){
                          alert("查询数据失败");
                       }
                       else if (type=='error'){
                          alert("查询数据出错");
                       }
                   }
                 },error:function (data) {
                    alert("查询数据响应失败");
                }
            });
        });





        //添加数据的点击确认函数
        $("#addbtn").click(function () {
            var name=$("#addDoctorsInfo").find("input[name='officename']").val();
            var id=$("#addDoctorsInfo").find("select[name='Appoint_category'] option:selected").val();
            if (name!=null&&name!=""&&id!=""&&id!=null){
                $.ajax({
                    type:"GET",
                    dataType:"JSON",
                    data:{"id":id,"name":name},
                    url:"${pageContext.request.contextPath}/admin/info/insertIntoOfficeInfo",
                    success:function (data) {
                        if (data!=null&&data!=""){
                            var type=data.type;
                           if (type=='success'){
                                alert("添加成功");
                                window.location.href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers";
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
                        url:"${pageContext.request.contextPath}/admin/info/deleteOfficesInfoById",
                        type:"GET",
                        data:{"id":id},
                        dataType:"JSON",
                        success:function (data) {
                            var  type=data.type;
                           // var  menuid=data.menuid;
                            if (data!=null&&data!=""){
                                if (type=='success'){
                                    alert("删除成功");
                                    window.location.href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers";
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
        var id=checkboxs[0].value;//这个是这条数据的id
        var name = $("#appointId"+id).val();
        $("#updatemain").html("");
        //思路：

        /*
            将每条数据的门诊部门的信息，隐藏在该input标签的name里面
            然后，在获取该name属性，然后查询所有的部门的信息，与该查询的信息
            比较，然后置为选中的状态！
        */

        var clinic_name=$("#appointId"+id).prop("name");
        //alert("clinic_name="+clinic_name);
        if (name!=null&&name!=""){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/admin/info/beforeInsertFindInfo",
                dataType:"JSON",
                success:function (data) {
                    if (data!=null&&data!=""){
                        var type=data.type;
                        if (type=='success'){
                            var  allAppoint_categorys=data.allAppoint_category;
                            var content=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 0px;\">\n" +
                                "                            <div class=\"form-group\">\n" +
                                "                                <label for=\"name\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                                "                                <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                "                                    <input type=\"text\" name=\"officeName\" class=\"form-control\" value='"+name+"' placeholder=\"请输入科室名称\" />\n" +
                                "                                </div>\n" +
                                "                            </div>\n" ;

                               content+="<div class=\"form-group\">\n" +
                                            "<label  class=\"col-sm-2 control-label\">门诊名称</label>\n" +
                                            " <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                                            " <select class=\"form-control\" name=\"Appoint_category\">";
                                                    for (var i=0;i<allAppoint_categorys.length;i++){
                                                        content+=" <option value="+allAppoint_categorys[i].id+">"+allAppoint_categorys[i].name+"</option>";
                                                    }
                                    content+=" </select>\n" +
                                        "</div>\n" +
                                " </div> </div>\n" ;
                            $("#updatemain").html(content);



                                  //下面是将这个从后台响应的数据，置为selected的状态
                                   var $select = $("select[name='Appoint_category']");
                                   var find = $select.find("option");
                                    if (find!=null&&find!=""){
                                        if (clinic_name!=null&&clinic_name!=""){
                                            for (var i=0;i<find.length;i++){
                                                console.log("find[i].value="+find[i].value);
                                                if ($(find[i]).text() == clinic_name){
                                                    $(find[i]).attr("selected","selected");
                                                    break;
                                                }
                                            }
                                        }
                                    }
                            $("#update").removeAttr("data-target","#_updateexampleModalScrollable");
                        }
                        else if (type=='fail'){
                            alert("查询数据失败");
                        }
                        else if (type=='error'){
                            alert("查询数据出错");
                        }
                    }
                } ,error:function (data) {
                    alert("查询数据响应失败");
                }
            });
        }else{
            alert("请输入科室的名称!");
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
        //这个修改这个条数据的id
        var id=checkboxs[0].value;
       // var name = $("#appointId"+id).val();
        var name=$("#updatemain").find("input[name='officeName']").val();//这个是获取输入的name
        var appoint_categorys = $("#updatemain").find("select[name='Appoint_category']").find("option:selected");
        var selectedIndex = $(appoint_categorys).val();
       // var selectedText = $(appoint_categorys).text();
      if (name!=null&&name!=""&&
          selectedIndex!=null&&
          selectedIndex!=""){
          $.ajax({
              type:"GET",
              url:"${pageContext.request.contextPath}/admin/info/updateOfficesInfo",
              dataType:"JSON",
              data:{"id":id,"name":name,"selectedIndex":selectedIndex},
              success:function (data) {
                  if (data!=null&&data!=""){
                      var  type=data.type;
                      if (type == 'success'){
                          alert("修改数据成功");
                          window.location.href="${pageContext.request.contextPath}/admin/info/findOfficesInfoAndManagers";
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
