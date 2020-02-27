package com.chinasoft.hospital_manager.domain;

/**
 * Created by Jack on 2020/1/29 0:00
 */
public class Offices {
    private Integer id;
    private String name;
    private Appoint_category appoint_category;

    public Offices() {
    }

    public Offices(Integer id, String name, Appoint_category appoint_category) {
        this.id = id;
        this.name = name;
        this.appoint_category = appoint_category;
    }

    public Offices(String name, Appoint_category appoint_category) {
        this.name = name;
        this.appoint_category = appoint_category;
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

    public Appoint_category getAppoint_category() {
        return appoint_category;
    }

    public void setAppoint_category(Appoint_category appoint_category) {
        this.appoint_category = appoint_category;
    }

    @Override
    public String toString() {
        return "Offices{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", appoint_category=" + appoint_category +
                '}';
    }
}
