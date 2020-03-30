package com.chinasoft.hospital_manager.controller.user.clinicManager;

import com.chinasoft.hospital_manager.domain.Department;
import com.chinasoft.hospital_manager.domain.Menu;
import com.chinasoft.hospital_manager.domain.Role;
import com.chinasoft.hospital_manager.domain.User;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.employee.EmployeeService;
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

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Jack on 2020/1/9 20:27
 */
@Controller
@RequestMapping("/admin/user")
public class ClinicManagerController {

     @Autowired
    private EmployeeService employeeService;


     /**
      * @description:  这个是退出frameset框架的操作的java后台代码
      * @author jack
      * @date 2020/2/12 16:47
      * @param null
      * @return
      */

     @RequestMapping("/logout")
     public void logout(HttpServletResponse response,HttpServletRequest request) throws IOException {
         //这个是退出frameset框架的操作的java后台代码
         HttpServletResponse httpServletResponse = (HttpServletResponse) response;
         httpServletResponse.getWriter().print("<script>parent.window.location.href="+request.getContextPath()+"'/admin/logout'</script>");
     }


    /**
     * @description:这个是挂号人员，点击门诊挂号，跳出lists页面的加载
     * @author jack
     * @date   20:47
     * @param null
     * @return
     */
    @RequestMapping ("/patientRegister")
    public ModelAndView patientRegister(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        String menuid = request.getParameter("menuid");
        if (menuid!=null&&menuid!=""){
            andView.addObject("menuid",menuid);
        }
        andView.setViewName("admin/user_clinicManager/lists");
        return andView;
    }

    /**
     * @description:这个函数是加载，门诊挂号页面，输入病人的基本信息
     * @author jack
     * @date 2020/1/9 20:55
     * @param null
     * @return
     */
    @RequestMapping(value = "/loadPatientInfo",method = RequestMethod.GET)
    public ModelAndView loadPatientInfo(){
        ModelAndView andView=new ModelAndView();
        andView.setViewName("admin/user_clinicManager/register");
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
     public ModelAndView  patientRegisterInfoInject(HttpServletRequest request){
          ModelAndView   andView =new ModelAndView();

           return andView;
     }

/*
      思路：
       1：输入病人的基本信息，然后提交，从该页面提交过去， 先存放在servlet 里面
       2：将该医院挂号的信息， 显示在挂号页面上， 同时将病人信息，再次传递到该页面，同时将数据,隐藏，
       3：同时将挂号数据， 和病人的数据提交过去 ，然后分别插入不同的两张表， 挂号成功！
*/
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
               andView.addObject("pageBean",allUserInfo);
               andView.addObject("userInfo", users);
              // andView.setViewName("/admin/user_clinicManager/query");//这样会导致将所有的数据，删除了，会出现报错
           }
       }
          andView.addObject("menuid",menuid);
          andView.setViewName("/admin/user_clinicManager/query");
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
      /* Map<String, String[]> parameterMap = request.getParameterMap();
          User user=new User();
       Class<?> aClass = Class.forName("com.chinasoft.hospital_manager.domain.User");
       Object o = aClass.newInstance();
       Field[] declaredFields = aClass.getDeclaredFields();
       Method[] declaredMethods = aClass.getDeclaredMethods();*/
       // BeanUtils.populate(user,parameterMap);
    /*   for (Map.Entry<String,String[]> entry:parameterMap.entrySet()){
           String key = entry.getKey();
           String[] value=entry.getValue();
     *//*      if (declaredFields!=null&&declaredFields.length>0){
               for (Field field:declaredFields){
                     if (field.getName().equals(key)){
                        // String setMethod="set"+field.getName().toUpperCase();

                     }
               }
           }*//*

          if (declaredFields!=null&&declaredFields.length>0){
              for (Method method:declaredMethods){
                  System.out.println(method.getName());
                  method.invoke(o, value[0]);
              }
          }

       }*/

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
           int currentCount=3;

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
               andView.addObject("pageBean",pageBean);
               andView.addObject("userInfo", users);
               // andView.setViewName("/admin/user_clinicManager/query");//这样会导致将所有的数据，删除了，会出现报错
           }
       }


       andView.addObject("menuid",menuid);
      // andView.setViewName("/admin/user_clinicManager/query");
       andView.setViewName("/admin/employee/userClinicInfo/query");
       return andView;
   }


}
