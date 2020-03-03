package com.chinasoft.hospital_manager.service.admin.work.impl;


import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.mapper.admin.work.WorkInfoMapper;
import com.chinasoft.hospital_manager.service.admin.work.WorkUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/1/23 22:13
 */
@Service
public class WorkUserInfoServiceImp implements WorkUserInfoService {

    @Autowired
    private WorkInfoMapper workInfoMapper;

    @Override
    public int addUserWorkInfo(Map<String,Object> work) {
        int i = workInfoMapper.addUserWorkInfo(work);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public List<Work> requestloadUserWorkInfo(int id) {
        List<Work> works = workInfoMapper.requestloadUserWorkInfo(id);
        if (works!=null&&works.size()>0){
            return  works;
        }
        return null;
    }

    @Override
    public List<User> getUsers() {
        List<User> users = workInfoMapper.getUsers();
        if (users!=null&&users.size()>0){
            return users;
        }
        return null;
    }

    @Override
    public Work findUserWorkInfoById(int id) {
        Work userWorkInfoById = workInfoMapper.findUserWorkInfoById(id);
        if (userWorkInfoById!=null&&userWorkInfoById.getId()!=0){
            return userWorkInfoById;
        }
        return null;
    }

    @Override
    public List<Role> getAllRoles() {
        List<Role> allRoles = workInfoMapper.getAllRoles();
        if (allRoles!=null&&allRoles.size()!=0){
            return allRoles;
        }
        return null;
    }

    @Override
    public List<Admin> findAdminsByCategory() {
        List<Admin> adminsByCategory = workInfoMapper.findAdminsByCategory();
        if (adminsByCategory!=null&&adminsByCategory.size()>0){
            return adminsByCategory;
        }
        return null;
    }

    @Override
    public List<User> findUsersByCategory() {
        List<User> adminsByCategory = workInfoMapper.findUsersByCategory();
        if (adminsByCategory!=null&&adminsByCategory.size()>0){
            return adminsByCategory;
        }
        return null;
    }

    @Override
    public List<Doctor> findDoctorsByCategory() {
        List<Doctor> adminsByCategory = workInfoMapper.findDoctorsByCategory();
        if (adminsByCategory!=null&&adminsByCategory.size()>0){
            return adminsByCategory;
        }
        return null;
    }

    @Override
    public int editWorkInfoById(Map<String, Object> map) {
        int i = workInfoMapper.editWorkInfoById(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int deleteWorkInfoById(Map<String, Object> map) {
        int i = workInfoMapper.deleteWorkInfoById(map);
        if (i>0){
            return i;
        }
        return 0;
    }
}
