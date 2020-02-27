package com.chinasoft.hospital_manager.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by Jack on 2020/1/29 12:08
 */
public class Patient {

    private String id;
    private String name;
    private String id_number;
    private String sex;
    private int is_marry;
   @DateTimeFormat(pattern = "yyyy-MM-dd")
    private  String birthday;
    private String telephone;
    private String address;
    private String work;
    private User user;//这个字段的设计已经没有用了，但是不想让程序动，这个字段还是没有从数据库里面删除

    public Patient(String id, String name, String id_number, String sex, int is_marry, String birthday, String telephone, String address, String work, User user) {
        this.id = id;
        this.name = name;
        this.id_number = id_number;
        this.sex = sex;
        this.is_marry = is_marry;
        this.birthday = birthday;
        this.telephone = telephone;
        this.address = address;
        this.work = work;
        this.user = user;
    }

    public Patient() {
    }

    public Patient(String name, String id_number, String sex, int is_marry, String birthday, String telephone, String address, String work, User user) {
        this.name = name;
        this.id_number = id_number;
        this.sex = sex;
        this.is_marry = is_marry;
        this.birthday = birthday;
        this.telephone = telephone;
        this.address = address;
        this.work = work;
        this.user = user;
    }

    public Patient(String name, String id_number, String sex, int is_marry, String birthday, String telephone, String address, String work) {
        this.name = name;
        this.id_number = id_number;
        this.sex = sex;
        this.is_marry = is_marry;
        this.birthday = birthday;
        this.telephone = telephone;
        this.address = address;
        this.work = work;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId_number() {
        return id_number;
    }

    public void setId_number(String id_number) {
        this.id_number = id_number;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getIs_marry() {
        return is_marry;
    }

    public void setIs_marry(int is_marry) {
        this.is_marry = is_marry;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWork() {
        return work;
    }

    public void setWork(String work) {
        this.work = work;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Patient{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", id_number=" + id_number +
                ", sex='" + sex + '\'' +
                ", is_marry=" + is_marry +
                ", birthday='" + birthday + '\'' +
                ", telephone='" + telephone + '\'' +
                ", address='" + address + '\'' +
                ", work='" + work + '\'' +
                ", user=" + user +
                '}';
    }
}
