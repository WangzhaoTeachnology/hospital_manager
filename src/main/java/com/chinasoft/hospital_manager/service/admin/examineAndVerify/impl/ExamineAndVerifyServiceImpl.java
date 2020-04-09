package com.chinasoft.hospital_manager.service.admin.examineAndVerify.impl;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.employee.EmployeeMapper;
import com.chinasoft.hospital_manager.mapper.admin.examineAndVerify.ExamineAndVerifyMapper;
import com.chinasoft.hospital_manager.service.admin.examineAndVerify.ExamineAndVerifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2019/12/30 21:05
 */
@Service
public class ExamineAndVerifyServiceImpl implements ExamineAndVerifyService {

    @Autowired
    private ExamineAndVerifyMapper examineAndVerifyMapper ;


    @Override
    public PageBean<Prescription> findAllPrescriptionByNoStatus(int currentPage,int count,Map<String,Object> parameter) {
        Map<String,Object> condition=new HashMap<String, Object>();
        if (count!=0&&currentPage!=0){
            int totalCount = examineAndVerifyMapper.getTotalfindAllPrescriptionByNoStatus(parameter);
            PageBean<Prescription> pageBean=new PageBean<Prescription>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/count);
                int index= (currentPage-1)*count;
                condition.put("index",index);
                condition.put("count",count);
                //装参数
                for (Map.Entry<String,Object> entry:parameter.entrySet()){
                    String key = entry.getKey();
                    Object value = entry.getValue();
                    if (key!=null&&key!=""&&(key.equals("id"))){
                        condition.put("id",value);
                    }
                    else if (key!=null&&key!=""&&(key.equals("content"))){
                        condition.put("content",value);
                    }
                    else {
                        condition.put("status",value);
                    }
                }


                List<Prescription> allPrescriptions = examineAndVerifyMapper.findAllPrescriptionByNoStatus(condition);
                if (allPrescriptions!=null&&allPrescriptions.size()!=0){
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(allPrescriptions);
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

    @Override
    public int submitCheckInfo(Map<String, Object> map) {
        int i = examineAndVerifyMapper.submitCheckInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int deleteCheckInfoByItemId(String id) {
        int i = examineAndVerifyMapper.deleteCheckInfoByItemId(id);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public Check findCheckItemByItemId(String id) {
        Check checkItemByItemId = examineAndVerifyMapper.findCheckItemByItemId(id);
        if (checkItemByItemId!=null&&checkItemByItemId.getCid()!=""&&
        checkItemByItemId.getCid()!=null
        ){
            return checkItemByItemId;
        }
        return null;
    }

    @Override
    public int updateItemPrescriptionByCheckInfo(String id,int flag) {
        int i = examineAndVerifyMapper.updateItemPrescriptionByCheckInfo(id,flag);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public Itemprescription findItemPrescriptionById(String id) {
        Itemprescription itemPrescriptionById = examineAndVerifyMapper.findItemPrescriptionById(id);
        if (itemPrescriptionById!=null&&itemPrescriptionById.getId()!=null&&itemPrescriptionById.getId()!=""){
           return itemPrescriptionById;
        }
        return null;
    }

    @Override
    public List<Itemprescription> submitCheck(String id) {
        List<Itemprescription> itemprescriptions = examineAndVerifyMapper.submitCheck(id);
        if (itemprescriptions!=null&&itemprescriptions.size()>0){
            return itemprescriptions;
        }
        return null;
    }

    @Override
    public int updatePrescriptionStatus(String id,int ret) {
        int i = examineAndVerifyMapper.updatePrescriptionStatus(id,ret);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int addPays(Map<String, Object> map) {
        int i = examineAndVerifyMapper.addPays(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public List<Pay> findPayByPrescriptionId(String id) {
        List<Pay> payByPrescriptionId = examineAndVerifyMapper.findPayByPrescriptionId(id);
        if (payByPrescriptionId!=null&&payByPrescriptionId.size()>0){
            return payByPrescriptionId;
        }
        return null;
    }

    @Override
    public int deletePayByPrescriptionId(String id) {
        int i = examineAndVerifyMapper.deletePayByPrescriptionId(id);
        if (i>0){
            return i;
        }
        return 0;
    }
}
