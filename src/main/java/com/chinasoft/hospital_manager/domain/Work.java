package com.chinasoft.hospital_manager.domain;


import org.springframework.format.annotation.DateTimeFormat;



/**
 * Created by Jack on 2020/1/23 20:55
 */
public class Work {

    private Integer id;
    private User user;
    private String address;
    private String onday;
    private  String morning;
    private String afternoon;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String startime;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String endtime;

    //因为这个work工作表，设计成医生和挂号人员共用的，所以将医生的实体作为字段
    private Doctor doctor;
    private int status; //这个字段0，表示这个号可以挂，默认为0，只要为1，是医生停止了挂号操作
    private String comment;

    public Work() {
    }

    public Work(Integer id, User user, String address, String onday, String morning, String afternoon, String startime, String endtime) {
        this.id = id;
        this.user = user;
        this.address = address;
        this.onday = onday;
        this.morning = morning;
        this.afternoon = afternoon;
        this.startime = startime;
        this.endtime = endtime;
    }

    public Work(User user, String address, String onday, String morning, String afternoon, String startime, String endtime) {
        this.user = user;
        this.address = address;
        this.onday = onday;
        this.morning = morning;
        this.afternoon = afternoon;
        this.startime = startime;
        this.endtime = endtime;
    }
    public Work(Integer id, User user, String address, String onday, String morning, String afternoon, String startime, String endtime, Doctor doctor) {
        this.id = id;
        this.user = user;
        this.address = address;
        this.onday = onday;
        this.morning = morning;
        this.afternoon = afternoon;
        this.startime = startime;
        this.endtime = endtime;
        this.doctor= doctor;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOnday() {
        return onday;
    }

    public void setOnday(String onday) {
        this.onday = onday;
    }

    public String getMorning() {
        return morning;
    }

    public void setMorning(String morning) {
        this.morning = morning;
    }

    public String getAfternoon() {
        return afternoon;
    }

    public void setAfternoon(String afternoon) {
        this.afternoon = afternoon;
    }

    public String getStartime() {
        return startime;
    }

    public void setStartime(String startime) {
        this.startime = startime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
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

    @Override
    public String toString() {
        return "Work{" +
                "id=" + id +
                ", user=" + user +
                ", address='" + address + '\'' +
                ", onday='" + onday + '\'' +
                ", morning='" + morning + '\'' +
                ", afternoon='" + afternoon + '\'' +
                ", startime='" + startime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", doctor=" + doctor +
                ", status=" + status +
                ", comment='" + comment + '\'' +
                '}';
    }
}
