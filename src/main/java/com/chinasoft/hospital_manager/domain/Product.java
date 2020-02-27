package com.chinasoft.hospital_manager.domain;



/**
 * Created by Jack on 2020/2/17 22:34
 */
public class Product {


    private Integer id;
    private String url;
    private  String name;
    private  Category_Product category_product;
    private String detail; //这个是药品的详情
    private Float price; //价格
    private int number;  //这个是现有的数量，这个是药房仓库用到的，医生开处方详情时候，用不到这个信息
    private  String content; //这个药品的适用症
    private String use;   //这个是使用量，剂量
    private String component; //成分
    private  String comment; //注意事项，可有可无
    private  String standards;   // 这个是药品的规格，这个在数据库里面没有添加上

    public Product() {
    }

    public Product(Integer id, String url, String name, Category_Product category_product, String detail, Float price, int number, String content, String use, String component, String comment) {
        this.id = id;
        this.url = url;
        this.name = name;
        this.category_product = category_product;
        this.detail = detail;
        this.price = price;
        this.number = number;
        this.content = content;
        this.use = use;
        this.component = component;
        this.comment = comment;
    }

    public Product(String url, String name, Category_Product category_product, String detail, Float price, int number, String content, String use, String component, String comment) {
        this.url = url;
        this.name = name;
        this.category_product = category_product;
        this.detail = detail;
        this.price = price;
        this.number = number;
        this.content = content;
        this.use = use;
        this.component = component;
        this.comment = comment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStandards() {
        return standards;
    }

    public void setStandards(String standards) {
        this.standards = standards;
    }

    public Category_Product getCategory_product() {
        return category_product;
    }

    public void setCategory_product(Category_Product category_product) {
        this.category_product = category_product;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", url='" + url + '\'' +
                ", name='" + name + '\'' +
                ", category_product=" + category_product +
                ", detail='" + detail + '\'' +
                ", price=" + price +
                ", number=" + number +
                ", content='" + content + '\'' +
                ", use='" + use + '\'' +
                ", component='" + component + '\'' +
                ", comment='" + comment + '\'' +
                ", standards='" + standards + '\'' +
                '}';
    }
}
