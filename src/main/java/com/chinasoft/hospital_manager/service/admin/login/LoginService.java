package com.chinasoft.hospital_manager.service.admin.login;

import com.chinasoft.hospital_manager.domain.*;

import java.util.List;
import java.util.Map;


public interface LoginService {

    //根据用户名，输入查询数据是不是存在，存在，继续做密码的判断，不存在那么直接提示用户错误
    public  User selectUserBeforeLogin(String username);
    //根据用户名，查询密码，是不是正确
    public User selectPasswordBeforelogin (User user);

    //根据用户名和密码查询数据
    public  User selectUserNameAndPassword(User user);

    //登录之前查询role表
    public List<Role> selectRole();

    //查询roleid
    public  Role seleRoleBeforeLogin(int role_id);


    //查询menuid,查询不同的用户，从而查询不同的菜单的项
    public List<Menu> seleMenuBeforeLoginByRoleId(int roleid);



    //日期：2019-12-26
    //admin登录
    public Admin selectAdminBeforeLogin(String username);

    //根据用户名，查询密码，是不是正确
    public Admin selectAdminPasswordBeforelogin (Admin admin);

    //根据用户名和密码查询数据
    public  Admin selectAdminNameAndPassword(Admin admin);

    //每次登录成功，修改管理员上次登录的次数
    public  int updateAdminCount(Admin admin);

    //每次登录成功，修改管理员上次登录的时间
    public  int updateAdminLastime(Map<String,Object> map);


    //查询该用户详细的情况：
    public  Admin selectAdminInfo(Admin admin);


    //修改密码：
    public  int updateAdminPasswordBySession(Map<String,String> map);


    //以下是医生登录，显示菜单的查询操作

    //根据用户名，输入查询数据是不是存在，存在，继续做密码的判断，不存在那么直接提示用户错误
    public Doctor selectDoctorBeforeLogin(String name);

    //根据用户名和密码查询数据
    public  Doctor selectDoctorNameAndPassword(Doctor doctor);



}
