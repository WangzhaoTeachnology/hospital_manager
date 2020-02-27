package com.chinasoft.hospital_manager.service.admin.employee.impl;

import com.chinasoft.hospital_manager.domain.Department;
import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.domain.Role;
import com.chinasoft.hospital_manager.domain.User;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.employee.EmployeeMapper;
import com.chinasoft.hospital_manager.service.admin.employee.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2019/12/30 21:05
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public PageBean<User> getAllUserInfo(int currentPage, int currentCount) {

        if (currentCount!=0&&currentPage!=0){
            int totalCount = employeeMapper.getTotalCount();
            Map<String,Object> map=new HashMap<String, Object>();
            PageBean<User> pageBean=new PageBean<User>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                map.put("index",index);
                map.put("count",currentCount);
                List<User> allUserInfo = employeeMapper.getAllUserInfo(map);
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
    public List<Role> selectAllRole() {
        List<Role> roles = employeeMapper.selectAllRole();
        if (roles!=null&&roles.size()>0){
            return roles;
        }
        return null;
    }

    @Override
    public List<Department> selectDepartment() {
        List<Department> departments = employeeMapper.selectDepartment();
        if (departments!=null&&departments.size()>0){
            return departments;
        }
        return null;
    }

    @Override
    public int addUserInfo(Map<String, Object> map) {
        int i = employeeMapper.addUserInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int deleteUserInfoById(int id) {
        int i = employeeMapper.deleteUserInfoById(id);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public User beforUpdateFindUserInfo(int id) {
        User user = employeeMapper.beforUpdateFindUserInfo(id);
        if (user!=null&&user.getUsername()!=""){
            return user;
        }
        return null;
    }

    @Override
    public int updateUserInfoById(Map<String,Object> map) {
        int i = employeeMapper.updateUserInfoById(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public PageBean<User> searchUserInfoByCondition(Map<String, Object> mapdata,int currentPage,int currentCount) {
        Map<String,Object> condition=new HashMap<String, Object>();
        for (Map.Entry<String,Object> entry:mapdata.entrySet()){
            String key = entry.getKey();
             if (key.equals("sex")){
                Integer sex= (Integer) entry.getValue();
                condition.put("sex",sex);
            }
            else if (key.equals("username")){
                String username= (String) entry.getValue();
                condition.put("username",username);
            }
            else if (key.equals("name")){
                String name = (String) entry.getValue();
                condition.put("name",name);
            }
        }

        if (currentCount!=0&&currentPage!=0){
            int totalCount = employeeMapper.getTotalCountByCondition(condition);
            Map<String,Object> map=new HashMap<String, Object>();
            PageBean<User> pageBean=new PageBean<User>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                condition.put("index",index);
                condition.put("count",currentCount);
                List<User> allUserInfo = employeeMapper.searchUserInfoByCondition(condition);
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
    public PageBean<Doctor> getAllDoctorsInfo(int currentPage, int currentCount) {

        if (currentCount!=0&&currentPage!=0){
            int totalCount = employeeMapper.getAllDoctorsTotalCount();
            Map<String,Object> map=new HashMap<String, Object>();
            PageBean<Doctor> pageBean=new PageBean<Doctor>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                map.put("index",index);
                map.put("count",currentCount);
                List<Doctor> allUserInfo =  employeeMapper.getAllDoctorsInfo(map);
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
    public Doctor selectDoctorInfoById(int id) {
        Doctor doctor = employeeMapper.selectDoctorInfoById(id);
        if (doctor!=null&&doctor.getId()!=0){
            return doctor;
        }
        return null;
    }

    @Override
    public int addDoctorInfo(Map<String, Object> map) {
        int i = employeeMapper.addDoctorInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int deleteDoctorInfoById(int id) {
        int i = employeeMapper.deleteDoctorInfoById(id);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public PageBean<Doctor> searchDoctorsInfoByCondition(Map<String, Object> map, int currentPage, int currentCount) {
        Map<String,Object> condition=new HashMap<String, Object>();
        for (Map.Entry<String,Object> entry:map.entrySet()){
            String key = entry.getKey();
            if (key.equals("sex")){
                String sex = (String) entry.getValue();
                condition.put("sex",sex);
            }
            else if (key.equals("realname")){
                String username= (String) entry.getValue();
                condition.put("realname",username);
            }
            else if (key.equals("name")){
                String name = (String) entry.getValue();
                condition.put("name",name);
            }
            else if (key.equals("prat")){
                String prat = (String) entry.getValue();
                condition.put("prat",prat);
            }
        }

        if (currentCount!=0&&currentPage!=0){
            int totalCount = employeeMapper.getTotalDoctorsCountByCondition(condition);
            Map<String,Object> _map=new HashMap<String, Object>();
            PageBean<Doctor> pageBean=new PageBean<Doctor>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                condition.put("index",index);
                condition.put("count",currentCount);
                List<Doctor> allUserInfo = employeeMapper.searchDoctorsInfoByCondition(condition);
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
    public Doctor beforUpdateFindDoctorInfo(int id) {
        Doctor doctor = employeeMapper.beforUpdateFindDoctorInfo(id);
        if (doctor!=null&&doctor.getId()!=0){
            return doctor;
        }
        return null;
    }

    @Override
    public int updateDoctorInfoById(Map<String, Object> map) {
        int i = employeeMapper.updateDoctorInfoById(map);
        if (i>0){
            return i;
        }
        return 0;
    }


}
