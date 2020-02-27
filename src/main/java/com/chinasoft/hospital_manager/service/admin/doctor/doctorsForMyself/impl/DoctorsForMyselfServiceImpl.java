package com.chinasoft.hospital_manager.service.admin.doctor.doctorsForMyself.impl;


import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForMyself.DoctorsForMyselfMapper;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForMyself.DoctorsForMyselfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * Created by Jack on 2020/2/13 12:20
 */
@Service
public class DoctorsForMyselfServiceImpl implements DoctorsForMyselfService {

    @Autowired
    private DoctorsForMyselfMapper doctorsForMyselfMapper;

    @Override
    public Doctor findDoctorInfoById(int id) {
        Doctor doctorInfoById = doctorsForMyselfMapper.findDoctorInfoById(id);
        if (doctorInfoById!=null&&doctorInfoById.getId()!=0){
            return doctorInfoById;
        }
        return null;
    }

    @Override
    public int updateDoctorInfoById(Map<String, Object> map) {
        int i = doctorsForMyselfMapper.updateDoctorInfoById(map);
        if (i>0){
            return i;
        }
        return 0;
    }


}
