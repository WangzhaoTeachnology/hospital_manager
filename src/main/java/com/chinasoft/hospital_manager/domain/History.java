package com.chinasoft.hospital_manager.domain;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * Created by Jack on 2020/2/23 17:45
 */
public class History {
    private String id;
    private Patient patient;
    private  String content;
    private Doctor doctor;
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:MM:ss")
    private String datetime;

    public History() {
    }

    public History(Patient patient, String content, Doctor doctor, String datetime) {
        this.patient = patient;
        this.content = content;
        this.doctor = doctor;
        this.datetime = datetime;
    }

    public History(String id, Patient patient, String content, Doctor doctor, String datetime) {
        this.id = id;
        this.patient = patient;
        this.content = content;
        this.doctor = doctor;
        this.datetime = datetime;
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

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    @Override
    public String toString() {
        return "History{" +
                "id=" + id +
                ", patient=" + patient +
                ", content='" + content + '\'' +
                ", doctor=" + doctor +
                ", datetime='" + datetime + '\'' +
                '}';
    }
}
