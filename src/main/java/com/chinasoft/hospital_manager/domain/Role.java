package com.chinasoft.hospital_manager.domain;

public class Role {
    private  Integer roleid;
    private  String name;
    private  String remark;

    public Role() {
    }

    public Role(Integer id, String name, String remark) {
        this.roleid = id;
        this.name = name;
        this.remark = remark;
    }

    public Role(String name, String remark) {
        this.name = name;
        this.remark = remark;
    }


    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleid=" + roleid +
                ", name='" + name + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
