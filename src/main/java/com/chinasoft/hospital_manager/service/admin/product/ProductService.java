package com.chinasoft.hospital_manager.service.admin.product;

import com.chinasoft.hospital_manager.domain.Category_Product;
import com.chinasoft.hospital_manager.domain.Doctor;
import com.chinasoft.hospital_manager.domain.Product;
import com.chinasoft.hospital_manager.domain.page.PageBean;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
 * Created by Jack on 2020/2/13 12:20
 */
@Service
public interface ProductService {

    //查询药品的类别
    public List<Category_Product> findProductCategory();

    //根据类别的id查找该类的药品信息
    public  List<Product> findProductByCategoryId(int id);

    //根据id，查询具体的药品的信息
    public Product findProductDetailsById(int id);

    //医生查询所有的药品
    public PageBean<Product> findAllProducts(int currentPage, int count);


    //医生根据药品类型，查询所有的药品
    public  PageBean<Product> findAllProductsByCategoryId(Map<String,Object> map,int currentPage, int count);
}
