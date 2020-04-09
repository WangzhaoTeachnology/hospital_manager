<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>处方管理</title>
    <meta charset="utf-8">
    <!--声明文档兼容模式，表示使用IE浏览器的最新模式-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--设置视口的宽度(值为设备的理想宽度)，页面初始缩放值<理想宽度/可见宽度>-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>处方管理</title>
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
                        <td valign="bottom" class="title">处方管理</td>
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
                                            <input  data-toggle="modal"  data-target="#exampleModalScrollable" type="hidden"   id="autobtn" name="autobtn" class="btn btn-success" value="编辑"/>
                                            <input  data-toggle="modal"  type="button"   id= "update" name="update" class="btn btn-success" value="编辑"/>
                                            <input type="button"  id="delete" name="delete" class="btn btn-primary" value="删除"/>
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
                    <table class="table table-hover" style="width: 1580px;" id="prescriptionTable">
                        <tr class="active" style="text-align: center;">
                            <td >
                                选择
                                <input name="menuid" type="hidden" value="${menuid}" id="menuid"/>
                            </td>
                            <td >处方编号</td>
                            <td >病人姓名</td>
                            <td >病人诊断</td>
                            <td>医生姓名</td>
                            <td >日期时间</td>
                            <td >审核状态</td>
                        </tr>

                        <c:forEach items="${list}" var="p">
                            <tr style="text-align: center;">
                                <td>
                                    <span>
                                        <input name="checkbox" type="checkbox" value="${p.id}" >
                                        <input name="prescriptionId" value="${p.id}" type="hidden" />
                                   </span>
                                </td>
                                <td>${p.id}</td>
                                <td>${p.patient.name}</td>
                                <td>${p.content}</td>
                                <td>${p.doctor.realname}</td>
                                <td>${p.datetime}</td>
                                <td>
                                    <c:if test="${p.status==0}">
                                        <font style="color:red"> 尚未审核</font>
                                    </c:if>
                                    <c:if test="${p.status==1}">
                                        审核通过
                                    </c:if>
                                    <c:if test="${p.status==2}">
                                        <font style="color:blue"> 审核失败</font>
                                    </c:if>
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
                    <a href="${pageContext.request.contextPath}/admin/doctor/loadPrescriptionInfo?currentPage=${pageBean.currentPage-1}&&search=${search}&&condition=${condition}" aria-label="Previous">
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
                    <li><a href="${pageContext.request.contextPath}/admin/doctor/loadPrescriptionInfo?currentPage=${page}&&search=${search}&&condition=${condition}">${page}</a></li>
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
                    <a href="${pageContext.request.contextPath}/admin/doctor/loadPrescriptionInfo?currentPage=${pageBean.currentPage+1}&&search=${search}&&condition=${condition}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </div>





    <!-- 双击每行显示处方详情的信息 -->
  <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document" id="addUserInfo">
            <form id="addform">
                <div class="modal-content" style="width: 1098px;margin-left: -267px;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalScrollableTitle">处方详情信息</h5>
                        <button type="button"  id="closebtn" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body" style="align-content: center;" >
                        <table style="border: 1px solid red;margin: auto;width: 950px;" class="table table-bordered" id="bodymaincontent">
                             <tr>
                                <td colspan="4">
                                    <input type="button"  id="onclickupdateBtn" class="btn btn-default"  value="编辑"/>
                                    <input type="button" data-toggle="modal" data-target="_myModal_prescription" name="updateprescription" id="updateprescription"  class="btn btn-default"  value="添加"/>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="modal-footer">
                        <button type="button"   id="closeItemInfo" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        <button type="button"  id="updatebtn" class="btn btn-primary">确认</button>
                    </div>
                </div>
            </form>
        </div>
    </div>




   <%-- 这个是在处方管理里面，如果出现了审核后的药物反应那么医生可以重新添加别的药品--%>
    <div class="modal fade" id="_myModal_prescription" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button"  id="auto_close" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabe">处方详情信息</h4>
                </div>
                <div class="modal-body">
                    <%--  这个是导航按钮--%>
                    <form class="form-inline" style="margin-left: -454px;margin-top: -23px;">
                        <div class="form-group">
                            <button type="button"  id="addbtn_prescription" class="btn btn-primary navbar-btn">添加</button>
                            <input type="button" class="btn btn-info navbar-btn" value="删除" />
                        </div>
                    </form>

                    <div class="row">
                        <%--这个是表格--%>
                        <table class="table table-striped" id="prescribe_Content" style="border: 0px solid red;">
                            <thead>
                            <tr>
                                <td class="active">处方编号</td>
                                <td class="active" colspan="9"  id="prescription_id"></td>
                            </tr>
                            </thead>
                            <tbody id="table_content">
                                <tr>
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
                </div>
                <div class="modal-footer">
                    <button type="button" id="bottom_close" class="btn btn-primary" data-dismiss="modal">关闭</button>
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


                        <%-- 按照每天几次，每次多少量，多少数量的药，到底吃几天，医生不管--%>
                        <div class="form-group">
                            <label for="time" class="col-sm-2 control-label">天/次</label>
                            <div class="col-sm-10" style="position: relative;left: -40px;">
                                <input type="button"  value="+" style="width: 34px;height: 31px;margin-left: 42px;position: absolute;" class="form-control" id="add_time" name="add_time">
                                <input type="text" style="width: 64px;height: 31px;position: absolute;left: 92px;" value="1" class="form-control" id="time" name="time">
                                <input type="button" value="-"  style="width: 34px;height: 31px;position: absolute;left: 158px;" class="form-control" id="minus_time" name="minus_time">
                            </div>
                        </div>

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
</center>
</body>
<script type="text/javascript">
    $(function () {




        //医生发现药品吃药方式，经过审核后有误
        //医生修改处方详情
        $("#updatebtn").click(function () {
            //这个是双击的处方的编号
            var pid = $("#prescription_id").text().trim();
             //数据源，传递到后台
            var data=[];
            //该处方下面的所有的处方详情的id
            var itemsId=$("input[name='_itemId']");
            if (itemsId.length>0){
                for (var i=0;i<itemsId.length;i++){
                    var if_use_str=null,if_time_str=null,if_per_str=null;
                    //获取该元素所在的行dom
                    var obj = $(itemsId[i]).parent("td").parent("tr");
                    //获取行索引
                    var index = obj.index();
                    // alert(index);

                    //加上ret的目的是：将加入data里面的数据，不仅仅是id，不为空，而且审核条件也是不为空
                    var ret=-1;
                    for (var j=index+4;j<index+7;j++){
                        //获取该范围内每一行
                        var jQ = $(itemsId[i]).parent("td").parent("tr").parent("tbody").find("tr").eq(j);
                        //  var index = $(jQ).index();
                        //获取该行的input标签
                        var find = $(jQ).find("td:eq(1)").find("input");
                        var name=$(find).attr("name");
                        //  alert(name);
                        //判断
                        if (name=='if_use'){
                            //保证提价的数据一定是修改的数据，
                            // 而不是readonly状态下的，尚未修改的数据
                            if ($(find).attr("readonly")!='readonly'){
                                //存在修改，那么说明这个row里面的数据，并不仅仅是id不为空，存在其他不为空
                                ret=1;
                                if_use_str=$(find).val();
                            }
                        }
                        else if (name=='if_time'){
                            if ($(find).attr("readonly")!='readonly'){
                                ret=1;
                                if_time_str=$(find).val();
                            }
                        }
                        else if (name=='if_per'){
                            if ($(find).attr("readonly")!='readonly'){
                                ret=1;
                                if_per_str=$(find).val();
                            }
                        }
                    }
                    //保证提交的数据，id和其他的属性不为空
                    if (ret==1){
                        var row={"id":itemsId[i].value,"use":if_use_str,"time":if_time_str,"per":if_per_str};
                        data.push(row);
                    }
                }
               // alert(JSON.stringify(data));

                //接下ajax修改数据
                //思路1：
                //只要这个医生按照审核的条件修改了"这个处方详情"的内容，那么这个数据再次提交上去
                //这个所修改的处方状态，以及修改该处方详情的状态都是重新置为0，尚未审核

                        $.ajax({
                            type:"GET",
                            url:"${pageContext.request.contextPath}/admin/doctor/updateItemPrescriptionInfo",
                            data:{"id":pid,"data":JSON.stringify(data)},
                            dataType:"JSON",
                            success:function (data) {
                                if (data!=null&&data!=""){
                                    var type=data.type;
                                    if(type=='success') {
                                        alert("修改成功，等待审核");
                                        $("#closeItemInfo").trigger("click");
                                    }else if (type=='fail'){
                                        alert("修改失败，请你重新修改");
                                    }
                                }
                            },error:function (data) {

                            }
                        });
            }
            //思路2：
            //只要一点击编辑，只要存在处方详情的3个条件审核没有，那么该处方下面的"所有的处方详情"
            //都是提交上去置为未审核的状态
        });

            //点击编辑的话，这个自动去掉readonly
           $("#onclickupdateBtn").click(function () {

               //找审核失败的状态的input，然后将它们所处的行，的文本框置为可写状态，而其他的文本框不变，仍然是只读的状态
               //点击确认的，提交的也是审核失败的所在的处方详情的编号
               var find_checkfail = $("#bodymaincontent").find("input[name='checkfail']");
               for (var i=0;i<find_checkfail.length;i++){
                    var obj=$(find_checkfail[i]);
                    var find = obj.parent("td").parent("tr").find("td:eq(1)").find("input");
                     find.removeAttr("readonly");
               }
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




        //这个是点击处方里面的，添加按钮，然后医生开处方详情时，查询具体的药品类别
        $("#addbtn_prescription").click(function () {
            //只要医生一点击这个添加，我默认一个药品的用法
            $("#inlineRadio1").attr("checked",true);
            $("#add_prescription").modal();

            //自定义处方详情的编号
            var item_id = "785413394213734"+new Date().getTime();
            $("#prescri_id").val(item_id);
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
                                                    $("#origin_price").val(productDetail.price);
                                                    var number=parseInt($("#number").val());
                                                    if (isNaN(number)){
                                                        number=1;
                                                        parseInt($("#number").val(number))
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




        //这个是点击添加药品信息的页面的确认按钮
        $("#prescri_btn").click(function () {

            var prescri_id = $("#prescri_id").val();
            var product = $("select[name='product'] option:selected").text();
            var pro_id = $("select[name='product'] option:selected").val();
            var use= $('input:radio[name="use"]:checked').val();
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

                //直接获取处方编号
                var val = $("#prescription_id").text().trim();
                if(val!=null&&val!=""){
                    $.ajax({
                        type:"GET",
                        url:"${pageContext.request.contextPath}/admin/doctor/addItemPrescription",
                        data:{"id":prescri_id,"prescription_id":val,"product_id":pro_id,"number":number,"use":use,"comment":comment,"time":time,"per":per,"status":0},
                        dataType:"JSON",
                        success:function (data) {
                            if (data!=null&&data!=""){
                                var type=data.type;
                                if (type=='success'){
                                    //数据库添加成功
                                    alert("添加成功!");

                                    //前端页面添加成功
                                    var info="<tr><td>"+prescri_id+"</td><input name='prescrid' type='hidden' value='"+prescri_id+"'/>"+
                                        " <td>"+product+"</td><input name='proId' type='hidden' value='"+pro_id+"'/>"+
                                        " <td>"+use+"</td><input name='use' type='hidden' value='"+use+"'/>"+
                                        " <td>"+time+"</td><input name='time' type='hidden' value='"+time+"'/>"+
                                        " <td>"+per+"</td><input name='per' type='hidden' value='"+per+"'/>"+
                                        " <td>"+number+"</td><input name='number' type='hidden' value='"+number+"'/>"+
                                        " <td>"+comment+"</td><input name='comment' type='hidden' value='"+comment+"'/>"+
                                        " <td >"+price+"</td><input name='detailprice' type='hidden' value='"+price+"'/>" +
                                        "<td><button type=\"button\" class=\"close\"  name=\"btn_item_close\">" +
                                        "<span aria-hidden=\"true\">&times;</span></button></td></tr>";

                                    $("#table_content").append(info);

                                    //前端jquery删除元素
                                    /* $("button[name='btn_item_close']").click(function () {
                                         if (confirm("你确定要删除吗?")){
                                             $(this).parent().parent().remove();
                                         }
                                     });*/

                                    $('#prescri_btn').click(function() {
                                        $('#_myModal_prescription').css({'overflow-y':'scroll'});
                                    });

                                    //点击确定，让它自动点击这个关闭按钮
                                    $("#priscribe_close").trigger("click");

                                } else if (type=='fail'){
                                    alert("添加失败!")
                                }
                            }
                        }
                    });
                }
            }else{
                alert("请你填写好数据才能提交");
            }
        });





        //对于二级模态框，二级模态框关闭，一级就不能滚动了，怎样解决这个问题？？
        //关闭这个二级之前，给这个一级模态框加上滚动的属性，就可以
        //点击叉号关闭
        $('#auto_close').click(function() {
            $('#exampleModalScrollable').css({'overflow-y':'scroll'});
        });
        //直接点击关闭
        $('#bottom_close').click(function() {
            $('#exampleModalScrollable').css({'overflow-y':'scroll'});
            $("#closebtn").trigger("click");
        });
        //双击每行显示处方详情后，在处方详情里面点击添加，只有在审核出现药物反应的时候，
        //该医生才会更换药品信息，才会再次点击添加按钮，把这个处方详情的信息，再次回显到二级模态框上
        //如果审核条件是4个中的其中一个，不包括药品反应，那么直接点击编辑即可，然后点击确认
        $("#updateprescription").on('click', function () {
           //跳出开出方的模态框
            $("#_myModal_prescription").modal();
        });

       //


        $("#updateprescription").click(function () {
            //这个是清除处方里面的处方详情的内容
            $("#table_content tr").not(':eq(0)').empty();
            //点击添加先获取这个处方详情里面的处方详情的编号
            var itemsId=$("input[name='_itemId']");
            //直接通过处方编号查询数据
           var val = $("#prescription_id").text().trim();

           //方法1：ok
          $.ajax({
                type:"GET",
                async:false,
                url:"${pageContext.request.contextPath}/admin/doctor/findItemPrescriptionsById",
                data:{"id":val},
                dataType:"JSON",
                success:function (data) {
                    if (data!=null&&data!=""){
                        var type=data.type;
                        if (type=='success'){
                            var list=data.list;
                            for (var i=0;i<list.length;i++){
                                var itemprescription=list[i];
                                var  product=itemprescription.product;

                                //数据回显
                              var  info="<tr><td>"+itemprescription.id+"</td><input name='prescrid' type='hidden' value='"+itemprescription.id+"'/>"+
                                    " <td>"+product.name+"</td><input name='proId' type='hidden' value='"+product.id+"'/>"+
                                    " <td>"+itemprescription.use+"</td><input name='use' type='hidden' value='"+itemprescription.use+"'/>"+
                                    " <td>"+itemprescription.time+"</td><input name='time' type='hidden' value='"+itemprescription.time+"'/>"+
                                    " <td>"+itemprescription.per+"</td><input name='per' type='hidden' value='"+itemprescription.per+"'/>"+
                                    " <td>"+itemprescription.number+"</td><input name='number' type='hidden' value='"+itemprescription.number+"'/>"+
                                    " <td>"+itemprescription.comment+"</td><input name='comment' type='hidden' value='"+itemprescription.comment+"'/>"+
                                    " <td >"+(parseInt(itemprescription.number)*parseFloat(product.price))+"</td><input name='detailprice' type='hidden' value='"+(parseInt(itemprescription.number)*parseFloat(product.price))+"'/>" +
                                    "<td><button type=\"button\" class=\"close\"  name=\"btn_item_close\">" +
                                    "<span aria-hidden=\"true\">&times;</span></button></td></tr>";
                                $("#table_content").append(info);


                                //对于二级模态框，二级模态框关闭，一级就不能滚动了，怎样解决这个问题？？
                                //关闭这个二级之前，给这个一级模态框加上滚动的属性，就可以
                                $('#prescri_btn').click(function() {
                                    $('#_myModal_prescription').css({'overflow-y':'scroll'});
                                });

                                //点击确定，让它自动点击这个关闭按钮
                                // $("#priscribe_close").trigger("click");

                            }

                            //前端jquery删除元素
                            $("button[name='btn_item_close']").click(function () {
                                if (confirm("你确定要删除吗?")){
                                    var itemid = $(this).parent().parent().find("input[name='prescrid']").val();
                                    if (itemid!=null&&itemid!=""){
                                        $.ajax({
                                            type:"GET",
                                            url:"${pageContext.request.contextPath}/admin/doctor/deleteItemPrescriptionById",
                                            data:{"id":itemid},
                                            dataType:"JSON",
                                            success:function (data) {
                                                if (data!=null&&data!=""){
                                                    var type=data.type;
                                                    if (type=='success'){
                                                        //数据库删除成功
                                                        alert("删除成功!");

                                                        //页面删除成功
                                                        $(this).parent().parent().remove();
                                                    } else  if (type=='fail'){
                                                        alert("删除失败!");
                                                    }
                                                }
                                            },error:function (data) {
                                                alert("数据响应出现错误!");
                                            }
                                        });
                                    }

                                }


                                //思路：
                               /*1:  点击叉号就从数据库里面删除，然后点击添加，就添加到数据库里面
                               2: 这个页面只有关闭按钮，没有添加按钮
                               3: 只要一点击二级模态框的叉号和关闭按钮，那么一级模态框也给自动的关闭*/



                            });
                        }
                    }
                }
            });





//方法2：也是ok
/*          for (var  i=0;i<itemsId.length;i++){
                $.ajax({
                    type:"GET",
                    async:false,
                    url:"/admin/doctor/findItemprescriptionById",
                    data:{"id":itemsId[i].value},
                    dataType:"JSON",
                    success:function (data) {
                        if (data!=null&&data!=""){
                            var type=data.type;
                            if (type=='success'){
                                var itemprescription=data.itemprescription;
                                var product=data.itemprescription.product;
                                 //数据回显
                               var  info="<tr><td>"+itemprescription.id+"</td><input name='prescrid' type='hidden' value='"+itemprescription.id+"'/>"+
                                    " <td>"+product.name+"</td><input name='proId' type='hidden' value='"+product.id+"'/>"+
                                    " <td>"+itemprescription.use+"</td><input name='use' type='hidden' value='"+itemprescription.use+"'/>"+
                                    " <td>"+itemprescription.time+"</td><input name='time' type='hidden' value='"+itemprescription.time+"'/>"+
                                    " <td>"+itemprescription.per+"</td><input name='per' type='hidden' value='"+itemprescription.per+"'/>"+
                                    " <td>"+itemprescription.number+"</td><input name='number' type='hidden' value='"+itemprescription.number+"'/>"+
                                    " <td>"+itemprescription.comment+"</td><input name='comment' type='hidden' value='"+itemprescription.comment+"'/>"+
                                    " <td >"+(parseInt(itemprescription.number)*parseFloat(product.price))+"</td><input name='detailprice' type='hidden' value='"+(parseInt(itemprescription.number)*parseFloat(product.price))+"'/>" +
                                    "<td><button type=\"button\" class=\"close\"  name=\"btn_item_close\">" +
                                    "<span aria-hidden=\"true\">&times;</span></button></td></tr>";
                                  $("#table_content").append(info);

                                //前端jquery删除元素
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

                            }else if (type=='fail'){
                                alert("处方历史记录查询失败");
                            }
                        }
                    },error:function (data) {
                        alert("处方历史记录响应失败");
                    }
                });
            }*/
        });







        // 处方中的诊断内容
        var content;
        //双击每行，跳出弹出层
        $('#prescriptionTable tbody').on('dblclick','tr', function() {
              var obj=$(this).find("td").find("span").find("input[name='prescriptionId']");
              var id = $(obj).val();
                content=$(this).find("td:eq(3)").text().trim();
              //自动点击并且传递参数
              $("#autobtn").trigger("click",id);
        });
        $("#autobtn").click(function (event,id) {
             //按照id，处方编号，查询处方详情信息，加载在弹出层上
            $("#bodymaincontent tr:not(:first)").empty();
            //这个只会在点击添加药品的时候，才看见这个处方编号
            $("#prescription_id").html(id);
            $.ajax({
                type:"GET",
                data:{"id":id},
                dataType:"JSON",
                async:false,
                url:"${pageContext.request.contextPath}/admin/doctor/findItemPrescriptionsById",
                success:function (data) {
                    if (data!=null&&data!=""){
                        var type=data.type;
                        if (type=='success'){
                          var list=data.list;
                          for (var i=0;i<list.length;i++){
                               var item=list[i];
                               var product=item.product;
                               var itemid=item.id;


                               //先加载每一个处方，详情的公共的部分，
                              //内部再次嵌套ajax，查询每个处方的考核的部分信息
                              var info ="<tr>\n" +
                                  " <td>处方详情编号:" +
                                      "<input type=\"hidden\" value='"+item.id+"' name=\"_itemId\"/>"+
                                  "</td>\n" +
                                  " <td >"+item.id+"</td>\n" +
                                      " <td>审核状态</td>\n" ;
                                       if(item.status==0){
                                           var str="尚未审核";
                                          info+="<td style='text-align: center;'><font style='color: red;'>"+str+"</font></td>";
                                       }
                                      else if(item.status==1){
                                           var str="审核通过";
                                          info+="<td style='text-align: center;'>"+str+"</td>";
                                      }
                                      else  if(item.status==2){
                                           var str="审核失败";
                                          info+="<td style='text-align: center;'><font style='color: blue;'>"+str+"</font></td>";
                                      }
                                info+=" </tr>" ;

                              info+= "<tr>" +
                                      " <td colspan=\"4\">药品信息</td>\n" +
                                  "  </tr>";

                              info+=   "  <tr>" +
                                  " <td style=\"width: 150px;\">药品名称</td>\n" +
                                  " <td style=\"width: 50px;\">"+product.name+"</td>\n" +
                                  " <td style=\"width: 60px;\">功能主治</td>\n" +
                                  " <td>"+product.content+"</td>\n" +
                                  " </tr>";

                              info+=   "<tr>" +
                                  "<td>使用信息</td>\n" +
                                  " <td colspan=\"2\" style=\"text-align: right;\">备注</td>\n" +
                                  " <td>审核状态</td>\n" +
                                  " </tr>";

                               $.ajax({
                                   type:"GET",
                                   async:false,
                                   url:"${pageContext.request.contextPath}/admin/doctor/findCheckInfoByItemId",
                                   data:{"id":itemid},
                                   dataType:"JSON",
                                   success:function (data) {
                                         if (data!=null&&data!=""){
                                             var type=data.type;
                                             if (type=='success'){
                                                 var check=data.check;
                                                 //如果查询数据不为空，那么正常显示审核的数据
                                                 //如果查询考核的数据为空，那么显示尚未考核，在fail情况里面显示
                                              if (check!=null&&check!=""){
                                                  info+=" <tr>\n" +
                                                      "     <td>使用方法</td>\n" +
                                                      "     <td style=\"width: 250px;\"><input type=\"text\" readonly=\"readonly\"  class=\"form-control\" value=\""+item.use+"\" name=\"if_use\"/></td>\n" +
                                                      "      <td style=\"width: 250px;\">\n" +
                                                      "         <input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+check.if_use_str+"\" name=\"if_use_str\"/>\n" +
                                                      "      </td>\n" ;

                                                  if (check.if_use==1){
                                                      var str="审核通过";
                                                      info+="<td>"+str+"</td>\n" ;
                                                  }
                                                  else if (check.if_use==2){
                                                      var str="审核失败";
                                                      info+="<td>" +
                                                              "<input type='hidden'value='"+str+"' name='checkfail'/>" +
                                                             "<a><font style='color: blue' >"+str+"</font></a>"+
                                                          "</td>" ;
                                                  }
                                                   else if (check.if_use==0){
                                                      var str="尚未审核";
                                                      info+="<td><a><font style='color: red' >"+str+"</font></a></td>\n" ;
                                                  }
                                                  info+="</tr>";

                                                  info+="<tr>\n" +
                                                      "           <td>每天次数</td>\n" +
                                                      "            <td style=\"width: 250px;\"><input type=\"text\" readonly=\"readonly\" class=\"form-control\" value=\""+item.time+"\" name=\"if_time\"/></td>\n" +
                                                      "             <td>\n" +
                                                      "               <input type=\"text\"  class=\"form-control\"  readonly=\"readonly\" value=\""+check.if_time_str+"\" name=\"if_time_str\"/>\n" +
                                                      "              </td>\n" ;

                                                  if (check.if_time==1){
                                                      var str="审核通过";
                                                      info+="<td>"+str+"</td>\n" ;
                                                  }
                                                  else if (check.if_time==2){
                                                      var str="审核失败";
                                                      info+="<td>" +
                                                               "<input type='hidden' value='"+str+"' name='checkfail'/>" +
                                                               "<a><font style='color: blue' >"+str+"</font></a>" +
                                                          "</td>" ;
                                                  }
                                                  else if (check.if_time==0){
                                                      var str="尚未审核";
                                                      info+="<td><a><font style='color: red' >"+str+"</font></a></td>\n" ;
                                                  }
                                                  info+="  </tr>";

                                                  info+=" <tr>\n" +
                                                      "        <td>每次剂量</td>\n" +
                                                      "        <td><input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+item.per+"\" name=\"if_per\"/></td>\n" +
                                                      "         <td>\n" +
                                                      "            <input type=\"text\" class=\"form-control\" readonly=\"readonly\"  value=\""+check.if_per_str+"\" name=\"if_per_str\"/>\n" +
                                                      "         </td>\n" ;
                                                  if (check.if_per==1){
                                                      var str="审核通过";
                                                      info+="<td>"+str+"</td>\n" ;
                                                  }
                                                  else if (check.if_per==2){
                                                      var str="审核失败";
                                                      info+="<td>" +
                                                          "<input type='hidden' value='"+str+"' name='checkfail'/>" +
                                                          "<a><font style='color: blue' >"+str+"</font></a>"+
                                                          "</td>" ;
                                                  }
                                                  else if (check.if_per==0){
                                                      var str="尚未审核";
                                                      info+="<td><a><font style='color: red' >"+str+"</font></a></td>\n" ;
                                                  }

                                                  info+="</tr>";

                                                  info+=" <tr>\n" +
                                                      "         <td>诊断内容</td>\n" +
                                                      "          <td><input type=\"text\" class=\"form-control\"  readonly=\"readonly\" value=\""+content+"\" name=\"if_content\"/></td>\n" +
                                                      "           <td>\n" +
                                                      "               <input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+check.if_content_str+"\" name=\"if_content_str\"/>\n" +
                                                      "           </td>\n" ;
                                                  if (check.if_content==1){
                                                      var str="审核通过";
                                                      info+="<td>"+str+"</td>\n" ;
                                                  }
                                                  else if (check.if_content==2){
                                                      var str="审核失败";
                                                      info+="<td>" +
                                                          "<font style='color: blue' >"+str+"</font></td>" ;
                                                  }
                                                  else if (check.if_content==0){
                                                      var str="尚未审核";
                                                      info+="<td><a><font style='color: red' >"+str+"</font></a></td>\n" ;
                                                  }
                                                  info+="</tr>";

                                                  info+="<tr>\n" +
                                                      "         <td>药物反应</td>\n" ;
                                                                  if (check.if_react==1){
                                                                      var str="正常";
                                                                      info+= "<td><input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+str+"\" name=\"if_react\"/></td>\n";
                                                                  }
                                                                   else  if (check.if_react==2){
                                                                      var str="相互反应";
                                                                      info+= "<td><input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+str+"\" name=\"if_react\"/></td>\n";
                                                                   }
                                                                  else  if (check.if_react==0){
                                                                      var str="";
                                                                      info+= "<td><input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+str+"\" name=\"if_react\"/></td>\n";
                                                                  }
                                                       info+= "<td>\n" +
                                                       "              <input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+check.if_react_str+"\" name=\"if_react_str\"/>\n" +
                                                       "        </td>\n" ;

                                                  if (check.if_react==1){
                                                      var str="审核通过";
                                                      info+="<td>"+str+"</td>\n" ;
                                                  }
                                                  else if (check.if_react==2){
                                                      var str="审核失败";
                                                      info+="<td><font style='color: blue' >"+str+"</font></td>" ;
                                                  }
                                                  else if (check.if_react==0){
                                                      var str="尚未审核";
                                                      info+="<td><a><font style='color: red' >"+str+"</font></a></td>\n" ;
                                                  }
                                                  info+="</tr>";
                                              }
                                          }

                                             //如果查询考核的数据为空，那么显示尚未考核，在fail情况里面显示
                                             else if(type=='fail'){
                                                 var str="尚未审核";
                                                 info+=" <tr>\n" +
                                                     "     <td>使用方法</td>\n" +
                                                     "     <td style=\"width: 250px;\"><input type=\"text\" readonly=\"readonly\"  class=\"form-control\" value=\""+item.use+"\" name=\"if_use\"/></td>\n" +
                                                     "      <td style=\"width: 250px;\">\n" +
                                                     "         <input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\"\" name=\"if_use_str\"/>\n" +
                                                     "      </td>\n" ;

                                                 info+="<td>" +
                                                     "<a><font style='color: red' >"+str+"</font></a>"+
                                                     "</td>" ;
                                                 info+="</tr>";



                                                 info+="<tr>\n" +
                                                     "           <td>每天次数</td>\n" +
                                                     "            <td style=\"width: 250px;\"><input type=\"text\" readonly=\"readonly\" class=\"form-control\" value=\""+item.time+"\" name=\"if_time\"/></td>\n" +
                                                     "             <td>\n" +
                                                     "               <input type=\"text\"  class=\"form-control\"  readonly=\"readonly\" value='' name=\"if_time_str\"/>\n" +
                                                     "              </td>\n" ;

                                                 info+="<td>" +
                                                     "<a><font style='color: red' >"+str+"</font></a>" +
                                                     "</td>" ;
                                                 info+="  </tr>";


                                                 info+=" <tr>\n" +
                                                     "        <td>每次剂量</td>\n" +
                                                     "        <td><input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+item.per+"\" name=\"if_per\"/></td>\n" +
                                                     "         <td>\n" +
                                                     "            <input type=\"text\" class=\"form-control\" readonly=\"readonly\"  value='' name=\"if_per_str\"/>\n" +
                                                     "         </td>\n" ;

                                                 info+="<td>" +
                                                     "<a><font style='color: red' >"+str+"</font></a>"+
                                                     "</td>" ;
                                                 info+="</tr>";



                                                 info+=" <tr>\n" +
                                                     "         <td>诊断内容</td>\n" +
                                                     "          <td><input type=\"text\" class=\"form-control\"  readonly=\"readonly\" value='' name=\"if_content\"/></td>\n" +
                                                     "           <td>\n" +
                                                     "               <input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\"\" name=\"if_content_str\"/>\n" +
                                                     "           </td>\n" ;

                                                 info+="<td><font style='color: red' >"+str+"</font></td>" ;
                                                 info+="</tr>";


                                                 info+="<tr>\n" +
                                                     "         <td>药物反应</td>\n" ;
                                                 info+= "<td><input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\""+str+"\" name=\"if_react\"/></td>\n";
                                                 info+= "<td>\n" +
                                                     "        <input type=\"text\" class=\"form-control\" readonly=\"readonly\" value=\"\" name=\"if_react_str\"/>\n" +
                                                     "   </td>\n" ;
                                                 info+="<td><font style='color: red' >"+str+"</font></td>" ;
                                                 info+="</tr>";
                                             }
                                         }
                                   },error:function (data) {

                                   }
                               });
                               //加载数据到页面上
                              $("#bodymaincontent").append(info);
                          }
                        }else if (type=='fail'){
                              alert("数据响应失败");
                        }
                    }
                },error:function (data) {
                    alert("响应数据错误");
                }
            });
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
</script>
</html>
