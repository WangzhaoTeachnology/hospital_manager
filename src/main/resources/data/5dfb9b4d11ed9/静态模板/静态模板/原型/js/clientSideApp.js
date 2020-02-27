//��������Ҽ�
//document.oncontextmenu = contextmenu ;
/**
 * ������������Ի���
 *
 */
function fPopUpCalendarDlg(obj){
    var ctrlobj
    if(obj.tagName==null)
        ctrlobj=document.all(obj);
    else
        ctrlobj=obj;
	showx = event.screenX - event.offsetX -160//+ 25; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	retval = window.showModalDialog("/js/CalendarDlg.htm", "", "dialogWidth:195px; dialogHeight:230px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:0;" );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
/**
  *��ѡ��Ա
 */
function fPopUpPersonDlg(idf,namef){
    idobj=document.all(idf);
    nameobj=document.all(namef);
    showx = event.screenX - event.offsetX -160//+ 25; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	retval = window.showModalDialog("/per/perQuery.do", null, "dialogWidth:800px; dialogHeight:400px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:0;resizable:yes;" );
	if( retval != null ){
	    var s=retval.split("|");
		idobj.value = s[0];
		nameobj.value=s[1];
	}else{
		idobj.value = "";
		nameobj.value="";
	}
}
/**
 * �����´���
 *
 */
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left){
	var parameter=features+" top="+top+",left="+left+",width="+width+",height="+hight;
	if(scrollbars=="no"){
		parameter+=",scrollbars=no";
	}else{
		parameter+=",scrollbars=yes";
	}
	window.open(theURL,winName,parameter);
}

/**
 * �����������Ի���
 *
 */
function fPopUpCodeDlg(obj){
	var ctrlobj=document.all(obj);
    showx = event.screenX - event.offsetX - 150; // + deltaX;
    showy = event.screenY - event.offsetY + 18; // + deltaY;
    var arg="dict_num="+ctrlobj.dict_num;
    arg+="&curCode="+ctrlobj.code;
    if(ctrlobj.layer!="undefined"&&ctrlobj.layer!=null){
        arg+="&layer="+ctrlobj.layer;
    }    
    retval = window.showModalDialog("/jsp/common/codeDlg.jsp?"+arg,"" , "dialogWidth:215px; dialogHeight:230px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:0;resizable:yes" );
    if( retval != null ){
        rs =  retval.split(",");
    	ctrlobj.value = rs[1];
    	ctrlobj.code = rs[0];
    	if(ctrlobj.next!=null&&document.all(ctrlobj.next)!=null){
    	    //document.all(ctrlobj.next).focus();
    	    nextInput(ctrlobj);
    	}
    }
}
/**
 * ���¼��ش�����
 *
 */
function reloadCSApp(obj){
    parent.code.location="/jsp/common/codeInterpret.jsp";
}
/**
 * �����ý���
 *
 */
function obtainFocus(obj){
try{
	var obj=obj;//document.all(obj_name);
    if(obj!=null){
    	if(obj.readonly==true){
            if(obj.next!=null&&document.all(obj.next)!=null){
    	        document.all(obj.next).focus();
    	    }
    	}else{
    	    if(obj.formula!=null&&obj.formula!=''){
    	        if(obj.value==null||obj.value==""){
    	            methodInvoke(obj);
    	        }
    		}else if(obj.value!="" && obj.dict_num!="" && obj.dict=="yes"){
                getShowCode(obj.dict_num,obj.value,obj);                
    		}else{
    		    obj.focus();
    		    return;
    		}
    	}
    }
}catch(e){}
}

var win = window;
var n = 0;
function forSearch(str){
    //if(event.keyCode!=13){//�س�
    //	return
    //}

    var txt, i, found;
    if (str == "")
        return false;
        txt = win.document.body.createTextRange();
		
    for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
        txt.moveStart("character", 1);
        txt.moveEnd("textedit");
    }
    if (found) {
        txt.moveStart("character", -1);
        txt.findText(str);
        txt.doctorsForPatient();
        txt.scrollIntoView();
        n++;
		
    }else {
        if (n > 0) {
            n = 0;
            forSearch(str);
        }else{
		document.forms(0).searchName.value="";
            alert("��Ǹ!û���ҵ�");
		     return false;
		}
    }
    return false;
}
function matchInput(curobj){
    obj=curobj;
    var matchbl = false;
    if(obj.value==""||obj.value==null){//if

        obj.code = "";
        obj.value = "";
        matchbl=true;
    }else{
        if(obj.dict_num==null||obj.dict_num==''){
            matchbl = true;
        }else{
            matchbl = getShowCode(obj.dict_num,obj.value,obj);             
        }
    }
    if(matchbl == false){
        curobj.value="";
        alert("û��ƥ��Ĵ�����,����������");
        curobj.focus();
        return false;
    }else{

        return true;
    }
}
function nextInput(curobj){
    try{
        obj=curobj;
        if(matchInput(curobj)){
            //��ת����һ��input����
            if(obj.next==null){
                return;
            }else{
                var nextObj=document.all(obj.next);
                while(nextObj!=null){
                    if(nextObj.type!='hidden'&& nextObj.readOnly==false && nextObj.disabled==false){
                        nextObj.focus();
                        break;
                    }else{
                        if(nextObj.next!=null){
                            nextObj=document.all(nextObj.next);
                        }else{
                            return;
                        }
                    }
                }
            }
        }
    }catch(e){
    }
}
/**
 * �س���ת����һ������
 *
 */
function gotoNextInput(curobj){
    if(event.keyCode!=13){//�س�
    	return
    }
    nextInput(curobj);
}

/**
 *���뷭��:����ֵ�������������
 *��Ҫ����onload����
 */
function interpret(form){
    var i=0;
    try{
        for(var num = 0; num < form.length; num++){
            var obj =form.elements[num];
            if(obj.value!="" && obj.dict_num!="" && obj.dict=="yes"&&obj.value.indexOf("*****")<0){
                try{
                    var codeset = CSApp.get(obj.dict_num) ;
                    var code = codeset.get(obj.value) ;
                    obj.code=code.id;
                    obj.value=code.name;
                }catch(e){
                }
            }
            i++;
        }
    }catch(e){
        return "";
    }
}
/**
 *���뷭��:��������ɴ���ֵ
 *����onsubmit����
 */
function code(form){
    for(var num = 0; num < form.length; num++){
        var obj =form.elements[num];
        if(obj.value!=""&&obj.code!="" && obj.dict=="yes"){
        	obj.value=obj.code;
        }
    }
    return true;
}
/**
 *���뷭��:���ݾ���Ĵ����źʹ���ֵ,�����������
 *���ݴ���õ�ҳ����ʾ��(��ʼ)
 */
function getShowValue(dict_num,code){
	var strShowValue;
	if(dict_num==""||dict_num==null){
	    return code;
    }else if(code==""||code==null||code.indexOf("***")>-1){
    	return code;
   	}
   	try{
        var  codeSet = CSApp.get(dict_num);
        strShowValue = codeSet.get(code);
        return strShowValue.name;
    }catch(e){
        //alert('�������'+code);
        return code ;
    }
}
function getShowSpell(code,orgFlag){
    if(code==null||code==""||code.indexOf("***")>-1){
        return "";
    }
    if(orgFlag ==null||orgFlag=="" ){
        orgFlag =false;
    }
    try{
        if(orgFlag){
            var  codeSet = CSApp.get("OU");
            strShowValue = codeSet.get(code);
            return strShowValue.spell;
        }else{
            //var  codeSet = CSApp.get("All");
           var strShowValue;// = codeSet.get(code);
           var key =CSApp.keys();
           for(i=0;i<key.length;i++){
                var keyvalue = key[i];
                if(keyvalue=='OU') continue;
                if(keyvalue=='CS') continue;
                var codeset=CSApp.get(keyvalue);
                if(codeset==null)continue;
                var codeobj=codeset.get(code);
                if(codeobj!='undefined'&&codeobj!=null){
                    strShowValue=codeobj;
                    return strShowValue.spell;
                    //break;
                }
           }
        }
        return code;
    }catch(e){
        //alert('�������'+code);
        return code ;
    }
}
/**
 *���뷭��:���ݾ������ֵ,�����������
 *code ����ֵ
 *orgFlag �Ƿ�������룬true �� false �� ȱʡ�Ƿ�
 *���ݴ���õ�ҳ����ʾ��(��ʼ)
 */
function getShowValueByCode(code,orgFlag){
    if(code==null||code=="" || code=="null"){
        return "";
    }
    if(orgFlag ==null||orgFlag=="" ){
        orgFlag =false;
    }
    try{
        if(orgFlag){
            var  codeSet = CSApp.get("OU");
            strShowValue = codeSet.get(code);
            if(strShowValue == null)
                return code;
            else
                return strShowValue.name;
        }else{
            //var  codeSet = CSApp.get("All");
           var strShowValue;// = codeSet.get(code);
           var key =CSApp.keys();
           for(i=0;i<key.length;i++){
                var keyvalue = key[i];
                if(keyvalue=='OU') continue;
                if(keyvalue=='CS') continue;
                var codeset=CSApp.get(keyvalue);
                if(codeset==null)continue;
                var codeobj=codeset.get(code);
                if(codeobj!='undefined'&&codeobj!=null){
                    strShowValue=codeobj;
                    return strShowValue.name;
                    //break;
                }
           }
        }
        return code;
    }catch(e){
        //alert('�������'+code);
        return code ;
    }
}
/**
 *���뷭��:���ݾ���Ĵ����ź�������,����ɴ���ֵ
 */
function getShowCode(dict_num,desc,obj){
    try{
        if(obj.code!=null){
            var v=getShowValue(dict_num,obj.code);
            if(v==desc){
                obj.value=v;
                return true;
            }
        }
        var currentSet = CSApp.get(obj.dict_num);

        var keys=currentSet.keys();
        flag=false;
        for(i=0;i<keys.length;i++){
            var codeobj = currentSet.get(keys[i]);
            var name =codeobj.name;
            var spell= codeobj.spell;
            var treeId=codeobj.treeId;
            var layer = codeobj.layer;
            if(obj.layer!=null&&obj.layer!=""){
                layer=obj.layer;
            }
            var pnode= codeobj.pnode;
            var pid=codeobj.pid;
            //if(pid!=-1){//�Ǹ��ڵ�
                if(name.indexOf(desc)>-1){//��������
                    if(layer==0){//Ҷ�ӽڵ�ֵ
                        if( pnode == 0 ){
                            obj.value = codeobj.name;
                            obj.code = codeobj.id;
                            flag=true;
                            break;
                        }
                    }else if(layer==1){//����ڵ�ֵ
                        obj.value = codeobj.name;
                        obj.code = codeobj.id;
                        flag=true;
                        break;
                    }
                }else if(spell.indexOf(desc)>-1){//����ƴ��
                    if(layer==0){
                        if( pnode == 0 ){
                            obj.value = codeobj.name;
                            obj.code = codeobj.id;
                            flag=true;
                            break;
                        }
                    }else if(layer==1){
                        obj.value = codeobj.name;
                        obj.code = codeobj.id;
                        flag=true;
                        break;
                    }
                }else if(treeId==desc){//����tree����
                    if(layer==0){
                        if( pnode == 0 ){
                            obj.value = codeobj.name;
                            obj.code = codeobj.id;
                            flag=true;
                            break;
                        }
                    }else if(layer==1){
                        obj.value = codeobj.name;
                        obj.code = codeobj.id;
                        flag=true;
                        break;
                    }
                }
            //}
        }
        return flag;
    }catch(e){
        return false;
    }
}
/**
 * У��checkBox��radio�Ƿ�ѡ��
 * chk: object
 */
function checkMutilSelect(chk){
	if (chk==null){
		return false;
	}
	var size = chk.length;
	if (size==null){
		if (chk.checked){
			return true;
		}else{
			return false;
		}
	}else {
		for(var i=0;i<size;i++){
			if (chk[i].checked){
				return true;
			}
		}
	}
	return false;
}
//��ʾֻ��ѡ��һ��
function selectOnlyOne(field){      //add by zenghx
    size = field.length;
    var flag = 0;
    id = null;
    if(size != null){
        for(i=0;i<size;i++){
            if(field[i].checked == true){
                flag = flag +1;
                if(flag ==1)
                    id = field[i].value;
                if(flag >1)
                    break;
            }
        }
    }else
       id = field.value;

    if(flag >1){
       alert("ֻ��ѡ��һ����");
       return null;                 //ѡ�����ʱ����null
    }else
       return id;                   //ѡ����ȷ�򷵻ر�ѡ�е�checkbox��ֵ
}

/**
 * ��Ӧȫѡ�¼���
 * all:ȫѡ�¼�checkbox����
 * chk:��Ҫȫѡcheckbox����
 */
function selectAll(all,chk){
    if (chk==null){
        return false;
    }
    var size = chk.length;
    if (size==null){
        if(!chk.disabled)
            chk.checked=all.checked;;
    }else {
        for(var i=0;i<size;i++){
            if(!chk[i].disabled)
                chk[i].checked=all.checked;
        }
    }
    return true;
}

/**
 * �ύ���������
 * targObj:parent���ڵ�iframe������
 * height:��С�߶�
 */
function forsubmit(form1,flag){
	if(checkAll(form1,flag)){
		code(form1);
		//form1.submit();
		return true;
	}else{
		return false;
	}
}

/**
 * iframe����Ӧ�߶�
 * targObj:parent���ڵ�iframe������
 * height:��С�߶�
 */
function iframeResize( targObj,height){
    if(targObj=='main'){
        var targWin = parent.document.all[targObj];
        if(targWin != null){
            var HeightValue = this.document.body.scrollHeight;
            var targWinHeight=targWin.document.body.scrollHeight;
            targWin.style.pixelHeight = HeightValue;
            if(HeightValue<targWin.document.body.clientHeight){
                targWin.style.pixelHeight =targWin.document.body.clientHeight;
            }
        }
    }
}

function linkOver(src){
    src.style.color = "#FF6600";
    src.style.cursor="hand";
    src.style.textDecoration = "underline";
}
function linkOut(src){
    src.style.color = "#294673";
    src.style.cursor="auto";
    src.style.textDecoration = "none";
}

function  ctrlbar(){
    if(document.all.showTree.style.display==""){
        document.all.showTree.style.display="none"
        document.all.ctrlBnt.src='../../../images/button_2.gif';
    }else{
        document.all.showTree.style.display=""
        document.all.ctrlBnt.src='../../../images/button_1.gif';
    }
}

//������Ա���ᣬ�õ�ʡ��
function getNativeAB(nativeName){
    nativeab = "";
    if(nativeName.indexOf("������") != -1)
        nativeab = "������";
    else
        nativeab = nativeName.substring(0,2);
    return nativeab;
}