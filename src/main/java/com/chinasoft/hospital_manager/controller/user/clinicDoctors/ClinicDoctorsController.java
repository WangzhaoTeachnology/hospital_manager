package com.chinasoft.hospital_manager.controller.user.clinicDoctors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpCookie;

/**
 * Created by Jack on 2020/2/9 2:05
 */
@Controller
@RequestMapping("/admin/doctorsController")
public class ClinicDoctorsController {

    @RequestMapping("/loadDoctorsInfo")
    public void loadDoctorsInfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
        ModelAndView andView=new ModelAndView();
      //  andView.setViewName("/admin/user_clinicManager/clinic_Department/doctors");
        //andView.setViewName("redirect:/admin/login");

        String requestURL = request.getRequestURL().toString();
      //  andView.setViewName("redirect:"+"http://localhost:8080/admin/login");
        andView.setViewName("<script> window.parent.location.href=\"${pageContext.request.contextPath}/admin/logout</script>");

        //这个是退出frameset框架的操作的java后台代码
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.getWriter().print("<script>parent.window.location.href="+request.getContextPath()+"'/admin/logout'</script>");

    }
}
