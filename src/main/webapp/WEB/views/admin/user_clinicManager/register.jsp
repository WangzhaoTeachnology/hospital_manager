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
    <title>病人基本信息</title>
    <!-- 引入Bootstrap核心样式文件 -->
    <link href="${pageContext.request.contextPath}/static/admin/boostrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/admin/css/style.css" rel="stylesheet" type="text/css">
    <!-- 引入jQuery核心js文件 -->
    <script language="javascript"  src="${pageContext.request.contextPath}/static/admin/boostrap/js/jquery-1.11.3.min.js" ></script>
    <!-- 引入BootStrap核心js文件 -->
    <script src="${pageContext.request.contextPath}/static/admin/boostrap/js/bootstrap.min.js"></script>


    <!-- 弹出层插件 -->
    <link href="${pageContext.request.contextPath}/static/admin/pop/popup_layer.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/pop/popup_layer.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/pop/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
/*       $(function(){
            //弹出层插件调
           new PopupLayer({
               trigger:".clickedElement",//触发点 点击谁弹出div
               popupBlk:"#showDiv",//弹出哪个div
               closeBtn:"#closeBtn",//关闭按钮
               useOverlay:true
           });
        });*/
    </script>
    <style type="text/css">

    </style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<%--<center>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" align="center" valign="bottom" class="td06"><table width="98%" border="0" cellspacing="3" cellpadding="0">
          <tr>
            <td width="15"><img src="${pageContext.request.contextPath }/static/admin/images/index_32.gif" width="9" height="9"></td>
            <td valign="bottom" class="title">门诊挂号</td>
          </tr>
      </table></td>
    </tr>
  </table>
  <form name="form1" method="post" action="">
    <table width="95%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="90" height="24" class="td_form01">姓名</td>
        <td class="td_form02"><input type="text" name="username" class="input" /></td>
        <td width="90" class="td_form01">性别</td>
        <td class="td_form02">
            <input type="radio"  value="0" name="sex" checked="checked"/>男
            <input type="radio"  value="1" name="sex"/>女
	     </td> 
      </tr>
      <tr>
          <td width="90" class="td_form01">身份证编号</td>
          <td class="td_form01"><input name="textfield262" type="text" name="id_number" class="input"></td>
        <td height="24" class="td_form01">联系电话</td>
        <td class="td_form01"><input type="text"  class="input"  name="telephone"/></td>
      </tr>
    </table>    
   
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
          <td class="td_form01">出生日期</td>
          <td class="td_form02"><input type="text" class="input"  name="birthday"/></td>
      </tr>
      <tr>
        <td class="td_form01">职业</td>
        <td class="td_form02"><input name="textfield222" type="text"  name="job" class="input" size="30"></td>
      </tr>
      <tr>
        <td  class="td_form01">婚姻</td>
        <td class="td_form02">
           <input type="radio" name="marry" value="radiobutton" checked="checked">已婚
           <input type="radio" name="marry" value="radiobutton">未婚
        </td>
      </tr>
      <tr>
        <td class="td_form01">挂号时间</td>
        <td class="td_form02"><input name="textfield222"  name="datetime" type="text" class="input" size="30"></td>
      </tr>
      &lt;%&ndash; <tr>
        <td class="td_form01">费用</td>
        <td class="td_form02"><input name="textfield222" name="fee" type="text" class="input" size="30"></td>
      </tr>&ndash;%&gt;
     
      <tr>
        <td class="td_form01">联系地址</td>
        <td class="td_form02"><input name="textfield26" type="text" name="address" class="input"></td>
      </tr>
      
       <tr>
        <td class="td_form01">备注(*过敏):</td>
        <td class="td_form02">
           <textarea placeholder="是否对药物过敏"  name="comment"></textarea>
        </td>
      </tr>
    </table>
    <br>
    <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" whdth="100%">
      <tr>
        <td align="center">
            <input name="save"  type="button" class="buttonface" value= "确认" />
            <input name="cancel"  type="button" class="buttonface" value= "返回"  onClick="history.back(-1)">
        </td>
      </tr>
    </table>
  </form>
</center>--%>

<div class="container  form-horizontal" style="margin-top:  100px;" id="main">

        <div class="form-group">
            <label for="username" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="text" name="username" class="form-control" id="username" placeholder="姓名">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">性别</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="radio"  name="radio" value="男"   checked="checked">男
                <input type="radio"  name="radio"  value="女" > 女
            </div>
        </div>


        <div class="form-group">
            <label for="id_number" class="col-sm-2 control-label">身份证编号</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="text" class="form-control" name="id_number" id="id_number" placeholder="输入18位数字">
            </div>
        </div>

        <div class="form-group">
            <label  class="col-sm-2 control-label">婚姻</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="radio"  name="is_marry" value="0"   checked="checked">已婚
                <input type="radio"  name="is_marry"  value="1" > 未婚
            </div>
        </div>

        <div class="form-group">
            <label for="telephone" class="col-sm-2 control-label">联系电话</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="text" name="telephone" class="form-control" id="telephone">
            </div>
        </div>

        <div class="form-group">
            <label for="birthday" class="col-sm-2 control-label">出生日期</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="date" name="birthday" class="form-control" id="birthday">
            </div>
        </div>

        <div class="form-group">
            <label for="job" class="col-sm-2 control-label">职业</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="text" name="job" class="form-control" id="job">
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-2 control-label">联系地址</label>
            <div class="col-sm-4 col-lg-4 col-xs-4 col-md-4">
                <input type="text" name="address" class="form-control" id="address">
            </div>
        </div>


        <div class="form-group" style="padding-left: 100px;">
            <div class="col-sm-offset-2 col-sm-10">
                <input type="button" name="save" class="btn btn-success clickedElement "  data-toggle="modal" data-target="#myModal"  value="提交"/>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button"  class="btn btn-default"   id="reset"   value="重置"  />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="button"  class="btn btn-default" onClick="history.back(-1);"  value="返回"/>
            </div>
        </div>
</div>

<%--
<div  id ="showDiv"  class="blk" >
    <div id ="_main"  class="main" style="width: 900px;height: auto;margin-left: 800px;">
        &lt;%&ndash;这个是一个外表弹出层的一个width 和height&ndash;%&gt;
        <a  id="closeBtn" class="closeBtn">关闭</a>
        <div style="margin-top: 50px;">
            <form action="" method="get">
                <div id="showDivTab1" align="center" style="padding-left: 80px; ">

                </div>
            </form>
        </div>
    </div>
</div>
--%>


<%--模态框--%>
<!-- Modal -->
<div class="modal fade"  id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">挂号信息</h4>
            </div>
            <div class="modal-body" id="mainBody">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="close" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" name="registerPatientInfo">确认</button>
            </div>
        </div>
    </div>
</div>


</body>


<script type="text/javascript">
/*
思路：
1：将所有的input标签放在集合里面，绑定focus，blur()事件
2：获取每一个input的name，然后，根据这个name，跳出相应的alert
3：等到最后一个input，输入完之后，将提交，按钮置为可用的状态，然后点击提交，跳出对话框
*/

$(function () {

    var  mainStr;
          //性别：
          var radios = $("input[name='radio']");
          if (radios.length > 0) {
              for (var i = 0; i < radios.length; i++) {
                  radios[i].click(function () {
                      var flag = radios[i].checked;
                      if (flag == false) {
                          radios[i].checked = true;
                      }
                  });
              }
          }

          //marry
          var marrys = $("input[name='marry']");
          if (marrys.length > 0) {
              for (var i = 0; i < marrys.length; i++) {
                  marrys[i].click(function () {
                      var flag = marrys[i].checked;
                      if (flag == false) {
                          marrys[i].checked = true;
                      }
                  });
              }
          }


//下面的blur代码是失去焦点的验证代码
          $("#username").blur(function(){
              if(this.value ==""||this.value ==null ){
                  alert("请输入用户名");
                  return;
              }
          });
          $("#id_number").blur(function(){
              if(this.value ==""||this.value ==null){
                  alert("请输入身份证编号");
                   return ;
              }
     /*         else{
                  var  id_number=$("input[name='id_number']").val();
                  if (id_number!=null&&id_number!=""){
                      var id=/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/;
                      if (!(id.test(id_number))) {
                          alert("输入的身份证号码格式不正确，请重新输入");
                          $("input[name='save']").attr('disabled', 'disabled');
                      }else{
                          $("input[name='save']").attr('disabled', false);
                          var  birthday = id_number.substr(6,8);
                          var yyyy = id_number.substr(6,4);
                          var MM = id_number.substr(10,2);
                          var dd = id_number.substr(12,2);
                          var time = yyyy + "-" + MM + "-" + dd;
                          var datetime=document.querySelector("input[name='birthday']");
                          datetime.value=time;
                      }
                  }
              }*/
          });
          $("#telephone").blur(function(){
              if(this.value ==""||this.value ==null){
                  alert("请输入联系电话");
                  return;
              }
          });
          $("#birthday").blur(function(){
              if(this.value ==""||this.value ==null){
                  alert("请输入出生日期");
                  return;
              }
          });
          $("#job").blur(function(){
              if(this.value ==""||this.value ==null){
                  alert("请输入职业");
                  return;
              }
          });
          $("#address").blur(function(){
              if(this.value ==""||this.value ==null){
                  alert("请输入联系地址");
                  return;
              }
          });


//加上一个定时器，随时调用这些代码 ，相当于监听用户有没有将这个填写的数据输入完整，相当于监听器的功能
  var  timer=setInterval(function () {
         var  username=$("input[name='username']").val();
         var   telephone=$("input[name='telephone']").val();
         var  birthday=$("input[name='birthday']").val();
         var   address=$("input[name='address']").val();
         var  job=$("input[name='job']").val();
         var  id_number=$("input[name='id_number']").val();
         if(username!=null&&username!=""&&telephone!=null&&telephone!=""&&
             birthday!=null&&birthday!=""&&address!=null&&address!=""&&job!=null&&job!=""&&
             id_number!=null&&id_number!=""
         ){
             $("input[name='save']").attr('disabled', false);

         }else{
             $("input[name='save']").attr('disabled', 'disabled');
         }
     }, 1) ;

//这个是清除的按钮的功能
          $("#reset").click(function () {
                  $("input[name='username']").val("");
                  $("input[name='telephone']").val("");
                  $("input[name='birthday']").val("");
                  $("input[name='address']").val("");
                  $("input[name='job']").val("");
                  $("input[name='id_number']").val("");

          });

          //这个是在挂号的时候输入病人的信息，然后点击确认按钮
         $("input[name='save']").click(function () {
              var b = checkBefore();
              //这个下面的if 判断以及这个checkBefore验证输入的函数以及没有用了，当然你不删除 ，加上也没有关系，
              //因为这个if 判断永远不会执行！
              if (b==false){
                    alert("提交数据失败！");
              } else{

                  //重新再次获取这个数据，而不是采用全局变量的方法，那种方法，没有用！
                  var username=$("input[name='username']").val();
                  var   telephone=$("input[name='telephone']").val();
                  var  birthday=$("input[name='birthday']").val();
                  var   address=$("input[name='address']").val();
                  var  job=$("input[name='job']").val();
                  var  id_number=$("input[name='id_number']").val();
                  var radio=$("input[name='radio']").val();
                  var is_marray=$("input[name='is_marry']").val();

                  if(username!=null&&username!=""&&telephone!=null&&telephone!=""&&
                      birthday!=null&&birthday!=""&&address!=null&&address!=""&&job!=null&&job!=""&&
                      id_number!=null&&id_number!=""
                  ){

                    //  loadPatientInfo();
                    //  alert(username+":"+telephone+":"+birthday+":"+address+":"+job+":"+id_number);
                     // alert("提交数据成功");


                      $.ajax({
                          type:"GET",
                          url:"${pageContext.request.contextPath}/admin/userForPatient/getPatientBeforeAjaxSelect" ,
                          dataType:"JSON",
                          data:{"username":username,"telephone":telephone,"birthday":birthday,"address":address,"job":job,"id_number":id_number,"sex":radio,"is_marray":is_marray},
                          success: function (data) {
                              if (data!=null&&data!=""){
                                  var number=0;
                                  var type=data.type;
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
                                  var  str=year+"-"+month+"-"+strDate+"T"+dateHours+":"+dateMinutes;
                                // alert("currentdate="+str);

                                  if (type=='success'){

                                      //$("input[name='save']").attr("data-toggle","modal").attr("data-target","#myModal");
                                      //data-toggle="modal" data-target="#myModal"
                                      //返回在登录的时候，病人的信息
                                      var  num=data.number;
                                      //获取门诊类型
                                      var allAppoint_categorys=data.allAppoint_categorys;
                                      if (num!=0){

                                          //头部
                                          var content="\t\t\t\t<div class=\"form-horizontal\" style=\"border: 0px solid red;height:auto;width:700px;\">\n" +
                                              "                   \n" +
                                              "                      \t \t\t\t\t\t<div class=\"form-group\">\n" +
                                              "\t\t\t\t\t\t<label for=\"inputEmail3\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                              "\t\t\t\t\t\t\t<input type=\"text\" name=\"username\" value='"+username+"' readonly='readonly' class=\"form-control\" id=\"inputEmail3\" placeholder=\"姓名\">\n" +
                                              "\t\t\t\t\t\t</div>\n" +
                                              "\t\t\t\t\t</div>\n" +
                                              "\t\t\t\t\t\n" ;


                                          content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                                              "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">就诊编号</label>\n" +
                                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                              "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" readonly='readonly' value='"+num+"' name=\"number\" id=\"inputPassword3\" placeholder=\"就诊编号\" />\n" +
                                              "\t\t\t\t\t\t</div>\n" +
                                              "\t\t\t\t\t</div>\n";


                                          content+="<div class=\"form-group\">\n" +
                                              "\t\t\t            <label for=\"patientContent\" class=\"col-sm-2 control-label\">主诉</label>\n" +
                                              "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                              "\t\t\t                <textarea placeholder=\"输入病人的基本症状\"  class=\"form-control\"  name=\"patientContent\"  id=\"patientContent\"></textarea>\n" +
                                              "\t\t\t            </div>\n" +
                                              "\t\t\t        </div>\n" ;

                                          content+= "\t\t\t\t\t<div class=\"form-group\">\n" +
                                              "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">挂号时间</label>\n" +
                                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                              "\t\t\t\t\t\t\t<input type=\"datetime-local\" class=\"form-control\"  readonly='readonly'  name=\"datetime\" id=\"registerDatetime\" >\n" +
                                              "\t\t\t\t\t\t</div>\n" +
                                              "\t\t\t\t\t</div>\n" ;


                                          content+=  "\t\t\t\t\t<div class=\"form-group\">\n" +
                                              "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">挂号费用</label>\n" +
                                              "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                                              "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"fee\" id=\"fee\"  value='1.0' readonly=\"readonly\" placeholder='1.0元'>\n" +
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
                                          "\t\t\t        </div>\n" ;



                                         mainStr=content;

                                         // $("#showDivTab1").html(content);
                                          $("#mainBody").html(mainStr);
                                           $("#registerDatetime").val(str);

                                            //这个是选择门诊类型，如果这个chang函数，放在ajax外面的话，这个select的id
                                          //没有办法识别，所以这个change函数，只能放在ajax里面
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
                                                                  $("#doctors").append("<option value='0'>请选择医生</option>");
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
                                      }
                                  } else if(type=='fail'){
                                      alert("数据查询失败！");
                                  }

                              }
                          },error:function (data) {
                               alert("数据响应失败");
                          }
                      });



                  }
              }
          });


    //这个是填写好数据，准备帮助病人挂号
    $("button[name='registerPatientInfo']").click(function () {

        //病人信息
        var username=$("input[name='username']").val();
        var   telephone=$("input[name='telephone']").val();
        var  birthday=$("input[name='birthday']").val();
        var   address=$("input[name='address']").val();
        var  job=$("input[name='job']").val();
        var  id_number=$("input[name='id_number']").val();
        var sex=$("input[name='radio']").val();
        var is_marray=$("input[name='is_marry']").val();
      //  alert("is_marray="+is_marray);
        //  alert("username"+username+"telephone"+telephone+"birthday"+birthday+"address"+address+"job"+job+"id_number"+id_number+"sex"+sex+"is_marray"+is_marray);
         if (username!=null&&username!="" && telephone!=null&&telephone!="" && birthday!=""&&birthday!=null && address!=null&&address!=""&&
             job!=""&&job!=null&&id_number!=null&&id_number!=""&&sex!=null&&sex!=""&& is_marray!="" && is_marray!=null
         ){

            //在病人的信息输入完成后，进入到这个挂号的信息
             //挂号信息
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
             var content=$("#patientContent").val();
            // alert("times"+times+"introduce"+introduce+"addressss"+addressss+"comment"+comment);

            if ( number!=null && number!="" && registerDatetime!=null && registerDatetime!="" && fee!=null &&fee!="" && introduce!=null && introduce!="" && addressss!=null && addressss!=""&&content!=null&&content!=""){
               // alert("开始挂号3");
                $.ajax({
                    type:"GET",
                    data:{"username":username,"telephone":telephone,"birthday":birthday,"address":address,"job":job,"is_marray":is_marray,
                        "id_number":id_number,"sex":sex,"number":number,"registerDatetime":registerDatetime,
                        "fee":fee,"_type":_type,"appoint":appoint,"office":offices,"doctors":doctors,
                        "times":times,"introduce":introduce,"addressss":addressss,"comment":comment,"content":content},
                    dataType:"JSON",
                    url:"${pageContext.request.contextPath}/admin/userForPatient/patientRegisterInfoInject",
                    success:function (data) {
                        if (data!=null&&data!=""){
                            var  type=data.type;
                            if (type=='success'){
                                alert("已经成功挂号");
                                $("#close").trigger("click");
                            } else if (type=='fail'){
                                alert("挂号失败!");
                            }else if (type=='logout'){
                                alert("你已经离线，请重新登录");
                                window.location.href="${pageContext.request.contextPath}/admin/login";
                            }
                        }
                    },error:function (data) {
                        alert("在挂号插入挂号信息响应失败！");
                    }
                });
            }
         }






    });




//弹出层的内容：
          function loadPatientInfo(){
              var content="\t\t\t\t<div class=\"form-horizontal\" style=\"border: 0px solid red;height:auto;width:700px;\">\n" +
                  "                   \n" +
                  "                      \t \t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputEmail3\" class=\"col-sm-2 control-label\">姓名</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t\t<input type=\"text\" name=\"username\" class=\"form-control\" id=\"inputEmail3\" placeholder=\"姓名\">\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t\n" +
                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">就诊编号</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" value=\"\" name=\"number\" id=\"inputPassword3\" placeholder=\"就诊编号\" />\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +


                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">挂号时间</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t\t<input type=\"datetime-local\" class=\"form-control\" name=\"datetime\" id=\"inputPassword3\" >\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +


                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"fee\" class=\"col-sm-2 control-label\">挂号费用</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"fee\" id=\"fee\"  readonly=\"readonly\" placeholder='1.0元'>\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +




                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">挂号类型</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t\t<input type=\"radio\"  id=\"radioone\" name=\"radio\"   placeholder=\"Password\" checked=\"checked\"> 初诊\n" +
                  "\t\t\t\t\t\t\t<input type=\"radio\"  id=\"radiotwo\"  name=\"radio\"   placeholder=\"Password\"> 复诊\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +




                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">门诊类型</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t    <select class=\"form-control\">\n" +
                  "\t\t\t\t\t\t    \t<option>普通门诊</option>\n" +
                  "\t\t\t\t\t\t    \t<option>专家门诊</option>\n" +
                  "\t\t\t\t\t\t    \t<option>专科门诊</option>\n" +
                  "\t\t\t\t\t\t    \t<option>特需门诊</option>\n" +
                  "\t\t\t\t\t\t    \t<option>夜间门诊</option>\n" +
                  "\t\t\t\t\t\t    </select>\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t\n" +


                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">科室名称</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t    <select class=\"form-control\">\n" +
                  "\t\t\t\t\t\t    \t<option>骨科</option>\n" +
                  "\t\t\t\t\t\t    \t<option>心脏外科</option>\n" +
                  "\t\t\t\t\t\t    \t<option>内科</option>\n" +
                  "\t\t\t\t\t\t    \t<option>大肠科</option>\n" +
                  "\t\t\t\t\t\t    \t<option>心脑科</option>\n" +
                  "\t\t\t\t\t\t    </select>\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +



                  "\t\t\t\t\t\n" +
                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">值班医生</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t    <select class=\"form-control\">\n" +
                  "\t\t\t\t\t\t    \t<option>jack</option>\n" +
                  "\t\t\t\t\t\t    \t<option>alice</option>\n" +
                  "\t\t\t\t\t\t    \t<option>tom</option>\n" +
                  "\t\t\t\t\t\t    \t<option>lisi</option>\n" +
                  "\t\t\t\t\t\t    \t<option>wangwu</option>\n" +
                  "\t\t\t\t\t\t    </select>\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +

                  "\t\t\t\t\t\n" +
                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">就诊地址</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t    \t<input type=\"text\" class=\"form-control\" value=\"三楼一大厅\" id=\"inputPassword3\" placeholder=\"Password\" />\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +


                  "\t\t\t\t\t\n" +
                  "\t\t\t       \n" +
                  "\t\t\t        <div class=\"form-group\">\n" +
                  "\t\t\t            <label for=\"comment\" class=\"col-sm-2 control-label\">备注(*过敏):</label>\n" +
                  "\t\t\t            <div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t                <textarea placeholder=\"是否对药物过敏\"  class=\"form-control\"  name=\"comment\"  id=\"comment\"></textarea>\n" +
                  "\t\t\t            </div>\n" +
                  "\t\t\t        </div>\n" +


                  "\t\t\t        \n" +
                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t\t<label for=\"inputPassword3\" class=\"col-sm-2 control-label\">医生介绍</label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-4 col-lg-4 col-xs-4 col-md-4\">\n" +
                  "\t\t\t\t\t\t\t<textarea class=\"form-control\"  placeholder=\"医生详情介绍\"   name=\"introduce\"  id=\"introduce\"  ></textarea>\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\n" +
                  "\t\t\t\t\t<div class=\"form-group\">\n" +
                  "\t\t\t\t\t   <label for=\"info\" class=\"col-sm-2 control-label\"></label>\n" +
                  "\t\t\t\t\t\t<div class=\"col-sm-offset-2 col-sm-10\" style='margin-left: -170px;'>\n" +
                  "\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-success\">确认</button>\n" +
                  "\t\t\t\t\t\t\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\t\n" +
                  "\t\t\t\t\t\t\t<button type=\"reset\" class=\"btn btn-default\">取消</button>\n" +
                  "\t\t\t\t\t\t</div>\n" +
                  "\t\t\t\t\t</div>\n" +
                  "                     \n" +
                  "\t\t\t\t</div>";
              $("#showDivTab1").html(content);
          }



      });



     /*关于提交表单数据的问题验证后数据消失的问题：
      1:这种情况是因为，提交按钮type="submit",而不是button，而且会有form表单，标签
      解决方案：
       a:将form标签清除掉，
       b:将type类型改为button，这样的话，填写到表格里面的数据，验证失败，提示框跳出来后，之前输入的数据不会消失，接着
      输入没有填写的数据*/


   $("input[name='id_number']").change(function () {
       var  id_number=$("input[name='id_number']").val();
       if (id_number!=null&&id_number!=""){
           var id=/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/;
           if (!(id.test(id_number))) {
               alert("输入的身份证号码格式不正确，请重新输入");
               $("input[name='save']").attr('disabled', 'disabled');
               $("input[name='birthday']"). val("");
           }else{
               $("input[name='save']").attr('disabled', false);
               var  birthday = id_number.substr(6,8);
               var yyyy = id_number.substr(6,4);
               var MM = id_number.substr(10,2);
               var dd = id_number.substr(12,2);
               var time = yyyy + "-" + MM + "-" + dd;
               var datetime=document.querySelector("input[name='birthday']");
               datetime.value=time;
           }
       }
   });
     function checkBefore() {
         var  flag=true;
          var username=$("input[name='username']").val();
         var   telephone=$("input[name='telephone']").val();
         var  birthday=$("input[name='birthday']").val();
         var   address=$("input[name='address']").val();
         var  job=$("input[name='job']").val();
         var  id_number=$("input[name='id_number']").val();

         //这个挂号费用是自动填充的，但是不同类型门诊挂号的费用是不同的，专家的门诊费，和普通门诊的费用是不同的
         //而且这个挂号的费用的字段是放在挂号表里面的，不是存放在患者表里面的
         //  var  fee=$("input[name='fee']").val();

         //这个备注的信息是存放在预约表里面的，不存放在病人的信息表里面
         //  var  comment=$("textarea[name='comment']").val();

         /*  前端写数据验证的思路：
             1:先判空，不管是不是正确的数据，先判断是不是空的
             2:按照不同要求的数据，验证数据输入的格式，内容是不是正确
          */

         if (username==null||username==""){
             alert("请你输入患者姓名");
             flag=false;
         } else if (telephone==null||telephone==""){
             alert("请你输入联系方式");
             flag=false;
         }else if (address==null||address==""){
             alert("请你输入家庭地址");
             flag=false;
         }else if (job==null||job==""){
             alert("请你输入职业");
             flag=false;
         } else if (id_number==null||id_number==""){
             alert("请你输入身份证号");
             flag=false;
         }else if (birthday==null||birthday==""){
             alert("请你输入出生日期");
             flag=false;
         }
        /* else{*/
           /*  var id=/^[1-9][0-9]{5}(19|20)[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|31)|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}([0-9]|x|X)$/;
             if (!(id.test(id_number))){
                 alert("输入的身份证号码格式不正确，请重新输入");
                 flag=false;
             }else{*/
                 //340881199506291353

                 //这个substr函数，start：参数是指下标，从0开始
                 //birthday = id_number.substr(6,8);
               //  birthday = birthday.replace(/-/g, ""); // "2010/08/01";
                // var date_now=new Date(birthday);
                // var yyyy = id_number.substr(6,4);
                // var MM = id_number.substr(10,2);
                // var dd = id_number.substr(12,2);
                 // var time = yyyy + "-" + MM + "-" + dd;
                // var date=new Date(Date.parse(str.replace(/-/g, "/")));
                // var milliseconds=new Date(Date.parse(time)).getTime().toLocaleString();
                 //alert("milliseconds="+milliseconds);
                 //方法1：
              //  var datetime=document.querySelector("input[name='birthday']");
               //  datetime.value=time;
                 //方法2：
                //$("input[name='birthday']").val(time);

              /* 如何填充type=date这个标签的数据，关键在于type=date标签需要什么类型和什么格式的数据
                 最简单的方法：获取type=date类型的数据的格式方法：用这个标签选择数据，然后传递到servlet后台去
                 查看这个数据格式，即可获取这个数据的格式*/
         return flag;
     }
</script>
</html>
