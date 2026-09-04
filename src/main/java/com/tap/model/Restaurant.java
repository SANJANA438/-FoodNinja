package com.tap.model;

public class Restaurant {

    private int restaurantID;
    private String name;
    private String cuisineType;
    private int deliveryTime;
    private String address;
    private int adminUserID;
    private double rating;
    private boolean isActive;

    // IMAGE
    private String imageUrl;


    // ==============================
    // DEFAULT CONSTRUCTOR
    // ==============================

    public Restaurant() {
    }


    // ==============================
    // CONSTRUCTOR
    // ==============================

    public Restaurant(
            String name,
            String cuisineType,
            int deliveryTime,
            String address,
            int adminUserID,
            double rating,
            boolean isActive,
            String imageUrl) {

        this.name = name;
        this.cuisineType = cuisineType;
        this.deliveryTime = deliveryTime;
        this.address = address;
        this.adminUserID = adminUserID;
        this.rating = rating;
        this.isActive = isActive;
        this.imageUrl = imageUrl;
    }


    // ==============================
    // RESTAURANT ID
    // ==============================

    public int getRestaurantID() {
        return restaurantID;
    }

    public void setRestaurantID(int restaurantID) {
        this.restaurantID = restaurantID;
    }


    // ==============================
    // NAME
    // ==============================

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    // ==============================
    // CUISINE TYPE
    // ==============================

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }


    // ==============================
    // DELIVERY TIME
    // ==============================

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime) {
        this.deliveryTime = deliveryTime;
    }


    // ==============================
    // ADDRESS
    // ==============================

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    // ==============================
    // ADMIN USER ID
    // ==============================

    public int getAdminUserID() {
        return adminUserID;
    }

    public void setAdminUserID(int adminUserID) {
        this.adminUserID = adminUserID;
    }


    // ==============================
    // RATING
    // ==============================

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }


    // ==============================
    // ACTIVE
    // ==============================

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }


    // ==============================
    // IMAGE URL
    // ==============================

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }


    // ==============================
    // TO STRING
    // ==============================

    @Override
    public String toString() {

        return "Restaurant ["
                + "restaurantID=" + restaurantID
                + ", name=" + name
                + ", cuisineType=" + cuisineType
                + ", deliveryTime=" + deliveryTime
                + ", address=" + address
                + ", adminUserID=" + adminUserID
                + ", rating=" + rating
                + ", isActive=" + isActive
                + ", imageUrl=" + imageUrl
                + "]";
    }
}