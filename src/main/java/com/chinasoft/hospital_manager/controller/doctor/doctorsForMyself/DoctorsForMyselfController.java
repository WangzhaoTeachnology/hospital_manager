package com.chinasoft.hospital_manager.controller.doctor.doctorsForMyself;

import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForMyself.DoctorsForMyselfService;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Jack on 2020/2/13 12:23
 */
@Controller
@RequestMapping("/admin/doctor")
public class DoctorsForMyselfController {


    @Autowired
    private DoctorsForMyselfService doctorsForMyselfService;

    @RequestMapping("/findDoctorInfoById")
   public ModelAndView findDoctorInfoById(HttpServletRequest request,HttpServletResponse response) throws IOException {
       ModelAndView andView=new ModelAndView();
        HttpSession session = request.getSession();
        Doctor doctor=null;
        Object object = session.getAttribute("doctor");
        if (object != null) {
            doctor = (Doctor) object;
        }
         if (doctor != null) {
                int id = doctor.getId();
                if (id != 0) {
                    Doctor doctorInfoById = doctorsForMyselfService.findDoctorInfoById(id);
                    if (doctorInfoById != null) {
                        andView.addObject("doctor", doctorInfoById);
                    }
                }
            } else {
                //这个是退出frameset框架的操作的java后台代码
                HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                httpServletResponse.getWriter().print("<script>parent.window.location.href=" + request.getContextPath() + "'/admin/logout'</script>");
            }

        andView.setViewName("/admin/doctorInfoAndManager/doctorsForMyself/doctorinfo");
       return andView;
   }

   @RequestMapping("/updateDoctorInfoById")
   @ResponseBody
   public Map<String,Object> updateDoctorInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> parameter=new HashMap<String, Object>();
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
       if (id != null&&id!=""&&name!=null&&name!=""&&password!=null&&password!="") {
          parameter.put("id",Integer.parseInt(id));
          parameter.put("name",name);
          parameter.put("password",password);
           int i = doctorsForMyselfService.updateDoctorInfoById(parameter);
           if (i>0){
               map.put("type","success");
           }else {
               map.put("type","fail") ;
           }

       }else{
           map.put("type","error");
       }
        return map;
   }
}
