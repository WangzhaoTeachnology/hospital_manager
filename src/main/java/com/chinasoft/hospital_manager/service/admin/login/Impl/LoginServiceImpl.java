package com.chinasoft.hospital_manager.service.admin.login.Impl;


import com.chinasoft.hospital_manager.domain.*;
import com.chinasoft.hospital_manager.mapper.admin.login.LoginMapper;
import com.chinasoft.hospital_manager.service.admin.login.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Map;



@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

/**
 * @description:登录之前查询用户名是不是存在
 * @author jack
 * @date 2019/12/22 4:17
 * @param null
 * @return
 */


    @Override
    public User selectUserBeforeLogin(String username) {
        User user1 = loginMapper.selectUserBeforeLogin(username);
        if (user1!=null&&user1.getUsername()!=null&&user1.getUsername()!=""){
            return user1;
        }
        return null;
    }

    /**
 * @description :登录之前，根据username，查询密码
 * @author jack
 * @date 2019/12/22 4:10
 * @param null
 * @return
 */

    @Override
    public User selectPasswordBeforelogin(User user) {
        return null;
    }
/**
 * @description:根据用户名和密码登录
 * @author jack
 * @date 2019/12/22 4:31
 * @param null
 * @return
 */

    @Override
    public User selectUserNameAndPassword(User user) {
        User user1 = loginMapper.selectUserNameAndPassword(user);
        if (user1!=null){
            return user1;
        }
        return null;
    }

   @Override
    public List<Role> selectRole() {
        List<Role> roles = loginMapper.selectRole();
        if (roles!=null&&roles.size()!=0){
            return  roles;
        }
        return null;
    }
/**
 * @description:这个是根据这个roleid作为user表的外键，
 * 查询这个用户的roleid，然后在，menu_rolo:表里面，查询所有的menuid，查询该用户所有的菜单的名称
 * @author jack
 * @date 2019/12/22 16:30
 * @param null
 * @return
 */

    @Override
    public Role seleRoleBeforeLogin(int roleid) {
        Role role = loginMapper.seleRoleBeforeLogin(roleid);
        if (role!=null&&role.getName()!=""){
            return  role;
        }
        return  null;
    }

    /**
     * @description：这个是根据这个roleid，查询这个menu表中的菜单的项的
     * @author jack
     * @date 2019/12/22 16:35
     * @param null
     * @return
     */

    @Override
    public List<Menu> seleMenuBeforeLoginByRoleId(int roleid) {
        List<Menu> menus = loginMapper.seleMenuBeforeLoginByRoleId(roleid);
            if (menus!=null&&menus.size()>0){
                return  menus;
            }
        return null;
    }


    /**
     * @description:这个下面的函数都是admin的登录的业务函数，与上面的user类似
     * @author jack
     * @date 2019/12/26 15:17
     * @param null
     * @return
     */


    @Override
    public Admin selectAdminBeforeLogin(String username) {
        Admin admin = loginMapper.selectAdminBeforeLogin(username);
        if (admin!=null&&admin.getUsername()!=null&&admin.getUsername()!=""){
            return  admin;
        }
        return null;
    }

    @Override
    public Admin selectAdminPasswordBeforelogin(Admin admin) {
        return null;
    }

    @Override
    public Admin selectAdminNameAndPassword(Admin admin) {
        Admin admin1 = loginMapper.selectAdminNameAndPassword(admin);
        if (admin1!=null&&admin1.getUsername()!=null&&admin1.getUsername()!=""&&admin1.getPassword()!=null&&admin1.getPassword()!=""){
            return admin1;
        }
        return null;
    }
/**
 * @description:每次admin登录，统计登录的次数以及上次登录的时间
 * @author jack
 * @date 2019/12/26 17:52
 * @param null
 * @return
 */

    @Override
    public int updateAdminCount(Admin admin) {
        int i = loginMapper.updateAdminCount(admin);
        if (i>0){
            return  i;
        }
        return 0;
    }

    @Override
    public int updateAdminLastime(Map<String,Object> map) {
        int i = loginMapper.updateAdminLastime(map);
        if (i>0){
            return i;
        }
        return  0;
    }

    @Override
    public Admin selectAdminInfo(Admin admin) {
        Admin admin1 = loginMapper.selectAdminInfo(admin);
        if (admin1!=null&&admin1.getPassword()!=null&&admin1.getPassword()!=""
                &&admin1.getUsername()!=null&&admin1.getUsername()!=""){
            return admin1;
        }
        return null;
    }



    @Override
    public int updateAdminPasswordBySession(Map<String,String> map) {
        int i = loginMapper.updateAdminPasswordBySession(map);
        if (i>0){
            return 1;
        }
        return 0;
    }

    @Override
    public Doctor selectDoctorBeforeLogin(String name) {
        Doctor doctor = loginMapper.selectDoctorBeforeLogin(name);
        if (doctor!=null&&doctor.getName()!=null&&doctor.getName()!=""){
            return  doctor;
        }
        return null;
    }

    @Override
    public Doctor selectDoctorNameAndPassword(Doctor doctor) {
        Doctor doctor1 = loginMapper.selectDoctorNameAndPassword(doctor);
        if (doctor1!=null&&doctor1.getName()!=null&&doctor1.getName()!=""&&doctor1.getPassword()!=null&&doctor1.getPassword()!=""){
            return doctor1;
        }
        return null;
    }
}
