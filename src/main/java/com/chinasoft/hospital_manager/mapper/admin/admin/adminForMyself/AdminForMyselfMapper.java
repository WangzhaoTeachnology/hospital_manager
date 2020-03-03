package com.chinasoft.hospital_manager.mapper.admin.admin.adminForMyself;


import com.chinasoft.hospital_manager.domain.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminForMyselfMapper {

 //这个是根据这个id，查询这个用户的详细的信息的过程
  public Admin findAdminInfoById(int id);

}
