package com.chinasoft.hospital_manager.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by Jack on 2020/1/29 12:03
 */
public class Appointment {

    private String id;
  //  private Integer appointId;
    private Patient patient;

    private String content;
    private String fee;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private String datetime;//这个是挂号时间
    private Appoint_category appoint_category;
    private String address;
    private User  user;
    private  Offices offices;
    private Doctor doctor;


    private String comment;
    private int number; //这个是挂号的编号
    private int status; //这个是初诊还是复诊
    private String time;//这个是看病时间段，病人的挂号有具体的挂号时间，这个是选择医生看病的时间段
    private int flag;   //这个属性是病人成功，挂号以后有没有去医生那里看病，看过为1，默认为0

    private String waitime;
    //这个字段在数据库里面不设计，只是每次从数据里面查询数据到controller层的时候，将这个datetime数据取出来，计算出来结果然后
    //把这个结果显示在页面上

    public Appointment() {
    }

    public Appointment(String id, Patient patient, String fee, String datetime, Appoint_category appoint_category, String address, User user, Offices offices, Doctor doctor, String comment, int number, int status) {
        this.id = id;
        this.patient = patient;
        this.fee = fee;
        this.datetime = datetime;
        this.appoint_category = appoint_category;
        this.address = address;
        this.user = user;
        this.offices = offices;
        this.doctor = doctor;
        this.comment = comment;
        this.number = number;
        this.status = status;
    }

    public Appointment(Patient patient, String fee, String datetime, Appoint_category appoint_category, String address, User user, Offices offices, Doctor doctor, String comment, int number, int status) {
        this.patient = patient;
        this.fee = fee;
        this.datetime = datetime;
        this.appoint_category = appoint_category;
        this.address = address;
        this.user = user;
        this.offices = offices;
        this.doctor = doctor;
        this.comment = comment;
        this.number = number;
        this.status = status;
    }

    public Appointment(String id, Patient patient, String fee, String datetime, Appoint_category appoint_category, String address, User user, Offices offices, Doctor doctor, String comment, int number, int status, String time) {
        this.id = id;
        this.patient = patient;
        this.fee = fee;
        this.datetime = datetime;
        this.appoint_category = appoint_category;
        this.address = address;
        this.user = user;
        this.offices = offices;
        this.doctor = doctor;
        this.comment = comment;
        this.number = number;
        this.status = status;
        this.time = time;
    }

    public Appointment(String id, Patient patient, String fee, String datetime, Appoint_category appoint_category, String address, User user, Offices offices, Doctor doctor, String comment, int number, int status, String time, int flag) {
        this.id = id;
        this.patient = patient;
        this.fee = fee;
        this.datetime = datetime;
        this.appoint_category = appoint_category;
        this.address = address;
        this.user = user;
        this.offices = offices;
        this.doctor = doctor;
        this.comment = comment;
        this.number = number;
        this.status = status;
        this.time = time;
        this.flag = flag;
    }

    public Appointment(Patient patient, String fee, String datetime, Appoint_category appoint_category, String address, User user, Offices offices, Doctor doctor, String comment, int number, int status, String time, int flag) {
        this.patient = patient;
        this.fee = fee;
        this.datetime = datetime;
        this.appoint_category = appoint_category;
        this.address = address;
        this.user = user;
        this.offices = offices;
        this.doctor = doctor;
        this.comment = comment;
        this.number = number;
        this.status = status;
        this.time = time;
        this.flag = flag;
    }

    public Appointment(String id, Patient patient, String content, String fee, String datetime, Appoint_category appoint_category, String address, User user, Offices offices, Doctor doctor, String comment, int number, int status, String time, int flag) {
        this.id = id;
        this.patient = patient;
        this.content = content;
        this.fee = fee;
        this.datetime = datetime;
        this.appoint_category = appoint_category;
        this.address = address;
        this.user = user;
        this.offices = offices;
        this.doctor = doctor;
        this.comment = comment;
        this.number = number;
        this.status = status;
        this.time = time;
        this.flag = flag;
    }

    public String getWaitime() {
        return waitime;
    }

    public void setWaitime(String waitime) {
        this.waitime = waitime;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getFee() {
        return fee;
    }

    public void setFee(String fee) {
        this.fee = fee;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public Appoint_category getAppoint_category() {
        return appoint_category;
    }

    public void setAppoint_category(Appoint_category appoint_category) {
        this.appoint_category = appoint_category;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Offices getOffices() {
        return offices;
    }

    public void setOffices(Offices offices) {
        this.offices = offices;
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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    @Override
    public String toString() {
        return "Appointment{" +
                "id='" + id + '\'' +
                ", patient=" + patient +
                ", content='" + content + '\'' +
                ", fee='" + fee + '\'' +
                ", datetime='" + datetime + '\'' +
                ", appoint_category=" + appoint_category +
                ", address='" + address + '\'' +
                ", user=" + user +
                ", offices=" + offices +
                ", doctor=" + doctor +
                ", comment='" + comment + '\'' +
                ", number=" + number +
                ", status=" + status +
                ", time='" + time + '\'' +
                ", flag=" + flag +
                '}';
    }
}
