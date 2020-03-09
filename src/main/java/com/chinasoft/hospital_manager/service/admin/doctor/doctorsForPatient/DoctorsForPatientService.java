package com.chinasoft.hospital_manager.service.admin.doctor.doctorsForPatient;

import com.chinasoft.hospital_manager.domain.Appointment;
import com.chinasoft.hospital_manager.domain.History;
import com.chinasoft.hospital_manager.domain.Prescription;
import com.chinasoft.hospital_manager.domain.Product;
import com.chinasoft.hospital_manager.domain.page.PageBean;

import java.util.List;
import java.util.Map;


/**
 * Created by Jack on 2020/2/13 12:03
 */
public interface DoctorsForPatientService  {

    //医生查询就诊信息，按照今天的挂号时间，查询医生的需要看的病人
    public PageBean<Appointment> findPatientOfAppointmentById(int currentPage,int count,int id);

    //医生端，点击接诊，那么这个按钮置为不可用的状态，同时将这个数据库的字段flag字段改为1
    public int doctorsClickForAppointment(String id);

    //医生点击详情查看这个病人的挂号的详细信息
    public  Appointment findPatientInfoById(Map<String,Object> map);

    //根据关键字，搜素信息，这个是管理病人的信息
    public PageBean<Appointment> searchPatientsInfoByCondition(Map<String,Object> map,int currentPage,int count);

    //医生点击停止挂号，按照该医生的id，修改该医生今天工作表里面的状态，让挂号人员不能挂号
    public int updateDoctorWorkInfoById(Map<String,Object> map);

    //这个是医生插入处方的信息
    public int submitPrescriptionInfo(Map<String,Object> map,Map<String,Object> pay);

    //医生填写病例史，医生填写这个病历史的同时，修改这个处方的history_id字段信息
    public int submitHistoryByDoctor(Map<String,Object> map);
    public  int updatePrescriptionItemInfo(Map<String,Object> map);

    //根据病人的id信息查询这个病人的处方史
    public List<Prescription> findPrescriptionsByPatientId(Map<String,Object> map);


    //查询这个该医生病人的病历史
    public PageBean<History> doctorsFindHistory(Map<String,Object> map,int currentPage,int count);

    //根据这个病历的id，查询该条数据，在点击编辑的时候，数据回显的函数
    public History findHistoryById(Map<String,Object> map);

    //根据id，修该病历信息
    public int updateHistoryById(Map<String,Object> map);

    //根据id,删除这个病历的信息
    public int deleteHistoryById(Map<String,Object> map);



}
