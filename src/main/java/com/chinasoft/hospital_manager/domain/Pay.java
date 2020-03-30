package com.chinasoft.hospital_manager.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.List;

/**
 * Created by Jack on 2020/3/9 22:26
 */
public class Pay {

    private String id;
    private  Patient patient;
    private Doctor doctor;
    private  User user;
    private  int flag;  //这个字段是是否缴费，0,or 1
    private double fee;
    @DateTimeFormat(pattern = "yyyy-MM-ss HH:mm:ss")
    private  String datetime;
    private List<Prescription> prescriptions;
   // private Prescription prescriptions;

    public Pay() {
    }



    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public List<Prescription> getPrescriptions() {
        return prescriptions;
    }

    public void setPrescriptions(List<Prescription> prescriptions) {
        this.prescriptions = prescriptions;
    }

    @Override
    public String toString() {
        return "Pay{" +
                "id='" + id + '\'' +
                ", patient=" + patient +
                ", doctor=" + doctor +
                ", user=" + user +
                ", flag=" + flag +
                ", fee=" + fee +
                ", datetime='" + datetime + '\'' +
                ", prescriptions=" + prescriptions +
                '}';
    }
}
