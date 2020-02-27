package com.chinasoft.hospital_manager.mapper.admin.employee;




import com.chinasoft.hospital_manager.domain.Department;
import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.domain.Role;
import com.chinasoft.hospital_manager.domain.User;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public interface EmployeeMapper {
    //admin点击 员工管理，获取挂号人员的信息
     public List<User> getAllUserInfo(Map<String,Object> map);

     //在分页之前，先查询出这些信息的个数
     public int getTotalCount();

     //在在admin在员工管理模块，点击添加的时候，跳出角色的信息和部门的信息
    public List<Role> selectAllRole();

    //admin点击添加的时候，与role一样，先去查询这个role的信息
    public List<Department> selectDepartment();

    //这个是在管理挂号人员里面，添加信息
    public int addUserInfo(Map<String,Object> map);

    //根据id删除用户的信息
    public  int deleteUserInfoById(int id);

    //根据id编辑数据，之前查询对应的数据，回显
    public  User beforUpdateFindUserInfo(int id);

    //根据id，修改数据
    public int updateUserInfoById(Map<String,Object> map);

    //根据关键字，搜素信息
    public List<User> searchUserInfoByCondition(Map<String,Object> map);


    //根据关键字，搜素信息
    public int getTotalCountByCondition(Map<String,Object> map);


    //以下的信息是医生的业务逻辑
     //admin点击 员工管理，获取医生的信息
    public List<Doctor> getAllDoctorsInfo(Map<String,Object> map);

    //在分页之前，先查询出这些信息的个数
    public int getAllDoctorsTotalCount();

    //按照id，查看这个医生的详细信息
    public Doctor  selectDoctorInfoById(int id);

    //添加医生的信息之前，查询这个医生的部门的所有的信息
    //以及科室


    //添加医生的个人信息
    public int addDoctorInfo(Map<String,Object> map);

    //根据医生的id，删除医生的信息
    public int deleteDoctorInfoById(int id);

    //根据关键字，搜素信息
    public List<Doctor> searchDoctorsInfoByCondition(Map<String,Object> map);
    public int getTotalDoctorsCountByCondition(Map<String,Object> map);

    //根据id编辑数据，之前查询对应的数据，回显
    public  Doctor beforUpdateFindDoctorInfo(int id);

    //这个是根据id，修改数据
    public int updateDoctorInfoById(Map<String,Object> map);

}
