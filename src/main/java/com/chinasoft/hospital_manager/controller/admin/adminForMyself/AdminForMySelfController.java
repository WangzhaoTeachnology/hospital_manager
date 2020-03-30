package com.chinasoft.hospital_manager.controller.admin.adminForMyself;

import com.chinasoft.hospital_manager.domain.Admin;
import com.chinasoft.hospital_manager.domain.Appoint_category;

import com.chinasoft.hospital_manager.domain.Offices;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.admin.adminForMyself.AdminForMyselfService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/3/3 18:23
 */
@Controller
@RequestMapping("/admin/info")
public class AdminForMySelfController {

    @Autowired
    private AdminForMyselfService adminForMyselfService;

    @RequestMapping("/adminForMyselfInfo")
    @ResponseBody
    public ModelAndView adminForMyselfInfo(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        HttpSession session = request.getSession();
        Object admin = session.getAttribute("admin");
        Admin admin1=null;

        int id=0;
        if (admin!=null&&admin!=""){
            admin1=(Admin) admin;
            id=admin1.getId();
        }
        Admin adminInfoById = adminForMyselfService.findAdminInfoById(id);
        if (adminInfoById!=null){
            andView.addObject("admin",adminInfoById);
            andView.setViewName("/admin/adminInfoAndManager/adminInfoForMySelf/admininfo");
        }
        return andView;
    }

    @RequestMapping("/updateAdminInfoById")
    @ResponseBody
    public Map<String,Object> updateAdminInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> response=new HashMap<String, Object>();
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        map.put("id",Integer.parseInt(id));
        map.put("username",name);
        map.put("password",password);
        int i = adminForMyselfService.updateAdminInfoById(map);
        if (i>0){
            response.put("type","success");
            return response;
        }else {
            response.put("type","fail");
        }
        return map;
    }



    /**
     * @description:这个是门诊的类别管理
     * @author jack
     * @date 2020/3/4 0:42
     * @param null
     * @return
     */
    @RequestMapping("/findClinicInfoAndManagers")
    public ModelAndView findClinicInfoAndManagers(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        String currentPage = request.getParameter("currentPage");
        String condition = request.getParameter("condition");
        String search = request.getParameter("search");
        if (currentPage==null){
            currentPage="1";
        }
    /*    if (condition!=null&&condition!=""&&condition.equals("姓名")){
            map.put("name",search);
        }


        if (condition!=null&&condition!=""&&condition.equals("今天")){
            if (search!=null){
                map.put("name",search);
                map.put("today",search);//再次以姓名作为条件，检索信息
            }
        }
*/

        int currentCount=3;
        PageBean<Appoint_category> allAndMangager = adminForMyselfService.findAllAndMangager(Integer.parseInt(currentPage), currentCount);
        if (allAndMangager!=null){
            List<Appoint_category> list = allAndMangager.getList();
            if (list!=null){
                andView.addObject("lists",list);

                //andView.addObject("list",list);
               // andView.addObject("search",value);
                //andView.addObject("condition",id);
                //andView.addObject("productCategory",productCategory);
                andView.addObject("pageBean",allAndMangager);
            }
         }
        andView.setViewName("/admin/adminInfoAndManager/clinicAndManager/query");
        return andView;
    }

/**
 * @description:这是添加部门的信息
 * @author jack
 * @date 2020/3/4 13:45
 * @param null
 * @return
 */

    @RequestMapping("/insertAppoint_Category")
    @ResponseBody
    public  Map<String,Object> insertAppoint_Category(HttpServletRequest request){
       Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> response=new HashMap<String, Object>();
       String name=request.getParameter("name");
       if (name!=null&&name!=""){
           map.put("name",name);
           int i = adminForMyselfService.insertAppoint_Category(map);
           if (i>0){
               response.put("type","success");
           }else {
               response.put("type","fail");
           }
       }else {
           response.put("type","error");
       }
       return response;
    }

    @ResponseBody
    @RequestMapping("/deleteAppoint_CategoryById")
    public Map<String,Object> deleteAppoint_CategoryById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> response=new HashMap<String, Object>();
        String id=request.getParameter("id");
        if (id!=null&&id!=""){
            map.put("id",Integer.parseInt(id));
            int i = adminForMyselfService.deleteAppoint_CategoryById(map);
            if (i>0){
                response.put("type","success");
            }else {
                response.put("type","fail");
                return response;
            }
        }else {
            response.put("type","error");
        }
        return response;
    }

    /**
     * @description:修改门诊的类型的函数
     * @author jack
     * @date 2020/3/5 17:13
     * @param null
     * @return
     */

    @RequestMapping("/updateAppointCategoryInfo")
    @ResponseBody
    public Map<String,Object> updateAppointCategoryInfo(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> response=new HashMap<String, Object>();
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        if (id!=null&&id!=""&& name!=null&&name!=""){
            map.put("id",id);
            map.put("name",name);
            int i = adminForMyselfService.updateAppointCategoryInfo(map);
            if (i>0){
                response.put("type","success");
                return response;
            }else {
                response.put("type","fail");
                return response;
            }
        }else {
            response.put("type","error");
        }
        return response;
    }


    /**
     * @description:这个是插入科室之前，查询所有的门诊信息
     * @author jack
     * @date 2020/3/4 20:52
     * @param null
     * @return
     */

    @ResponseBody
    @RequestMapping("/beforeInsertFindInfo")
    public Map<String,Object> beforeInsertFindInfo(HttpServletRequest request){
        Map<String,Object> map= new HashMap<String, Object>();
        List<Appoint_category> allAppoint_category = adminForMyselfService.findAllAppoint_category();
        if (allAppoint_category!=null){
            map.put("type","success");
            map.put("allAppoint_category",allAppoint_category);
        }else {
            map.put("type","fail");
        }
        return map;
    }

    /**
     * @description:这个是科室的信息的添加函数
     * @author jack
     * @date 2020/3/5 15:13
     * @param null
     * @return
     */

    @RequestMapping("/insertIntoOfficeInfo")
    @ResponseBody
    public Map<String,Object> insertIntoOfficeInfo(HttpServletRequest request){
        Map<String,Object> map= new HashMap<String, Object>();
        Map<String,Object> response= new HashMap<String, Object>();
        String id=request.getParameter("id");
        String name=request.getParameter("name");

        if (id!=null&&id!=""&&name!=null&&name!=""
        ){
          map.put("ap_cate_id",Integer.parseInt(id));
          map.put("name",name);
         // map.put("appointCategoryName",text);
            int i = adminForMyselfService.insertIntoOfficeInfo(map);
            if (i>0){
                response.put("type","success");
                return  response;
            }else {
                response.put("type","fail");
                return response;
            }
        }else {
            response.put("type","error");
        }
        return map;
    }

    @RequestMapping("/findOfficesInfoAndManagers")
    public ModelAndView findOfficesInfoAndManagers(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        String currentPage = request.getParameter("currentPage");
        String condition = request.getParameter("condition");
        String search = request.getParameter("search");
        if (currentPage==null){
            currentPage="1";
        }
        int currentCount=3;
        PageBean<Offices> allAndMangager = adminForMyselfService.findAllOfficesAndMangager(Integer.parseInt(currentPage), currentCount);
        if (allAndMangager!=null){
            List<Offices> list = allAndMangager.getList();
            if (list!=null){
                andView.addObject("lists",list);

                //andView.addObject("list",list);
                // andView.addObject("search",value);
                //andView.addObject("condition",id);
                //andView.addObject("productCategory",productCategory);
                andView.addObject("pageBean",allAndMangager);
            }
        }
        andView.setViewName("/admin/adminInfoAndManager/officesAndManager/query");
        return andView;
    }


    @RequestMapping("/updateOfficesInfo")
    @ResponseBody
    public Map<String,Object> updateOfficesInfo(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> response=new HashMap<String, Object>();
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String selectedIndex=request.getParameter("selectedIndex");
        //UPDATE offices SET name=#{name},ap_cate_id=#{ap_cate_id} WHERE id=#{id}
        if (id!=null&&id!=""&& name!=null&&name!=""&&selectedIndex!=null&&selectedIndex!=""){
            map.put("id",id);
            map.put("name",name);
            map.put("ap_cate_id",selectedIndex);
            int i = adminForMyselfService.updateOfficesInfo(map);
            if (i>0){
                response.put("type","success");
                return response;
            }else {
                response.put("type","fail");
                return response;
            }
        }else {
            response.put("type","error");
        }
        return response;
    }

    @RequestMapping("/deleteOfficesInfoById")
    public @ResponseBody Map<String,Object> deleteOfficesInfoById(HttpServletRequest request){
        Map<String,Object> response=new HashMap<String, Object>();
        String id=request.getParameter("id");
        if (id!=null&&id!=""){
            int i = adminForMyselfService.deleteOfficesInfoById(Integer.parseInt(id));
            if (i>0){
                response.put("type","success");
                return response;
            }else {
                response.put("type","fail");
                return response;
            }
        }else {
            response.put("type","error");
        }
        return response;
    }


}
