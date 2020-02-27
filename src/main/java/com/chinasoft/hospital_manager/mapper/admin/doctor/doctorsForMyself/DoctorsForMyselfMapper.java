package com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForMyself;


import com.chinasoft.hospital_manager.domain.Doctor;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @description
 * @author jack
 * @date 2020/2/13 13:57
 * @param null
 * @return
 */

@Repository
public interface DoctorsForMyselfMapper {

    //doctor登录，根据id，查询这个医生个人资料信息：
    public Doctor findDoctorInfoById(int id);

    //根据这个id修改这个name和passwor
    public  int updateDoctorInfoById(Map<String,Object> map);

}
