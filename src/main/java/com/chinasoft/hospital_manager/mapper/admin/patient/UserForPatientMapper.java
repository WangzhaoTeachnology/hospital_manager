package com.chinasoft.hospital_manager.mapper.admin.patient;



import com.chinasoft.hospital_manager.domain.*;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Repository
public interface UserForPatientMapper {
    //查询门诊类型
    public List<Appoint_category> getAllAppoint_categorys();

    //根据这个门诊的，去查这个科室的名称
    public  List<Offices> getOfficesByAppoint_category(int id);

    //在注入病人的挂号的数据后，马上得到病人的编号
    //按照今天的日期的时间，去数据库里面，查询数据，然后得到在本次注入数据的时候
    //这个是第几次，这个第几次就可以作为这个病人的挂号编号
     public int  getPatientBeforeAjaxSelect(Date date);


     //根据当前的挂号的时间，查询医生以及该医生的上班表
     public List<Doctor> getDoctorByOndayTime(int id);

     //SELECT d.*,w.* FROM doctor d,`work` w WHERE  d.id=w.id AND  DATEDIFF(now(),w.startime)=0

    //根据id，查询医生的具体的信息
     public  Doctor  getDoctorsByDetailsById(int id);

     //根据医生的id，查询，该医生的工作时间段
    public Work getDoctorsTimesById(int id);

    //挂号插入病人的基本的资料
    public int insertPatientUserInfo(Map<String,Object> map);
    //插病人的挂号信息
    public int insertPatitentClinicInfo(Map<String,Object> map);


    //这个是按照今天的日期，查询挂号表里面的数据，以查看今天，多少人挂号了
    public List<Appointment> selectPatientNumberInfo(Map<String,Object> map);
    //在分页之前，先查询出这些信息的个数
    public int getTotalCount();


    //双击查询列表的行，按照这个id，查询数据到一个弹出层上
    public  Appointment selectPatientNumberInfoById(String id);


    //在修改挂号之前的数据回显
    public Appointment beforeSelectupdatePatientNumberInfoById(int id);

    //根据关键字，搜素信息，这个是管理病人的信息
    public List<Appointment> searchPatientsInfoByCondition(Map<String,Object> map);
    public int getTotalPatientsCountByCondition(Map<String,Object> map);





    //下面是门诊的挂号人员，查询门诊医生的信息，按照当天的日期查询,查询当天所有的医生的信息(工作的信息和个人的信息)
    //涉及到分页，所以要查询个数
    public List<Doctor> selectDoctorsInfoByOnTime(Map<String,Object> map);
    public int getSelectDoctorsInfoByOnTimeCount(Map<String,Object> map);



}
