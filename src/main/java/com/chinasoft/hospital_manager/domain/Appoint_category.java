package com.chinasoft.hospital_manager.domain;

/**
 * Created by Jack on 2020/1/28 23:50
 */
public class Appoint_category {

   private Integer id;
   private String name;

    public Appoint_category() {
    }

    public Appoint_category(String name) {
        this.name = name;
    }

    public Appoint_category(Integer id, String name) {
        this.id = id;
        this.name = name;
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
        return "Appoint_category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
