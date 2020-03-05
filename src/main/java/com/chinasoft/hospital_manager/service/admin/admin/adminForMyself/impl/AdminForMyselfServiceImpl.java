package com.chinasoft.hospital_manager.service.admin.admin.adminForMyself.impl;

import com.chinasoft.hospital_manager.domain.Admin;
import com.chinasoft.hospital_manager.domain.Appoint_category;

import com.chinasoft.hospital_manager.domain.Offices;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.admin.adminForMyself.AdminForMyselfMapper;
import com.chinasoft.hospital_manager.service.admin.admin.adminForMyself.AdminForMyselfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/3/3 18:27
 */
@Service
public class AdminForMyselfServiceImpl implements AdminForMyselfService {

    @Autowired
    private AdminForMyselfMapper adminForMyselfMapper;

    @Override
    public Admin findAdminInfoById(int id) {
        Admin adminInfoById = adminForMyselfMapper.findAdminInfoById(id);
        if (adminInfoById!=null){
            return adminInfoById;
        }
        return null;
    }

    @Override
    public int updateAdminInfoById(Map<String,Object> map) {
        int i = adminForMyselfMapper.updateAdminInfoById(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public PageBean<Appoint_category> findAllAndMangager(int currentPage,int currentCount) {
        if (currentCount!=0&&currentPage!=0){
            int totalCount = adminForMyselfMapper.getTotalCounts();
            Map<String,Object> map=new HashMap<String, Object>();
            PageBean<Appoint_category> pageBean=new PageBean<Appoint_category>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                map.put("index",index);
                map.put("count",currentCount);
                List<Appoint_category> allUserInfo = adminForMyselfMapper.findAllAndMangager(map);
                if (allUserInfo!=null&&allUserInfo.size()!=0){
                    pageBean.setCurrentCount(currentCount);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(allUserInfo);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                }
                return pageBean;
            }else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(currentCount);
                pageBean.setList(null);
            }
            return  pageBean;
        }
        return null;
    }

    @Override
    public int insertAppoint_Category(Map<String, Object> map) {
        int i = adminForMyselfMapper.insertAppoint_Category(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int deleteAppoint_CategoryById(Map<String, Object> map) {
        int i = adminForMyselfMapper.deleteAppoint_CategoryById(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int updateAppointCategoryInfo(Map<String, Object> map) {
        int i = adminForMyselfMapper.updateAppointCategoryInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public List<Appoint_category> findAllAppoint_category() {
        List<Appoint_category> allAppoint_category = adminForMyselfMapper.findAllAppoint_category();
        if (allAppoint_category!=null&&allAppoint_category.size()>0){
            return allAppoint_category;
        }
        return null;
    }

    @Override
    public int insertIntoOfficeInfo(Map<String, Object> map) {
        int i = adminForMyselfMapper.insertIntoOfficeInfo(map);
        if (i>0){
            return  i;
        }
        return 0;
    }

    @Override
    public PageBean<Offices> findAllOfficesAndMangager(int currentPage, int currentCount) {
        if (currentCount!=0&&currentPage!=0){
            int totalCount = adminForMyselfMapper.getTotalOfficesCounts();
            Map<String,Object> map=new HashMap<String, Object>();
            PageBean<Offices> pageBean=new PageBean<Offices>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/currentCount);
                int index= (currentPage-1)*currentCount;
                map.put("index",index);
                map.put("count",currentCount);
                List<Offices> allUserInfo = adminForMyselfMapper.findAllOfficesAndMangager(map);
                if (allUserInfo!=null&&allUserInfo.size()!=0){
                    pageBean.setCurrentCount(currentCount);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(allUserInfo);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                }
                return pageBean;
            }else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(currentCount);
                pageBean.setList(null);
            }
            return  pageBean;
        }
        return null;
    }

    @Override
    public int updateOfficesInfo(Map<String, Object> map) {
        int i = adminForMyselfMapper.updateOfficesInfo(map);
        if (i>0){
            return i;
        }
        return 0;
    }

    @Override
    public int deleteOfficesInfoById(int id) {
        int i = adminForMyselfMapper.deleteOfficesInfoById(id);
        if (i>0){
            return i;
        }
        return 0;
    }
}
