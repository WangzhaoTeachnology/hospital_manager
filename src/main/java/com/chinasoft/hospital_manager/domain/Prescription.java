package com.chinasoft.hospital_manager.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.List;


/**
 * Created by Jack on 2020/2/18 14:11
 */
public class Prescription {

        private String id;
        @DateTimeFormat(pattern = "yyyy-MM-ss HH:mm:ss")
        private String datetime;
        private Patient patient;
        private List<Itemprescription> itemprescription;
        private Doctor doctor;
        private String content;
        private History history;
        //private MoneyPay history;
        private String comment;
        private int status;
        //private Pay pay;//对应Prescription表里面的money_id字段，但是这个字段去掉了
       //原本的逻辑是：缴费成功后，同时修改这个处方的money_id字段，让医生查看病人这个处方有没有缴费
       private String comment_reason;//这个是审核处方不通过的字段

       //total总价格，虽然在数据库中，不设计，但是在后端数据在计算总的价格的时候，需要有字段传递到前端
      //所以设计这字段
       private  String total;




    public Prescription() {
    }

    public Prescription(String id, String datetime, Patient patient, List<Itemprescription> itemprescription, Doctor doctor, String content, String comment) {
        this.id = id;
        this.datetime = datetime;
        this.patient = patient;
        this.itemprescription = itemprescription;
        this.doctor = doctor;
        this.content = content;
        this.comment = comment;
    }

    public Prescription(String id, String datetime, Patient patient, List<Itemprescription> itemprescription, Doctor doctor, String content, History history, String comment) {
        this.id = id;
        this.datetime = datetime;
        this.patient = patient;
        this.itemprescription = itemprescription;
        this.doctor = doctor;
        this.content = content;
        this.history = history;
        this.comment = comment;
    }

    public Prescription(String datetime, Patient patient, List<Itemprescription> itemprescription, Doctor doctor, String content, String comment) {
        this.datetime = datetime;
        this.patient = patient;
        this.itemprescription = itemprescription;
        this.doctor = doctor;
        this.content = content;
        this.comment = comment;
    }

    public List<Itemprescription> getItemprescription() {
        return itemprescription;
    }

    public void setItemprescription(List<Itemprescription> itemprescription) {
        this.itemprescription = itemprescription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public History getHistory() {
        return history;
    }

    public void setHistory(History history) {
        this.history = history;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getComment_reason() {
        return comment_reason;
    }

    public void setComment_reason(String comment_reason) {
        this.comment_reason = comment_reason;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Prescription{" +
                "id='" + id + '\'' +
                ", datetime='" + datetime + '\'' +
                ", patient=" + patient +
                ", itemprescription=" + itemprescription +
                ", doctor=" + doctor +
                ", content='" + content + '\'' +
                ", history=" + history +
                ", comment='" + comment + '\'' +
                ", status=" + status +
                ", comment_reason='" + comment_reason + '\'' +
                ", total=" + total +
                '}';
    }
}
