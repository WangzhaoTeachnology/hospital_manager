package com.chinasoft.hospital_manager.domain;

/**
 * Created by Jack on 2019/12/22 16:47
 */
public class Menu {
    private  Integer menuid;
    private  Integer parentid;
    private  String name;
    private  String url;
    private  String remark;
    private int status;

    public Menu() {
    }

    public Menu(Integer menuid, Integer parentid, String name, String url, String remark) {
        this.menuid = menuid;
        this.parentid = parentid;
        this.name = name;
        this.url = url;
        this.remark = remark;
    }

    public Menu(Integer parentid, String name, String url, String remark) {
        this.parentid = parentid;
        this.name = name;
        this.url = url;
        this.remark = remark;
    }

    public Integer getMenuid() {
        return menuid;
    }

    public void setMenuid(Integer menuid) {
        this.menuid = menuid;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "menuid=" + menuid +
                ", parentid=" + parentid +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", remark='" + remark + '\'' +
                ", status=" + status +
                '}';
    }
}
