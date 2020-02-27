package com.chinasoft.hospital_manager.controller.admin.employee;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.employee.EmployeeService;
import com.chinasoft.hospital_manager.service.admin.patient.UserForPatientService;
import com.chinasoft.hospital_manager.utils.MenuUtils;
import com.sun.xml.internal.messaging.saaj.soap.ver1_1.FaultElement1_1Impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * Created by Jack on 2020/1/9 20:27:这个是从以前存在的类里面复制了一份过来，为了整理文件夹，以前的那个待会再删除
 */
@Controller
@RequestMapping("/admin/employee")
public class EmployeeManagerController {

     @Autowired
    private EmployeeService employeeService;

    @Autowired
    private UserForPatientService userForPatientService;





    /**
 * @description:这个函数是查看挂号人员的信息
 * @author jack
 * @date 2020/1/18 13:10
 * @param null
 * @return
 */

  @RequestMapping("/clinicUserInfo")
  public ModelAndView FindClincUserInfo(HttpServletRequest request) throws Exception {
      request.setCharacterEncoding("UTF-8");
       ModelAndView andView=new ModelAndView();
       Map<String,Object> condition_map=new HashMap<String, Object>();
       String menuid = request.getParameter("menuid");

       if (menuid!="" && menuid!=null){
           //这个是每次加载这个页面的时候都要将这个三级菜单，查询出来
           HttpSession session = request.getSession();
           Object menu = session.getAttribute("menus");
           List<Menu> list_menu=(List<Menu>)menu;
           List<Menu> third=null;
           if (list_menu!=null&&list_menu.size()>0){
               int id=Integer.parseInt(menuid);
               third = MenuUtils.getThird(list_menu, id);
           }
           String currentPage = request.getParameter("currentPage");
           if (currentPage==null){
               currentPage="1";
           }
           int currentCount=3;


           PageBean<User> allUserInfo = employeeService.getAllUserInfo(Integer.parseInt(currentPage),currentCount);
         //  PageBean<User> allUserInfo = employeeService.searchUserInfoByCondition(condition_map, Integer.parseInt(currentPage), currentCount);
           List<User> users = allUserInfo.getList();

           if(third!=null){
               andView.addObject("third",third);
           }
           if (users!=null) {
               andView.addObject("page",allUserInfo);
               andView.addObject("userInfo", users);
              // andView.setViewName("/admin/user_clinicManager/query");//这样会导致将所有的数据，删除了，会出现报错
           }
       }
          andView.addObject("menuid",menuid);
          andView.setViewName("admin/employee/userClinicInfo/query");
       return andView;
   }
/**
 * @description:添加信息之前，查询部门的信息
 * @author jack
 * @date 2020/1/20 2:08
 * @param null
 * @return
 */

   @RequestMapping(value = "/addBeforeFindUserInfo",method = RequestMethod.GET)
   @ResponseBody
   public Map<String,Object> addBeforeFindUserInfo(HttpServletRequest request){
      Map<String,Object> map=new HashMap<String, Object>();
       List<Role> roles = employeeService.selectAllRole();
       List<Department> departments = employeeService.selectDepartment();
       if (roles!=null){
           map.put("roles",roles);
       }
       if (departments!=null){
           map.put("department",departments);
       }
       return map;
   }
/**
 * @description：添加信息
 * @author jack
 * @date 2020/1/20 2:08
 * @param null
 * @return
 */

   @ResponseBody
   @RequestMapping(value = "/addUserInfo",method = RequestMethod.GET)
   public Map<String,Object> addUserInfo(HttpServletRequest request) throws Exception {
       request.setCharacterEncoding("UTF-8");
       Map<String,Object> request_map=new HashMap<String, Object>();
       Map<String,Object> response_map=new HashMap<String, Object>();


   /*    获取传递来的数据的思路:
         1:用户普通的方法：,request.getParameter();
         2：用相对于来说快一点的方法，request.getParameterMap();：这个对于传递来的字段的名字与该映射的类的字段名字如何存在不一致的情况的话，可能会发生异常！
         3:"用"反射，将获取的数据的字段的名字与该类的set函数名字比较，然后调用set方法赋值，但是这个方法相对来说比较复杂
      */
   //下面采用1：

       String menuid=request.getParameter("menuid");
       String name=request.getParameter("name");
       String username=request.getParameter("username");
       String password=request.getParameter("password");
       String birthday=request.getParameter("birthday");
       int sex = Integer.parseInt(request.getParameter("sex"));

       String profession=request.getParameter("profession");
       String job=request.getParameter("job");
       String school=request.getParameter("school");
       int department=Integer.parseInt(request.getParameter("department"));
       Date datetime=new Date();//获取现在的时间，将这个时间插入到datetime字段里面
       SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
       long time = simpleDateFormat.parse(birthday).getTime();
       Date birth_date=new Date(time);//这个挂号人员的出生日期
       request_map.put("name",name);
       request_map.put("username",username);
       request_map.put("password",password);
       request_map.put("birthday",birth_date);
       request_map.put("sex",sex);
       request_map.put("profession",profession);
       request_map.put("job",job);
       request_map.put("school",school);
       request_map.put("department",department);
       request_map.put("datetime",datetime);
       request_map.put("role",2);
       int i = employeeService.addUserInfo(request_map);
       if (i>0){
           response_map.put("type","success");
           response_map.put("menuid",menuid);
       }else {
           response_map.put("type","fail");
       }
       return response_map;
   }

   /**
    * @description:根据id删除信息
    * @author jack
    * @date 2020/1/20 2:09
    * @param null
    * @return
    */

   @ResponseBody
   @RequestMapping("/deleteUserInfoById")
   public Map<String,String> deleteUserInfoById(HttpServletRequest request){
       Map<String,String> map=new HashMap<String, String>();
       String menuid = request.getParameter("menuid");
       int id =Integer.parseInt(request.getParameter("id"));
       int i = employeeService.deleteUserInfoById(id);
       if (i>0){
           map.put("type","success");
           map.put("menuid",menuid);
       }else {
           map.put("type","fail");
       }
     return  map;
   }
/**
 * @description：修改数据之前的数据回显
 * @author jack
 * @date 2020/1/21 22:25
 * @param null
 * @return
 */

   @ResponseBody
   @RequestMapping(value = "/beforUpdateFindUserInfo",method = RequestMethod.GET)
   public  Map<String,Object> beforUpdateFindUserInfo(HttpServletRequest request){
       Map<String,Object> map=new HashMap<String, Object>();
       int id=Integer.parseInt(request.getParameter("id"));
       String menuid=request.getParameter("menuid");
       User user = employeeService.beforUpdateFindUserInfo(id);
       if (user!=null){
           map.put("user",user);
           map.put("menuid",menuid);
       }else {
           map.put("type","fail");
       }
       return map;
   }


   /**
    * @description:这个是修改数据的代码
    * @author jack
    * @date 2020/1/20 15:34
    * @param null
    * @return
    */

   @ResponseBody
   @RequestMapping(value = "/updateUserInfoById",method = RequestMethod.GET)
   public Map<String, Object> updateUserInfoById(HttpServletRequest request) throws ParseException {
      Map<String,Object> map=new HashMap<String, Object>();
     Map<String,Object> response=new HashMap<String, Object>();
       String id = request.getParameter("id");
       String menuid=request.getParameter("menuid");
       String name=request.getParameter("name");
       String username=request.getParameter("username");
       String password=request.getParameter("password");
       String birthday=request.getParameter("birthday");
       int sex = Integer.parseInt(request.getParameter("sex"));
       String profession=request.getParameter("profession");
       String job=request.getParameter("job");
       String school=request.getParameter("school");
       int department=Integer.parseInt(request.getParameter("department"));

       SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
       long time = simpleDateFormat.parse(birthday).getTime();
       Date birth_date=new Date(time);//这个挂号人员的出生日期

       map.put("id",Integer.parseInt(id));
       map.put("name",name);
       map.put("username",username);
       map.put("password",password);
       map.put("birthday",birth_date);
       map.put("sex",sex);
       map.put("profession",profession);
       map.put("job",job);
       map.put("school",school);
       map.put("department",department);
       map.put("role",2);

       int i = employeeService.updateUserInfoById(map);
         if (i>0){
             response.put("type","success");
             response.put("menuid",menuid);
         }else{
             response.put("type","fail");
         }
       return response;
   }

   /**
    * @description：这个是根据搜索的关键字，查询数据的
    * @author jack
    * @date 2020/1/21 22:24
    * @param null
    * @return
    */

   @RequestMapping(value = "/searchUserInfoByCondition",method = RequestMethod.GET)
   public ModelAndView  searchUserInfoByCondition(HttpServletRequest request) throws UnsupportedEncodingException {
       request.setCharacterEncoding("UTF-8");
       ModelAndView andView =new ModelAndView();
       Map<String,Object> map=new HashMap<String, Object>();
       String search = request.getParameter("search");
       String menuid = request.getParameter("menuid");
       String condition=request.getParameter("conditon").trim();

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
                       map.put("sex",0);
                   }else if (search.indexOf("女")>=0){
                       map.put("sex",1);
                   }
               }else  if (condition.equals("真实姓名")){
                   map.put("name",search);
               }else if (condition.equals("姓名")){
                   map.put("username",search);
               }
           }

           //指定当前页数和个数
           String currentPage = request.getParameter("currentPage");
           if (currentPage==null){
               currentPage="1";
           }
           int currentCount=2;

           //查询出来的数据
         //  List<User> users = employeeService.searchUserInfoByCondition(map);

           PageBean<User> pageBean = employeeService.searchUserInfoByCondition(map,Integer.parseInt(currentPage),currentCount);
           List<User> users = pageBean.getList();
           //加工数据
           if (users!=null){
               for (Map.Entry<String,Object> entry:map.entrySet()){
                   String key = entry.getKey();
                   if (key.equals("username")){
                       for (User user:users){
                           String username = user.getUsername();
                           username=" <font style=\"color: red;\">"+username+"</font>";
                           user.setUsername(username);
                       }
                   }else if (key.equals("name")){
                       for (User user:users){
                           String name = user.getName();

                           //关键字加红
                       /*    int index=-1;String str=null;
                         while ((index=name.indexOf(search,index))!=-1){
                             str+=name.substring(0,index-1);
                             str+=" <font style=\"color: red;\">"+search+"</font>";
                             index=index+search.length();
                         }*/
                        // str+=name.substring(index,name.length());



                           //这个是直接整体加红
                           name=" <font style=\"color: red;\">"+name+"</font>";
                           //name=str;
                           user.setName(name);
                       }
                   }else  if (key.equals("sex")){
                      /* for (User user:users){
                           Integer sex = user.getSex();
                       }*/
                   }
               }
           }



           if(third!=null){
               andView.addObject("third",third);
           }
           if (users!=null) {
               andView.addObject("condition",condition);
               andView.addObject("search",search);
               andView.addObject("page",pageBean);
               andView.addObject("userInfo", users);
               // andView.setViewName("/admin/user_clinicManager/query");//这样会导致将所有的数据，删除了，会出现报错
           }
       }


       andView.addObject("menuid",menuid);
       andView.setViewName("/admin/employee/userClinicInfo/query");
       return andView;
   }

/**
 * @description:这个函数是点击”医生管理的按钮“，查询所有的医生的信息的函数
 * * @author jack
 * @date 2020/2/9 23:20
 * @param null
 * @return
 */
   @RequestMapping("/selectDoctorsInfo")
    public ModelAndView selectDoctorsInfo(HttpServletRequest request) throws UnsupportedEncodingException {
       request.setCharacterEncoding("UTF-8");
       ModelAndView andView=new ModelAndView();
       Map<String,Object> condition_map=new HashMap<String, Object>();
       String menuid = request.getParameter("menuid");
       if (menuid!="" && menuid!=null){
           //这个是每次加载这个页面的时候都要将这个三级菜单，查询出来
           HttpSession session = request.getSession();
           Object menu = session.getAttribute("menus");
           List<Menu> list_menu=(List<Menu>)menu;
           List<Menu> third=null;
           if (list_menu!=null&&list_menu.size()>0){
               int id=Integer.parseInt(menuid);
               third = MenuUtils.getThird(list_menu, id);
           }
           String currentPage = request.getParameter("currentPage");
           if (currentPage==null){
               currentPage="1";
           }
           int currentCount=4;


           PageBean<Doctor> allDoctorsInfo = employeeService.getAllDoctorsInfo(Integer.parseInt(currentPage), currentCount);
           List<Doctor> list = allDoctorsInfo.getList();

           if(third!=null){
               andView.addObject("third",third);
           }else {
               andView.setViewName("redirect:/admin/login");
               return andView; //如果这个，menuid不为空，而这个menus失效了，那么三级菜单为空，那么这个也跳到logout
           }

           if (list!=null) {
               andView.addObject("page",allDoctorsInfo);
               andView.addObject("userInfo", list);
           }
       }else {
           andView.setViewName("redirect:/admin/logout");
           return andView; //如果这个menuid为空，那么跳到logout
       }
       andView.addObject("menuid",menuid);
       andView.setViewName("/admin/employee/doctorsInfo/query");
       return andView;
    }

    /**
     * @description:这个是按照这个id,点击详情时，查看这个医生的详情信息
     * @author jack
     * @date 2020/2/4 23:56
     * @param null
     * @return
     */
    @RequestMapping("/selectDoctorInfoBId")
    @ResponseBody
    public Map<String,Object> selectDoctorInfoBId(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id = request.getParameter("id");
        if (id!=null&&id!=""){
            Doctor doctor = employeeService.selectDoctorInfoById(Integer.parseInt(id));
            List<Appoint_category> allAppoint_categorys = userForPatientService.getAllAppoint_categorys();
            if (doctor!=null&&allAppoint_categorys!=null){
                map.put("type","success");
                map.put("allAppoint_categorys",allAppoint_categorys);
                map.put("doctor",doctor);
                return map;
            }
            map.put("type","fail");
            return map;
        }else{
            map.put("type","error");
        }
        return map;
    }


    /**
     * @description:这个是插入医生的信息的时候，将所有的部门的信息，查询出来
     * @author jack
     * @date 2020/2/9 19:33
     * @param null
     * @return
     */

    @RequestMapping("/beforeSelectInfoAddDoctorInfo")
    @ResponseBody
    public Map<String,Object> beforeSelectInfoAddDoctorInfo(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
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
 * @description:这个函数是添加医生的信息
 * @author jack
 * @date 2020/2/9 22:46
 * @param null
 * @return
 */

    @RequestMapping(value="/addDoctorInfo",method = RequestMethod.POST)
    public  @ResponseBody Map<String,Object> addDoctorInfo(HttpServletRequest request,MultipartFile file){
        Map<String,Object> response_map=new HashMap<String, Object>();
        Map<String,Object> request_map=new HashMap<String, Object>();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyyMMdd");
        try {

            request.setCharacterEncoding("UTF-8");
            //生成uuid
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            //得到上传时的文件名
            String filename=file.getOriginalFilename();
            String menuid=request.getParameter("menuid");
            String name=request.getParameter("name");
            String realname=request.getParameter("realname");
            String password=request.getParameter("password");
            String birthday=request.getParameter("birthday");
            birthday = ConvertDateStringToMillsTime(birthday);
            long birth= simpleDateFormat.parse(birthday).getTime();
            Date _birthday=new Date(birth);
            String profession=request.getParameter("profession");
            String job=request.getParameter("job");
            String prat=request.getParameter("prat");
            String school=request.getParameter("school");
            String strength=request.getParameter("strength");
            String appoint=request.getParameter("appoint");
            String offices=request.getParameter("offices");
            String female=request.getParameter("female");
            String male=request.getParameter("male");
            String sex="";
            if (female!=null && female!=""){
                sex=female;
            } else if (male!=null && male!=""){
                sex=male;
            }
          //  INSERT INTO doctor (realname,url,name,password,sex,strength,status,birthday,profession,school,job,prat,office_id,role_id,appoint_categoryid) VALUES()
            request_map.put("realname",realname);
            request_map.put("url","/static/upload/img/"+filename);
            request_map.put("name",name);
            request_map.put("password",password);
            request_map.put("sex",sex);
            request_map.put("strength",strength);
            request_map.put("birthday",_birthday);
            request_map.put("profession",profession);
            request_map.put("school",school);
            request_map.put("job",job);
            request_map.put("prat",prat);
            request_map.put("office_id",Integer.parseInt(offices));
            request_map.put("role_id",3);
            request_map.put("appoint_categoryid",Integer.parseInt(appoint));
            int i = employeeService.addDoctorInfo(request_map);
            if (i>0){
                response_map.put("type","success");
                response_map.put("menuid",menuid);
            }else {
                response_map.put("type","fail");
            }

            //上传目录地址
            //1.1保存到项目指定目录
            String uploadDir=request.getSession().getServletContext().getRealPath("/")+"static/upload/img";
            //1.2 上传到相对路径 request.getSession().getServletContext().getRealPath("/")+"upload/";
            //1.2 此路径为tomcat下，可以输出看一看

            //如果目录不存在，自动创建文件夹
            File dir=new File(uploadDir);
            if(!dir.exists()){
                dir.mkdir();
            }

            //保存文件对象 加上uuid是为了防止文件重名
            File serverFile=new File(uploadDir+"\\"+filename);
            file.transferTo(serverFile);

        } catch (Exception e) {
            //打印错误堆栈信息
            e.printStackTrace();
            response_map.put("type","upload");
        }

        return response_map;
    }

/**
 * @description：根据医生的id删除信息
 * @author jack
 * @date 2020/2/10 14:28
 * @param null
 * @return
 */
    @ResponseBody
    @RequestMapping("/deleteDoctorInfoById")
    public Map<String,String> deleteDoctorInfoById(HttpServletRequest request){
        Map<String,String> map=new HashMap<String, String>();
        String menuid = request.getParameter("menuid");
        int id =Integer.parseInt(request.getParameter("id"));
        int i = employeeService.deleteDoctorInfoById(id);
        if (i>0){
            map.put("type","success");
            map.put("menuid",menuid);
        }else {
            map.put("type","fail");
        }
        return  map;
    }



/**
 * @description：这个是管理员，管理医生信息，搜索查询的函数
 * @author jack
 * @date 2020/2/11 15:01
 * @param null
 * @return
 */

    @RequestMapping(value = "/searchDoctorsInfoByCondition",method = RequestMethod.GET)
    public ModelAndView  searchDoctorsInfoByCondition(HttpServletRequest request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView andView =new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        String search = request.getParameter("search");
        String menuid = request.getParameter("menuid");
        String condition=request.getParameter("conditon").trim();
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
                }else  if (condition.equals("真实姓名")){
                    map.put("realname",search);
                }else if (condition.equals("姓名")){
                    map.put("name",search);
                }
                else if (condition.equals("职称")){
                    map.put("prat",search);
                }
            }

            //指定当前页数和个数
            String currentPage = request.getParameter("currentPage");
            if (currentPage==null){
                currentPage="1";
            }
            int currentCount=4;

            PageBean<Doctor> pageBean = employeeService.searchDoctorsInfoByCondition(map,Integer.parseInt(currentPage),currentCount);
            List<Doctor> users = pageBean.getList();
            //加工数据
            if (users!=null){
                for (Map.Entry<String,Object> entry:map.entrySet()){
                    String key = entry.getKey();
                    if (key.equals("realname")){
                        for (Doctor doctor:users){
                            String username = doctor.getRealname();
                            username=" <font style=\"color: red;\">"+username+"</font>";
                            doctor.setRealname(username);
                        }
                    }else if (key.equals("name")){
                        for (Doctor doctor:users){
                            String name = doctor.getName();
                            //这个是直接整体加红
                            name=" <font style=\"color: red;\">"+name+"</font>";
                            //name=str;
                            doctor.setName(name);
                        }
                    }else  if (key.equals("sex")){
                      for (Doctor doctor:users){
                          String sex = doctor.getSex();
                          sex=" <font style=\"color: red;\">"+sex+"</font>";
                          doctor.setSex(sex);
                       }
                    }else  if (key.equals("prat")){
                        for (Doctor doctor:users){
                            String prat = doctor.getPrat();
                            prat=" <font style=\"color: red;\">"+prat+"</font>";
                            doctor.setPrat(prat);
                        }
                    }
                }
            }



            if(third!=null){
                andView.addObject("third",third);
            }else {
              //  request.getRequestURL()
                String requestURL = request.getRequestURL().toString();
                andView.setViewName(requestURL);
                return andView; //如果这个，menuid不为空，而这个menus失效了，那么三级菜单为空，那么这个也跳到logout
            }


            if (users!=null) {
                andView.addObject("condition",condition);
                andView.addObject("search",search);
                andView.addObject("page",pageBean);
                andView.addObject("userInfo", users);
            }
        }else {
            andView.setViewName("redirect:/admin/logout");
            return andView; //如果这个menuid为空，那么跳到logout
        }

        andView.addObject("menuid",menuid);
        andView.setViewName("/admin/employee/doctorsInfo/query");
        return andView;
    }

/**
 * @description:这个是修改医生信息的数据的回显
 * @author jack
 * @date 2020/2/10 19:43
 * @param null
 * @return
 */

    @ResponseBody
    @RequestMapping(value = "/beforUpdateFindDoctorInfo",method = RequestMethod.GET)
    public  Map<String,Object> beforUpdateFindDoctorInfo(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        int id=Integer.parseInt(request.getParameter("id"));
        String menuid=request.getParameter("menuid");
        Doctor doctor = employeeService.beforUpdateFindDoctorInfo(id);
        List<Appoint_category> allAppoint_categorys = userForPatientService.getAllAppoint_categorys();
        if (doctor!=null&&allAppoint_categorys!=null){
            map.put("type","success");
            map.put("allAppoint_categorys",allAppoint_categorys);
            map.put("doctor",doctor);
            map.put("menuid",menuid);
            return map;
        }
         else {
            map.put("type","fail");
        }
        return map;
    }



/**
 * @description：这个是医生的修改数据的提交：尚未完成！
 * @author jack
 * @date 2020/2/10 23:03
 * @param null
 * @return
 */
    @ResponseBody
    @RequestMapping(value = "/updateDoctorInfoById",method = RequestMethod.GET)
    public Map<String, Object> updateDoctorInfoById(HttpServletRequest request) throws ParseException {
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> response=new HashMap<String, Object>();
        String id = request.getParameter("did");
        String menuid=request.getParameter("menuid");
        String realname=request.getParameter("realname");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String birthday=request.getParameter("birthday");
         String sex =request.getParameter("sex");
        String profession=request.getParameter("profession");
        String strength=request.getParameter("strength");
        String school=request.getParameter("school");
        String prat=request.getParameter("prat");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
        long time = simpleDateFormat.parse(birthday).getTime();
        Date birth_date=new Date(time);//这个挂号人员的出生日期

        map.put("id",Integer.parseInt(id));
        map.put("realname",realname);
        map.put("name",name);
        map.put("password",password);
        map.put("birthday",birth_date);
        map.put("sex",sex);
        map.put("profession",profession);
        map.put("strength",strength);
        map.put("school",school);
        map.put("prat",prat);


        int i = employeeService.updateDoctorInfoById(map);
        if (i>0){
            response.put("type","success");
            response.put("menuid",menuid);
        }else{
            response.put("type","fail");
        }
        return response;
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
