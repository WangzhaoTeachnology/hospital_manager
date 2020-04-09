package com.chinasoft.hospital_manager.domain;

/**
 * Created by Jack on 2020/4/4 22:17
 */
public class Check {

   /* 0,尚未审核，1：审核通过，2：审核失败*/
      private  String cid;
      private int if_use;
      private String if_use_str;
      private int if_per;
      private  String if_per_str;
      private int if_time;
      private  String if_time_str;
      private int if_react;
      private  String if_react_str;
      private int if_content;
      private  String if_content_str;
      private Itemprescription itemprescription;
      private String comment;

    public Check() {
    }

    public Check(String cid, int if_use, String if_use_str, int if_per, String if_per_str, int if_time, String if_time_str, int if_react, String if_react_str, int if_content, String if_content_str, Itemprescription itemprescription, String comment) {
        this.cid = cid;
        this.if_use = if_use;
        this.if_use_str = if_use_str;
        this.if_per = if_per;
        this.if_per_str = if_per_str;
        this.if_time = if_time;
        this.if_time_str = if_time_str;
        this.if_react = if_react;
        this.if_react_str = if_react_str;
        this.if_content = if_content;
        this.if_content_str = if_content_str;
        this.itemprescription = itemprescription;
        this.comment = comment;
    }

    public Check(String cid, int if_content, int if_use, int if_per, int if_time, int if_react, Itemprescription itemprescription, String comment) {
        this.cid = cid;
        this.if_content = if_content;
        this.if_use = if_use;
        this.if_per = if_per;
        this.if_time = if_time;
        this.if_react = if_react;
        this.itemprescription = itemprescription;
        this.comment = comment;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public int getIf_content() {
        return if_content;
    }

    public void setIf_content(int if_content) {
        this.if_content = if_content;
    }

    public int getIf_use() {
        return if_use;
    }

    public void setIf_use(int if_use) {
        this.if_use = if_use;
    }

    public int getIf_per() {
        return if_per;
    }

    public void setIf_per(int if_per) {
        this.if_per = if_per;
    }

    public int getIf_time() {
        return if_time;
    }

    public void setIf_time(int if_time) {
        this.if_time = if_time;
    }

    public int getIf_react() {
        return if_react;
    }

    public void setIf_react(int if_react) {
        this.if_react = if_react;
    }

    public Itemprescription getItemprescription() {
        return itemprescription;
    }

    public void setItemprescription(Itemprescription itemprescription) {
        this.itemprescription = itemprescription;
    }

    public String getIf_use_str() {
        return if_use_str;
    }

    public void setIf_use_str(String if_use_str) {
        this.if_use_str = if_use_str;
    }

    public String getIf_per_str() {
        return if_per_str;
    }

    public void setIf_per_str(String if_per_str) {
        this.if_per_str = if_per_str;
    }

    public String getIf_time_str() {
        return if_time_str;
    }

    public void setIf_time_str(String if_time_str) {
        this.if_time_str = if_time_str;
    }

    public String getIf_react_str() {
        return if_react_str;
    }

    public void setIf_react_str(String if_react_str) {
        this.if_react_str = if_react_str;
    }

    public String getIf_content_str() {
        return if_content_str;
    }

    public void setIf_content_str(String if_content_str) {
        this.if_content_str = if_content_str;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Check{" +
                "cid='" + cid + '\'' +
                ", if_use=" + if_use +
                ", if_use_str='" + if_use_str + '\'' +
                ", if_per=" + if_per +
                ", if_per_str='" + if_per_str + '\'' +
                ", if_time=" + if_time +
                ", if_time_str='" + if_time_str + '\'' +
                ", if_react=" + if_react +
                ", if_react_str='" + if_react_str + '\'' +
                ", if_content=" + if_content +
                ", if_content_str='" + if_content_str + '\'' +
                ", itemprescription=" + itemprescription +
                ", comment='" + comment + '\'' +
                '}';
    }
}
