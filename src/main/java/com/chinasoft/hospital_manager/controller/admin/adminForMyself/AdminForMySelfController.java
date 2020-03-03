package com.chinasoft.hospital_manager.controller.admin.adminForMyself;

import com.chinasoft.hospital_manager.domain.Admin;
import com.chinasoft.hospital_manager.service.admin.admin.adminForMyself.AdminForMyselfService;
import com.chinasoft.hospital_manager.service.admin.employee.EmployeeService;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Jack on 2020/3/3 18:23
 */
@Controller
@RequestMapping("/admin/info")
public class AdminForMySelfController {

    @Autowired
    private AdminForMyselfService adminForMyselfService;

    @RequestMapping("/adminForMyselfInfo")
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
        }
        return andView;
    }

}
