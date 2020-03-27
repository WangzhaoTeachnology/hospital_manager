<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>缴费管理</title>
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="25" align="center" valign="bottom" class="td06">
                <table width="98%" border="0" cellspacing="3" cellpadding="0">
                    <tr>
                        <td width="15"><img src="${pageContext.request.contextPath}/static/admin/images/index_32.gif"
                                            width="9" height="9"></td>
                        <td valign="bottom" class="title">缴费管理</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

<%--    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td align="center">
                <table width="95%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="td_page">
                            <div class="row">
                                <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4">
                                    <input data-toggle="modal" data-target="#exampleModalScrollable" type="button" id="add" name="add" class="btn btn-info" value="添加"/>
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
                <br>--%>

                <%--                   private String id;
                           private  Patient patient;
                           private Doctor doctor;
                           private  User user;
                           private  int flag;  //这个字段是是否缴费，0,or 1
                           private double fee;
                           @DateTimeFormat(pattern = "yyyy-MM-ss HH:mm:ss")
                           private  String datetime;
                           private List<Prescription> prescriptions;--%>

               <%-- <c:if test="${list!=null}">--%>
        <%--            <table width="95%" border="0" cellpadding="2" cellspacing="0" class="table01">
                        <tr>
                            <td class="td_top">
                                选择
                                <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                            </td>
                            <td class="td_top">缴费编号</td>
                            <td class="td_top">缴费姓名</td>
                            <td class="td_top">医生姓名</td>
                            <td class="td_top">是否缴费</td>
                            <td class="td_top">缴费金额</td>
                            <td class="td_top">缴费时间</td>
                            <td class="td_top">操作</td>
                        </tr>

                        <c:forEach items="${list}" var="history">
                            <tr>
                                <td class="td_01">
                                <span class="td01">
                                  <input name="checkbox" type="checkbox" value="${history.id}" >
                               </span>
                                </td>
                                <td class="td_01">${history.id}</td>
                                <td class="td_01">${history.patient.name}</td>
                                <td class="td_01">${history.content}</td>
                                <td class="td_01">${history.doctor.realname}</td>
                                <td class="td_01">${history.datetime}</td>
                            </tr>
                        </c:forEach>
                    </table>--%>

    <div class="row" style="width: 100%;border: 0px solid gray;">
        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="margin-top: 16px;margin-bottom: 15px;margin-left: 0px;border: 0px solid red;">
            <div class="col-lg-1 col-sm-1 col-md-1 col-xs-1" style="margin-left: 0px;">
                <input  type="button" id="print" name="add" class="btn btn-info" value="打印"/>
            </div>
            <div class="col-lg-4 col-sm-4  col-md-4 col-xs-4" style="border: 0px solid  red; ">
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
            <div class="col-lg-1 col-sm-1  col-md-1 col-xs-1" style="margin-left: -37px;">
                <input type="button"  name="search" width="60px" height="30px"
                       class="btn btn-success" value="搜索" style=" margin-left: -20px; "/>
            </div>
        </div>
    </div>



    <div class="row" style="border:0px solid red;margin: auto;">
        <table class="table table-bordered" id="main">
            <tr class="warning">
                <td >
                    选择
                <%--    <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>--%>
                </td>
                <td >缴费编号</td>
                <td >缴费姓名</td>
                <td >医生姓名</td>
                <td >是否缴费</td>
                <td >需要缴费</td>
                <td >缴费金额</td>
                <td >缴费时间</td>
                <td >操作</td>
            </tr>

            <c:forEach items="${list}" var="pay">
                <tr >
                    <td style="text-align: center;vertical-align: center;">
                        <input type="checkbox" name="checkbox" value="${pay.id}" id="${pay.id}"/>
                    </td>
                    <td style="height: 34px;text-align: center;vertical-align: center;" >${pay.id}</td>
                    <td style="text-align: center;vertical-align: center;">${pay.patient.name}</td>
                    <td style="text-align: center;vertical-align: center;">${pay.doctor.realname}</td>
                    <td style="text-align: center;vertical-align: center;">
                        <c:if test="${pay.flag==1}">
                            已经缴费
                        </c:if>
                        <c:if test="${pay.flag==0}">
                            尚未缴费
                        </c:if>
                    </td>
                    <td class="fee" style="text-align: center;vertical-align: center;">
                        ￥${pay.fee}
                    </td>
                    <td style="text-align: center;vertical-align: center;">
                        <c:if test="${pay.flag==1}">
                            <input type="text"   disabled="disabled" style="width: 60px;height: 20px;" name="fee" id="${pay.id}fee"/>
                        </c:if>
                        <c:if test="${pay.flag==0}">
                            <input type="text"   style="width: 60px;height: 20px;" name="fee" id="${pay.id}fee"/>
                        </c:if>
                    </td>
                    <td style="text-align: center;vertical-align: center;">${pay.datetime}</td>
                    <td style="text-align: center;vertical-align: center;">
                        <c:if test="${pay.flag==1}">
                            <input type="button" class="btn btn-default btn-lg" disabled="disabled" value="已经缴费"/>
                        </c:if>
                        <c:if test="${pay.flag==0}">
                            <a name="${pay.fee}">
                                <input type="button" class="btn btn-default" name="submitfee" value="确认缴费" />
                            </a>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="9">
                            <%--  因为一个缴费单下面可能有多个处方的信息，
                             一个处方的信息，可能有多个处方详情的信息--%>
                        <c:forEach items="${pay.prescriptions}" var="prescription">
                            <a  data-toggle="collapse" href="#collapseExample${prescription.id}" aria-expanded="false" aria-controls="collapseExample">
                                查看处方详情  &nbsp; &nbsp; &nbsp;处方编号 :${prescription.id}
                                <input  type="hidden" value="${prescription.id}" name="collapseDetail" />
                            </a>
                            <div class="collapse" id="collapseExample${prescription.id}"<%-- style="width: 900px;"--%>>
                                <div class="well">
                                        <%--因为有很多的处方的编号，所以按照不同的处方编号，绑定不同的处方的详情的数据，
                                          所以采用这样的拼接的方式：table_history_info${prescription.id}
                                        --%>
                                    <table class="table table-bordered" id="table_history_info${prescription.id}" style="border: 0px solid red;">

                                    </table>
                                </div>
                            </div>
                        </c:forEach>
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
                    <a href="${pageContext.request.contextPath}/admin/payForPatientController/loadPayPages?currentPage=${pageBean.currentPage-1}&&search=${search}&&condition=${condition}" aria-label="Previous">
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
                    <li><a href="${pageContext.request.contextPath}/admin/payForPatientController/loadPayPages?currentPage=${page}&&search=${search}&&condition=${condition}">${page}</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/payForPatientController/loadPayPages?currentPage=${pageBean.currentPage+1}&&search=${search}&&condition=${condition}" aria-label="Next">
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

</center>
</body>
<script type="text/javascript">
    $(function () {


        //打印按钮的模块函数
        $("#print").click(function () {
           var checkboxs=$("input[name='checkbox']:checked");
             if (checkboxs.length>0){
               //  alert("打印成功");
                 //获取这个缴费的单号：
                 var objId=$("input[name='checkbox']:checked");
                 //这个是查询点击的按钮的处方的编号的，当然它可能有多个编号，所以这个是一个集合
                 var find = objId.parent("td").parent("tr").next("tr").find("td").find("input[name='collapseDetail']");

                 //每次打印之前把之前的数据清除掉
                   $("#thead_tableUserInfo tr").not(':eq(0)').empty();
                   $("#tbody_tableUserInfo tr").not(':eq(0)').empty();
                   $("#tfoot_tableUserInfo").empty();

                 for (var i=0;i<find.length;i++){
                     //这个是为了获取其中一个处方的编号
                     var val=find[i].value;
                   //  alert("val="+val);
                         if (val!=null&&val!=""){
                             $.ajax({
                                type:"GET",
                                 url:"${pageContext.request.contextPath}/admin/payForPatientController/findItemPrescriptionsByIdWithPrint",
                                 data:{"id":val},
                                 dataType:"JSON",
                                 success:function (data) {
                                     if (data!=null&&data!=""){
                                         var type=data.type;
                                         if (type=='success'){
                                             //获得这个处方的信息
                                           var pre=data.prescription;
                                             //获取操作员信息
                                             var user=data.user;
                                             //这个是打印的总计:
                                             var total=0;
                                           if (pre!=null&&pre!=""){
                                               for (var i=0;i<pre.length;i++){
                                                   //获得这个处方的详情信息
                                                   var items=pre[i].itemprescription;
                                                   //获得这个处方的病人的信息
                                                   var patient=pre[i].patient;

                                                   //添加处方信息
                                                   var head=" <tr>\n" +
                                                       "             <td>缴费单号："+val+"</td>\n" +
                                                       "                <td>姓名："+patient.name+"</td>\n" +
                                                       "                <td colspan=\"4\">时间："+pre[i].datetime+"</td>\n" +
                                                       "            </tr>";

                                                   $("#thead_tableUserInfo").append(head);

                                                   //添加处方详情
                                                   if (items!=null&&items!=""){
                                                       for(var i=0;i<items.length;i++){
                                                           //获取药品信息
                                                           var product=items[i].product;
                                                           var item=items[i];
                                                           //加入处方详情的信息
                                                           var body="<tr>" +
                                                               "       <td style='text-align: center;'>"+product.name+"</td>\n" +
                                                               "       <td style='text-align: center;'>"+product.standards+"</td>\n" +
                                                               "       <td style='text-align: center;'>"+product.price+"</td>\n" +
                                                               "       <td style='text-align: center;'>"+item.number+"</td>\n" +
                                                               "       <td colspan=\"2\" style='text-align: center;'>"+(parseInt(item.number)*parseFloat(product.price))+"</td>\n" +
                                                               "    </tr>";
                                                           total+=parseInt(item.number)*parseFloat(product.price);
                                                           $("#tbody_tableUserInfo").append(body);
                                                       }
                                                   }
                                                // alert("total="+total);
                                                   //添加打印的时间：
                                                   var date=new Date();
                                                   var year = date.getFullYear();
                                                   var month = date.getMonth() + 1;
                                                   var strDate = date.getDate();
                                                   if (month >= 1 && month <= 9) {
                                                       month = "0" + month;
                                                   }
                                                   if (strDate >= 0 && strDate <= 9) {
                                                       strDate = "0" + strDate;
                                                   }
                                                   var  str_datetime=year+"-"+month+"-"+strDate;
                                                  // alert("str_datetime="+str_datetime);
                                                   if (total!=0&&str_datetime!=null&&str_datetime!=""){
                                                       var  foot=" <tr style=\"text-align: center;\">\n" +
                                                           "                 <td>合计：</td>\n" +
                                                           "                  <td>￥："+total+"</td>\n" +
                                                           "                  <td colspan=\"2\">收费员："+user.name+"</td>\n" +
                                                           "                  <td colspan=\"2\">日期："+str_datetime+"</td>\n" +
                                                           "</tr>";
                                                       $("#tfoot_tableUserInfo").append(foot);
                                                   }

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
                                               }
                                           }
                                         } else if (type=='fail'){
                                             alert("打印查询处方详情的数据失败");
                                         }
                                     }
                                 },error:function (data) {
                                     alert("打印处方详情，响应失败");
                                 }

                             });
                         }
                 }

             } else{
                 alert("请你选择要打印的选项");
             }
        });



        //点击确认缴费按钮
        $("input[name='submitfee']").click(function () {
              var text_fee = $(this).parent("a").attr("name");
              //text_fee:这个是需要缴费的金额
              var fee = $(this).parent("a").parent("td").parent("tr").find("td:eq(6)").find("input[name='fee']").val();
              //这个fee是输入的缴费的金额
              var id=$(this).parent("a").parent("td").parent("tr").find("td:eq(0)").find("input[name='checkbox']").val();
              //这个id是获取这个缴费单的编号
              //这个fee是填写的缴费金额的数据：
              // var prescriptionId=$(this).parent("a").parent("td").parent("tr").next("tr").find("td").find("a").find("input[name='collapseDetail']").val();

                   //.eq(0).find("td").eq(2).html()


              if (fee!=null&&fee!=""){
                  var valid = /^\d{0,8}(\.\d{0,2})?$/.test(fee);
                  //输入数据后，验证数据是不是数字
                  if (valid==true){
                      //这个按钮，1：修改这个缴费的状态，2：为这个缴费单添加操作人 3：显示其他的操作按钮出来
                    /*  if (prescriptionId!=null&&prescriptionId!="")*/
                          if (parseInt(text_fee)==parseInt(fee)){
                              //  alert("come in");
                              $.ajax({
                                  type:"GET",
                                  data:{"id":id},
                                  dataType:"JSON",
                                  url:"${pageContext.request.contextPath}/admin/payForPatientController/updateStatus",
                                  success:function (data) {
                                      if (data!=null&&data!=""){
                                          var type=data.type;
                                          if (type=='success'){
                                              alert("缴费成功");
                                              window.location.href="${pageContext.request.contextPath}/admin/payForPatientController/loadPayPages";
                                          } else if (type=='fail'){
                                              alert("缴费失败");
                                          }
                                      }
                                  },error:function (data) {
                                      alert("点击这个确认的按钮，数据响应失败");
                                  }
                              });
                          }else{
                              alert("你填写的金额与需要缴费的金额不一致，请你重写填写！");
                          }
                       /*else{
                          alert("处方的编号不能为空");
                      }*/
                  }else{
                      alert("请你填写数字，不能填写其他的字符串");
                  }
              } else{
                  alert("请你填写这个缴费金额");
              }
        });
        
        
          //将处方的编号，放在这个折叠的标签的input标签里面
         var collapses = $("input[name='collapseDetail']");
         if (collapses!=null&&collapses!="") {
             for (var i=0;i<collapses.length;i++) {
                 var id = collapses[i].value;

                 //每次重新查询新的数据的时候，都要将这个置为空
                 $("#table_history_info"+id).html("");
                 $.ajax({
                    type:"GET",
                    url:"${pageContext.request.contextPath}/admin/payForPatientController/findItemPrescriptionsById",
                    data:{"id":id},
                    dataType:"JSON",
                    success:function (data) {
                        if (data!=null&&data!=""){
                            var  type=data.type;
                            if (type=='success'){
                                var   itemprescrips=data.itemPrescriptionsById;
                                if (itemprescrips!=null){
                                    var head=" <tr style='text-align: center;'>" +
                                        "          <td style='text-align: center;'>编号</td>" +
                                        "          <td >药品</td>" +
                                        "          <td >用法</td>" +
                                        "          <td >天数</td>" +
                                        "           <td >数量</td>" +
                                        "           <td >备注</td>" +
                                        "           <td >单价</td>" +
                                        "      </tr>";

                                    //因为每一个不同的处方的处方编号可能有多个处方详情的信息，
                                    $("#table_history_info"+id).append(head);
                                    var totalfee=0;
                                    for (var j=0;j<itemprescrips.length;j++){
                                        var   tbody ="<tr>" +
                                            "       <td >"+itemprescrips[j].id+"</td>" +
                                            "       <td >"+itemprescrips[j].product.name+"</td>" +
                                            "       <td>"+itemprescrips[j].use+"</td>" +
                                            "       <td >"+itemprescrips[j].day+"</td>" +
                                            "       <td >"+itemprescrips[j].number+"</td>" +
                                            "       <td >"+itemprescrips[j].comment+"</td>" +
                                            "       <td>"+(parseInt(itemprescrips[j].number)* parseFloat(itemprescrips[j].product.price))+"</td>" +
                                            "</tr>";
                                       totalfee+=Math.ceil((parseInt(itemprescrips[j].number)* parseFloat(itemprescrips[j].product.price)));
                                        $("#table_history_info"+id).append(tbody);
                                    }
                                    if (totalfee!=0){
                                        //这个是加入总的金额
                                        var tfooter=" <tr>\n" +
                                            "          <td colspan='7' style='text-align: right;'>" +
                                            "总金额￥："+"<a><font style='color: red;'> "+totalfee+"</font></a>"+
                                            "            </td>"
                                        "      </tr>";
                                        $("#table_history_info"+id).append(tfooter);
                                    }
                                }

                            }else if (type=='fail'){
                                alert("响应数据失败");
                            }
                        }
                    },error:function (data) {
                         alert("按照这个处方编号，查询这个处方详情响应失败");
                     }
                 });

             }
         }

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
            var  search=$("#searchvalue").val();
            var  condition= $("#appear_btn").text();
            var  index=-1;
          //  var  menuid=$("#menuid").val();

            if (search!=null&&search!=""){
                if (condition=='今天'){
                    //因为选择了今天作为条件的话，也可以将姓名作为条件再次检索
                } else if(condition=='全部'){
                    alert("你选择的是全部作为条件，不能在文本框里面输入数据");
                    return;
                }else if (condition=='姓名'){

                }
                window.location.href="${pageContext.request.contextPath}/admin/payForPatientController/loadPayPages?search="+search+"&&condition="+condition;
            }else{
                if (condition=='姓名'){
                    alert("你选择的是姓名,文本框不能为空,请输入数据");
                    return;
                }
                window.location.href="${pageContext.request.contextPath}/admin/payForPatientController/loadPayPages?search="+search+"&&condition="+condition;
            }
        });
    });
</script>
</html>
