package com.chinasoft.hospital_manager.service.admin.admin.adminForMyself.impl;

import com.chinasoft.hospital_manager.domain.Admin;
import com.chinasoft.hospital_manager.mapper.admin.admin.adminForMyself.AdminForMyselfMapper;
import com.chinasoft.hospital_manager.service.admin.admin.adminForMyself.AdminForMyselfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Jack on 2020/3/3 18:27
 */
@Service
public class AdminForMyselfServiceImpl implements AdminForMyselfService {

    @Autowired
    private AdminForMyselfMapper adminForMyselfMapper;

    @Override
    public Admin findAdminInfoById(int id) {
        Admin adminInfoById = adminForMyselfMapper.findAdminInfoById(id);
        if (adminInfoById!=null){
            return adminInfoById;
        }
        return null;
    }
}
