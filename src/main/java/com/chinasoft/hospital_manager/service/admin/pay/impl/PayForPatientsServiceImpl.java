package com.chinasoft.hospital_manager.service.admin.pay.impl;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.pay.PayForPatientsMapper;
import com.chinasoft.hospital_manager.service.admin.pay.PayForPatientsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2019/12/30 21:05
 */
@Service
public class PayForPatientsServiceImpl   implements PayForPatientsService {

    @Autowired
    private PayForPatientsMapper payForPatientsMapper;

    @Override
    public PageBean<Pay> findPayAllInfoByCondition(Map<String, Object> map, int currentPage, int currentCount) {
        Map<String,Object> condition=new HashMap<String, Object>();
        //这个条件，：今天，明天，姓名
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

        if (currentCount!=0&&currentPage!=0){
            int totalCount = payForPatientsMapper.getTotalPaysCountByCondition(condition);
            Map<String,Object> _map=new HashMap<String, Object>();
            PageBean<Pay> pageBean=new PageBean<Pay>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                condition.put("index",index);
                condition.put("count",currentCount);
                List<Pay> allUserInfo = payForPatientsMapper.findPayAllInfoByCondition(condition);
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
    public List<Itemprescription> findItemPrescriptionsById(String id) {
        List<Itemprescription> itemPrescriptionsById = payForPatientsMapper.findItemPrescriptionsById(id);
        if (itemPrescriptionsById!=null&&itemPrescriptionsById.size()>0){
            return itemPrescriptionsById;
        }
        return null;
    }

    @Override
    public int updatePayItemInfoStatusByBtn(int user_id,String id) {
        int i = payForPatientsMapper.updatePayItemInfoStatusByBtn(user_id,id);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public List<Prescription> findItemPrescriptionsByIdWithPrint(String id) {
        List<Prescription> itemPrescriptionsByIdWithPrint = payForPatientsMapper.findItemPrescriptionsByIdWithPrint(id);
        if (itemPrescriptionsByIdWithPrint!=null&&itemPrescriptionsByIdWithPrint.size()>0){
            return itemPrescriptionsByIdWithPrint;
        }
        return null;
    }
}
