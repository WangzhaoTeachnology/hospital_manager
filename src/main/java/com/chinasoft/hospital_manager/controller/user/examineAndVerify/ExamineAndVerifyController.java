package com.chinasoft.hospital_manager.controller.user.examineAndVerify;



import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinasoft.hospital_manager.domain.Itemprescription;
import com.chinasoft.hospital_manager.domain.Pay;
import com.chinasoft.hospital_manager.domain.Prescription;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForPatient.DoctorsForPatientService;
import com.chinasoft.hospital_manager.service.admin.examineAndVerify.ExamineAndVerifyService;
import com.chinasoft.hospital_manager.service.admin.pay.PayForPatientsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Jack on 2019/12/21 23:09
 */
@Controller
@RequestMapping("/admin/user")
public class ExamineAndVerifyController {

    @Autowired
    ExamineAndVerifyService  examineAndVerifyService ;

    @Autowired
    PayForPatientsService payForPatientsService ;

    @Autowired
    private DoctorsForPatientService doctorsForPatientService;

    /**
     * @description:这个是查询没有被药剂师审核的处方的信息
     * @author jack
     * @date   16:56
     * @param null
     * @return
     */
    @RequestMapping("/findAllPrescriptionByNoStatus")
    public ModelAndView findAllPrescriptionByNoStatus(HttpServletRequest  request){
        ModelAndView andView =new ModelAndView();
        Map<String,Object> parameter=new HashMap<String, Object>();
        String currentPage=request.getParameter("currentPage");
        String condition=request.getParameter("condition");
        String search=request.getParameter("search");

        if (condition!=null&&condition!=""&&condition.equals("处方编号")){
            if (search!=null&&search!=""){
                parameter.put("id",search);
            }
        }
        else if (condition!=null&&condition!=""&&condition.equals("处方内容")){
            if (search!=null&&search!=""){
                parameter.put("content",search);
            }
        }
        else if (condition!=null&&condition!=""&&
                (condition.equals("尚未审核")||
                        condition.equals("审核通过")||
                        condition.equals("审核失败"))){
            parameter.put("status",search);
        }

        if (currentPage==null){
            currentPage="1";
        }
        int count=3;
        PageBean<Prescription> allPrescriptionByNoStatus = examineAndVerifyService.findAllPrescriptionByNoStatus(Integer.parseInt(currentPage), count,parameter);
        if (allPrescriptionByNoStatus!=null){
            List<Prescription> list = allPrescriptionByNoStatus.getList();
            if (list!=null){
                //遍历list处方id，然后再次按照这个id查询这个处方的详情的信息
                //再次封装在Prescription类里面，一起响应给页面
                for (Prescription prescription:list){
                    //处理年纪，显示在页面上
                    String birthday = prescription.getPatient().getBirthday();
                    String[] split = birthday.split("-");
                    int year=Integer.parseInt(split[0]);
                    Date now = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    String format = dateFormat.format(now);
                    String[] split1 = format.split("-");
                    int now_year = Integer.parseInt(split1[0]);
                    int age=now_year-year;
                    if (age!=0){
                        prescription.getPatient().setAge(age);
                    }
                    //按照id查询处方详情
                    String id = prescription.getId();
                    List<Itemprescription> itemPrescriptionsById = payForPatientsService.findItemPrescriptionsById(id);
                    if (itemPrescriptionsById!=null){
                        double total=0.0;
                        for (Itemprescription itemprescription:itemPrescriptionsById){
                            //处理每一个处方详情的check表中的5个条件，是不是都是通过的
                            //只有这个5个条件都是通过的，那么这个处方详情才通过status为1，不然为2审核失败
                            //如果这个5个条件都是通过的，那么修改这处方的详情status1，因为默认为0，status为0的状态医生端可以查看处方有没有审核
                            //如果这个5个条件至少有不通过的，那么修改这处方的详情status2

                            //下面是根据check表，审核每条的处方详情的状态
                            //只要这个处方详情是处于0，或者2的状态的时候，此时是需要修改这个状态的
                            //该为2或者1的状态是通过5个条件而定的
                 /*if (itemprescription.getStatus()==0&&itemprescription.getStatus()==2){
                                String item_id = itemprescription.getId();
                                //因为表中的，cid与itemid是1：n的关系，所以这个查出来可能是一个集合
                                //所以思路1，有问题，因为存在重复的审核，此时check表里面根据itemid，查询出来的数据就是一个集合
                                Check checkItemByItemId = examineAndVerifyService.findCheckItemByItemId(item_id);
                                if (checkItemByItemId!=null){
                                    int if_use = checkItemByItemId.getIf_use();
                                    int if_time = checkItemByItemId.getIf_time();
                                    int if_per = checkItemByItemId.getIf_per();
                                    int if_content = checkItemByItemId.getIf_content();
                                    int if_react = checkItemByItemId.getIf_react();
                                    if (if_use==1&&if_time==1&&if_per==1&&if_content==1&&if_react==1){
                                        int flag=1;
                                        //思路1：
                                        //先查询再更新是没有办法显示给用户看的，只有先更新后查询
                                        //但是也是可以解决这个问题的
                                        //更新到数据库中，但是这个还未显示在页面上，下面是为了显示在页面上
                                        int i = examineAndVerifyService.updateItemPrescriptionByCheckInfo(item_id,flag);
                                        //为了显示在页面上
                                        if (i>0){
                                            itemprescription.setStatus(1);
                                            System.out.println("item_id="+item_id);
                                            System.out.println("审核成功！");
                                        }
                                    }else {
                                        int flag=2;
                                        int i = examineAndVerifyService.updateItemPrescriptionByCheckInfo(item_id,flag);
                                        if (i>0){
                                            itemprescription.setStatus(2);
                                            System.out.println("item_id="+item_id);
                                            System.out.println("审核失败！");
                                        }
                                    }
                                }
                            }*/

                            //处理小数点
                            int number = itemprescription.getNumber();
                            Float price = itemprescription.getProduct().getPrice();
                            total+=number*price;
                        }
                        DecimalFormat df = new DecimalFormat("0.0");
                        String totalPrice = df.format(total);
                        prescription.setTotal(totalPrice);
                        prescription.setItemprescription(itemPrescriptionsById);
                    }
                }
            }
            andView.addObject("search",search);
            andView.addObject("condition",condition);
            andView.addObject("list",list);
            andView.addObject("pageBean",allPrescriptionByNoStatus);
        }
        andView.setViewName("/admin/examineAndVerify/examineAndVerify");
        return andView ;
    }

    /**
     * @description：这个只是将这个处方按照5个条件进行审核，将审核的状态，插入到数据库里面
     * @author jack
     * @date 2020/4/6 20:43
     * @param null
     * @return
     */
    @ResponseBody
    @RequestMapping("/submitCheckInfo")
    public Map<String,Object> submitCheckInfo(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();

        //获取cid，itemid
        String cid=request.getParameter("cid");
        String itemid=request.getParameter("itemid");
        String data=request.getParameter("data");
        String if_use_str=request.getParameter("if_use_str");
        String if_time_str=request.getParameter("if_time_str");
        String if_per_str=request.getParameter("if_per_str");
        String if_content_str=request.getParameter("if_content_str");
        String if_react_str=request.getParameter("if_react_str");

        map.put("cid",cid);
        map.put("item_id",itemid);
        JSONArray json = JSONArray.parseArray(data);
        int flag=0;
        if (json!=null&&json.size()>0){
            for (int i=0;i<json.size();i++){
                flag=0;
                if (i==0){
                    String use_str = JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("if_use");
                    if (use_str!=null&&use_str!=""){
                        int if_use= Integer.parseInt(use_str);
                        if (if_use==1){
                            flag=1;
                        }else {
                            flag=2;
                        }
                        map.put("if_use",if_use);
                    }
                }
               else if (i==1){
                    String time_str = JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("if_time");
                    if (time_str!=null&&time_str!=""){
                        int if_time= Integer.parseInt(time_str);
                        if (if_time==1){
                            flag=1;
                        }else {
                            flag=2;
                        }
                        map.put("if_time",if_time);
                    }
                }
                else if (i==2){
                    String per_str = JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("if_per");
                    if (per_str!=null&&per_str!=""){
                        int if_per= Integer.parseInt(per_str);
                        if (if_per==1){
                            flag=1;
                        }else {
                            flag=2;
                        }
                        map.put("if_per",if_per);
                    }
                }
                else if (i==3){
                    String content_str = JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("if_content");
                    if (content_str!=null&&content_str!=""){
                        int if_content= Integer.parseInt(content_str);
                        if (if_content==1){
                            flag=1;
                        }else {
                            flag=2;
                        }
                        map.put("if_content",if_content);
                    }
                }
                else if (i==4){
                    String react_str = JSONObject.parseObject(JSONObject.toJSONString(json.get(i))).getString("if_react");
                    if (react_str!=null&&react_str!=""){
                        int if_react= Integer.parseInt(react_str);
                        if (if_react==1){
                            flag=1;
                        }else {
                            flag=2;
                        }
                        map.put("if_react",if_react);
                    }
                }
               // String string = JSONObject.toJSONString(json.get(i));//json字符串
            }

            map.put("if_use_str",if_use_str);
            map.put("if_time_str",if_time_str);
            map.put("if_per_str",if_per_str);
            map.put("if_content_str",if_content_str);
            map.put("if_react_str",if_react_str);

            //在插入审核表数据之前，因为审核表的cid主键与处方详情外键是1：n的关系，在插入审核表之前，
            //每次将之前的数据按照itemid作为条件删除，然后再插入
                int i1 = examineAndVerifyService.deleteCheckInfoByItemId(itemid);
                int i = examineAndVerifyService.submitCheckInfo(map);
                if (i>0){
                    //思路2：思路1见上面的查询函数findAllPrescriptionByNoStatus
                    //在插入数据成功的情况下，按照这个处方详情的id，查询这个处方的status字段是不是改为基于5个条件的
                    //状态，如果5个条件同为1，那么这个处方详情改为1，如果存在不为1.那么处方详情改为2
                    Itemprescription itemPrescriptionById = examineAndVerifyService.findItemPrescriptionById(itemid);
                    if (itemPrescriptionById!=null){
                        //前提是尚未审核，第一次，处方详情里面是
                  /*    for (Map.Entry<String,Object> entry:map.entrySet()){
                          String key = entry.getKey();
                          Object value = entry.getValue();
                          String string = value.toString().trim();
                          flag=0;
                          if (string=="1"){
                              flag=1;
                          }
                      }*/


                        //5个条件都是审核通过的
                        if (flag==1){
                            int j = examineAndVerifyService.updateItemPrescriptionByCheckInfo(itemid,flag);
                            //为了显示在页面上
                            if (j>0){
                                System.out.println("审核成功！");
                            }
                        }
                        //至少存在不通过的一个条件
                        //如果同时存在该处方详情再次审核，至少不止一次，那么此时可以再次按照flag，修改这个ItemPrescription的status字段
                        //可以达到同一个处方详情多次审核
                        else {
                            flag=2;
                            int j = examineAndVerifyService.updateItemPrescriptionByCheckInfo(itemid,flag);
                            //为了显示在页面上
                            if (j>0){
                                System.out.println("审核失败！");
                            }
                        }
                    }
                    map.put("type","success");
                    return map;
                }else {
                    map.put("type","fail");
                }

        }

        return map;
    }

    /**
     * @description:这个是提交处方审核按钮的函数
     * @author jack
     * @date 2020/4/6 23:32
     * @param null
     * @return
     */
    @RequestMapping("/submitCheck")
    @ResponseBody
    public Map<String,Object> submitCheck(HttpServletRequest request){
        Map<String,Object> map=new HashMap<String, Object>();
        Map<String,Object> pay=new HashMap<String, Object>();
        String id = request.getParameter("id");
        String patient_id=request.getParameter("patient_id");
        String doctor_id=request.getParameter("doctor_id");
        String totalPrice=request.getParameter("totalPrice");
        List<Itemprescription> itemprescriptions = examineAndVerifyService.submitCheck(id);
        if (itemprescriptions!=null){
            int flag=-1;
            for (Itemprescription item:itemprescriptions){
                //item.getStatus()==0,这种情况是不可能的，因为如果至少存在一个处方详情尚未审核，那么
                //提交审核按钮是不可能提交的，所以只有1，或者2两种状态
                if (item.getStatus()==2){
                    flag=2;
                }
            }
            //至少存在2，那么更新处方数据为2
            if (flag==2){
                int ret=2;
                int i = examineAndVerifyService.updatePrescriptionStatus(id,ret);
                if (i>0){
                    System.out.println("更新处方状态信息成功");
                }
            }
            //不存在2，那么更新处方数据为1，总之，每条的处方详情status，不可能为0，
            //0是提交不了的
            else {
                int ret=1;
                int i = examineAndVerifyService.updatePrescriptionStatus(id,ret);
                if (i>0){
                    System.out.println("更新处方状态信息成功");
                    //更新处方的状态成功后，再次查询这个处方的状态是不是1
                    //是1的话，生成缴费单，不是1，不生成
                    Prescription prescriptionById = doctorsForPatientService.findPrescriptionById(id);
                    if (prescriptionById!=null){
                        if (prescriptionById.getStatus()==1){

                            //如果存在，那么就把这些数据全部删除掉
                            //保证每一条的处方详情都只是生成一条缴费单的信息
                            List<Pay> payByPrescriptionId = examineAndVerifyService.findPayByPrescriptionId(id);
                            int f=-1;
                            if (payByPrescriptionId!=null){
                                for (Pay item:payByPrescriptionId){
                                    String id1 = item.getId();
                                    f=0;
                                    int i1 = examineAndVerifyService.deletePayByPrescriptionId(id1);
                                    if (i1>0){
                                        //如果至少存在f=0,那么说明没有删除完，那么不能插入数据，只有，将缴费单里面的以前相同处方的信息全部删除掉
                                        //才，将本次提交审核的按钮，产生的数据，提交过去，
                                        //这样做只是保证pay表里面只有一条关于处方缴费单的数据
                                        f=1;
                                    }
                                }
                            }

                            if (f==1){
                                //同时生成缴费单号信息
                                Random random=new Random();
                                Date date=new Date();
                                int random_number = random.nextInt(100);
                                String payId= (String) (random_number+id);
                                pay.put("id",payId);
                                pay.put("patient_id",patient_id);
                                pay.put("doctor_id",doctor_id);
                                //pay.put("user_id",)//这个是等交完费用，这个自动的会修改操作人员的信息
                                pay.put("flag",0);   //默认尚未缴费
                                pay.put("datetime",date);
                                pay.put("prescription_id",id);//这个是处方的id
                                pay.put("fee",Double.parseDouble(totalPrice));
                                int j = examineAndVerifyService.addPays(pay);
                                if (j>0){
                                    System.out.println("生成缴费单信息");
                                }
                            }
                        }else {
                            System.out.println("更新处方状态信息失败，不生成缴费单信息");
                        }
                    }

                }
            }
            map.put("type","success");
            return map;
        }
        map.put("type","errpr");
        return map;
    }
}
