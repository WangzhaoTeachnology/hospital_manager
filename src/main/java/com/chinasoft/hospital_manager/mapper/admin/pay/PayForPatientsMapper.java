package com.chinasoft.hospital_manager.mapper.admin.pay;


import com.chinasoft.hospital_manager.domain.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PayForPatientsMapper {

    //查询这个缴费的信息,
    //这个查询是在30分钟内
    public  List<Pay> findPayAllInfoByCondition(Map<String,Object> map);

    //这个是统计个数
    int getTotalPaysCountByCondition(Map<String,Object> map);

    //根据这个处方的编号，查询这个处方的详情的信息
    List<Itemprescription> findItemPrescriptionsById(String id);

    //通过点击这个确认的按钮，修改这个缴费单的状态
    int updatePayItemInfoStatusByBtn(int user_id,String id);


    //这个是打印的时候按照处方编号，打印处方的详情
    List<Prescription> findItemPrescriptionsByIdWithPrint(String id);
}
