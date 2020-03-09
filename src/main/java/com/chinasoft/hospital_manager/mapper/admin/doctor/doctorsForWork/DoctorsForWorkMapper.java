package com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForWork;


import com.chinasoft.hospital_manager.domain.Appointment;
import com.chinasoft.hospital_manager.domain.History;
import com.chinasoft.hospital_manager.domain.Prescription;
import com.chinasoft.hospital_manager.domain.Work;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface DoctorsForWorkMapper {

    //根据id，查询这个医生的工作信息
    public List<Work> findDoctorsWorkInfoById(int id);

    //根据id,查询这个工作的信息
    public Work findWorkDetailInfoById(int id);
}
