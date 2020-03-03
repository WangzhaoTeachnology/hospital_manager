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
}
