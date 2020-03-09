package com.chinasoft.hospital_manager.service.admin.work;


import com.chinasoft.hospital_manager.domain.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/1/23 22:13
 */

@Service
public interface WorkUserInfoService {

    //插入挂号人员的工作信息
    public  int addUserWorkInfo(Map<String,Object> work);

    //请求加载所有的相关的工作表的信息
    public List<Work> requestloadUserWorkInfo(int id);

    //把所有的挂号用户的信息显示在搜素框上
    public  List<User> getUsers();

    //根据id，查询工作表的详细信息
    public  Work findUserWorkInfoById(int id);

    //查询用户角色的类型
    public List<Role> getAllRoles();

    //查询所有的admin的用户的个数
    public List<Admin> findAdminsByCategory();
    //查询所有的admin的用户的个数
    public List<User> findUsersByCategory();
    //查询所有的admin的用户的个数
    public List<Doctor> findDoctorsByCategory();

    //通过id，修改工作信息的
    public int editWorkInfoById(Map<String,Object> map);

    //通过id，删除这个信息的
    public int deleteWorkInfoById(Map<String,Object> map);

    //根据这个这个挂号人员的id查询该工作的信息
    public List<Work> findUsersWorkInfo(int id);
}
