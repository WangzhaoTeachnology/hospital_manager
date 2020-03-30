package com.chinasoft.hospital_manager.controller.user.clinicUserForPatient;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.patient.UserForPatientService;

import com.chinasoft.hospital_manager.utils.MenuUtils;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;


/**
 * Created by Jack on 2020/1/28 23:31
 */
@Controller
@RequestMapping("/admin/userForPatient")
public class ClinicUserForPatient {

    @Autowired
    private UserForPatientService userForPatientService;



    /**
     * @description:这个是功能本想是解决用户的离线的状态下，解决重新登录的账号的问题，但是由于
     * 返回值的问题限制，不能解决！！！
     * @author jack
     * @date 2020/2/1 19:06
     * @param null
     * @return
     */

    public static ModelAndView getUserInfoIfReturnLogin(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        if (user==null){
            andView.setViewName("/admin/login");
        }else {
            andView.addObject("uid",user.getId());
            andView.setViewName("/admin/userForPatient/patientRegisterInfoInject");
        }
        return andView;
    }

    /**
     * @description：这个在门诊管理模块， 门诊挂号中，将病人的信息和挂号表的数据，插入到挂号表里面
     * @author jack
     * @date 2020/1/11 16:28
     * @param null
     * @return
     */
    @RequestMapping(value="/patientRegisterInfoInject",method =  RequestMethod.GET )
    @ResponseBody
    public Map<String,Object> patientRegisterInfoInject(HttpServletRequest request) throws ParseException {

        Map<String,Object> insertPatientUser=new HashMap<String, Object>();
        Map<String,Object> insertClinicInfo=new HashMap<String, Object>();
        Map<String,Object> response=new HashMap<String, Object>();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat simpleDateFormat1=new SimpleDateFormat("yyyyMMddHHmm");
        SimpleDateFormat simpleDateFormat2=new SimpleDateFormat("yyyyMMddHHmmss");

        User user=null;int uid=0;
            user =(User) request.getSession().getAttribute("user");

        //如果这个是人是处于离线的状态，那么这个获取这个数据是失败的，那么直接通过这个判断
        //跳到login登录的状态:
       /* 解决方法：把这个获取用户的信息的状态用另外一个函数，获取，这个函数的返回值来决定这
                个返回到login页面还是继续插入数据*/



       /* data:{"username":username,"telephone":telephone,"birthday":birthday,"address":address,"job":job,
                "id_number":id_number,"sex":sex,"number":number,"registerDatetime":registerDatetime,
                "fee":fee,"_type":_type,"appoint":appoint,"offices":offices,"doctors":doctors,
                "times":times,"introduce":introduce,"addressss":addressss,"comment":comment}*/

        //病人信息
    /*    var username=$("input[name='username']").val();
        var   telephone=$("input[name='telephone']").val();
        var  birthday=$("input[name='birthday']").val();
        var   address=$("input[name='address']").val();
        var  job=$("input[name='job']").val();
        var  id_number=$("input[name='id_number']").val();
        var sex=$("input[name='radio']").val();
        var is_marray=$("input[name='is_marry']").val();*/



        //病人信息

        String id = getRandomString(5);
        String username = request.getParameter("username");
        String telephone = request.getParameter("telephone");
        String birthday = request.getParameter("birthday");
         long birth= simpleDateFormat.parse(birthday).getTime();
        Date _birthday=new Date(birth);
        String address = request.getParameter("address");
        String job = request.getParameter("job");
        String id_number = request.getParameter("id_number");
        String sex = request.getParameter("sex");
        int is_marry=Integer.parseInt(request.getParameter("is_marray"));

        if (user!=null){
             uid=user.getId();
             if (uid!=0){
                 insertPatientUser.put("uid",uid);
             }
        }else {
            response.put("type","logout");//处于离线的状态
            return response;
        }
        insertPatientUser.put("id",id);
        insertPatientUser.put("name",username);
        insertPatientUser.put("id_number",id_number);
        insertPatientUser.put("sex",sex);
        insertPatientUser.put("is_marry",is_marry);
        insertPatientUser.put("birthday",_birthday);
        insertPatientUser.put("telephone",telephone);
        insertPatientUser.put("address",address);
        insertPatientUser.put("work",job);

        int i = userForPatientService.insertPatientUserInfo(insertPatientUser);

        //挂号信息

        Date date=new Date();
        String format = simpleDateFormat2.format(date);
        String cid=format ;//自定义id，然后按照这个挂号编号，查询数据

        String registerDatetime = request.getParameter("registerDatetime");
        String register = ConvertDateStringToMillsTime(registerDatetime);
        long time1 = simpleDateFormat1.parse(register).getTime();
        Date _register=new Date(time1);
        String content=request.getParameter("content");
        String fee = request.getParameter("fee");
        String _type = request.getParameter("_type");
        String appoint = request.getParameter("appoint");
        String office = request.getParameter("office");
        String doctor = request.getParameter("doctors");
        String time = request.getParameter("times");
      //  String introduce = request.getParameter("introduce");
        String addressss = request.getParameter("addressss");
        String comment = request.getParameter("comment");
        //这个是就诊编号
        String number = request.getParameter("number");
        insertClinicInfo.put("id",cid);//自动义，id，按照十分秒
        insertClinicInfo.put("patient_id",id);
        insertClinicInfo.put("content",content);
        insertClinicInfo.put("fee",fee);
        insertClinicInfo.put("datetime",_register);
        insertClinicInfo.put("clinc_category_id",Integer.parseInt(appoint));
        insertClinicInfo.put("address",addressss);
        insertClinicInfo.put("user_id",uid);
        insertClinicInfo.put("office_id",Integer.parseInt(office));
        insertClinicInfo.put("doctor_id",Integer.parseInt(doctor));
        insertClinicInfo.put("number",Integer.parseInt(number));
        insertClinicInfo.put("status",Integer.parseInt(_type));
        insertClinicInfo.put("flag",0);
        insertClinicInfo.put("time",time);
        if (comment!=null&&comment!=""){
            insertClinicInfo.put("comment",comment);
        }
        int i1 = userForPatientService.insertPatitentClinicInfo(insertClinicInfo);
        if (i1>0&&i>0){
            response.put("type","success");
        }else {
            response.put("type", "fail");
        }

       // INSERT INTO patient (id,name,id_number,sex,is_marry,birthday,telephone,address,work,uid) VALUES (#{id},#{name},#{id_number},#{sex},#{is_marry},#{birthday},#{telephone},#{address},#{work},#{uid})

        //    INSERT INTO appointment (appointId,patient_id,fee,datetime,clinc_category_id,address,user_id,office_id,doctor_id,`comment`,number,`status`,flag,time) values (#{appointId},#{patient_id},#{fee},#{datetime},#{clinc_category_id},#{address},#{user_id},#{office_id},#{doctor_id},#{number},#{`status`},#{flag},#{time})
        return response;
    }

/*
      思路：
       1：输入病人的基本信息，然后提交，从该页面提交过去， 先存放在servlet 里面
       2：将该医院挂号的信息， 显示在挂号页面上， 同时将病人信息，再次传递到该页面，同时将数据,隐藏，
       3：同时将挂号数据， 和病人的数据提交过去 ，然后分别插入不同的两张表， 挂号成功！
*/


/**
 * @description:这个是为了挂号人员：将病人的信息输入后，然后点击挂号，把病人的信息，传递过来，然后将挂号页面所需要的信息，查询出来
 * 显示在挂号的页面上
 * 这个在会自动加载，在输入病人的信息后，马上就加载而不是独立的servlet请求
 * @author jack
 * @date 2020/1/28 23:43
 * @param null
 * @return
 */

@ResponseBody
@RequestMapping(value = "/getAllAppoint_categorys",method = RequestMethod.GET)
  public Map<String,Object> getAllAppoint_categorys(HttpServletRequest request){
      Map<String,Object> map=new HashMap<String, Object>();

      //查询门诊类型

    //科室类型
    //值班医生  :这个是按照今天的时间，查询
    //按照挂号时间，查询今天挂号的人数，然后按照这个人数，给出一个编号，这个作为挂号编号
    List<Appoint_category> allAppoint_categorys = userForPatientService.getAllAppoint_categorys();
    if (allAppoint_categorys!=null){
       map.put("type","success");
       map.put("allAppoint_categorys",allAppoint_categorys);
       return map;
    }
    map.put("type","fail");
    return map;
  }
/**
 * @description:这个是查询所有的科室
 * @author jack
 * @date 2020/2/9 17:11
 * @param null
 * @return
 */

  @ResponseBody
  @RequestMapping(value = "/getOfficesByAppoint_category")
  public Map<String ,Object> getOfficesByAppoint_category(HttpServletRequest request){
    Map<String,Object> map=new HashMap<String, Object>();
    int id=Integer.parseInt(request.getParameter("id"));
    //  String date = request.getParameter("date");//测试时间
      if (id!=0){
        List<Offices> officesByAppoint_category = userForPatientService.getOfficesByAppoint_category(id);
        if (officesByAppoint_category!=null){
            map.put("type","success");
            map.put("officesByAppoint_category",officesByAppoint_category);
            return map;
        }else {
            map.put("type","fail");
            return map;
        }
     }else {
          map.put("type","init");
          return map;
      }
  }


  @RequestMapping(value = "/getPatientBeforeAjaxSelect",method = RequestMethod.GET)
  @ResponseBody
  public Map<String,Object> getPatientBeforeAjaxSelect(HttpServletRequest request) throws ParseException {
    Map<String,Object> map=new HashMap<String, Object>();
    Map<String,Object> response=new HashMap<String, Object>();//这个是在把病人的数据输入后，然后跳出一个框子，把这个病人的信息，存放在那个显示框字的函数里面
      Date date=new Date(System.currentTimeMillis());
      int number=0;
      //按照当前的日期，进行查询数据，挂号的当天有多少人了，然后再次挂号的时候，按照这个人数在加1
      //得到这个挂号的编号
      int patientBeforeAjaxSelect = userForPatientService.getPatientBeforeAjaxSelect(date);
      List<Appoint_category> allAppoint_categorys = userForPatientService.getAllAppoint_categorys();
    //  Map<String, String[]> parameterMap = request.getParameterMap();

      //获取数据

      //  data:{"username":username,"telephone":telephone,"birthday":birthday,"address":address,"job":job,"id_number":id_number,"radio":radio,"is_marray":is_marray},
      String username=request.getParameter("username");
      String sex=request.getParameter("sex");
      String telephone=request.getParameter("telephone");
      String birthday = request.getParameter("birthday");
      String address = request.getParameter("address");
      String job = request.getParameter("job");
      String id_number = request.getParameter("id_number");
      String is_marray = request.getParameter("is_marray");


      map.put("username",username);
      map.put("telephone",telephone);
      map.put("birthday",birthday);
      map.put("address",address);
      map.put("job",job);
      map.put("id_number",id_number);
      map.put("is_marray",is_marray);
      map.put("sex",sex);
    //  Patient patient=new Patient(username,Integer.parseInt(id_number),sex,Integer.parseInt(is_marray),birthday,telephone,address,job);
      //public Patient(String name, int id_number, String sex, int is_marry, String birthday, String telephone, String address, String work)

      if (allAppoint_categorys!=null){
          map.put("allAppoint_categorys",allAppoint_categorys);
          if (patientBeforeAjaxSelect!=0){
              number=patientBeforeAjaxSelect;
              map.put("number",number+1);
          }else {
              map.put("number",number+1);
          }
          map.put("type","success");
          return map;
      }
      map.put("type","fail");
      return map;
  }

  /**
   * @description：这个是根据科室的id，查询每个不同的科室里面的医生
   * @author jack
   * @date 2020/2/16 21:21
   * @param null
   * @return
   */

  @ResponseBody
  @RequestMapping(value = "/getDoctorByOndayTime",method = RequestMethod.GET)
  public  Map<String,Object> getDoctorByOndayTimeByOfficesId(HttpServletRequest request){
    Map<String,Object> map=new HashMap<String, Object>();
    int id=Integer.parseInt(request.getParameter("id"));
    if (id!=0){
        List<Doctor> doctorByOndayTime = userForPatientService.getDoctorByOndayTime(id);
        if (doctorByOndayTime!=null){
            map.put("type","success");
            map.put("doctors",doctorByOndayTime);
            return map;
        }else{
            map.put("type","fail");
        }
    }else if (id==0){
        map.put("type","init");
    }

      return map;
  }



/**
 * @description:根据不同的id，查询医生在该天的工作表
 * @author jack
 * @date 2020/1/29 17:37
 * @param null
 * @return
 */

  @ResponseBody
  @RequestMapping (value = "/getDoctorsByDetails")
  public Map<String,Object> getDoctorsTimesById(HttpServletRequest request){
    Map<String,Object> map=new HashMap<String, Object>();
    int id=Integer.parseInt(request.getParameter("id"));
    if (id!=0){
        Work doctorsTimesById = userForPatientService.getDoctorsTimesById(id);
        if (doctorsTimesById!=null){
            map.put("type","success");
            map.put("workInfo",doctorsTimesById);
            return map;
        }
        map.put("type","fail");
        return map;
    }else {
        map.put("type","init");
    }
    return map;
  }

/**
 * @description:这个本想通过这个函数，查询当天医生上班的时间段，可是这个函数最终没有用上，所以没有用
 * @author jack
 * @date 2020/1/29 20:36
 * @param null
 * @return
 */

  @RequestMapping("/getDoctorsTimesById")
  @ResponseBody
  public Map<String,Object> getDoctorsByDetailsById(HttpServletRequest request){
    Map<String,Object> map=new HashMap<String, Object>();
    int id=Integer.parseInt(request.getParameter("id"));
      Doctor doctorsByDetailsById = userForPatientService.getDoctorsByDetailsById(id);
      if (doctorsByDetailsById!=null){
          map.put("type","success");
          map.put("doctor",doctorsByDetailsById);
          return map;
      }
      map.put("type","fail");
      return map;
  }

    public static String getRandomString(int length){
        String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random=new Random();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<length;i++){
            int number=random.nextInt(62);
            sb.append(str.charAt(number));
        }
        return sb.toString();
    }

    /**
     * @description:这个是查询所有的挂号成功的病人的信息,这个是默认按照今天得日期时间，查询数据的
     * @author jack
     * @date 2020/2/3 20:40
     * @param null
     * @return
     */

    @RequestMapping(value = "/selectPatientNumberInfo")
    public ModelAndView selectPatientNumberInfo(HttpServletRequest request){
      ModelAndView andView=new ModelAndView();
       List<Menu> menus = (List<Menu> )request.getSession().getAttribute("menus");
        String menuid = request.getParameter("menuid");
        List<Menu> third=null;
        if (menuid!=null&&menuid!=""){
            int _menuid=Integer.parseInt(menuid);
             third= MenuUtils.getThird(menus, _menuid);
        }

        if (third!=null){
           andView.addObject("third",third);
        }else {
            andView.setViewName("redirect:/admin/login");
            return andView; //如果这个，menuid不为空，而这个menus失效了，那么三级菜单为空，那么这个也跳到logout
        }

        //指定当前页数和个数
        String currentPage = request.getParameter("currentPage");

        if (currentPage==null){
            currentPage="1";
        }
        int currentCount=4;

        PageBean<Appointment> appointmentPageBean = userForPatientService.selectPatientNumberInfo(Integer.parseInt(currentPage), currentCount);
        List<Appointment> list = appointmentPageBean.getList();
        if (list!=null&&list.size()>0){
            andView.addObject("pageBean",appointmentPageBean);
            andView.addObject("list",list);
            andView.addObject("menuid",menuid);
        }
        andView.setViewName("/admin/user_clinicManager/clinic_Department/select");
        return andView;
    }

/**
 * @description：这个是挂号人员，在管理挂号病人的页面，中的搜索函数
 * @author jack
 * @date 2020/2/11 15:03
 * @param null
 * @return
 */

    @RequestMapping(value = "/searchPatientsInfoByCondition",method = RequestMethod.GET)
    public ModelAndView  searchPatientsInfoByCondition(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView andView =new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        String search = request.getParameter("search");
        String menuid = request.getParameter("menuid");
        String condition=request.getParameter("conditon").trim();

        //按照在选全部的条件下面，按照这个开始时间和结束时间，检索数据
        String startime=request.getParameter("startime");
        String endtime=request.getParameter("endtime");


        if (menuid!="" && menuid!=null && condition!=null && condition!=""){
            HttpSession session = request.getSession();
            Object menu = session.getAttribute("menus");
            List<Menu> list_menu=(List<Menu>)menu;
            List<Menu> third=null;

            //每次加载页面的时候，进行，三级菜单的查询
            if (list_menu!=null&&list_menu.size()>0){
                int id=Integer.parseInt(menuid);
                third = MenuUtils.getThird(list_menu, id);
            }

            //根据条件，map键值队的赋值，操作
            if (search!=null&&search!=""){
                if (condition.equals("性别")){
                    if (search.indexOf("男")>=0){
                        map.put("sex","男");
                    }else if (search.indexOf("女")>=0){
                        map.put("sex","女");
                    }
                }else  if (condition.equals("身份证编号")){
                    map.put("id_number",search);
                }else  if (condition.equals("挂号编号")){
                    map.put("id",search);
                }
                else  if (condition.equals("全部")){
                    map.put("all",search);
                }
                else  if (condition.equals("今天")){
                    map.put("today",search);
                    if (startime!=null&&endtime!=null){
                        map.put("startime",startime);
                        map.put("endtime",endtime);
                    }
                }
                else if (condition.equals("姓名")){
                    map.put("name",search);
                }
            }



            //指定当前页数和个数
            String currentPage = request.getParameter("currentPage");
            if (currentPage==null){
                currentPage="1";
            }
            int currentCount=4;

            PageBean<Appointment> pageBean = userForPatientService.searchPatientsInfoByCondition(map,Integer.parseInt(currentPage),currentCount);
            List<Appointment> users = pageBean.getList();
            //加工数据
            if (users!=null){
                for (Map.Entry<String,Object> entry:map.entrySet()){
                    String key = entry.getKey();
                    if (key.equals("name")){
                        for (Appointment appointment:users){
                            String name = appointment.getPatient().getName();
                            name=" <font style=\"color: red;\">"+name+"</font>";
                            appointment.getPatient().setName(name);
                        }
                    }else  if (key.equals("sex")){
                        for (Appointment appointment:users){
                            String sex = appointment.getPatient().getSex();
                            sex=" <font style=\"color: red;\">"+sex+"</font>";
                            appointment.getPatient().setSex(sex);
                        }
                    }/*else  if (key.equals("id")){
                        for (Appointment appointment:users){
                            String id=appointment.getId();
                            id=" <font style=\"color: red;\">"+id+"</font>";
                            appointment.setId(id);
                        }
                    }*/
                    else  if (key.equals("id_number")){
                        for (Appointment appointment:users){
                            String id_number = appointment.getPatient().getId_number();
                            id_number=" <font style=\"color: red;\">"+id_number+"</font>";
                          appointment.getPatient().setId_number(id_number);
                        }
                    }
                }
            }



            if(third!=null){
                andView.addObject("third",third);
            }else {
                //andView.setViewName("redirect:/admin/logout");
                String requestURL = request.getRequestURL().toString();
                andView.setViewName(requestURL);
                return andView; //如果这个，menuid不为空，而这个menus失效了，那么三级菜单为空，那么这个也跳到logout
            }


            if (users!=null) {
                andView.addObject("condition",condition);
                andView.addObject("search",search);
                andView.addObject("pageBean",pageBean);
                andView.addObject("list", users);
            }
        }else {
         //   andView.setViewName("redirect:/admin/logout");
            //  request.getRequestURL()
            String requestURL = request.getRequestURL().toString();
            andView.setViewName(requestURL);
            return andView; //如果这个menuid为空，那么跳到logout
        }

        andView.addObject("menuid",menuid);
        andView.setViewName("/admin/user_clinicManager/clinic_Department/select");
        return andView;
    }

    /**
     * @description:这个是按照这个id，查询数据，然后双击行时，显示这个查询的数据
     * @author jack
     * @date 2020/2/4 23:56
     * @param null
     * @return
     */
    @RequestMapping("/selectPatientNumberInfoById")
    @ResponseBody
    public Map<String,Object> selectPatientNumberInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id = request.getParameter("id");
        if (id!=null&&id!=""){
           // Appointment appointment = userForPatientService.selectPatientNumberInfoById(Integer.parseInt(id));
            Appointment appointment = userForPatientService.selectPatientNumberInfoById(id);
            if (appointment!=null){
                String comment = appointment.getComment();
                if (comment==null){
                    appointment.setComment("无");
                }
                map.put("type","success");
                map.put("appointment",appointment);
                return map;
            }
            map.put("type","fail");
            return map;
        }else{
            map.put("type","error");
        }
        return map;
    }


    @ResponseBody
    @RequestMapping("/updatePatientNumberInfoById")
    public Map<String,Object> updatePatientNumberInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String menuid = request.getParameter("menuid");
        String id = request.getParameter("id");

        return map;
    }

/**
 * @description:这个是在30分钟内，修改挂号信息的操作，超过这个时间，修改失败，这个函数是点击修改时，数据的回显
 * @author jack
 * @date 2020/2/5 23:50
 * @param null
 * @return
 */

    @RequestMapping("/beforeSelectupdatePatientNumberInfoById")
    @ResponseBody
    public Map<String,Object> beforeSelectupdatePatientNumberInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String menuid = request.getParameter("menuid");
        String id = request.getParameter("id");
        if (menuid!=null&&menuid!=""&&id!=null&&id!=""){
            Appointment appointment = userForPatientService.beforeSelectupdatePatientNumberInfoById(id);
            //查询门诊
            List<Appoint_category> allAppoint_categorys = userForPatientService.getAllAppoint_categorys();

            //
            if (appointment!=null&&allAppoint_categorys!=null){
                map.put("type","success");
                map.put("appointment",appointment); //成功
                map.put("allAppoint_categorys",allAppoint_categorys);
                return map;
            }
            map.put("type","fail"); //失败
            return map;
        }else {
            map.put("type","error"); //异常
        }
        return map;
    }
    
    /**
     * @description:这个是点击修改后，填好数据，然后确认修改数据的函数
     * @author jack
     * @date 2020/2/9 1:36
     * @param null
     * @return 
     */
    
    @RequestMapping(value = "/updatePatientInfoById")
    @ResponseBody
    public Map<String,Object> updatePatientInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id = request.getParameter("id");
        String date = request.getParameter("_date");



        return map;
    }

    /**
     * @description:这个是点击退号操作的函数
     * @author jack
     * @date 2020/3/29 14:10
     * @param null
     * @return
     */

    @RequestMapping("/deletePatientInfoByIdBetweenTime")
    @ResponseBody
    public  Map<String ,Object> deletePatientInfoByIdBetweenTime(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id = request.getParameter("id");
        int i = userForPatientService.deletePatientInfoByIdBetweenTime(id);
        if (i>0){
            map.put("type","success");
            return map;
        }else {
            map.put("type","fail");
        }
        return map;
    }



/**
 * @description:这个是为了将这个日期时间类型中数据，除去T
 * @author jack
 * @date 2020/2/3 20:48
 * @param null
 * @return
 */

    public  static  String ConvertDateStringToMillsTime(String s){
        String startStr="";
        if (s!=null){
            char[] chars = s.toCharArray();
            for (int i=0;i<chars.length;i++){
                if (chars[i]>='0'&&chars[i]<='9'){
                    startStr+=chars[i];
                }
            }
        }
        return startStr;
    }



}
