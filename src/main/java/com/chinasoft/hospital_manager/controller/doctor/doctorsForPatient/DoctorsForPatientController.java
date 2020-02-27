package com.chinasoft.hospital_manager.controller.doctor.doctorsForPatient;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForPatient.DoctorsForPatientService;
import com.chinasoft.hospital_manager.service.admin.patient.UserForPatientService;
import com.chinasoft.hospital_manager.service.admin.product.ProductService;
import com.chinasoft.hospital_manager.utils.MenuUtils;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;

import java.util.*;


/**
 * Created by Jack on 2020/2/13 0:14
 */
@Controller
@RequestMapping("/admin/doctor")
public class DoctorsForPatientController {

    @Autowired
    private DoctorsForPatientService doctorsForPatientService;

    @Autowired
    private UserForPatientService userForPatientService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/findPatientOfAppointment")
   public ModelAndView findPatientOfAppointment(HttpServletRequest request,HttpServletResponse response) throws IOException {
       ModelAndView  andView=new ModelAndView();
        List<Menu> menus = (List<Menu> )request.getSession().getAttribute("menus");
        HttpSession session = request.getSession();
        Doctor doctor=null;
        Object object = session.getAttribute("doctor");
        PageBean<Appointment> appointmentPageBean=null;
        String menuid = request.getParameter("menuid");
        List<Menu> third=null;
        if (menuid!=null&&menuid!=""){
            int _menuid=Integer.parseInt(menuid);
            third= MenuUtils.getThird(menus, _menuid);
        }

        if (third!=null){
            andView.addObject("third",third);
        }else {
            //这个是退出frameset框架的操作的java后台代码
            HttpServletResponse httpServletResponse = (HttpServletResponse) response;
            httpServletResponse.getWriter().print("<script>parent.window.location.href=" + request.getContextPath() + "'/admin/logout'</script>");
        }

        //指定当前页数和个数
        String currentPage = request.getParameter("currentPage");

        if (currentPage==null){
            currentPage="1";
        }
        int currentCount=4;
        if (object != null) {
            doctor = (Doctor) object;
            int id=doctor.getId();
            appointmentPageBean =doctorsForPatientService.findPatientOfAppointmentById(Integer.parseInt(currentPage),currentCount,id);
        }else{
            //如果这个医生长期没有触动这个系统，那么这个session里面的数据可能失效了，那么
            //也别查信息了，直接给我退出重新登录把
            andView.setViewName("redirect:/admin/doctor/logout");
            return andView;
        }

        List<Appointment> list = appointmentPageBean.getList();
        if (list!=null&&list.size()>0){
           //如果这个医生接诊了的信息那么这个时间，程序执行到controller层时，先从浏览器cookie上，
            //拿到，然后响应给浏览器上显示出来
            for (Appointment appointment:list){
                 if (appointment.getFlag()==1){
                     Cookie[] cookies = request.getCookies();
                     if (cookies!=null){
                         for (Cookie cookie:cookies){
                             if (cookie.getName().equals(appointment.getId())){
                                 String value = cookie.getValue();
                                 String[] split = value.split("/");
                                 if (split!=null){
                                     String waitime=split[0];
                                     String id=split[1];
                                     if (appointment.getId().equals(id)){
                                           appointment.setWaitime(waitime);
                                     }
                                 }
                             }
                         }
                     }
                 }
            }


            andView.addObject("page",appointmentPageBean);
            andView.addObject("list",list);
            if (object != null) {
                doctor = (Doctor) object;
                andView.addObject("doctor",doctor);
                //为了医生点击停止挂号按钮的功能，把医生的id传递到前台去
                //当然在医生操作的时候，直接从后台获取这个数据也可以

            }
            andView.addObject("menuid",menuid);
        }


      andView.setViewName("admin/doctorInfoAndManager/doctorsForPatient/doctorsForPatient");
       return andView;
   }

    /**
     * @description:这个是按照输入框里面的条件查询的函数:
     * 这个函数是医生与病人之间的关系的表，病人看病挂这个医生的号，所以这函数的查询是病人表，挂号表，医生表，三张表之间建立一个逻辑关系
     *所以每一个不同的医生不同的id，必须要求传递过去，因为每个不同的医生不同的挂号信息，以及不同的病人的信息
     * 而医生在操作停止挂号是必须与医生的工作表相关的，医生表，工作表，
     *
     * @author jack
     * @date 2020/2/16 16:25
     * @param null
     * @return
     */
    @RequestMapping(value = "/searchPatientsInfoByCondition",method = RequestMethod.GET)
    public ModelAndView  searchPatientsInfoByCondition(HttpServletRequest request) throws UnsupportedEncodingException, ParseException {
        request.setCharacterEncoding("UTF-8");
        ModelAndView andView =new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        HttpSession doctor_session = request.getSession();
        String search = request.getParameter("search");
        String menuid = request.getParameter("menuid");
        String condition=request.getParameter("conditon").trim();

        //获取医生的信息
        Object doctor = doctor_session.getAttribute("doctor");
        Doctor doctor_info=null;
        if (doctor!=null&&doctor!=""){
            doctor_info=(Doctor) doctor;
        }


        //按照在选全部的条件下面，按照这个开始时间和结束时间，检索数据
        String startime=request.getParameter("startime");
        String endtime=request.getParameter("endtime");


        if (menuid!="" && menuid!=null && condition!=null && condition!=""){
            HttpSession session = request.getSession();
            Object menu = session.getAttribute("menus");
            List<Menu> list_menu=(List<Menu>)menu;
            List<Menu> third=null;

            //每次加载页面的时候，进行，三级菜单的查询
            if (list_menu!=null&&list_menu.size()>0){
                int id=Integer.parseInt(menuid);
                third = MenuUtils.getThird(list_menu, id);
            }

            //根据条件，map键值队的赋值，操作

            //这个是按照医生的id，查询信息，不管你用不用下面的条件，只要医生登录上去
            //就得按照医生的id，查询与该医生相关的病人的挂号的信息
            int id=doctor_info.getId();
            map.put("drid",id);
            if (search!=null&&search!=""){
                  if (condition.equals("挂号编号")){
                    map.put("aid",search);
                }
                else  if (condition.equals("全部")){
                    map.put("all",id);
                }
                else  if (condition.equals("今天")){
                    map.put("today",search);
                    if (startime!=null&&endtime!=null){
                        map.put("startime",startime);
                        map.put("endtime",endtime);
                    }
                }
                else if (condition.equals("姓名")){
                    map.put("name",search);
                }
                else if (condition.equals("诊断")){
                      map.put("flag",Integer.parseInt(search));
                }
                //这个是按照时间的降序排序
                  else if (condition.equals("排序")){
                      map.put("sort",search);
                  }
            }



            //指定当前页数和个数
            String currentPage = request.getParameter("currentPage");
            if (currentPage==null){
                currentPage="1";
            }
            int currentCount=4;

            PageBean<Appointment> pageBean = doctorsForPatientService.searchPatientsInfoByCondition(map,Integer.parseInt(currentPage),currentCount);
            List<Appointment> users = pageBean.getList();
            //加工数据
            if (users!=null){
                for (Map.Entry<String,Object> entry:map.entrySet()){
                    String key = entry.getKey();
                    if (key.equals("name")){
                        for (Appointment appointment:users){
                            String name = appointment.getPatient().getName();
                            name=" <font style=\"color: red;\">"+name+"</font>";
                            appointment.getPatient().setName(name);
                          }
                     }
                    //排序的话
/*                    if (key.equals("sort")){
                        for (int i=0;i<users.size();i++){
                            //@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            for (int j=i+1;j<users.size();j++){
                                long first=simpleDateFormat.parse(users.get(i).getDatetime()).getTime();
                                long second=simpleDateFormat.parse(users.get(j).getDatetime()).getTime();
                                if (first>second){
                                    Appointment temp=users.get(i);
                                    users.set(i,users.get(j));
                                    users.set(j,temp);

                                }
                            }
                        }
                    }*/



                }
                //这个全部数据，有的已经看过，有的没有看过，
                for (Appointment appointment:users){
                    if (appointment.getFlag()==1){
                        Cookie[] cookies = request.getCookies();
                        if (cookies!=null){
                            for (Cookie cookie:cookies){
                                if (cookie.getName().equals(appointment.getId())){
                                    String value = cookie.getValue();
                                    String[] split = value.split("/");
                                    if (split!=null){
                                        String waitime=split[0];
                                        String _id=split[1];
                                        if (appointment.getId().equals(_id)){
                                            appointment.setWaitime(waitime);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if(third!=null){
                andView.addObject("third",third);
            }else {
                //andView.setViewName("redirect:/admin/logout");
                String requestURL = request.getRequestURL().toString();
                andView.setViewName(requestURL);
                return andView; //如果这个，menuid不为空，而这个menus失效了，那么三级菜单为空，那么这个也跳到logout
            }

            if (users!=null) {

                andView.addObject("condition",condition);
                andView.addObject("search",search);
                andView.addObject("page",pageBean);
                andView.addObject("list", users);
            }
        }else {
            //   andView.setViewName("redirect:/admin/logout");
            //  request.getRequestURL()
            String requestURL = request.getRequestURL().toString();
            andView.setViewName(requestURL);
            return andView; //如果这个menuid为空，那么跳到logout
        }

        andView.addObject("menuid",menuid);
        andView.setViewName("admin/doctorInfoAndManager/doctorsForPatient/doctorsForPatient");
        return andView;
    }

    /**
     * @description:医生端，点击接诊，那么这个按钮置为不可用的状态，同时将这个数据库的字段flag字段改为1
     * @author jack
     * @date 2020/2/14 23:34
     * @param null
     * @return
     */
    @RequestMapping("/doctorsClickForAppointment")
    @ResponseBody
    public Map<String,Object> doctorsClickForAppointment(HttpServletRequest request,HttpServletResponse response){
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        String waitime = request.getParameter("waitime");
        if (id!=null&&id!=""&&waitime!=null&&waitime!=""){
            int i = doctorsForPatientService.doctorsClickForAppointment(id);
            if (i>0){
                map.put("type","success");
                map.put("waitime",waitime);
                String temp = waitime.replaceAll("\\s*", "");
                waitime=temp;
                String info=waitime+"/"+id;
                //如果这个医生点击这个接诊，那么把这个挂号的信息，主键，存放到本地的浏览器上面
                //然后再次后台查询数据的时候，这个等待的时间，是没有涉及数据里面的，怎么办，
                //在程序加载到页面上之前，先将程序从浏览器上拿到这个cookie的数据，然后加工后把这个数据
                //显示在浏览器上

                Cookie cookie = new Cookie(id, info);
                cookie.setMaxAge(60*60*60*60);
                cookie.setPath("/");
                response.addCookie(cookie);
                return map;
            }
            map.put("type","fail");
            return map;
        }else{
            map.put("type","error");
        }
      return map;
    }

    /**
     * @description:这个是医生端点击查看挂号病人的详情
     * @author jack
     * @date 2020/2/15 0:19
     * @param null
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findPatientInfoById",method = RequestMethod.GET)
    public Map<String,Object> findPatientInfoById(HttpServletRequest request){
        Map<String,Object> request_map=new HashMap<String, Object>();
        Map<String,Object> response_map=new HashMap<String, Object>();
        String id = request.getParameter("id");
        Doctor doctor=null;
        HttpSession session = request.getSession();
        Object doctor1 = session.getAttribute("doctor");
        if (doctor1!=null){
            doctor=(Doctor) doctor1;
        }
        if (id!=null&&id!=""){
            if (doctor!=null){
                int drid=doctor.getId();
                request_map.put("drid",drid);
            }
            request_map.put("id",id);
            Appointment patientInfoById = doctorsForPatientService.findPatientInfoById(request_map);
            if (patientInfoById!=null){
                response_map.put("type","success");
                response_map.put("appointment",patientInfoById);
                return response_map;
            }
            response_map.put("type","fail");
            return response_map;
        }
        else{
            response_map.put("type","error");
        }
        return response_map;
    }

    /**
     * @description:这个是医生点击停止挂号，继续挂号按钮，修改医生工作表的状态
     * @author jack
     * @date 2020/2/16 20:47
     * @param null
     * @return
     */

    @RequestMapping("/updateDoctorWorkInfoById")
    @ResponseBody
    public Map<String,Object> updateDoctorWorkInfoById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> parameter=new HashMap<String, Object>();
        String id=request.getParameter("id");
        String status=request.getParameter("status");
        if (id!=null&&id!=""){
            parameter.put("id",Integer.parseInt(id));
            parameter.put("status",Integer.parseInt(status));
            int i = doctorsForPatientService.updateDoctorWorkInfoById(parameter);
            if (i>0){
                map.put("status",Integer.parseInt(status));
                map.put("type","success");
                return map;
            }
            else{
                map.put("type","fail");
                return map;
            }
        }else{
            map.put("type","error");
        }
        return map;
    }

/**
 * @description:这个是医生点击处方按钮，然后点击处方详情的时候
 * @author jack
 * @date 2020/2/17 22:52
 * @param null
 * @return
 */
    @ResponseBody
    @RequestMapping("/findProductCategory")
    public Map<String,Object> findProductCategory(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        List<Category_Product> productCategory = productService.findProductCategory();
        if (productCategory!=null){
            map.put("type","success");
            map.put("products",productCategory);
            return map;
        }else{
            map.put("type","fail");
        }
        return map;
    }
    /**
     * @description:这个是根据药品的类别的id，查询该类别的药品
     * @author jack
     * @date 2020/2/18 12:42
     * @param null
     * @return
     */

    @RequestMapping("/findProductByCategoryId")
    public  @ResponseBody Map<String,Object> findProductByCategoryId(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        if (id!=null){
            List<Product> productByCategoryId = productService.findProductByCategoryId(Integer.parseInt(id));
            if (productByCategoryId!=null){
                map.put("type","success");
                map.put("product",productByCategoryId);
                return map;
            }else {
                map.put("type","fail");
                return map;
            }
        }else {
            map.put("type","error");
        }
        return map;
    }
/**
 * @description
 * @author jack
 * @date 2020/2/22 22:51
 * @param null
 * @return
 */

    @ResponseBody
    @RequestMapping(value = "/findProductDetailsById",method = RequestMethod.GET)
    public Map<String,Object> findProductDetailsById(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        if (id!=null){
            Product productDetailsById = productService.findProductDetailsById(Integer.parseInt(id));
            if (productDetailsById!=null){
                map.put("type","success");
                map.put("productDetail",productDetailsById);
                return map;
            }else {
                map.put("type","fail");
                return map;
            }
        }else{
            map.put("type","error");
        }
        return map;
    }

    @RequestMapping("/submitPrescriptionInfo")
    @ResponseBody
    public Map<String,Object> submitPrescriptionInfo(HttpServletRequest request){
        Map<String,Object> response_map=new HashMap<String, Object>();
        String data=request.getParameter("data");
        JSONArray json = JSONArray.parseArray(data);
        Map<String,Map<String,Object>> items=new HashMap<String, Map<String,Object>>();
        Map<String, Object>  prescription=new HashMap<String,Object>();


        String id=request.getParameter("id");
        int doctor_id=Integer.parseInt(request.getParameter("doctor_id"));
        String content=request.getParameter("content").trim();
        String comment=request.getParameter("comment").trim();
        String patient_id=request.getParameter("patient_id");
        if(json.size()>0){

/*          private String id;
            private String number;
            @DateTimeFormat(pattern = "yyyy-MM-ss HH:mm:ss")
            private String datetime;
            private Patient patient;
            private Doctor doctor;
            private String content;
            //private History history;
            //private MoneyPay history;
            private String comment;*/


        //    var row={id:prescri_id[i].value,product_id:proId[i].value ,number:_number[i].value,use:use[i].value,day:day[i].value,comment:comment[i].value};
            for (int i=0;i<json.size();i++){
               Map<String,Object> item=new HashMap<String, Object>();
                String item_id=JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("id");
                int product_id=JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getInteger("product_id");
                int number=JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getInteger("number");
                String use=JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("use");
                int day=JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getInteger("day");
                String item_comment=JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("comment");
                     item.put("id",item_id);
                     item.put("prescription_id",id);
                     item.put("product_id",product_id);
                     item.put("number",number);
                     item.put("use",use);
                     item.put("day",day);
                     item.put("comment",item_comment);
                    items.put(item_id,item);
            }
        }



        Date date=new Date();
        prescription.put("id",id);
        prescription.put("content",content);
        prescription.put("datetime",date);
        prescription.put("patient_id",patient_id);
        prescription.put("doctor_id",doctor_id);
        prescription.put("comment",comment);
        prescription.put("prescription_id",items);
        int i = doctorsForPatientService.submitPrescriptionInfo(prescription);
        if (i>0){
            response_map.put("type","success");
        }else {
            response_map.put("type","fail");
        }
        return response_map;
    }

/**
 * @description:这个是医生开完处方后填写病例史的函数
 * @author jack
 * @date 2020/2/23 16:54
 * @param null
 * @return
 */

    @ResponseBody
    @RequestMapping("/submitHistoryByDoctor")
    public Map<String,Object> submitHistoryByDoctor(HttpServletRequest request){
        Map<String,Object> response_map=new HashMap<String, Object>();
        Map<String,Object> map=new HashMap<String, Object>();
         Date date=new Date();
        HttpSession session = request.getSession();
        Object doctor = session.getAttribute("doctor");
        Doctor doctor_info=null;
        doctor_info=(Doctor) doctor;
        if (doctor_info!=null){
            Integer id = doctor_info.getId();
            map.put("doctor_id",id);
        }
        String id=request.getParameter("id");
        String patient_id=request.getParameter("patient_id");
        String content=request.getParameter("content");
        map.put("id",id);
        map.put("patient_id",patient_id);
        map.put("content",content);
        map.put("datetime",date);
        int i = doctorsForPatientService.submitHistoryByDoctor(map);
        if (i>0){
            response_map.put("type","success");
            return  response_map;
        }else {
            response_map.put("type","fail");
        }
        return map;
    }

    @RequestMapping("/findPrescriptionsByPatientId")
    @ResponseBody
    public Map<String,Object> findPrescriptionsByPatientId(HttpServletRequest request){
        Map<String,Object> response_map=new HashMap<String, Object>();
        Map<String,Object> map=new HashMap<String, Object>();
        String id=request.getParameter("id");
        map.put("id",id);
        List<Prescription> prescriptionsByPatientId = doctorsForPatientService.findPrescriptionsByPatientId(map);
        if (prescriptionsByPatientId!=null){
            response_map.put("type","success");
            response_map.put("prescriptions",prescriptionsByPatientId);
            return response_map;
        }else {
            response_map.put("type","fail");
        }
        return response_map;
    }

    /**
     * @description：这个是医生查询所有的药品
     * @author jack
     * @date 2020/2/24 21:12
     * @param null
     * @return
     */

/*    @RequestMapping("/doctorsfindProducts")
    public ModelAndView findAllProducts(HttpServletRequest request){
        ModelAndView andView=new ModelAndView();
        //指定当前页数和个数
        String currentPage = request.getParameter("currentPage");
        if (currentPage==null){
            currentPage="1";
        }
        int currentCount=3;
        PageBean<Product> allProducts = productService.findAllProducts(Integer.parseInt(currentPage), currentCount);
        List<Category_Product> productCategory = productService.findProductCategory();
        if (allProducts!=null&&productCategory!=null){
            List<Product> list = allProducts.getList();
            if (list!=null&&list.size()>0){
                andView.addObject("list",list);
                andView.addObject("productCategory",productCategory);
                andView.addObject("page",allProducts);
                andView.setViewName("admin/doctorInfoAndManager/doctorsForPatient/doctorsForPatientFindProducts");
            }
        }
        return andView;
    }*/

    @RequestMapping("/doctorsfindProducts")
    public ModelAndView findAllProductsByCategoryId(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        ModelAndView andView=new ModelAndView();
        //这个是获取类型的id
        String id=request.getParameter("condition");
        String value=request.getParameter("value");
        String currentPage = request.getParameter("currentPage");
        if (id!=null&&id!=""){
            map.put("category_id",id);
        }

        if (value!=null&&value!=""){
            map.put("value",value);
        }

        if (currentPage==null){
            currentPage="1";
        }
        int currentCount=3;

        PageBean<Product> allProducts = productService.findAllProductsByCategoryId(map,Integer.parseInt(currentPage),currentCount);
        List<Category_Product> productCategory = productService.findProductCategory();
        if (allProducts!=null&&productCategory!=null){
            List<Product> list = allProducts.getList();
            if (list!=null&&list.size()>0){
                andView.addObject("list",list);
                andView.addObject("search",value);
                andView.addObject("condition",id);
                andView.addObject("productCategory",productCategory);
                andView.addObject("page",allProducts);
                andView.setViewName("admin/doctorInfoAndManager/doctorsForPatient/doctorsForPatientFindProducts");
            }
        }
        return andView;
    }

    /**
     * @description:这个是医生病历管理
     * @author jack
     * @date 2020/2/25 13:18
     * @param null
     * @return
     */


    @RequestMapping("/doctorsFindHistory")
    public ModelAndView doctorsFindHistory(HttpServletRequest request){
      String string=request.getParameter("githubdsadsadassdsad");
        ModelAndView andView=new ModelAndView();
        Map<String,Object> map=new HashMap<String, Object>();
        String currentPage = request.getParameter("currentPage");
        HttpSession session = request.getSession();
        Object doctor = session.getAttribute("doctor");
        String condition=request.getParameter("condition");
        String search=request.getParameter("search");

        Doctor doctor_info=null;
        doctor_info=(Doctor) doctor;


        if (condition!=null&&condition!=""&&condition.equals("姓名")){
            map.put("name",search);
        }
        if (condition!=null&&condition!=""&&condition.equals("编号")){
            map.put("id",search);
        }
        //这个是获取这个登录医生的id
        if (doctor_info!=null){
            Integer id = doctor_info.getId();
            map.put("drid",id);
        }
        if (currentPage==null){
            currentPage="1";
        }
        int currentCount=3;
        PageBean<History> historyPageBean = doctorsForPatientService.doctorsFindHistory(map, Integer.parseInt(currentPage), currentCount);
        if (historyPageBean!=null){
            List<History> list = historyPageBean.getList();

            //这个是将上面的东西按照对应的条件，加上红色标记
            for (Map.Entry<String,Object> entry:map.entrySet()){
                String key = entry.getKey();
                Object value = entry.getValue();
                if (key.equals("name")){
                    if (list!=null){
                        for (History history:list){
                            String name = history.getPatient().getName();
                            name=" <font style=\"color: red;\">"+name+"</font>";
                            history.getPatient().setName(name);
                        }
                    }
                }
            }


            if (list!=null){
                andView.addObject("list",list);
                andView.addObject("search",search);
                andView.addObject("condition",condition);
                andView.addObject("page",historyPageBean);
            }
            andView.setViewName("/admin/doctorInfoAndManager/doctorsForPatient/doctorsFindHistory");
        }
        return andView;
    }


}
