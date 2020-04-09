package com.chinasoft.hospital_manager.domain;

/**
 * Created by Jack on 2020/2/18 14:16
 */
public class Itemprescription {

        private String id;
        private Prescription prescription;
        private Product product;
        private int number;
        private String use;//这个是医生安排给病人怎样使用，而药品上有具体的使用方法，但是医生也要指明怎样吃药
        private int day;  //这个是使用几天，这个字段已经作废，但是是mybaits的sql查询部分，不想修改，所以这个字段还保留，但是jsp页面不在使用
        private String comment;
        private  String time;
        private String per;
        // 逻辑：
        //处方详情的审核是0：尚未审核，1：审核通过，2：审核失败，
        //只有在尚未审核的条件下，才不能提交提交审核按钮，其他可以正常提交信息的
        //实现逻辑思路：

     /*   只有将在页面加载的时候，查询每条处方详情的check表中的5个条件的信息
          状态是不是都是通过的，只有都是通过的这个字段status为1，
          如果至少存在一个条件不通过，那么这个处方详情都是不通过的为2
        */

        private int status;//这个是针对处方详情表的每一个药品信息的审核
        private Check check;

    public Itemprescription() {
    }

    public Itemprescription(String id, Prescription prescription, Product product, int number, String use, String comment) {
        this.id = id;
        this.prescription = prescription;
        this.product = product;
        this.number = number;
        this.use = use;
        this.comment = comment;
    }

    public Itemprescription(Prescription prescription, Product product, int number, String use, String comment) {
        this.prescription = prescription;
        this.product = product;
        this.number = number;
        this.use = use;
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

    public Check getCheck() {
        return check;
    }

    public void setCheck(Check check) {
        this.check = check;
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

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPer() {
        return per;
    }

    public void setPer(String per) {
        this.per = per;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
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
                ", time='" + time + '\'' +
                ", per='" + per + '\'' +
                ", status=" + status +
                ", check=" + check +
                '}';
    }
}
