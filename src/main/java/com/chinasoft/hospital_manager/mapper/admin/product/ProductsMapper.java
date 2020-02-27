package com.chinasoft.hospital_manager.mapper.admin.product;


import com.chinasoft.hospital_manager.domain.Appointment;
import com.chinasoft.hospital_manager.domain.Category_Product;
import com.chinasoft.hospital_manager.domain.Product;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ProductsMapper {

    //查询药品的类别
    public List<Category_Product> findProductCategory();

    //根据类别的id查找该类的药品信息
    public  List<Product> findProductByCategoryId(int id);

    //根据id，查询具体的药品的信息
    public Product findProductDetailsById(int id);

    //医生查询所有的药品
    public List<Product> findAllProducts(Map<String,Object> map);

    //这个是为了查询这个所有的药品的个数
    public int getCountAllProducts(Map<String,Object> map);

    //医生根据药品类型，查询所有的药品
    public List<Product> findAllProductsByCategoryId(Map<String,Object> map);
}
