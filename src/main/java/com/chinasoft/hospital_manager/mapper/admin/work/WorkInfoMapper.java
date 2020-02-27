package com.chinasoft.hospital_manager.mapper.admin.work;



import com.chinasoft.hospital_manager.domain.*;
import com.sun.javafx.tk.TKPulseListener;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public interface WorkInfoMapper {

    //给挂号人员插入工作数据
    public  int addUserWorkInfo(Map<String,Object> map);

    //请求加载所有该挂号人员的相关的工作表的信息
    public List<Work> requestloadUserWorkInfo(int id);

    //把所有的挂号用户的信息显示在搜素框上
    public  List<User> getUsers();

    //根据id，查询工作表的详细信息
    public  Work findUserWorkInfoById(int id);

}
