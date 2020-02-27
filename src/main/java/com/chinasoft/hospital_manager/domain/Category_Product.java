package com.chinasoft.hospital_manager.domain;

/**
 * Created by Jack on 2020/2/17 22:37
 */
public class Category_Product {
    private  Integer id;
    private  String name;

    public Category_Product(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Category_Product() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Category_Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
