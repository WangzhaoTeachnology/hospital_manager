package com.chinasoft.hospital_manager.service.admin.examineAndVerify;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;

import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2019/12/30 21:05
 */
public interface ExamineAndVerifyService {

    public PageBean<Prescription> findAllPrescriptionByNoStatus(int currentPage,int count,Map<String,Object> parameter);
    //把每条处方详情的数据，审核的条件的信息，插入到数据库里面
    public int  submitCheckInfo(Map<String,Object> map);

    //每次提交到check表里面的数据之前，都要删除上次已经提交的数据，保证审核的数据都是新的数据
    public int  deleteCheckInfoByItemId(String id);

    //根据5个条件，来判断或者决定这个处方详情的status状态
    public Check  findCheckItemByItemId(String id);

    //根据5个条件，来决定这个处方详情里面的status状态
    public int updateItemPrescriptionByCheckInfo(String id,int flag);

    //根据id查询,ItemPrescription
    public Itemprescription findItemPrescriptionById(String id);

    //提交每一条的处方详情的数据
    public List<Itemprescription> submitCheck(String id);

    //处方，所在处方详情至少存在有一条审核失败，那么，整条处方也就是失败的
    public int updatePrescriptionStatus(String id,int ret);

    //只有审核成功的情况下，才会生成这个缴费的单
    public  int addPays(Map<String,Object> map);


    //在生成缴费单之前，根据这个处方单编号查询这个pay表里面的数据是不是，存在
    //存在的话，删除掉
    //删除掉，再插入数据
    public List<Pay> findPayByPrescriptionId(String id);

    //根据id，删除缴费单里面的信息
    public int deletePayByPrescriptionId(String id);
}
