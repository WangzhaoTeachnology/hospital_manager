package com.chinasoft.hospital_manager.controller.user.clinicUserWork;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.service.admin.work.WorkUserInfoService;

import org.apache.ibatis.javassist.expr.NewExpr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Jack on 2020/1/23 15:20
 */
@Controller
@RequestMapping("/admin/user")
public class ClinicUserWorkController {

    @Autowired
    private WorkUserInfoService workUserInfoService;




    @ResponseBody
    @RequestMapping("/deleteWorkInfoById")
    public Map<String,Object> deleteWorkInfoById(HttpServletRequest request){
        Map<String,Object> map= new HashMap<String, Object>();
        Map<String,Object> response_map= new HashMap<String, Object>();
        String id=request.getParameter("id");
        map.put("id",Integer.parseInt(id));
        int i = workUserInfoService.deleteWorkInfoById(map);
        if (i>0){
            response_map.put("type","success");
            return response_map;
        }else {
            response_map.put("type","fail");
        }
        return map;
    }


    @RequestMapping("/editWorkInfoById")
    @ResponseBody
    public  Map<String,Object> editWorkInfoById(HttpServletRequest request){
        Map<String,Object> map= new HashMap<String, Object>();
        Map<String,Object> response_map= new HashMap<String, Object>();
        String id =request.getParameter("id");
        String address=request.getParameter("address");
        map.put("id",Integer.parseInt(id));
        map.put("address",address);
        int i = workUserInfoService.editWorkInfoById(map);
        if (i>0){
            response_map.put("type","success");
        }else {
            response_map.put("type","fail");
        }
        return  map;
    }

    /**
     * @description:这个是根据类型，查询具体的用户
     * @author jack
     * @date 2020/3/2 1:40
     * @param null
     * @return
     */
    @ResponseBody
    @RequestMapping("/findUsersByCategory")
    public  Map<String,Object> findUsersByCategory(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        if (id!=null&&id!=""){
             if (Integer.parseInt(id)==1){
                 List<Admin> adminsByCategory = workUserInfoService.findAdminsByCategory();
                 if (adminsByCategory!=null){
                     map.put("type","success");
                     map.put("admins",adminsByCategory);
                     return map;
                 }
             }if (Integer.parseInt(id)==2){
                List<User> usersByCategory = workUserInfoService.findUsersByCategory();
                if (usersByCategory!=null){
                    map.put("type","success");
                    map.put("users",usersByCategory);
                    return map;
                }
            }
             if (Integer.parseInt(id)==3){
                 List<Doctor> doctorsByCategory = workUserInfoService.findDoctorsByCategory();
                 if (doctorsByCategory!=null){
                     map.put("type","success");
                     map.put("doctors",doctorsByCategory);
                     return map;
                 }
             }
        }else {
            map.put("type","error");
        }
        return map;
    }

    /**
     * @descriptio:点击页面，查询这个类型
     * @author jack
     * @date 2020/3/2 1:41
     * @param null
     * @return
     */

    @RequestMapping("/clinicUserWorkInfo")
    public ModelAndView loadUserWorkInfo(HttpServletRequest request){
        ModelAndView andView =new ModelAndView();
        andView.setViewName("/admin/user_clinicManager/index");
        Object user = request.getSession().getAttribute("user");

        List<User> users = workUserInfoService.getUsers();
        List<Role> allRoles = workUserInfoService.getAllRoles();
        if (allRoles!=null){
            andView.addObject("allRoles",allRoles);
            andView.addObject("users",users);
        }

        return andView;
    }

    @RequestMapping("/addUserWorkInfo")
    @ResponseBody
    public Map<String,Object> addUserWorkInfo(HttpServletRequest request) throws ParseException {
        Map<String,Object> map=new HashMap<String, Object>();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String user_id = request.getParameter("user_id");

        User user=new User();
        user.setId(Integer.parseInt(user_id));
        String morning = request.getParameter("morning");
        String afternoon = request.getParameter("afternoon");
        String address = request.getParameter("address");
        String startime = request.getParameter("startime");
        String endtime = request.getParameter("endtime");
        String onday="";

          Date date_start=new Date(simpleDateFormat.parse(startime).getTime());
          Date date_end=new Date(simpleDateFormat.parse(endtime).getTime());
      /*  private Integer id;
        private User user;
        private String address;
        private String onday;
        private  String morning;
        private String afternoon;
        private  String startime;
        private String endtime;*/


        long time = simpleDateFormat.parse(startime).getTime();
        Date date = new Date(time);
        onday = getWeekOfDate(date);

       // Work work=new Work(user,address,onday,morning,afternoon,date_start,date_end);
        map.put("address",address);
        if (onday!=""&&onday!=null){
            map.put("onday",onday);
        }
        map.put("morning",morning);
        map.put("afternoon",afternoon);
        map.put("startime",date_start);
        map.put("endtime",date_end);
        map.put("user_id",Integer.parseInt(user_id));
        int i = workUserInfoService.addUserWorkInfo(map);
        if (i>0){
            map.put("type","success");
        }else {
            map.put("type","fail");
        }
        return map;
    }

    //获得星期几
    public static String getWeekOfDate(Date date) {
        String[] weekOfDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar calendar = Calendar.getInstance();
        if(date != null){
            calendar.setTime(date);
        }
        int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
         return weekOfDays[w];
    }

    @RequestMapping("/requestloadUserWorkInfo")
    @ResponseBody
    public Map<String, Object> requestloadUserWorkInfo(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
  //      int id=Integer.parseInt(request.getParameter("id"));
      //.  Work  work = workUserInfoService.requestloadUserWorkInfo(4);
       /* if (work!=null){
            map.put("type","success");
            map.put("info",work);
        }*/


        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/searchUserWorkInfoById",method = RequestMethod.POST)
    public Map<String,Object> searchUserWorkInfoById(HttpServletRequest request) throws ParseException {
        Map<String,Object> map= new HashMap<String, Object>();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        int id =Integer.parseInt(request.getParameter("id"));
        List<Work> works = workUserInfoService.requestloadUserWorkInfo(id);
        if (works!=null){
            map.put("type","success");
            map.put("info",works);
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/findUserWorkInfoById",method = RequestMethod.GET)
    public Map<String,Object> findUserWorkInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        int id=Integer.parseInt(request.getParameter("id"));
        Work userWorkInfoById = workUserInfoService.findUserWorkInfoById(id);
        if (userWorkInfoById!=null){
            map.put("type","success");
            map.put("work",userWorkInfoById);
            map.put("user",userWorkInfoById.getUser());
        }
        return map;
    }

}
