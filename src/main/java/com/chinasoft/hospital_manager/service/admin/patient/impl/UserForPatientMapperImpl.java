package com.chinasoft.hospital_manager.service.admin.patient.impl;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.patient.UserForPatientMapper;
import com.chinasoft.hospital_manager.service.admin.patient.UserForPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/1/28 23:35
 */

@Service
public class UserForPatientMapperImpl implements UserForPatientService {

    @Autowired
    private UserForPatientMapper userForPatientMapper;

    @Override
    public List<Appoint_category> getAllAppoint_categorys() {
        List<Appoint_category> allAppoint_categorys = userForPatientMapper.getAllAppoint_categorys();
        if (allAppoint_categorys!=null&&allAppoint_categorys.size()>0){
            return allAppoint_categorys;
        }
        return null;
    }

    @Override
    public List<Offices> getOfficesByAppoint_category(int id) {
        List<Offices> officesByAppoint_category = userForPatientMapper.getOfficesByAppoint_category(id);
        if (officesByAppoint_category!=null&&officesByAppoint_category.size()>0){
            return officesByAppoint_category;
        }
        return null;
    }

    @Override
    public int getPatientBeforeAjaxSelect(Date time) {
     int patientBeforeAjaxSelect = userForPatientMapper.getPatientBeforeAjaxSelect(time);
        if (patientBeforeAjaxSelect!=0){
            return patientBeforeAjaxSelect;
        }
        return 0;
    }

    @Override
    public List<Doctor> getDoctorByOndayTime(int id) {
        List<Doctor> doctorByOndayTime = userForPatientMapper.getDoctorByOndayTime(id);
        if (doctorByOndayTime!=null&&doctorByOndayTime.size()>0){
            return  doctorByOndayTime;
        }
        return null;
    }

    @Override
    public Doctor getDoctorsByDetailsById(int id) {
        Doctor doctorsByDetailsById = userForPatientMapper.getDoctorsByDetailsById(id);
        if (doctorsByDetailsById!=null&&doctorsByDetailsById.getId()!=0){
            return doctorsByDetailsById;
        }
        return null;
    }

    @Override
    public Work getDoctorsTimesById(int id) {
        Work doctorsTimesById = userForPatientMapper.getDoctorsTimesById(id);
        if (doctorsTimesById!=null&&doctorsTimesById.getId()!=0){
            return doctorsTimesById;
        }
        return null;
    }

    @Override
    public int insertPatientUserInfo(Map<String,Object> map) {
        int i = userForPatientMapper.insertPatientUserInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int insertPatitentClinicInfo(Map<String,Object> map) {
        int i = userForPatientMapper.insertPatitentClinicInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public PageBean<Appointment> selectPatientNumberInfo(int currentPage, int count) {
        PageBean<Appointment> pageBean = new PageBean<Appointment>();
        if (count != 0 && currentPage != 0) {
            int totalCount = userForPatientMapper.getTotalCount();
            Map<String, Object> map = new HashMap<String, Object>();
            if (totalCount != 0) {
                int totalPages = (int) Math.ceil(totalCount * 1.0 / count);
                int index = (currentPage - 1) * count;
                map.put("index", index);
                map.put("count", count);
                List<Appointment> appointments = userForPatientMapper.selectPatientNumberInfo(map);
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
    public Appointment selectPatientNumberInfoById(String id) {
        Appointment appointment = userForPatientMapper.selectPatientNumberInfoById(id);
        if (appointment!=null&&appointment.getId()!=""){
            return appointment;
        }
        return null;
    }

    @Override
    public Appointment beforeSelectupdatePatientNumberInfoById(int id) {
        Appointment appointment = userForPatientMapper.beforeSelectupdatePatientNumberInfoById(id);
        if (appointment!=null&&appointment.getId()!=""){
            return appointment;
        }
        return null;
    }

    @Override
    public PageBean<Appointment> searchPatientsInfoByCondition(Map<String, Object> map,int currentPage,int currentCount) {
        Map<String,Object> condition=new HashMap<String, Object>();
        for (Map.Entry<String,Object> entry:map.entrySet()){
            String key = entry.getKey();
            if (key.equals("sex")){
                String sex = (String) entry.getValue();
                condition.put("sex",sex);
            }
            else if (key.equals("id")){
                String id= (String) entry.getValue();
                condition.put("id",id);
            }
            else if (key.equals("name")){
                String name = (String) entry.getValue();
                condition.put("name",name);
            }
            else if (key.equals("id_number")){
                String id_number = (String) entry.getValue();
                condition.put("id_number",id_number);
            }
            else if (key.equals("all")){
                String all = (String) entry.getValue();
                condition.put("all",all);

            }
            else if (key.equals("today")){
                String today = (String) entry.getValue();
                condition.put("today",today);
            }
            else if (key.equals("startime")){
                String startime = (String) entry.getValue();
                condition.put("startime",startime);
            }
            else if (key.equals("endtime")){
                String endtime = (String) entry.getValue();
                condition.put("endtime",endtime);
            }
        }

        if (currentCount!=0&&currentPage!=0){
            int totalCount = userForPatientMapper.getTotalPatientsCountByCondition(condition);
            Map<String,Object> _map=new HashMap<String, Object>();
            PageBean<Appointment> pageBean=new PageBean<Appointment>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                condition.put("index",index);
                condition.put("count",currentCount);
                List<Appointment> allUserInfo = userForPatientMapper.searchPatientsInfoByCondition(condition);
                if (allUserInfo!=null&&allUserInfo.size()!=0){
                    pageBean.setCurrentCount(currentCount);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(allUserInfo);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                }
            }else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(currentCount);
                pageBean.setList(null);
            }
            return  pageBean;
        }
        return null;
    }

    @Override
    public PageBean<Doctor> selectDoctorsInfoByOnTime(Map<String,Object> map,int currentPage, int count) {
        Map<String,Object> condition=new HashMap<String, Object>();

        for (Map.Entry<String,Object> entry:map.entrySet()){
            String key = entry.getKey();
            if (key.equals("name")){
                String name = (String) entry.getValue();
                condition.put("name",name);
            }
            else if (key.equals("today")){
                String today = (String) entry.getValue();
                condition.put("today",today);
            }
        }

        if (count!=0&&currentPage!=0){
            int totalCount = userForPatientMapper.getSelectDoctorsInfoByOnTimeCount(condition);
            PageBean<Doctor> pageBean=new PageBean<Doctor>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/count);
                int index= (currentPage-1)*count;
                condition.put("index",index);
                condition.put("count",count);
                List<Doctor> doctors = userForPatientMapper.selectDoctorsInfoByOnTime(condition);
                if (doctors!=null&&doctors.size()!=0){
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(doctors);
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


}
