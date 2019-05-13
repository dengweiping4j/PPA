package com.wq.entity;

public class Student {
    private String pkid;

    private String xh;

    private String xm;

    private String year;

    private String classKey;

    private String majorKey;

    private String departmentKey;

    private String phone;

    public String getPkid() {
        return pkid;
    }

    public void setPkid(String pkid) {
        this.pkid = pkid == null ? null : pkid.trim();
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh == null ? null : xh.trim();
    }

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm == null ? null : xm.trim();
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year == null ? null : year.trim();
    }

    public String getClassKey() {
        return classKey;
    }

    public void setClassKey(String classKey) {
        this.classKey = classKey == null ? null : classKey.trim();
    }

    public String getMajorKey() {
        return majorKey;
    }

    public void setMajorKey(String majorKey) {
        this.majorKey = majorKey == null ? null : majorKey.trim();
    }

    public String getDepartmentKey() {
        return departmentKey;
    }

    public void setDepartmentKey(String departmentKey) {
        this.departmentKey = departmentKey == null ? null : departmentKey.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }
}