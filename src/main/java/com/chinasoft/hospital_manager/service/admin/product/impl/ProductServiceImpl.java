package com.chinasoft.hospital_manager.service.admin.product.impl;


import com.chinasoft.hospital_manager.domain.Appointment;
import com.chinasoft.hospital_manager.domain.Category_Product;
import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.domain.Product;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import com.chinasoft.hospital_manager.mapper.admin.doctor.doctorsForMyself.DoctorsForMyselfMapper;
import com.chinasoft.hospital_manager.mapper.admin.product.ProductsMapper;
import com.chinasoft.hospital_manager.service.admin.doctor.doctorsForMyself.DoctorsForMyselfService;
import com.chinasoft.hospital_manager.service.admin.product.ProductService;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Jack on 2020/2/13 12:20
 */
@Service
public class ProductServiceImpl implements ProductService {


    @Autowired
    private ProductsMapper productsMapper;

    @Override
    public List<Category_Product> findProductCategory() {
        List<Category_Product> productCategory = productsMapper.findProductCategory();
        if (productCategory!=null&&productCategory.size()>0){
            return productCategory;
        }
        return null;
    }

    @Override
    public List<Product> findProductByCategoryId(int id) {
        List<Product> productByCategoryId = productsMapper.findProductByCategoryId(id);
        if (productByCategoryId!=null&&productByCategoryId.size()>0){
            return productByCategoryId;
        }
        return null;
    }

    @Override
    public Product findProductDetailsById(int id) {
        Product productDetailsById = productsMapper.findProductDetailsById(id);
        if (productDetailsById!=null&&productDetailsById.getId()!=0){
            return productDetailsById;
        }
        return null;
    }

    @Override
    public PageBean<Product> findAllProducts(int currentPage, int count) {
        PageBean<Product> pageBean=new PageBean<Product>();
        Map<String,Object> condition=new HashMap<String, Object>();
        if (count!=0&&currentPage!=0){
            int totalCount = productsMapper.getCountAllProducts(condition);
            Map<String,Object> _map=new HashMap<String, Object>();
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/count);
                int index= (currentPage-1)*count;
                condition.put("index",index);
                condition.put("count",count);
                List<Product> products = productsMapper.findAllProducts(condition);
                if (products!=null&&products.size()!=0){
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(products);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                    return  pageBean;
                }
            }else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(count);
                pageBean.setList(null);
            }
        }
       return null;
    }

    @Override
    public PageBean<Product> findAllProductsByCategoryId(Map<String, Object> map, int currentPage, int count) {
        PageBean<Product> pageBean=new PageBean<Product>();
        if (count!=0&&currentPage!=0){
            int totalCount = productsMapper.getCountAllProducts(map);
            if (totalCount!=0){
                int totalPages= (int) Math.ceil(totalCount*1.0/count);
                int index= (currentPage-1)*count;
                map.put("index",index);
                map.put("count",count);
                List<Product> products = productsMapper.findAllProductsByCategoryId(map);
                if (products!=null&&products.size()!=0){
                    pageBean.setCurrentCount(count);
                    pageBean.setCurrentPage(currentPage);
                    pageBean.setList(products);
                    pageBean.setTotalCount(totalCount);
                    pageBean.setTotalPage(totalPages);
                    return  pageBean;
                }
            }else {
                pageBean.setTotalPage(0);
                pageBean.setTotalCount(0);
                pageBean.setCurrentPage(currentPage);
                pageBean.setCurrentCount(count);
                pageBean.setList(null);
            }
        }
        return null;
    }


}
