<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>门诊医生</title>
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

    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="25" align="center" valign="bottom" class="td06">
                <table width="98%" border="0" cellspacing="3" cellpadding="0">
                    <tr>
                        <td width="15"><img src="${pageContext.request.contextPath}/static/admin/images/index_32.gif"
                                            width="9" height="9"></td>
                        <td valign="bottom" class="title">门诊医生</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

 <%--   <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center">
                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="td_page">


                        </td>
                    </tr>
                </table>
                <br>
            </td>
        </tr>
    </table>--%>
    <div class="row" style="margin-top: 16px;margin-bottom: 15px;">
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
        <div class="col-lg-4 col-sm-4  col-md-4 col-xs-4" style="border: 0px solid  red;margin-left: -466px; ">
            <div class="input-group">
                <div class="input-group-btn">
                    <button id="appear_btn" type="button" class="btn btn-default dropdown-toggle"
                            data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">姓名 <span
                            class="caret"></span></button>
                    <ul class="dropdown-menu" id="menuls">
                        <li><a href="#">姓名</a></li>
                        <li><a href="#">今天</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">全部</a></li>
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


    <div class="row" style="border:0px solid red;margin: auto;">
        <c:if test="${doctorsInfo!=null}">
            <c:forEach items="${doctorsInfo}" var="doctor"  varStatus="vs">
                <div class="col-sm-6 col-md-4" style=" border:0px solid  red;width:320px;margin-left: 70px;">
                    <div class="thumbnail" style="text-align: center;">
                        <img src="${pageContext.request.contextPath}${doctor.url}" style="height: 150px;width:190px; ">
                        <div class="caption">
                            <h3>${doctor.prat}:${doctor.realname}</h3>
                            <p>毕业院校:${doctor.school}</p>
                            <p>性别:${doctor.sex}</p>
                            <p>擅长:${doctor.strength}</p>
                            <p>科室:${doctor.offices.name}</p>
                            <c:forEach items="${doctor.works}" var="work">
                                <p>坐诊时间:</p>
                                <p>上午:${work.morning}</p>
                                <p>下午:${work.afternoon}</p>
                                <p>位置:${work.address}</p>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>


    <!--分页 -->
    <div style="width: 380px; margin: 0 auto; margin-top: 50px;">
        <ul class="pagination" style="text-align: center; margin-top: 10px;">

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
                    <a href="${pageContext.request.contextPath}/admin/doctorsController/loadDoctorsInfo?currentPage=${pageBean.currentPage-1}&&search=${search}&&condition=${condition}" aria-label="Previous">
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
                    <li><a href="${pageContext.request.contextPath}/admin/doctorsController/loadDoctorsInfo?currentPage=${page}&&search=${search}&&condition=${condition}">${page }</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/doctorsController/loadDoctorsInfo?currentPage=${pageBean.currentPage+1 }&&search=${search}&&condition=${condition}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </div>
    <!-- 分页结束 -->
<%--<table width="95%" border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
    <tr>
        <td height="30" align="right">
            <a href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${1}&&menuid=${menuid}">
                <img src="${pageContext.request.contextPath}/static/admin/images/1.gif" width="4" height="5" align="absmiddle"> 首页
            </a>

            <c:if test="${page.currentPage==1}">
                <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${1}&&menuid=${menuid}">
                    <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                </a>
                <c:choose>
                    <c:when test="${page.currentPage==page.totalPage&&page.currentPage==1}">
                        <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${1}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                            <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                        </a>
                    </c:otherwise>
                </c:choose>
            </c:if>

                &lt;%&ndash; 这个是中间的情况&ndash;%&gt;
            <c:if test="${page.currentPage!=1 && page.currentPage!=page.totalPage}">
                <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                    <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                </a>
                <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${page.currentPage+1}&&menuid=${menuid}">
                    <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                </a>
            </c:if>


                &lt;%&ndash;  当数据只有一个的时候，第一页与最后一页是重复的：为了避免这种情况的发生，加上!=1&ndash;%&gt;
            <c:if test="${page.currentPage!=1&&page.currentPage==page.totalPage}">
                <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${page.currentPage-1}&&menuid=${menuid}">
                    <img src="${pageContext.request.contextPath}/static/admin/images/2.gif" width="3" height="5" align="absmiddle"> 上一页
                </a>
                <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${page.totalPage}&&menuid=${menuid}">
                    <img src="${pageContext.request.contextPath}/static/admin/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页
                </a>
            </c:if>
            <a  href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?currentPage=${page.totalPage}&&menuid=${menuid}">
                <img src="${pageContext.request.contextPath}/static/admin/images/3.gif" width="4" height="5" align="absmiddle"> 末页
            </a>
            　共 ${page.totalPage} 页 ${page.totalCount} 条记录

        </td>
    </tr>
</table>--%>



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
                        <h5 class="modal-title" id="update_exampleModalScrollableTitle">修改挂号人员个人信息</h5>
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
                window.location.href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?menuid="+menuid;
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
            var  condition= $("#appear_btn").text();
            var  index=-1;
            var  menuid=$("#menuid").val();

            if (search!=null&&search!=""){
                if (condition=='今天'){
                    //因为选择了今天作为条件的话，也可以将姓名作为条件再次检索
                } else if(condition=='全部'){
                    alert("你选择的是全部作为条件，不能在文本框里面输入数据");
                    return;
                }else if (condition=='姓名'){

                }
                window.location.href="${pageContext.request.contextPath}/admin/doctorsController/loadDoctorsInfo?search="+search+"&&menuid="+menuid+"&&condition="+condition;
            }else{
                if (condition=='姓名'){
                    alert("你选择的是姓名,文本框不能为空,请输入数据");
                    return;
                }
                window.location.href="${pageContext.request.contextPath}/admin/doctorsController/loadDoctorsInfo?search="+search+"&&menuid="+menuid+"&&condition="+condition;
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
           /* var  d={};
            var data = $("#addform").serializeArray();
            $.each(data, function() {
                d[this.name] = this.value;
            });*/
            /*  JSON.stringify()：
                该函数的作用是：系列化对象
                系列化对象说白了就是把对象的类型转换为字符串类型
                value
                将要序列化成 一个JSON 字符串的值。*/

          //  var str=JSON.stringify(d);//这个是将数据转化为json，object对象
           // $('#addform').serialize();


          /*  当你把表单所有的数据一次性传递到servlet里面，不用指明这个数据的名字*/
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
                        url:"${pageContext.request.contextPath}/admin/user/deleteUserInfoById",
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
                                        window.location.href="${pageContext.request.contextPath}/admin/user/clinicUserInfo?menuid="+menuid;
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
            url:"${pageContext.request.contextPath}/admin/user/beforUpdateFindUserInfo",
            data:{"id":uid,"menuid":menuid},
            dataType:"JSON", //这个表示ajax请求后，返回数据的类型，为json类型
            success:function (data) {
                //alert(data);
                if (data!=null&&data!=""){
                    var  user=data.user;
                    var  department=user.department;
                   // var s = JSON.stringify(department);
                    //alert("s"+s);
                    //alert(department);
                    //alert(department.id);

                    var  content=" <div class=\"form-horizontal\" style=\"border:0px solid red;text-align:center;margin-left: 100px;\">\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"username\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                        "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                        "                                <input type=\"hidden\" name=\"id\" class=\"form-control\" value="+ user.id +" id=\"id\" >\n" +
                        "                                <input type=\"text\" name=\"username\" class=\"form-control\" value="+ user.username +" id=\"username\" placeholder=\"姓名\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"name\" class=\"col-sm-2 control-label\">真实姓名</label>\n" +
                        "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                        "                                <input type=\"text\" name=\"name\" class=\"form-control\" id=\"name\"  value= "+user.name +" placeholder=\"真实姓名\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"password\" class=\"col-sm-2 control-label\">密码</label>\n" +
                        "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                        "                                <input type=\"text\" name=\"password\" class=\"form-control\"  value= "+ user.password + " id=\"password\" placeholder=\"输入密码\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"birthday\" class=\"col-sm-2 control-label\">出生日期</label>\n" +
                        "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                        "                                <input type=\"date\" name=\"birthday\" class=\"form-control\"  value= "+ user.birthday +" id=\"birthday\" >\n" +
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
                        "                                <input type=\"text\" name=\"profession\" class=\"form-control\" value= "+ user.profession + " id=\"profession\" placeholder=\"输入专业信息\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"job\" class=\"col-sm-2 control-label\">职业</label>\n" +
                        "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                        "                                <input type=\"text\" name=\"job\" class=\"form-control\" id=\"job\" value= "+ user.job + " placeholder=\"输入职业\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <label for=\"school\" class=\"col-sm-2 control-label\">学校</label>\n" +
                        "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                        "                                <input type=\"text\" name=\"school\" class=\"form-control\" value= "+ user.school +" id=\"school\" placeholder=\"输入学校的信息\">\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"form-group\">\n" +
                        "                            <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" ;
                    content+= "<input type='hidden' class=\"form-control\" value='2' name='role' placeholder='挂号人员' /></div></div>";
                    content+="<div class=\"form-group\">\n" +
                        "<label  class=\"col-sm-2 control-label\">部门</label>\n" +
                        " <div class=\"col-sm-6 col-lg-6 col-xs-6 col-md-6\">\n" +
                        " <select class=\"form-control\" name=\"department\">";
                    content+=" <option value="+user.department.id+">"+user.department.name+"</option>";
                    content+=" </select>\n" +
                        "</div>\n" +
                        " </div>\n" +
                        "</div>";
                    $("#updatemain").html(content);
                    $("#update").removeAttr("data-target");
                    //每次成功的加载数据，要移出这个属性，
                    //因为当你第一次点击成功，跳出一个框子，然后再次不选择，点击
                    //保证不选择点击这个框子，不能跳出来，所以要将这个属性移出！
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
            $("#update").attr("data-target","#_updateexampleModalScrollable");
            $("#update").trigger("dblclick");
         /*   $(document).ready(function(){
                $("#update").trigger("dblclick");
            });*/
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
