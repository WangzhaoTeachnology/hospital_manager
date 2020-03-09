package com.chinasoft.hospital_manager.service.admin.doctor.doctorsForWork.impl;

import com.chinasoft.hospital_manager.domain.Appointment;
import com.chinasoft.hospital_manager.domain.History;
import com.chinasoft.hospital_manager.domain.Prescription;
import com.chinasoft.hospital_manager.domain.Work;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForPatient.DoctorsForPatientMapper;
import com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForWork.DoctorsForWorkMapper;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForPatient.DoctorsForPatientService;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForWork.DoctorsForWorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/2/13 12:03
 */
@Service
public class DoctorsForWorkServiceImpl implements DoctorsForWorkService {



    @Autowired
    private DoctorsForWorkMapper doctorsForWorkMapper;


    @Override
    public List<Work> findDoctorsWorkInfoById(int id) {
        List<Work> doctorsWorkInfoById = doctorsForWorkMapper.findDoctorsWorkInfoById(id);
        if (doctorsWorkInfoById!=null&&doctorsWorkInfoById.size()>0){
            return doctorsWorkInfoById;
        }
        return null;
    }

    @Override
    public Work findWorkDetailInfoById(int id) {
        Work workDetailInfoById = doctorsForWorkMapper.findWorkDetailInfoById(id);
        if (workDetailInfoById!=null&&workDetailInfoById.getId()!=0){
            return workDetailInfoById;
        }
        return null;
    }
}
