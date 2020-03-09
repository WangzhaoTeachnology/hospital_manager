package com.chinasoft.hospital_manager.controller.doctor.doctorsForWork;

import com.alibaba.fastjson.JSONObject;
import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.domain.Work;
import com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForWork.DoctorsForWorkMapper;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForWork.DoctorsForWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/2/13 0:20
 */
@Controller
@RequestMapping("/admin/doctor")
public class DoctorsForWorkController {

    @Autowired
    private DoctorsForWorkService doctorsForWorkService;

    /**
     * @description:这个是医生点击工作信息的时候，显示这个工作信息的页面，然后获取这个id，进行这个ajax查询的，从而显示这个工作的信息！！！
     * @author jack
     * @date 2020/3/7 16:26
     * @param null
     * @return
     */
    @RequestMapping("/findDoctorsWorkInfoById")
    public ModelAndView findDoctorsWorkInfoById(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        HttpSession session = request.getSession();
       Object doctor = session.getAttribute("doctor");
        Doctor doctor1=null;int id=0;
        if (doctor!=null){
            doctor1=(Doctor) doctor;
            id=doctor1.getId();
        }

   /*     if (id!=0){
            List<Work> doctorsWorkInfoById = doctorsForWorkService.findDoctorsWorkInfoById(id);
            if (doctorsWorkInfoById!=null){
               // andView.addObject("doctor",doctor1);
               // JSONObject.fromObject(hero)
                String string = JSONObject.toJSONString(doctorsWorkInfoById);
             //   JSONObject jsonObject = JSONObject.parseObject(String.valueOf(doctorsWorkInfoById));
               // System.out.println(jsonObject);
                andView.addObject("works",string);
                andView.setViewName("/admin/doctorInfoAndManager/doctorsForWork/work");
            }
        }*/
        andView.addObject("doctor",doctor1);
        andView.setViewName("/admin/doctorInfoAndManager/doctorsForWork/work");
        return andView;
    }

    /**
     * @description：这个函数是获取到医生的id后，将工作日期的信息，显示出来
     * @author jack
     * @date 2020/3/7 16:25
     * @param null
     * @return
     */
    @RequestMapping("/findDoctorsWorkInfo")
    @ResponseBody
    public Map<String,Object> findDoctorsWorkInfo(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        int id = Integer.parseInt(request.getParameter("id"));
        if (id!=0){
            List<Work> doctorsWorkInfoById = doctorsForWorkService.findDoctorsWorkInfoById(id);
            if (doctorsWorkInfoById!=null){
                // andView.addObject("doctor",doctor1);
                // JSONObject.fromObject(hero)
                String string = JSONObject.toJSONString(doctorsWorkInfoById);
                //   JSONObject jsonObject = JSONObject.parseObject(String.valueOf(doctorsWorkInfoById));
                // System.out.println(jsonObject);
                map.put("info",doctorsWorkInfoById);
            }
        }
        return map;
    }


    /**
     * @description:这个是根据id，查询这个工作的详情的信息
     * @author jack
     * @date 2020/3/8 13:53
     * @param null
     * @return
     */
    @RequestMapping("/findWorkDetailInfoById")
    @ResponseBody
    public Map<String,Object> findWorkDetailInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        int id = Integer.parseInt(request.getParameter("id"));
        if (id!=0){
            Work workDetailInfoById = doctorsForWorkService.findWorkDetailInfoById(id);
            if (workDetailInfoById!=null){
                map.put("type","success");
                map.put("work",workDetailInfoById);
                map.put("doctor",workDetailInfoById.getDoctor());
                return map;
            }else{
                map.put("type","fail");
            }
        }
        return map;
    }
}
