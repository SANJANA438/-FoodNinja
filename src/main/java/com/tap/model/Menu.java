package com.tap.model;

import java.util.Date;

public class Menu {

    private int menuId;

    private int restaurantId;

    private String itemName;

    private String description;

    private double price;

    private boolean isAvailable;

    private String category;

    private double rating;

    private String imageUrl;       // NEW

    private Date createdAt;

    private Date updatedAt;

    private Date deletedAt;


    // =====================================================
    // DEFAULT CONSTRUCTOR
    // =====================================================

    public Menu() {

    }


    // =====================================================
    // PARAMETERIZED CONSTRUCTOR
    // =====================================================

    public Menu(
            int menuId,
            int restaurantId,
            String itemName,
            String description,
            double price,
            boolean isAvailable,
            String category,
            double rating,
            String imageUrl,
            Date createdAt,
            Date updatedAt,
            Date deletedAt) {

        this.menuId = menuId;

        this.restaurantId = restaurantId;

        this.itemName = itemName;

        this.description = description;

        this.price = price;

        this.isAvailable = isAvailable;

        this.category = category;

        this.rating = rating;

        this.imageUrl = imageUrl;

        this.createdAt = createdAt;

        this.updatedAt = updatedAt;

        this.deletedAt = deletedAt;
    }


    // =====================================================
    // GETTERS AND SETTERS
    // =====================================================

    public int getMenuId() {

        return menuId;
    }

    public void setMenuId(int menuId) {

        this.menuId = menuId;
    }


    public int getRestaurantId() {

        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {

        this.restaurantId = restaurantId;
    }


    public String getItemName() {

        return itemName;
    }

    public void setItemName(String itemName) {

        this.itemName = itemName;
    }


    public String getDescription() {

        return description;
    }

    public void setDescription(String description) {

        this.description = description;
    }


    public double getPrice() {

        return price;
    }

    public void setPrice(double price) {

        this.price = price;
    }


    public boolean isAvailable() {

        return isAvailable;
    }

    public void setAvailable(boolean isAvailable) {

        this.isAvailable = isAvailable;
    }


    public String getCategory() {

        return category;
    }

    public void setCategory(String category) {

        this.category = category;
    }


    // =====================================================
    // RATING
    // =====================================================

    public double getRating() {

        return rating;
    }

    public void setRating(double rating) {

        this.rating = rating;
    }


    // =====================================================
    // IMAGE URL
    // =====================================================

    public String getImageUrl() {

        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {

        this.imageUrl = imageUrl;
    }


    // =====================================================
    // DATE METHODS
    // =====================================================

    public Date getCreatedAt() {

        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {

        this.createdAt = createdAt;
    }


    public Date getUpdatedAt() {

        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {

        this.updatedAt = updatedAt;
    }


    public Date getDeletedAt() {

        return deletedAt;
    }

    public void setDeletedAt(Date deletedAt) {

        this.deletedAt = deletedAt;
    }


    // =====================================================
    // TO STRING
    // =====================================================

    @Override
    public String toString() {

        return "Menu [menuId=" + menuId
                + ", restaurantId=" + restaurantId
                + ", itemName=" + itemName
                + ", description=" + description
                + ", price=" + price
                + ", isAvailable=" + isAvailable
                + ", category=" + category
                + ", rating=" + rating
                + ", imageUrl=" + imageUrl
                + ", createdAt=" + createdAt
                + ", updatedAt=" + updatedAt
                + ", deletedAt=" + deletedAt + "]";
    }

}