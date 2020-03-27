package com.chinasoft.hospital_manager.service.admin.pay;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2019/12/30 21:05
 */
@Service
public interface PayForPatientsService {


    //查询这个缴费的信息,
    //这个查询是在一天内有效
    public  PageBean<Pay> findPayAllInfoByCondition(Map<String,Object> map,int currentPage,int currentCount);


    //根据这个处方的编号，查询这个处方的详情的信息
    List<Itemprescription> findItemPrescriptionsById(String id);

    //通过点击这个确认的按钮，修改这个缴费单的状态
    int updatePayItemInfoStatusByBtn(int user_id,String id);

    //这个是打印的时候按照处方编号，打印处方的详情
    List<Prescription> findItemPrescriptionsByIdWithPrint(String id);
}
