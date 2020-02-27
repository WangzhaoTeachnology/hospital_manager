<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/admin/boostrap/js/jquery-1.11.3.min.js"></script>
<script language="javascript" src="${pageContext.request.contextPath}/static/print/LodopFuncs.js"></script>
<object  id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
    <embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="${pageContext.request.contextPath}/static/print/install_lodop32.exe"></embed>
</object>
<script type="text/javascript">
    $(function(){
        $("#kkk").click(function(){
            var LODOP=getLodop();
            LODOP.PRINT_INIT("test套打");
            LODOP.ADD_PRINT_HTM(10,55,"100%","100%",document.getElementById("textarea01").value);
            LODOP.SET_PRINT_PAGESIZE(1,'200mm','152.4mm','');    //设置纸张高度

           LODOP.ADD_PRINT_TEXT(10,250,157,20,'客户公司名称');
           LODOP.ADD_PRINT_TEXT(432,149,157,20,'联系电话');

            LODOP.PRINT();
           // LODOP.PREVIEW();
        })
    })
</script>
<body>
<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="${pageContext.request.contextPath}/static/print/install_lodop32.exe"></embed>
<textarea rows="15"  cols="80" style="display: none;" id="textarea01">
<table   border="1" width="360" height="220" style="border-collapse:collapse;border:solid 1px;margin: auto;" bordercolor="#000000">
  <tr>
    <td width="100%" height="240">
      <p align="center">
      <font face="隶书" size="5" style="letter-spacing: 10px">郭德强</font>
      <p align="center"><font face="宋体" size="3">科学家</font></p>
      <p align="left"><font face="宋体" size="3">　地址：中国北京社会科学院附近东大街西胡同</font></p>
      <p align="left"><font face="宋体" size="3">　电话：010-88811888</font></p>
      <p><br>      　
      </p>
    </td>
  </tr>
</table>
</textarea>
<input type="button"  value="打印凭证" id="kkk"/>
</body>

<script>
   /* var LODOP; //声明为全局变量   
    //页面下载打印
    function print() {
        layer.load(2);
        $.post("@Url.Content("~/MyDeal/NCRFileDown")", { id: '@id', type: "online" }, function (res) {
            layer.closeAll('loading');
            if (!res.iserror) {
                var htmlPath = ".." + res.data.pathHtml;//返回HTML页面路径
                LODOP = getLodop();
                LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_按网址打印");
                LODOP.ADD_PRINT_URL(30, 0, 746, "95%", htmlPath);//746
                LODOP.SET_PRINT_STYLEA(0, "HOrient", 3);
                LODOP.SET_PRINT_STYLEA(0, "VOrient", 3);
                //		LODOP.SET_SHOW_MODE("MESSAGE_GETING_URL",""); //该语句隐藏进度条或修改提示信息
                //		LODOP.SET_SHOW_MODE("MESSAGE_PARSING_URL","");//该语句隐藏进度条或修改提示信息
                LODOP.PREVIEW();
            } else {
                if (res.errormsg != "") {
                    dialog_msg.alert('提示', res.errormsg, 'error');
                }
            }
        }, "json");
    }*/
</script>
</html>