package com.wq.entity;

public class User {

    private String pkid; // 主键
    private String userName; // 用户名
    private String userId;//账号
    private String password; // 密码
    private String phone; //联系电话

    public String getPkid() {
        return pkid;
    }
    public void setPkid(String pkid) {
        this.pkid = pkid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User [pkid=" + pkid + ", userName=" + userName + ", password="
                + password + ", phone=" + phone + "]";
    }

}
