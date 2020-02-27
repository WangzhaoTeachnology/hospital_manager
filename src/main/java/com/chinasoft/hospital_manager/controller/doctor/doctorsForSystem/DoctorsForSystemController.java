package com.chinasoft.hospital_manager.controller.doctor.doctorsForSystem;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Jack on 2020/2/13 0:20
 */
@Controller
@RequestMapping("admin/doctor")
public class DoctorsForSystemController {




    /**
     * @description:这个是医生退出登录的函数
     * @author jack
     * @date 2020/2/13 0:15
     * @param null
     * @return
     */

    @RequestMapping("/logout")
    public void logout(HttpServletResponse response, HttpServletRequest request) throws IOException {
        //这个是退出frameset框架的操作的java后台代码
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.getWriter().print("<script>parent.window.location.href="+request.getContextPath()+"'/admin/logout'</script>");
    }
}
