package com.chinasoft.hospital_manager.service.admin.doctor.doctorsForMyself;

import com.chinasoft.hospital_manager.domain.Doctor;
import org.springframework.stereotype.Service;

import java.util.Map;


/**
 * Created by Jack on 2020/2/13 12:20
 */
@Service
public interface DoctorsForMyselfService {

    //doctor登录，根据id，查询这个医生个人资料信息：
    public Doctor findDoctorInfoById(int id);

    //根据这个id修改这个name和passwor
    public  int updateDoctorInfoById(Map<String,Object> map);
}
