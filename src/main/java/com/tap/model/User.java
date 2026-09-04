package com.tap.model;

import java.sql.Timestamp;

public class User {

    private int userID;
    private String userName;
    private String email;
    private String address;
    private String role;
    private Timestamp createdDate;
    private Timestamp lastLoginDate;
    private String password;
    private String phone;

    // =====================================================
    // DEFAULT CONSTRUCTOR
    // =====================================================

    public User() {
    }

    // =====================================================
    // CONSTRUCTOR WITHOUT DATES
    // =====================================================

    public User(String userName, String email, String address,
                String role, String password, String phone) {

        super();

        this.userName = userName;
        this.email = email;
        this.address = address;
        this.role = role;
        this.password = password;
        this.phone = phone;
    }

    // =====================================================
    // CONSTRUCTOR WITH DATES
    // =====================================================

    public User(String userName, String email, String address,
                String role, Timestamp createdDate,
                Timestamp lastLoginDate, String password,
                String phone) {

        super();

        this.userName = userName;
        this.email = email;
        this.address = address;
        this.role = role;
        this.createdDate = createdDate;
        this.lastLoginDate = lastLoginDate;
        this.password = password;
        this.phone = phone;
    }

    // =====================================================
    // USER ID
    // =====================================================

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // =====================================================
    // USER NAME
    // =====================================================

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    // =====================================================
    // EMAIL
    // =====================================================

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // =====================================================
    // PHONE
    // =====================================================

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    // =====================================================
    // ADDRESS
    // =====================================================

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    // =====================================================
    // ROLE
    // =====================================================

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    // =====================================================
    // CREATED DATE
    // =====================================================

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    // =====================================================
    // LAST LOGIN DATE
    // =====================================================

    public Timestamp getLastLoginDate() {
        return lastLoginDate;
    }

    public void setLastLoginDate(Timestamp lastLoginDate) {
        this.lastLoginDate = lastLoginDate;
    }

    // =====================================================
    // PASSWORD
    // =====================================================

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // =====================================================
    // TO STRING
    // =====================================================

    @Override
    public String toString() {

        return "User [userID=" + userID
                + ", userName=" + userName
                + ", email=" + email
                + ", phone=" + phone
                + ", address=" + address
                + ", role=" + role
                + ", createdDate=" + createdDate
                + ", lastLoginDate=" + lastLoginDate
                + ", password=" + password
                + "]";
    }
}