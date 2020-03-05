package com.chinasoft.hospital_manager.mapper.admin.admin.adminForMyself;


import com.chinasoft.hospital_manager.domain.Admin;
import com.chinasoft.hospital_manager.domain.Appoint_category;
import com.chinasoft.hospital_manager.domain.Offices;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AdminForMyselfMapper {

 //这个是根据这个id，查询这个用户的详细的信息的过程
  public Admin findAdminInfoById(int id);

  //根据id，修改数据
 public int updateAdminInfoById(Map<String,Object> map);

 //管理这个门诊部门
 public List<Appoint_category> findAllAndMangager(Map<String,Object> map);
 public int getTotalCounts();

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


 //管理这个科室信息
 public List<Offices> findAllOfficesAndMangager(Map<String,Object> map);
 public int getTotalOfficesCounts();

 //修改科室的信息
 public int updateOfficesInfo(Map<String,Object> map);

 //根据id，删除信息
 public int deleteOfficesInfoById(int id);


}
