package com.chinasoft.hospital_manager.service.admin.admin.adminForMyself;

import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.domain.page.PageBean;

import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2019/12/30 21:05
 */
public interface AdminForMyselfService {

    //这个是根据这个id，查询这个用户的详细的信息的过程
    public Admin findAdminInfoById(int id);

    //根据id，修改数据
    public int updateAdminInfoById(Map<String,Object> map);

    //管理这个门诊部门
    public PageBean<Appoint_category> findAllAndMangager(int currentPage,int count);

    //添加部门名称
    public int insertAppoint_Category(Map<String,Object> map);

    //根据id,删除一条信息
    public int deleteAppoint_CategoryById(Map<String,Object> map);

    //根据id信息，修改数据
    public  int updateAppointCategoryInfo(Map<String,Object> map);

    //这个是添加科室之前，查询所有的门诊的信息
    public List<Appoint_category> findAllAppoint_category();

    //添加科室
    public int insertIntoOfficeInfo(Map<String,Object> map);

    //管理这个科室的信息
    //管理这个门诊部门
    public PageBean<Offices> findAllOfficesAndMangager(int currentPage,int count);

    //修改科室的信息
    public int updateOfficesInfo(Map<String,Object> map);

    //根据id，删除信息
    public int deleteOfficesInfoById(int id);
}
