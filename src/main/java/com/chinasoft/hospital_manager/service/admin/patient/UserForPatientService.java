package com.chinasoft.hospital_manager.service.admin.patient;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/1/28 23:35
 */
public   interface UserForPatientService   {

    //查询门诊类型
    public List<Appoint_category> getAllAppoint_categorys();

    //根据这个门诊的，去查这个科室的名称
    public  List<Offices> getOfficesByAppoint_category(int id);


    //
    public int  getPatientBeforeAjaxSelect(Date time);


    //根据当前的挂号的时间，查询医生以及该医生的上班表
    public List<Doctor> getDoctorByOndayTime(int id);


    //根据id，查询医生的具体的信息
    public  Doctor  getDoctorsByDetailsById(int id);

    //根据医生的id，查询，该医生的工作时间段
    public Work getDoctorsTimesById(int id);

    //挂号插入病人的基本的资料
    public int insertPatientUserInfo(Map<String,Object> map);
    //插病人的挂号信息
    public int insertPatitentClinicInfo(Map<String,Object> map);

    //这个是按照今天的日期，查询挂号表里面的数据，以查看今天，多少人挂号了
    public PageBean<Appointment> selectPatientNumberInfo(int currentPage,int count);


    //双击查询列表的行，按照这个id，查询数据到一个弹出层上
    public  Appointment selectPatientNumberInfoById(String id);


    //在修改挂号之前的数据回显
    public Appointment beforeSelectupdatePatientNumberInfoById(String id);


    //根据关键字，搜素信息，这个是管理病人的信息
    public PageBean<Appointment> searchPatientsInfoByCondition(Map<String,Object> map,int currentPage,int count);



    //下面是门诊的挂号人员，查询门诊医生的信息，按照当天的日期查询,查询当天所有的医生的信息(工作的信息和个人的信息)
    //涉及到分页，所以要查询个数
    public  PageBean<Doctor> selectDoctorsInfoByOnTime(Map<String,Object> map,int currentPage,int count);


    //门诊人员，在30分钟之内退号操作
    public  int deletePatientInfoByIdBetweenTime(String id);

}
