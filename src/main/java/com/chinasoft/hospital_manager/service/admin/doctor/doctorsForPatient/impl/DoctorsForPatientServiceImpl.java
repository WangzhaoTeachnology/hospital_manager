package com.chinasoft.hospital_manager.service.admin.doctor.doctorsForPatient.impl;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForPatient.DoctorsForPatientMapper;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForPatient.DoctorsForPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.amqp.RabbitRetryTemplateCustomizer;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/2/13 12:03
 */
@Service
public class DoctorsForPatientServiceImpl implements DoctorsForPatientService {


    @Autowired
    private DoctorsForPatientMapper doctorsForPatientMapper;


    @Override
    public PageBean<Appointment> findPatientOfAppointmentById(int currentPage,int count,int id) {
        PageBean<Appointment> pageBean = new PageBean<Appointment>();
        if (count != 0 && currentPage != 0) {
            int totalCount = doctorsForPatientMapper.getCountAppointmentById(id);
            Map<String, Object> map = new HashMap<String, Object>();
            if (totalCount != 0) {
                int totalPages = (int) Math.ceil(totalCount * 1.0 / count);
                int index = (currentPage - 1) * count;
                map.put("index", index);
                map.put("currentCount", count);
                map.put("id",id);
                List<Appointment> appointments = doctorsForPatientMapper.findPatientOfAppointmentById(map);
                if (appointments != null && appointments.size() != 0) {
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(appointments);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                }
            } else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(count);
                pageBean.setList(null);
            }
        }
        return pageBean;
    }

    @Override
    public int doctorsClickForAppointment(String id) {
        int i = doctorsForPatientMapper.doctorsClickForAppointment(id);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public Appointment findPatientInfoById(Map<String, Object> map) {

        Appointment patientInfoById = doctorsForPatientMapper.findPatientInfoById(map);
        if (patientInfoById!=null&&patientInfoById.getId()!=""&&patientInfoById.getId()!=null){
            return patientInfoById;
        }
        return null;
    }

    @Override
    public PageBean<Appointment> searchPatientsInfoByCondition(Map<String, Object> map, int currentPage, int count) {
        Map<String,Object> condition=new HashMap<String, Object>();
        for (Map.Entry<String,Object> entry:map.entrySet()){
            String key = entry.getKey();
             if (key.equals("name")){
                String name = (String) entry.getValue();
                condition.put("name",name);
            }
            else if (key.equals("aid")){
                String id_number = (String) entry.getValue();
                condition.put("aid",id_number);
            }
           /* else if (key.equals("all") || key.equals("sort")){
                Integer all = (Integer) entry.getValue();
                condition.put("drid",all);
            }*/
            else if (key.equals("today")){
                String today = (String) entry.getValue();
                condition.put("today",today);
            }
             else if (key.equals("flag")){
                 Integer today = (Integer) entry.getValue();
                 condition.put("flag",today);
             }else if (key.equals("drid")){
                 Integer id = (Integer) entry.getValue();
                 condition.put("drid",id);
             }
             else if (key.equals("sort")){
                 String sort = (String) entry.getValue();
                 condition.put("sort",sort);
             }
        }

        if (count!=0&&currentPage!=0){
            int totalCount = doctorsForPatientMapper.getTotalPatientsCountByCondition(condition);
            Map<String,Object> _map=new HashMap<String, Object>();
            PageBean<Appointment> pageBean=new PageBean<Appointment>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/count);
                int index= (currentPage-1)*count;
                condition.put("index",index);
                condition.put("count",count);
                List<Appointment> allUserInfo = doctorsForPatientMapper.searchPatientsInfoByCondition(condition);
                if (allUserInfo!=null&&allUserInfo.size()!=0){
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(allUserInfo);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                }
            }else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(count);
                pageBean.setList(null);
            }
            return  pageBean;
        }

        return null;
    }

    @Override
    public int updateDoctorWorkInfoById(Map<String,Object> map) {
        int i = doctorsForPatientMapper.updateDoctorWorkInfoById(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int submitPrescriptionInfo(Map<String, Object> map,Map<String, Object> pay) {
        Map<String,Map<String,Object>> items=new HashMap<String, Map<String,Object>>();

        //这个if判断是为了筛选处，这个处方里面处方详情的数据
        if (map.size()!=0){
            for (Map.Entry<String,Object> entry:map.entrySet()){
                String key = entry.getKey();
                if (key.equals("prescription_id")){
                    Object value = entry.getValue();
                    items= (Map<String, Map<String, Object>>) value;
                }
            }
        }
        //插入数据到处方表里面
        int i = doctorsForPatientMapper.addPrescription(map);
        int flag=0;
        //插入数据到处方详情里面
        for (Map.Entry<String,Map<String,Object>> entry_items:items.entrySet()){
            flag=0;
            String key = entry_items.getKey();
            Map<String, Object> value = entry_items.getValue();
            //这个是将数据插入到处方详情表里面
            int i1 = doctorsForPatientMapper.addItemsPrescription(value);
            if (i1>0){
                flag=1;
            }
        }

        //这个是将数据插入到缴费单表里面
        //int i2 = doctorsForPatientMapper.addPays(pay);
        //只有这个三个插入的函数同时成功的话，那么这个返回1，表示这个处方
        //提交的状态成功了
        if (flag>0&&i>0){
            return 1;
        }
        return 0;
    }

    @Override
    public int submitHistoryByDoctor(Map<String, Object> map) {
        int i = doctorsForPatientMapper.submitHistoryByDoctor(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int updatePrescriptionItemInfo(Map<String, Object> map) {
        int i = doctorsForPatientMapper.updatePrescriptionItemInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public List<Prescription> findPrescriptionsByPatientId(Map<String, Object> map) {
        List<Prescription> prescriptionsByPatientId = doctorsForPatientMapper.findPrescriptionsByPatientId(map);
        if (prescriptionsByPatientId!=null&&prescriptionsByPatientId.size()>0){
            return prescriptionsByPatientId;
        }
        return null;
    }

    @Override
    public PageBean<History> doctorsFindHistory(Map<String,Object> map,int currentPage,int count) {
        Map<String,Object> condition=new HashMap<String, Object>();

        //将上层的数据，筛序出来
        for (Map.Entry<String,Object> entry:map.entrySet()){
            String key = entry.getKey();
            Object value= (Object) entry.getValue();
            if (key.equals("id")){
                condition.put("id",value);
            }
            else if (key.equals("name")){
                condition.put("name",value);
            }
        }
        if (count!=0&&currentPage!=0){
            int totalCount = doctorsForPatientMapper.getTotalHistorysCountByCondition(map);
            Map<String,Object> _map=new HashMap<String, Object>();
            PageBean<History> pageBean=new PageBean<History>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/count);
                int index= (currentPage-1)*count;
                condition.put("index",index);
                condition.put("count",count);
                List<History> histories = doctorsForPatientMapper.doctorsFindHistory(condition);
                if (histories!=null&&histories.size()!=0){
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(histories);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                }
            }else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(count);
                pageBean.setList(null);
            }
            return  pageBean;
        }
        return null;
    }

    @Override
    public History findHistoryById(Map<String, Object> map) {
        History historyById = doctorsForPatientMapper.findHistoryById(map);
        if (historyById!=null&&historyById.getId()!=null&&historyById.getId()!=""){
            return historyById;
        }
        return null;
    }

    @Override
    public int updateHistoryById(Map<String, Object> map) {
        int i = doctorsForPatientMapper.updateHistoryById(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int deleteHistoryById(Map<String, Object> map) {
        int i = doctorsForPatientMapper.deleteHistoryById(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public Prescription findPrescriptionById(String id) {
        Prescription prescriptionById = doctorsForPatientMapper.findPrescriptionById(id);
        if (prescriptionById!=null&&prescriptionById.getId()!=""&&prescriptionById.getId()!=null){
            return  prescriptionById;
        }
        return null;
    }

    @Override
    public PageBean<Prescription> findPrescriptionsByDoctorId(Map<String, Object> map,int currentPage,int count) {
        PageBean<Prescription> pageBean = new PageBean<Prescription>();
        if (count != 0 && currentPage != 0) {
            int totalCount = doctorsForPatientMapper.getTotalfindPrescriptionsByDoctorId(map);
            if (totalCount != 0) {
                int totalPages = (int) Math.ceil(totalCount * 1.0 / count);
                int index = (currentPage - 1) * count;
                map.put("index", index);
                map.put("count", count);
                List<Prescription> prescriptionsByDoctorId = doctorsForPatientMapper.findPrescriptionsByDoctorId(map);
                if (prescriptionsByDoctorId != null && prescriptionsByDoctorId.size() != 0) {
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(prescriptionsByDoctorId);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                }
                return pageBean;
            } else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(count);
                pageBean.setList(null);
            }
        }
        return pageBean;

    }

    @Override
    public List<Itemprescription> findItemPrescriptionById(String id) {
        List<Itemprescription> itemPrescriptionsById = doctorsForPatientMapper.findItemPrescriptionById(id);
        if (itemPrescriptionsById!=null&&itemPrescriptionsById.size()>0){
            return itemPrescriptionsById;
        }
        return null;
    }

    @Override
    public Itemprescription findItemprescriptionById(String id) {
        Itemprescription itemprescriptionById = doctorsForPatientMapper.findItemprescriptionById(id);
        if (itemprescriptionById!=null&&itemprescriptionById.getId()!=null&&itemprescriptionById.getId()!=""){
            return itemprescriptionById;
        }
        return null;
    }

    @Override
    public int deleteItemPrescriptionById(String id) {
        int i = doctorsForPatientMapper.deleteItemPrescriptionById(id);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int addItemsPrescription(Map<String, Object> map) {
        int i = doctorsForPatientMapper.addItemsPrescription(map);
        if (i>0){
            return  i;
        }
        return 0;
    }

    @Override
    public int updateItemPrescriptionInfo(Map<String,Map<String,Object>> map) {
        int flag=-1;
        //修改数据
        for (Map.Entry<String,Map<String,Object>> entry_item:map.entrySet()){
             flag=0;
            String key = entry_item.getKey();
            Map<String, Object> value = entry_item.getValue();
            //逻辑
            //只要这个三个条件，修改了，不仅要修改字段，同时将处方的详情，status改为0
            //同时将处方详情对应的check里面的一项数据，对应的审核条件状态改为0，
            //其他审核条件不改
            int i1 = doctorsForPatientMapper.updateItemPrescriptionById(value);

            int i = doctorsForPatientMapper.updatecheckByItemPrescriptionId(value);
            if (i1>0&&i1>0){
                flag=1;
            }
        }
        if (flag==1){
            return flag;
        }
        return 0;
    }

    @Override
    public int updatePrescriptionById(Map<String, Object> map) {
        int i = doctorsForPatientMapper.updatePrescriptionById(map);
        if (i>0){
            return i;
        }
        return 0;
    }


}
