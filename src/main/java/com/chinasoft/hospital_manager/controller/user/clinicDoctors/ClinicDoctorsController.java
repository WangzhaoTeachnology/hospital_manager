package com.chinasoft.hospital_manager.controller.user.clinicDoctors;

import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.patient.UserForPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ansi.Ansi8BitColor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpCookie;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/2/9 2:05
 */
@Controller
@RequestMapping("/admin/doctorsController")
public class ClinicDoctorsController {



    @Autowired
    private UserForPatientService userForPatientService;



    /**
     * @description:这个是在门诊，查询这个医生的个人信息，以及当天的工作的信息
     * @author jack
     * @date 2020/2/28 23:15
     * @param null
     * @return
     */
    @RequestMapping("/loadDoctorsInfo")
    public ModelAndView  loadDoctorsInfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
        ModelAndView andView=new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        String currentPage = request.getParameter("currentPage");
        String condition = request.getParameter("condition");
        String search = request.getParameter("search");
        if (currentPage==null){
            currentPage="1";
        }
        if (condition!=null&&condition!=""&&condition.equals("姓名")){
            map.put("name",search);
        }
        //默认为全部：
       /* if (condition!=null&&condition!=""&&condition.equals("全部")){
            map.put("all",search);
        }*/

        if (condition!=null&&condition!=""&&condition.equals("今天")){
            if (search!=null){
                map.put("name",search);
                map.put("today",search);//再次以姓名作为条件，检索信息
            }
        }


        int currentCount=4;
        PageBean<Doctor> doctorPageBean = userForPatientService.selectDoctorsInfoByOnTime(map,Integer.parseInt(currentPage), currentCount);
        if (doctorPageBean!=null){
            List<Doctor> list = doctorPageBean.getList();
            if (list!=null){
                andView.addObject("doctorsInfo",list);
                andView.addObject("search",search);
                andView.addObject("condition",condition);
                andView.addObject("pageBean",doctorPageBean);
            }
        }
        andView.setViewName("/admin/user_clinicManager/selectDoctorsInfoAndOnTimes/query");
        return andView;
    }
}
