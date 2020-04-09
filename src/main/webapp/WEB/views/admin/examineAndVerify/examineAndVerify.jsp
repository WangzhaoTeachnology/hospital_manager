<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>处方审核管理</title>
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

    <script type="text/javascript">
        $(function () {
           $('#modal').on('shown.bs.modal', function () {
                $('#myInput').trigger('focus')
            })
        });
    </script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style="width: 1630px;">
<center>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="25" align="center" valign="bottom" class="td06">
                <table width="98%" border="0" cellspacing="3" cellpadding="0">
                    <tr>
                        <td width="15"><img src="${pageContext.request.contextPath}/static/admin/images/index_32.gif"
                                            width="9" height="9"></td>
                        <td valign="bottom" class="title">处方审核管理</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="row" style="width: 100%;border: 0px solid gray;">
        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="margin-top: 16px;margin-bottom: 15px;margin-left: 0px;border: 0px solid red;">
           <%-- <div class="col-lg-1 col-sm-1 col-md-1 col-xs-1" style="margin-left: 0px;">
                <input  type="button" id="print" name="add" class="btn btn-info" value="打印"/>
            </div>--%>
            <div class="col-lg-4 col-sm-4  col-md-4 col-xs-4" style="border: 0px solid  red; ">
                <div class="input-group">
                    <div class="input-group-btn">
                        <button id="appear_btn" type="button" class="btn btn-default dropdown-toggle"
                                data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">查询所有<span
                                class="caret"></span></button>
                        <ul class="dropdown-menu" id="menuls">
                            <li><a href="#">查询所有</a></li>
                            <li><a href="#">处方编号</a></li>
                            <li><a href="#">处方内容</a></li>
                            <li><a href="#">尚未审核</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">审核通过</a></li>
                            <li><a href="#">审核失败</a></li>
                        </ul>
                    </div>
                    <input type="text" placeholder="按照条件进行搜索" id="searchvalue" class="form-control" aria-label="...">
                </div>
            </div>
            <div class="col-lg-1 col-sm-1  col-md-1 col-xs-1" style="margin-left: -37px;">
                <input type="button"  name="search" width="60px" height="30px"
                       class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
            </div>
        </div>
    </div>



    <%--     status字段在处方详情表里面，也要设计在处方表里面，因为存在一种情况
        处方表里面的很多的处方详情，如果至少存在一种处方详情，不符合用药的规则的话，那么这个该药品审核不通过
        但是其他的药品审核可以通过，但是该处方整体肯定是审核不通过的


      思路1：   如果对于处方详情的数据的审核要设计多个不同条件作为字段，并且这些条件的不通过的原因存放在数据库里面
        至少还要设计两张表，处方审核表，和处方审核详情不通过的条件表，
        处方审核表与处方是1：n关系，而处方审核详情不通过的条件表建立了  处方审核表与处方详情表审核不同的很多条件，存放在这个里面
        这些条件可以都设计成字段。同时处方审核表与处方详情表是n:n关系
       思路2：按照思路1，，设计比较详细，可以管理审核不通过的原因，但是也是比较麻烦的，可以通过一个字段将所有的审核不通过的详情的条件的
        数据存放在comment一个字段里面--%>

    <div class="row" style="border:0px solid red;margin: auto;width: 1630px;">
        <table class="table table-bordered" id="main">
            <tr class="warning" style="text-align: center;">
                <td >处方编号</td>
                <td >处方内容</td>
                <td >处方时间</td>
                <td >诊断病人</td>
                <td >医生姓名</td>
                <td >处方备注</td>
                <td >处方状态</td>
            </tr>

            <c:forEach items="${list}" var="p">
                <tr>
                    <td style="height: 34px;text-align: center;vertical-align: center;" >${p.id}</td>
                    <td style="text-align: center;vertical-align: center;">${p.content}</td>
                    <td style="text-align: center;vertical-align: center;">${p.datetime}</td>
                    <td style="text-align: center;vertical-align: center;">
                        ${p.patient.name}
                          <%--  这些隐藏的数据是待会用到的--%>
                            <input type="hidden" name="patientId" value="${p.patient.id}"/>
                            <input type="hidden" name="doctor_id" value="${p.doctor.id}"/>
                            <input type="hidden" name="patientName" value="${p.patient.name}"/>
                            <input type="hidden" name="patientSex" value="${p.patient.sex}"/>
                            <input type="hidden" name="patientAge" value="${p.patient.age}"/>
                            <input type="hidden" name="totalPrice" value="${p.total}">
                    </td>
                    <td class="fee" style="text-align: center;vertical-align: center;">
                         ${p.doctor.realname}
                    </td>
                    <td style="text-align: center;vertical-align: center;">
                        ${p.comment}
                    </td>

                    <td style="text-align: center;vertical-align: center;">
                        <c:if test="${p.status==0}">
                            <a>尚未审核</a>
                        </c:if>
                        <c:if test="${p.status==1}">
                            <a>审核通过</a>
                        </c:if>
                        <c:if test="${p.status==2}">
                            <a><font style="color: red">审核失败</font></a>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="8">
                            <a  data-toggle="collapse" href="#collapseExample${p.id}" aria-expanded="false" aria-controls="collapseExample">
                                查看处方详情
                            </a>
                            <div class="collapse" id="collapseExample${p.id}">
                                <div class="well">
                                    <table id="table_history_info${p.id}" style="border: 0px solid red;margin-top: 10px;"  class="table table-bordered">
                                        <tr style='text-align: center;'>
                                            <td >编号</td>
                                            <td >药品</td>
                                            <td >用法</td>
                                            <td >数量</td>
                                            <td >天/次</td>
                                            <td >次/量</td>
                                            <td >状态</td>
                                          <%--  <td >原因</td>--%>
                                            <td >备注</td>
                                            <td >操作</td>
                                        </tr>
                                        <c:forEach items="${p.itemprescription}" var="item">
                                            <tr style='text-align: center;'>
                                                <td >${item.id}</td>
                                                <td >
                                                        ${item.product.name}
                                                    <input type="hidden" value="${item.product.content}" name="pcontent"/>
                                                </td>
                                                <td >${item.use}</td>
                                                <td >${item.number}</td>
                                                <td >${item.time}</td>
                                                <td >${item.per}</td>
                                             <%--
                                                逻辑：
                                                处方详情的审核是0：尚未审核，1：审核通过，2：审核失败，
                                                //只有在尚未审核的条件下，才不能提交提交审核按钮，其他可以正常提交信息的
                                                //实现逻辑思路：

                                                只有将在页面加载的时候，查询每条处方详情的check表中的5个条件的信息
                                                状态是不是都是通过的，只有都是通过的这个字段status为1，
                                                如果至少存在一个条件不通过，那么这个处方详情都是不通过的为2
                                                --%>
                                                <td >
                                                    <c:if test="${item.status==0}">
                                                        <a><font style="color: red;">尚未审核</font></a>
                                                    </c:if>
                                                    <c:if test="${item.status==1}">
                                                        审核通过
                                                    </c:if>
                                                    <c:if test="${item.status==2}">
                                                        <a><font style="color: red;">审核失败</font></a>
                                                    </c:if>
                                                </td>
                                        <%--        <td >
                                                    这个是未通过审核的原因，是设计那个审核5个条件中的至少一个
                                                    <c:if test="${item.status==0}">
                                                        等待审核
                                                    </c:if>
                                                    <c:if test="${item.status==1}">
                                                        审核通过
                                                    </c:if>
                                                    <c:if test="${item.status==2}">
                                                        审核失败失败条件的原因遍历check表
                                                    </c:if>
                                                </td>--%>
                                                <td>
                                                        <c:if test="${item.comment==null}">
                                                            无
                                                        </c:if>
                                                        <c:if test="${item.comment!=null}">
                                                            ${item.comment}
                                                        </c:if>
                                                </td>
                                                <td>
                                                    <select name='checkInfo'  class="form-control" style="width: 110px;height: 40px;">
                                                        <option value="0">请选择</option>
                                                        <option value="${item.id}">
                                                            开始审核
                                                        </option>
                                                        <option value="1">审核通过</option>
                                                        <option value="2">审核失败</option>
                                                    </select>
                                                    <input type="hidden"  data-toggle="modal"  name="check" data-target="#checkInfo" id="${item.id}"  />
                                                </td>
                                            </tr>

                                        </c:forEach>
                                        <tr>
                                             <td colspan='9' style='text-align: right;'>
                                                 <input type="button" value="提交审核"  class="btn btn-default" name="submitCheck"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                             </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <c:if test="${list==null}">
        <table  border="0" cellpadding="2" cellspacing="0" style="margin: auto;">
            <tr>
                <td>
                    <img src="${pageContext.request.contextPath}/static/admin/images/timg.jpg" width="700px" height="700px"/>
                </td>
            </tr>
        </table>
    </c:if>



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
                    <a href="${pageContext.request.contextPath}/admin/user/findAllPrescriptionByNoStatus?currentPage=${pageBean.currentPage-1}&&search=${search}&&condition=${condition}" aria-label="Previous">
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
                    <li><a href="${pageContext.request.contextPath}/admin/user/findAllPrescriptionByNoStatus?currentPage=${page}&&search=${search}&&condition=${condition}">${page}</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/user/findAllPrescriptionByNoStatus?currentPage=${pageBean.currentPage+1}&&search=${search}&&condition=${condition}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>

        </ul>
    </div>

    <%--这个是缴费单信息打印--%>
    <div id="box" style="visibility: hidden;">
        <!--startprint-->
        <table  class="table table-bordered" style="margin: auto;" id="tableUserInfo">
            <thead id="thead_tableUserInfo">
                <tr>
                    <td style="text-align: center;font-family: '微软雅黑';font-size:xx-large;" colspan="6">
                        xxxx医院缴费单
                    </td>
                </tr>
         <%--       <tr>
                    <td>缴费单号：213123213123213213</td>
                    <td>姓名：jack</td>
                    <td colspan="4">时间：2020-06-09</td>
                </tr>--%>
            </thead>
            <tbody id="tbody_tableUserInfo">
                <tr style="text-align: center;">
                    <td>名称</td>
                    <td>规格</td>
                    <td>单价</td>
                    <td>数量</td>
                    <td colspan="2">金额</td>
                </tr>
            </tbody>

            <tfoot id="tfoot_tableUserInfo">
              <%--  <tr style="text-align: center;">
                    <td>合计：</td>
                    <td>￥：132213</td>
                    <td>收费员：</td>
                    <td>jack</td>
                    <td>日期：</td>
                    <td>2020-08-9</td>
                </tr>--%>
            </tfoot>
        </table>
        <!--endprint-->
    </div>




    <%--这个是审核的弹出层--%>
<%--    对于每一个药品都是按照下面的if条件审核每条信息
   0，待审核，1，审核通过（只要下面的所有的条件都是1，那么这处方详情里面的status字段才为1，不然为0，或者2） 2，审核不通过
    cid
    if_content
    if_use
    if_per
    if_time
    if_react
    item_id
    comment--%>

    <div class="modal fade" id="checkInfo" tabindex="-1"   role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" style="margin-top: 167px;">
            <div class="modal-content" style="width: 900px;margin-left: -122px;">
                <div class="modal-header">

                </div>
                <div class="modal-body">
                    <div class="row">
                        <form>
                            <div class="form-group">
                                <table style="border: 1px solid red;margin: auto;width: 800px;" class="table table-bordered" id="info">
                                    <tr>
                                        <td colspan="4">病人信息</td>
                                    </tr>
                                    <tr>
                                        <td>姓名</td>
                                        <td>性别</td>
                                        <td colspan="2">年龄</td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td colspan="2"></td>
                                    </tr>
                                    <tr>
                                        <td>诊断信息</td>
                                        <td colspan="3"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">药品信息</td>
                                    </tr>
                                    <tr>
                                        <td>药品名称</td>
                                        <td style="width: 10px;">999</td>
                                        <td style="width: 60px;" colspan="2">功能主治:</td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            审核信息
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>使用方法</td>
                                        <td></td>
                                        <td>
                                            <input type="text" class="form-control" id="use" placeholder="建议服用方式">
                                        </td>
                                        <td >
                                            <select name='checkDetailInfo' class="form-control" style="width: 110px;height: 40px;">
                                                <option value="0">等待审核</option>
                                                <option value="1">审核通过</option>
                                                <option value="2">审核失败</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>每天次数</td>
                                        <td>口服</td>
                                        <td>
                                            <input type="text" class="form-control" id="time" placeholder="建议每天次数">
                                        </td>
                                        <td>
                                            <select name='checkDetailInfo' class="form-control" style="width: 110px;height: 40px;">
                                                <option value="0">等待审核</option>
                                                <option value="1">审核通过</option>
                                                <option value="2">审核失败</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>每次剂量</td>
                                        <td>口服</td>
                                        <td>
                                            <input type="text" class="form-control" id="per" placeholder="建议每次剂量">
                                        </td>
                                        <td >
                                            <select name='checkDetailInfo' class="form-control" style="width: 110px;height: 40px;">
                                                <option value="0">等待审核</option>
                                                <option value="1">审核通过</option>
                                                <option value="2">审核失败</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>诊断内容</td>
                                        <td></td>
                                        <td>
                                            <input type="text" class="form-control" id="content" placeholder="药品与诊断内容是否符合">
                                        </td>
                                        <td>
                                            <select name='checkDetailInfo' class="form-control" style="width: 110px;height: 40px;">
                                                <option value="0">等待审核</option>
                                                <option value="1">审核通过</option>
                                                <option value="2">审核失败</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>药物反应</td>
                                        <td>无药品之间的反应</td>
                                        <td>
                                            <input type="text" class="form-control" id="react" placeholder="是否存在药品之间的反应">
                                        </td>
                                        <td >
                                            <select name='checkDetailInfo' class="form-control" style="width: 110px;height: 38px;">
                                                <option value="0">等待审核</option>
                                                <option value="1">审核通过</option>
                                                <option value="2">审核失败</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="bottom_close" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="submitCheckInfo">确认</button>
                </div>
            </div>
        </div>
    </div>

</center>
</body>
<script type="text/javascript">
    $(function () {

        //提交处方审核按钮
        $("input[name='submitCheck']").click(function () {
            var obj = $(this).parent("td").parent("tr").parent("tbody").parent("table");
            var not = obj.find("tr").not(":eq(0)").not(":last");
          //  .not(':first').not(':last')
            var flag=0;var index=-1;
            //如果这个用户在处方详情里面，至少存在一个尚未审核，那么是不能提交数据的
              for (var i=0;i<not.length;i++){
                  var second=$(not[i]).find("td:eq(6)").text().trim();
                  if (second=='尚未审核'){
                      flag=1;
                      index=i;
                      alert("你的第"+(index+1)+"行的处方详情尚未审核!");
                  }
              }
              //不能提交数据，并且提示用户
              if (flag==1){
                  if (index!=-1){
                   //   alert("你的第"+(index+1)+"行的处方详情尚未审核!");
                  }
              }else{
                  //接下来，提交数据,这个id是处方的id
                  var obj=$(this).parent("td").parent("tr").parent("tbody").parent("table").parent("div").parent("div").parent("td").parent("tr").prev("tr");
                  var id=obj.find("td:eq(0)").text().trim();
                  //获得patient_id
                  var patient_id=$(obj).find("td:eq(3)").find("input[name='patientId']").val();
                  var doctor_id=$(obj).find("td:eq(3)").find("input[name='doctor_id']").val();
                  var totalPrice=$(obj).find("td:eq(3)").find("input[name='totalPrice']").val();
                  $.ajax({
                        type:"GET",
                        url:"${pageContext.request.contextPath}/admin/user/submitCheck" ,
                        data:{"id":id,"patient_id":patient_id,"doctor_id":doctor_id,"totalPrice":totalPrice},
                        dataType:"JSON",
                        success:function (data) {
                            if (data!=null&&data!=""){
                                var type=data.type;
                                if (type=='success'){
                                    alert("提交审核成功");
                                    window.location.href="${pageContext.request.contextPath}/admin/user/findAllPrescriptionByNoStatus";
                                }
                            }
                        },error:function (data) {
                          alert("提交审核响应失败");
                      }

                  });
              }
        });




        //将itemid作为全局变量
        var itemid=null;

        //审核处方详情中的，5个条件
        $("#submitCheckInfo").click(function () {
            var selects = $("select[name='checkDetailInfo']");
           // alert(selects.length);
            if (selects!=null&&selects!=""){
                //默认全部审核通过，但是只要存在一个未审核，这个表单都是不能提交的
                var flag=1;
                for (var i=0;i<selects.length;i++){
                    var value=selects[i].value;
                    //找到该select的tr行
                    var tr=selects[i].parentNode.parentNode;

                    //注意：如果你是通过for循环遍历得到这个dom的对象，那么要用parentNode而不是用parent()函数
                    //但是parentNode获得的obj可以加上$,符号，此时就可以利用find()直接的函数来用！

                    //根据tr行找到td内容
                    var text = $(tr).find("td:eq(0)").text();
                    if (value==0){
                        flag=0;
                        alert("请你审核"+text+"内容");
                    }
                }

                //表示已经审核，但是可能是审核通过也可能是审核失败
                if (flag==1){
                    //把审核过的数据装进去
                    var data=[];
                    for (var i=0;i<selects.length;i++){
                        var value=selects[i].value;
                        var tr=selects[i].parentNode.parentNode;
                        var text = $(tr).find("td:eq(0)").text();
                        if (text=='使用方法'){
                            var row={if_use:value};
                            data.push(row);

                        }
                        if (text=='每天次数'){
                            var row={if_time:value};
                            data.push(row);
                        }
                         if (text=='每次剂量'){
                            var row={if_per:value};
                            data.push(row);
                        }
                        if (text=='诊断内容'){
                            var row={if_content:value};
                            data.push(row);
                        }
                        if (text=='药物反应'){
                            var row={if_react:value};
                            data.push(row);
                        }
                    }
                   // alert(JSON.stringify(data));
                    //接下来，提交审核数据给后台
                    //将不同时刻的毫秒作为主键cid
                    var date=new Date();
                    var cid = date.getTime();

                    //建议的信息
                    var obj = $(this).parent("div").prev("div").find("div").find("form").find("div").find("table").find("tbody");
                    var if_use_str=obj.find("tr:eq(7)").find("td:eq(2)").val();
                    var if_time_str=obj.find("tr:eq(8)").find("td:eq(2)").val();
                    var if_per_str=obj.find("tr:eq(9)").find("td:eq(2)").val();
                    var if_content_str=obj.find("tr:eq(10)").find("td:eq(2)").val();
                    var if_react_str=obj.find("tr:eq(11)").find("td:eq(2)").val();


                    if (itemid!=null&&itemid!=""){
                        $.ajax({
                            type:"GET",
                            data: {"cid":cid,"itemid":itemid,"data":JSON.stringify(data),
                                "if_use_str":if_use_str,"if_time_str":if_time_str,"if_per_str":if_per_str,"if_content_str":if_content_str,
                                "if_react_str":if_react_str
                            },
                            dataType:"JSON",
                            url:"${pageContext.request.contextPath}/admin/user/submitCheckInfo",
                            success:function (data) {
                                if (data!=null&&data!=""){
                                    var type=data.type;
                                    if (type=='success'){
                                        alert("审核数据提交成功");
                                        window.location.href="${pageContext.request.contextPath}/admin/user/findAllPrescriptionByNoStatus";
                                    } else if (type=='fail'){
                                        alert("审核失败");
                                    }
                                }
                            },error:function (data) {
                                alert("提交审核数据，响应失败");
                            }
                        });
                    }
                }
            }

        });



        //点击处方详情中的开始审核
        $("select[name='checkInfo']").change(function () {
            //cid作为主键
            var date=new Date();
            var cid = date.getTime();
            var data=null;
            var text = $(this).find("option:selected").text().trim();
           // alert(text);
            //id即是option中的value也是处方详情的主键id
            //将id赋值为itemid作为全局变量给submitCheckInfo事件使用
            var id=$(this).parent("td").parent("tr").find("td:eq(0)").text();
            itemid=id;
            //点击开始审核
            if (text=='开始审核'){
                //病人信息
               var obj=$(this).parent("td").parent("tr").parent("tbody").parent("table").parent("div").parent("div").parent("td").parent("tr").prev("tr");
                var name=obj.find("td:eq(3)").find("input[name='patientName']").val();
                var sex=obj.find("td:eq(3)").find("input[name='patientSex']").val();
                var age=obj.find("td:eq(3)").find("input[name='patientAge']").val();
                //alert("age="+age+"name"+name+"sex"+sex);

                var table = $("#info");
                table.find("tr:eq(2)").find("td:eq(0)").text(name);
                table.find("tr:eq(2)").find("td:eq(1)").text(sex);
                table.find("tr:eq(2)").find("td:eq(2)").text(age);

                //诊断信息
                var content=obj.find("td:eq(1)").text();
                table.find("tr:eq(3)").find("td:eq(1)").text(content);

                //药品信息
                var pro=$(this).parent("td").parent("tr");
                var name=pro.find("td:eq(1)").text();
                var pcontent=pro.find("td:eq(1)").find("input[name='pcontent']").val();
                table.find("tr:eq(5)").find("td:eq(1)").text(name);
                table.find("tr:eq(5)").find("td:eq(2)").append(pcontent);

                //审核信息
                var check=$(this).parent("td").parent("tr");
                var check_obj=$(this).parent("td").parent("tr").parent("tbody").parent("table").parent("div").parent("div").parent("td").parent("tr").prev("tr");
                var if_use=check.find("td:eq(2)").text();
                var  if_time=check.find("td:eq(4)").text();
                var if_per=check.find("td:eq(5)").text();
                var if_content=check_obj.find("td:eq(1)").text();
                //var if_react=check.find("td:eq()").text();

                table.find("tr:eq(7)").find("td:eq(1)").text(if_use);
                table.find("tr:eq(8)").find("td:eq(1)").text(if_time);
                table.find("tr:eq(9)").find("td:eq(1)").text(if_per);
                table.find("tr:eq(10)").find("td:eq(1)").text(if_content);

                //跳出弹出层
                $("#"+id).trigger("click");
                return;

            }else if (text=='审核通过'){
                //直接点击审核通过下拉选项
                 data=[{if_use:1},{if_time:1},{if_per:1},{if_content:1},{if_react:1}];
            } else if (text=='审核失败'){
                 //直接点击审核失败下拉选项
                 data=[{if_use:2},{if_time:2},{if_per:2},{if_content:2},{if_react:2}];
            }
            if (data!=null&&data!=""){
                $.ajax({
                    type:"GET",
                    data: {"cid":cid,"itemid":itemid,"data":JSON.stringify(data),
                        "if_use_str":"","if_time_str":"","if_per_str":"","if_content_str":"",
                        "if_react_str":""
                    },
                    dataType:"JSON",
                    url:"${pageContext.request.contextPath}/admin/user/submitCheckInfo",
                    success:function (data) {
                        if (data!=null&&data!=""){
                            var type=data.type;
                            if (type=='success'){
                                alert("审核数据提交成功");
                                window.location.href="${pageContext.request.contextPath}/admin/user/findAllPrescriptionByNoStatus";
                            } else if (type=='fail'){
                                alert("审核失败");
                            }
                        }
                    },error:function (data) {
                        alert("提交审核数据，响应失败");
                    }
                });
            }
        });


        //只能选择一个的功能：
        var inputs = $("input[name='checkbox']");
         inputs.click(function () {
            if(this.checked || this.checked=='checked'){
                inputs.removeAttr("checked");
                $(this).prop("checked", true);
                var value = this.value;
               //点击打印按钮的时候，必须要选择一项数据

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
            var  search=$("#searchvalue").val().trim();
            var  condition= $("#appear_btn").text();
                if (condition=='处方编号'){
                    if (search==""){
                        alert("你选择的是处方编号,文本框不能为空,请输入数据");
                        return;
                    }
                }
                else if (condition=='查询所有'){
                    if (search!=""){
                        alert("你选择的是查询所有,文本框不能输入数据，请你清空!");
                        return;
                    }
                }
                else if (condition=='处方内容'){
                    if (search==null||search==""){
                        alert("你选择的是处方内容,文本框不能为空,请输入数据!");
                        return;
                    }
                }
               else if (condition=='尚未审核'){
                    if (search!=""){
                        alert("你选择的是尚未审核,文本框不能输入数据，请你清空!");
                        return;
                    }
                    search=0;
                }
               else if (condition=='审核通过'){
                    if (search!=""){
                        alert("你选择的是审核通过,文本框不能输入数据，请你清空!");
                        return;
                    }
                    search=1;
                }
                else if (condition=='审核失败'){
                    if (search!=""){
                        alert("你选择的是审核失败,文本框不能输入数据，请你清空!");
                        return;
                    }
                    search=2;
                }
                window.location.href="${pageContext.request.contextPath}/admin/user/findAllPrescriptionByNoStatus?search="+search+"&&condition="+condition;
            }
        );
    });
</script>
</html>
