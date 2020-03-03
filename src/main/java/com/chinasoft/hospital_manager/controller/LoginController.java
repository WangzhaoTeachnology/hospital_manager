package com.chinasoft.hospital_manager.controller;


import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.service.admin.login.LoginService;
import com.chinasoft.hospital_manager.utils.MenuUtils;

import org.apache.taglibs.standard.lang.jstl.NullLiteral;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.wiring.ClassNameBeanWiringInfoResolver;
import org.springframework.context.support.BeanDefinitionDsl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2019/12/21 23:09
 */
@Controller
@RequestMapping("/admin")
public class LoginController {


    @Autowired
    private  LoginService loginService;


    /**
     * @description
     * @author jack
     * @date 2019/12/21 23:30
     * @param request
     * @return org.springframework.web.servlet.ModelAndView
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public ModelAndView login(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        List<Role> roles = loginService.selectRole();
           if (roles!=null){
               andView.addObject("roles",roles);
           }
        andView.setViewName("/admin/login");
        return  andView;
    }
    /**
     * @description
     * @author jack
     * @date 2019/12/21 23:33
     * @param null
     * @return
     */

        //用ajax做登录主页：

        /*  用户名，密码是不是为空的判断在前端判断
        采用ajax技术，将controller登录的状态，响应给页面，提示用户输入的数据是哪里存在错误
        登录成功，提示登录成功给用户！
        */
        /*  输入用户名，查询，
        判断是不是为空
        判断用户名是不是存在，如果存在，继续往下判断，如果不存在，直接提示用户名错误
        根据用户名，和密码，查询数据是不是存在，不存在的话，那么这个提示密码错误，不然登录成功
        */

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public  Map<String,String> loginToIndex(HttpServletRequest request, HttpServletResponse response){
          ModelAndView andView=new ModelAndView();
        Map<String,String> map=new HashMap<String, String>();
        try {
            request.setCharacterEncoding("UTF-8");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String roleName=request.getParameter("rolename");
            //把这个数据再次传递回去，传递到请求的ajax页面处
                map.put("username",username);
                map.put("password",password);
                map.put("rolename",roleName);
       /*    再login页面输入数据后，点击登录后跳到这个页面
                然后在登录成功的时候，将再次跳到index页面，将这个跳到index页面
                与直接在地址栏上输入数据跳到index页面的请求方式不同，
                所以在登录成功的时候，再次加上ajax请求，加上post，跳到index页面
                此时再次跳到index页面，又得在index函数接受这个数据，所以
                第一次将前端的数据传递到后台，只不过是先存放在后台，然后在将后台的数据传递到
                前台，再次在前台将数据传递过来，登录的到主页

                这样麻烦的逻辑，？？为了实现自动登录的功能，而自动登录是直接在浏览器的地址上输入地址，请求为get
                而想区分，登录成功后的请求是post，只有在登录成功的状态下，再次设置ajax请求，而这个请求的数据
                仍然是上次登录输入的
                所以在这里面再次存放数据，然后传递到前台
                */


            //这个是可以直接登录的，当然在有效的时间内，可以实现自动登录，那么就去取cookie里面的数据
            if ("超级管理员".equals(roleName)){
                Admin admin=new Admin();
                admin.setUsername(username);
                admin.setPassword(password);
                  if (username != "" && username != null){
                      Admin admin1 = loginService.selectAdminBeforeLogin(admin.getUsername());
                      if (admin1!=null){
                          Admin admin2 = loginService.selectAdminNameAndPassword(admin);
                          if (admin2!=null){
                              Role role = loginService.seleRoleBeforeLogin(admin2.getRole().getRoleid());
                              admin2.setRole(role);
                              if (role != null) {
                                  int role_id = role.getRoleid();
                                  List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                                  if (menus != null) {
                                      //在有效的时间内实现自动登录的功能
                                      String info=admin2.getUsername()+"-"+admin2.getPassword()+"-"+admin2.getRole().getName();
                                      Cookie admin_cookie=new Cookie("admin",info);
                                      admin_cookie.setPath("/");
                                      admin_cookie.setMaxAge(5*60);
                                      response.addCookie(admin_cookie);
                                      request.getSession().setAttribute("admin", admin2);
                                      map.put("type", "success");
                                   //   request.getSession().removeAttribute("user");
                                   //   request.getSession().removeAttribute("doctor");
                                  }
                              }
                          }else {
                              map.put("type","password");
                          }
                      }else {
                          map.put("type","username");
                      }
                  }
            }

           if ("门诊工作人员".equals(roleName)) {
               User user=new User();
               user.setUername(username);
               user.setPassword(password);
               if (username != "" && username != null) {
                   User user1 = loginService.selectUserBeforeLogin(user.getUername());
                   if (user1 != null) {
                       User user2 = loginService.selectUserNameAndPassword(user);
                       if (user2 != null) {
                           Role role = loginService.seleRoleBeforeLogin(user2.getRole().getRoleid());
                           if (role != null) {
                               //方法1：超级管理员，医生，挂号人员的个人信息共用一张表，可以解决下面的程序效果的问题
                               //方法2：超级管理员，医生，挂号人员的个人信息，不用公用一张表，仍然是独立的表
                               //但是共用相同的登录函数，但是这个这个函数的sql查询语句根据if判断，这个if判断的条件
                               //是选择的角色的名字


                               //在用户名和密码正确的前提下面：查询该用户的角色名字，与选择的角色的名字比较是不是正确，
                               //正确直接进入主页
                               //不正确提示提示用户，角色选择错误哦！

                               //上面的功能：不可能实现，因为，超级管理员，医生，挂号人员是三张不同的信息的表，所以只有选择好角色，才可以使用username和password
                               //当你先登录是不是正确的用户名和密码，此时没有办法到哪张表里面去查询对应用户名和密码
                               //所以提示角色错误，这个功能是不可能实现的
                               int role_id = role.getRoleid();
                               List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                               //已经查询到该用户的所有的菜单，然后筛序出一级，二级，菜单
                               if (menus != null) {
                                   //在有效的时间内实现自动登录的功能
                                   String info=user2.getUsername()+"-"+user2.getPassword();
                                   Cookie user_cookie=new Cookie("user",info);
                                   user_cookie.setPath("/");
                                   user_cookie.setMaxAge(5*60);
                                   response.addCookie(user_cookie);
                                   map.put("type", "success");
                                   request.getSession().setAttribute("user", user2);
                                   //清除掉admin，为了防止这个隐患发生
                                //   request.getSession().removeAttribute("admin");
                                  // request.getSession().removeAttribute("doctor");

                               }
                           }
                       } else {
                           map.put("type", "password");
                       }
                   } else {
                       map.put("type", "username");
                   }
               }
           }

            if ("医生".equals(roleName)) {
                Doctor doctor=new Doctor();
                 doctor.setName(username);
                 doctor.setPassword(password);
                if (username != "" && username != null) {
                    Doctor user1 = loginService.selectDoctorBeforeLogin(doctor.getName());
                    if (user1 != null) {
                        Doctor user2 = loginService.selectDoctorNameAndPassword(doctor);
                        if (user2 != null) {
                            Role role = loginService.seleRoleBeforeLogin(user2.getRole().getRoleid());
                            if (role != null) {
                                int role_id = role.getRoleid();
                                List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                                //已经查询到该用户的所有的菜单，然后筛序出一级，二级，菜单
                                if (menus != null) {
                                    //在有效的时间内实现自动登录的功能
                                    String info=user2.getName()+"-"+user2.getPassword();
                                    Cookie user_cookie=new Cookie("doctor",info);
                                    user_cookie.setPath("/");
                                    user_cookie.setMaxAge(5*60);
                                    response.addCookie(user_cookie);
                                    map.put("type", "success");
                                    request.getSession().setAttribute("doctor", user2);
                                    //清除掉admin，为了防止这个隐患发生
                                  //  request.getSession().removeAttribute("admin");
                                    //request.getSession().removeAttribute("user");
                                }
                            }
                        } else {
                            map.put("type", "password");
                        }
                    } else {
                        map.put("type", "username");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return  map;
    }


    /**
     * @description：
     * 解决的问题：
     * 1：当你在输入密码登录成功的时候，此时将输入存放到cookie里面，为了自动的登录的效果
     *  2：同时当你输入密码和用户名的时候，登录成功的话，那么还要跳出一个提示框提示，提示用户已经登录成功了
     * 保证这两个功能同时解决的话，那么这个要将自动登录的函数和输入密码登录的函数要，分开来书写
     * 这个函数输入密码登录的函数，提示登录成功后的，再次登录到主页面的函数
     * @author jack
     * @date 2020/1/17 21:47
     * @param null
     * @return
     */

    @RequestMapping(value = "/indexToMainPage",method = RequestMethod.GET)
    public  ModelAndView indexToMainPage(HttpServletRequest request) throws ParseException {
        ModelAndView andView=new ModelAndView();
        HttpSession session = request.getSession();
        Admin admin_info=null;
        Object admin = session.getAttribute("admin");
          if (admin!=null&&admin!=""){
              admin_info=(Admin)admin;
          }
         Object user = session.getAttribute("user");
         User user_info=null;
         if (user!=null&&user!=""){
             user_info=(User)user;
         }

        Object doctor = session.getAttribute("doctor");
        Doctor doctor_info=null;
        if (doctor!=null&&doctor!=""){
            doctor_info=(Doctor) doctor;
        }

           /* 注意：在这个spingboot项目中也有这个默认的session失效的时间，所以如果起作用的话，那么登录到主页
            失效的话，那么直接跳到login页面*/


/*隐患：当你成功登录admin，然后在session的作用域的时间内，然后马上登录user账号，发现这个admin账号清除不了*/
        if (admin_info!=null){
            String username = admin_info.getUsername();
            String password = admin_info.getPassword();
            String name = admin_info.getRole().getName();
            if ("超级管理员".equals(name)){
                if (username != null && username != "" && password != null && password != "") {
                    Admin admin1=new Admin();
                    admin1.setUsername(username);
                    admin1.setPassword(password);
                    Admin admin2 = loginService.selectAdminNameAndPassword(admin1);
                    if (admin2 != null) {
                        //每次登录修改时间和登录的次数思路：是先将上次的登录的时间和次数，从数据库里面，查询出来，
                        //然后将本次的数据显示在页面上，然后偷偷的修改时间和次数

                        String lastime=admin2.getLastime();
                        int i = loginService.updateAdminCount(admin2);//修改登录次数，累加即可
                        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String format = sdf.format(new Date());
                        Date time = new Date(sdf.parse(format).getTime());
                        //查看上次的登录时间是：先查出来，再把现在登录的时间，修改，
                        Map<String,Object> map=new HashMap<String, Object>();
                        map.put("lastime",time);
                        map.put("username",admin2.getUsername());
                        map.put("password",admin2.getPassword());
                        int i1 = loginService.updateAdminLastime(map);
                        Role role = loginService.seleRoleBeforeLogin(admin2.getRole().getRoleid());
                        if (role != null&&i>0&&i1>0) {
                            int role_id = role.getRoleid();
                            List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                            if (menus != null) {
                                List<Menu> top = MenuUtils.getTop(menus);
                                List<Menu> second = MenuUtils.getSecond(menus,top);
                                request.getSession().setAttribute("admin", admin2);
                                request.getSession().setAttribute("role", role.getName());
                                request.getSession().setAttribute("menus",menus);
                                request.getSession().setAttribute("top",top);
                                request.getSession().setAttribute("second",second);
                                request.getSession().setAttribute("lastime",lastime);
                                andView.addObject("admin",admin2);
                                request.getSession().setAttribute("count",admin2.getCount()+1);
                                andView.setViewName("/admin/index");
                            }
                        }
                    }
                }
            }
        }
         if (user_info!=null){
            String username = user_info.getUsername();
            String password = user_info.getPassword();
            String name = user_info.getRole().getName();
            if ("门诊工作人员".equals(name)){
                if (username != null && username != "" && password != null && password != "") {
                    User user1=new User();
                    user1.setUsername(username);
                    user1.setPassword(password);
                    User user2 = loginService.selectUserNameAndPassword(user1);
                    if (user2 != null) {
                        //每次登录修改时间和登录的次数思路：是先将上次的登录的时间和次数，从数据库里面，查询出来，
                        //然后将本次的数据显示在页面上，然后偷偷的修改时间和次数
                        Role role = loginService.seleRoleBeforeLogin(user2.getRole().getRoleid());
                        if (role != null) {
                            int role_id = role.getRoleid();
                            List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                            if (menus != null) {
                                List<Menu> top = MenuUtils.getTop(menus);
                                List<Menu> second = MenuUtils.getSecond(menus,top);
                               // request.getSession().setAttribute("user", user2);
                                request.getSession().setAttribute("role", role.getName());
                                request.getSession().setAttribute("menus",menus);
                                request.getSession().setAttribute("top",top);
                                request.getSession().setAttribute("second",second);
                                andView.addObject("user",user2);
                                andView.setViewName("/admin/index");
                            }
                        }
                    }
                }
            }
        }
         if (doctor_info!=null){
            String username = doctor_info.getName();
            String password = doctor_info.getPassword();
            String name = doctor_info.getRole().getName();
            if ("医生".equals(name)){
                if (username != null && username != "" && password != null && password != "") {
                   Doctor doctor1=new Doctor();
                     doctor1.setPassword(password);
                     doctor1.setName(username);
                    Doctor doctor2 = loginService.selectDoctorNameAndPassword(doctor1);
                    if (doctor2 != null) {
                        //每次登录修改时间和登录的次数思路：是先将上次的登录的时间和次数，从数据库里面，查询出来，
                        //然后将本次的数据显示在页面上，然后偷偷的修改时间和次数
                        Role role = loginService.seleRoleBeforeLogin(doctor2.getRole().getRoleid());
                        if (role != null) {
                            int role_id = role.getRoleid();
                            List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                            if (menus != null) {
                                List<Menu> top = MenuUtils.getTop(menus);
                                List<Menu> second = MenuUtils.getSecond(menus,top);
                               // request.getSession().setAttribute("doctor", doctor2);
                                request.getSession().setAttribute("role", role.getName());
                                request.getSession().setAttribute("menus",menus);
                                request.getSession().setAttribute("top",top);
                                request.getSession().setAttribute("second",second);
                                andView.addObject("doctor",doctor2);
                                andView.setViewName("/admin/index");
                            }
                        }
                    }
                }
            }
        }

    if (admin_info==null&&doctor_info==null&&user_info==null){
          andView.setViewName("redirect:/admin/login");
    }
    return andView;
}
    /**
     * @description：这个函数是实现自动登录的
     * 这个涉及三个模型，前端的ajax页面函数，真正登录到主页面的函数，在地址栏输入地址，实现自动登录的函数
     *    前端的ajax页面函数：，登录输入密码和用户名，点击登录，登录成功后把数据存放到cookie；里面和session里面
     *    然后再在ajax去请求真正的登录到主页的函数，然后这个函数获取这个session和数据
     *    利用session里面的数据，去登录信息
     *
     *    当在自动登录的时候，是先获取cookie里面的数据，不为空的话，那么取出数据然后登录成功
     *    为空的话，直接跳到login页面
     *
     * @author jack
     * @date 2020/1/17 22:54
     * @param null
     * @return
     */

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request){
       ModelAndView andView=new ModelAndView();
        Cookie[] cookies = request.getCookies();
        if (cookies!=null){
            for (Cookie cookie:cookies){
                String name = cookie.getName();
                //admin模块：
                if ("admin".equals(name)){
                    String value = cookie.getValue();
                    String[] split = value.split("-");
                    if (split!=null&&split.length>0) {
                       String username =split[0];
                       String password=split[1];
                       String rolename=split[2];
                       Role role=new Role();
                       role.setName(rolename);
                       Admin admin=new Admin();
                       admin.setUsername(username);
                       admin.setPassword(password);
                       admin.setRole(role);
                       request.getSession().setAttribute("admin",admin);
                       andView.setViewName("redirect:/admin/indexToMainPage");
                       return andView;
                    }
                }
            }
        }else{
            andView.setViewName("/admin/login");
        }
        return andView;
    }

   /* @RequestMapping(value = "/index",method = RequestMethod.POST)
    public  ModelAndView index(HttpServletRequest request) throws ParseException {
        ModelAndView andView=new ModelAndView();
        Object userMenus = request.getSession().getAttribute("userMenus");
        String info=null;//这个user是普通工作者和超级管理员，共用的一个实体类，而不是这个医生的实体类
        Cookie[] cookies1 = request.getCookies();
        //思路：
        //将三个不同的角色，按照这个key：admin  value：username-password的形式，存放到cookie里面
        //在你直接在浏览器上操作这个/admin/index,地址，，
        // 如果不管你是不是关闭浏览器，只要读取这个cookie里面的数据是有效的，那么这个可以自动登录
        //如果你读取这个数据是无效的，那么这个直接跳到login页面，让你去登录信息
        String username=null;
        String password=null;

        //如果在同一个计算机上模拟三个不同的用户的时候，可能会出现，bug
        //因为当第一次登录admin的信息，第二次马上登录doctor的信息
        //然后在有效的时间点内，关闭浏览器，进行，自动登录的时候，会按照这个存放到cookie里面的数据的顺序的，一定是按照存放顺序读取
        //admin-doctor-cmmon：三个不同的用户名和密码，然后登录这个主页，
        // 如果你同时存放这个admin-doctor-cmmon，自动登录，那么谁先写在前面，admin，写在前面，先读取，那么这个读取的是admin用户名和密码，登录的是它的信息

        //问题：如果这个浏览器存在很多无用的cookie数据，那么这个问题怎么解决，而想要的数据确真正没有获取得到，那么怎样处理呢？？？
        int flag=0;
        if (cookies1!=null){
            for (Cookie cookie:cookies1){
                if ("admin".equals(cookie.getName())){
                    flag=1;
                    if (flag==1){
                        info = cookie.getValue();
                        String[] split = info.split("-");
                        if (split!=null&&split.length!=0) {
                            username = split[0];
                            password = split[1];
                            if (username != null && username != "" && password != null && password != "") {
                                Admin admin=new Admin();
                                admin.setUsername(username);
                                admin.setPassword(password);
                                Admin admin1 = loginService.selectAdminNameAndPassword(admin);
                                if (admin1 != null) {
                                    String lastime=admin1.getLastime();
                                    int i = loginService.updateAdminCount(admin1);//修改登录次数，累加即可
                                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                    String format = sdf.format(new Date());
                                    Date time = new Date(sdf.parse(format).getTime());
                                    //查看上次的登录时间是：先查出来，再把现在登录的时间，修改，
                                    Map<String,Object> map=new HashMap<String, Object>();
                                    map.put("lastime",time);
                                    map.put("username",admin1.getUsername());
                                    map.put("password",admin1.getPassword());
                                    int i1 = loginService.updateAdminLastime(map);
                                    Role role = loginService.seleRoleBeforeLogin(admin1.getRole().getRoleid());
                                    if (role != null&&i>0&&i1>0) {
                                        int role_id = role.getRoleid();
                                        List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                                        if (menus != null) {
                                            List<Menu> top = MenuUtils.getTop(menus);
                                            List<Menu> second = MenuUtils.getSecond(menus,top);
                                            request.getSession().setAttribute("user", admin1);
                                            request.getSession().setAttribute("role", role.getName());
                                            request.getSession().setAttribute("top",top);
                                            request.getSession().setAttribute("second",second);
                                            request.getSession().setAttribute("lastime",lastime);
                                            request.getSession().setAttribute("count",admin1.getCount()+1);
                                            andView.setViewName("/admin/index");
                                        }
                                    }
                                }
                            }
                        }
                    }
                   // break;//因为三个不同的角色，登录这个系统的话，这个只要有一个登录成功了，后面的马上break，因为这个是在一个计算机上模拟的三个不同的角色
               }
               else if ("doctor".equals(cookie.getName())){

                }
               else if ("user".equals(cookie.getName())){
                    flag=1;
                    if (flag==1){
                        info = cookie.getValue();
                        String[] split = info.split("-");
                        if (split!=null&&split.length!=0) {
                            username = split[0];
                            password = split[1];
                            if (username != null && username != "" && password != null && password != "") {
                                User user = new User();
                                user.setPassword(password);
                                user.setUsername(username);
                                User user1 = loginService.selectUserNameAndPassword(user);
                                if (user1 != null) {
                                    Role role = loginService.seleRoleBeforeLogin(user1.getRole().getRoleid());
                                    if (role != null) {
                                        int role_id = role.getRoleid();
                                        List<Menu> menus = loginService.seleMenuBeforeLoginByRoleId(role_id);
                                        if (menus != null) {
                                            List<Menu> top = MenuUtils.getTop(menus);
                                            List<Menu> second = MenuUtils.getSecond(menus,top);
                                            request.getSession().setAttribute("user", user1);
                                            request.getSession().setAttribute("role", role.getName());
                                            request.getSession().setAttribute("top",top);
                                            request.getSession().setAttribute("second",second);
                                            andView.setViewName("/admin/index");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }
    if (flag==0){
        andView.setViewName("redirect:/admin/login");
    }
  return andView;
}
*/
/**
 * @description:这个是退出的操作！
 * @author jack
 * @date 2019/12/23 19:48
 * @param null
 * @return
 */

    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public  ModelAndView logout(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        request.getSession().removeAttribute("top");
        request.getSession().removeAttribute("second");
        request.getSession().removeAttribute("role");
        request.getSession().removeAttribute("user");
        request.getSession().removeAttribute("doctor");
        request.getSession().removeAttribute("admin");
        andView.setViewName("redirect:/admin/login");
        return  andView;
    }

    /**
     * @description:这个功能是查询这个登录者的个人的信息
     * @author jack
     * @date 2019/12/26 22:32
     * @param request
     * @return org.springframework.web.servlet.ModelAndView
     */
    @RequestMapping(value = "/selectAdminInfo",method = RequestMethod.GET)
    public ModelAndView selectAdminInfo(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        if (user!=null&&user!=""){
            andView.addObject("userInfo",user);
            andView.setViewName("admin/PersonalSet/showset");
        }
        return andView;
    }


    /**
     * @description：点击修改密码，跳到修改密码的页面上去
     * @author jack
     * @date 2019/12/27 16:06
     * @param null
     * @return
     */
    @RequestMapping("/onclickToUpdatePassword")
    public  ModelAndView onclickToUpdatePassword(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
         andView.setViewName("admin/PersonalSet/lawset");
        return andView;
    }

    /**
     * @description:这个函数是修改用户的密码
     * @author jack
     * @date 2019/12/27 15:28
     * @param null
     * @return
     */
    @RequestMapping("/updateAdminPasswordBySession")
    @ResponseBody
    public  Map<String,String> updateAdminPasswordBySession(HttpServletRequest  request) throws UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        Map<String,String> map=new HashMap<String, String>();
        String password=request.getParameter("password");
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        String username = request.getParameter("username");
          if (password!=""&&username!=""&&password!=null&&username!=null){
                  map.put("password",password);
                  map.put("username",username);
              int i = loginService.updateAdminPasswordBySession(map);
              if (i>0){
                  map.put("type","success");
              }else {
                  map.put("type","fail");
              }
          }
          return  map;
    }


    @RequestMapping(value = "/getUserPersonInfo",method = RequestMethod.GET)
    public ModelAndView getUserPersonInfo(){
        ModelAndView andView=new ModelAndView();
        return  andView;
    }
}
