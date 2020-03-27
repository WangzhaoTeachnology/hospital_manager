package com.chinasoft.hospital_manager.controller.user.payForPatients;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.patient.UserForPatientService;
import com.chinasoft.hospital_manager.service.admin.pay.PayForPatientsService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import javafx.scene.control.Alert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.MissingPathVariableException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.channels.SeekableByteChannel;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/2/9 2:05
 */
@Controller
@RequestMapping("/admin/payForPatientController")
public class payForPatientController {

    @Autowired
    PayForPatientsService payForPatientsService;

    @RequestMapping (value = "/loadPayPages",method = RequestMethod.GET)
    public ModelAndView loadPayPages(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        String currentPage = request.getParameter("currentPage");
        String condition=request.getParameter("condition");
        String search=request.getParameter("search");
        //这个是检索条件,,
        // 默认为全部查询，但是可以通过检索的条件，按照这个姓名和今天的日期查询这个信息
        if (condition!=null&&condition!=""&&condition.equals("姓名")){
            map.put("name",search);
        }
        if (condition!=null&&condition!=""&&condition.equals("今天")){
            map.put("today",search);
        }
        if (currentPage==null){
            currentPage="1";
        }
        int currentCount=3;
        //默认为全部查询，但是可以通过检索的条件，按照这个姓名和今天的日期查询这个信息
       //  map.put("all","all");
        PageBean<Pay> payAllInfoByCondition = payForPatientsService.findPayAllInfoByCondition(map, Integer.parseInt(currentPage), currentCount);
        if (payAllInfoByCondition!=null){
            List<Pay> list = payAllInfoByCondition.getList();
            //这个是将上面的东西按照对应的条件，加上红色标记
            for (Map.Entry<String,Object> entry:map.entrySet()){
                String key = entry.getKey();
                Object value = entry.getValue();
                if (key.equals("name")){
                    if (list!=null){
                        for (Pay pay:list){
                            String name = pay.getPatient().getName();
                            name=" <font style=\"color: red;\">"+name+"</font>";
                            pay.getPatient().setName(name);
                        }
                    }
                }
            }
            if (list!=null){
                andView.addObject("list",list);
                andView.addObject("search",search);
                andView.addObject("condition",condition);
                andView.addObject("pageBean",payAllInfoByCondition);
            }
        }
        andView.setViewName("/admin/user_clinicManager/payForPatients/payForPatients");
        map.put("all", "all");
        return andView;
    }


    /**
     * @description:这个是根据这个处方编号，查找这个处方的详情
     * @author jack
     * @date 2020/3/25 20:33
     * @param null
     * @return
     */

    @RequestMapping("/findItemPrescriptionsById")
    @ResponseBody
    public  Map<String,Object> findItemPrescriptionsById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        List<Itemprescription> itemPrescriptionsById = payForPatientsService.findItemPrescriptionsById(id);
        if (itemPrescriptionsById!=null){
            map.put("type","success");
            map.put("itemPrescriptionsById",itemPrescriptionsById);
        }else {
            map.put("type","fail");
            return map;
        }
        return map;
    }
    /**
     * @description:这个是点击确认缴费的按钮，提交后修改状态的函数
     * @author jack
     * @date 2020/3/26 19:17
     * @param null
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateStatus")
    public Map<String,Object> updateStatus(HttpServletRequest request,HttpServletResponse response) throws IOException {
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");
        User _user=null;
        _user=(User)user;
        int user_id=0;
          user_id=_user.getId();
        if (id!=null&&id!=""){
             if (user_id!=0){
                 int i = payForPatientsService.updatePayItemInfoStatusByBtn(user_id, id);
                 if (i>0){
                     map.put("type","success");
                     return map;
                 }else {
                     map.put("type","fail");
                     return map;
                 }
             }else {
                 //如果这个操作用户失效，这个数据是存放在session里面的，
                 //但是这个session有一个默认的失效的时间，所以当它失效的时候，可以跳到登录的页面，重新操作
                 //这个是退出frameset框架的操作的java后台代码
                 HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                 httpServletResponse.getWriter().print("<script>parent.window.location.href=" + request.getContextPath() + "'/admin/logout'</script>");
             }
        }else {
            map.put("type","error");
        }
        return map;
    }

/**
 * @description:点击打印的按钮，然后查询这个处方的详情的信息
 * @author jack
 * @date 20-3-27 下午6:03
 * @param null
 * @return
 */
    @RequestMapping("/findItemPrescriptionsByIdWithPrint")
    @ResponseBody
    public  Map<String,Object> findItemPrescriptionsByIdWithPrint(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        List<Prescription> itemPrescriptionsById = payForPatientsService.findItemPrescriptionsByIdWithPrint(id);
        HttpSession session = request.getSession();
        //这个是为了获取这个操作员的信息
        Object user = session.getAttribute("user");
        User _user=null;
        _user=(User)user;
        if (itemPrescriptionsById!=null){
            if (_user!=null){
                map.put("user",_user);
                map.put("type","success");
                map.put("prescription",itemPrescriptionsById);
            }
        }else {
            map.put("type","fail");
            return map;
        }
        return map;
    }
}
