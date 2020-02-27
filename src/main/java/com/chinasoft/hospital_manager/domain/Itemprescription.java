package com.chinasoft.hospital_manager.domain;

/**
 * Created by Jack on 2020/2/18 14:16
 */
public class Itemprescription {

        /*id
        prescription_id
        product_id
        number
        use
        day
        comment*/
        private String id;
        private Prescription prescription;
        private Product product;
        private int number;
        private String use;//这个是医生安排给病人怎样使用，而药品上有具体的使用方法
        private int day;  //这个是使用几天
        private String comment;

    public Itemprescription() {
    }

    public Itemprescription(String id, Prescription prescription, Product product, int number, String use, int day, String comment) {
        this.id = id;
        this.prescription = prescription;
        this.product = product;
        this.number = number;
        this.use = use;
        this.day = day;
        this.comment = comment;
    }

    public Itemprescription(Prescription prescription, Product product, int number, String use, int day, String comment) {
        this.prescription = prescription;
        this.product = product;
        this.number = number;
        this.use = use;
        this.day = day;
        this.comment = comment;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Prescription getPrescription() {
        return prescription;
    }

    public void setPrescription(Prescription prescription) {
        this.prescription = prescription;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Itemprescription{" +
                "id='" + id + '\'' +
                ", prescription=" + prescription +
                ", product=" + product +
                ", number=" + number +
                ", use='" + use + '\'' +
                ", day=" + day +
                ", comment='" + comment + '\'' +
                '}';
    }
}
