package com.tap.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

    // =========================================================
    // ADD RESTAURANT
    // =========================================================

    @Override
    public void addRestaurant(Restaurant restaurant) {

        String sql = "INSERT INTO restaurant "
                + "(name, cuisineType, deliveryTime, address, "
                + "adminUserID, rating, isActive, imageUrl) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getCuisineType());
            pstmt.setInt(3, restaurant.getDeliveryTime());
            pstmt.setString(4, restaurant.getAddress());
            pstmt.setInt(5, restaurant.getAdminUserID());
            pstmt.setDouble(6, restaurant.getRating());
            pstmt.setBoolean(7, restaurant.isActive());

            // IMAGE
            pstmt.setString(8, restaurant.getImageUrl());

            pstmt.executeUpdate();

            System.out.println("Restaurant added successfully");

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }


    // =========================================================
    // GET RESTAURANT BY ID
    // =========================================================

    @Override
    public Restaurant getRestaurant(int restaurantID) {

        Restaurant restaurant = null;

        String sql =
                "SELECT * FROM restaurant WHERE restaurantID = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1, restaurantID);

            ResultSet rs =
                    pstmt.executeQuery();

            if (rs.next()) {

                restaurant = new Restaurant();

                restaurant.setRestaurantID(
                        rs.getInt("restaurantID")
                );

                restaurant.setName(
                        rs.getString("name")
                );

                restaurant.setCuisineType(
                        rs.getString("cuisineType")
                );

                restaurant.setDeliveryTime(
                        rs.getInt("deliveryTime")
                );

                restaurant.setAddress(
                        rs.getString("address")
                );

                restaurant.setAdminUserID(
                        rs.getInt("adminUserID")
                );

                restaurant.setRating(
                        rs.getDouble("rating")
                );

                restaurant.setActive(
                        rs.getBoolean("isActive")
                );

                // IMAGE
                restaurant.setImageUrl(
                        rs.getString("imageUrl")
                );
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return restaurant;
    }


    // =========================================================
    // UPDATE RESTAURANT
    // =========================================================

    @Override
    public void updateRestaurant(Restaurant restaurant) {

        String sql =
                "UPDATE restaurant SET "
                + "name = ?, "
                + "cuisineType = ?, "
                + "deliveryTime = ?, "
                + "address = ?, "
                + "adminUserID = ?, "
                + "rating = ?, "
                + "isActive = ?, "
                + "imageUrl = ? "
                + "WHERE restaurantID = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(
                    1,
                    restaurant.getName()
            );

            pstmt.setString(
                    2,
                    restaurant.getCuisineType()
            );

            pstmt.setInt(
                    3,
                    restaurant.getDeliveryTime()
            );

            pstmt.setString(
                    4,
                    restaurant.getAddress()
            );

            pstmt.setInt(
                    5,
                    restaurant.getAdminUserID()
            );

            pstmt.setDouble(
                    6,
                    restaurant.getRating()
            );

            pstmt.setBoolean(
                    7,
                    restaurant.isActive()
            );

            // IMAGE
            pstmt.setString(
                    8,
                    restaurant.getImageUrl()
            );

            pstmt.setInt(
                    9,
                    restaurant.getRestaurantID()
            );

            pstmt.executeUpdate();

            System.out.println(
                    "Restaurant updated successfully"
            );

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }


    // =========================================================
    // DELETE RESTAURANT
    // =========================================================

    @Override
    public void deleteRestaurant(int restaurantID) {

        String sql =
                "DELETE FROM restaurant WHERE restaurantID = ?";

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1, restaurantID);

            pstmt.executeUpdate();

            System.out.println(
                    "Restaurant deleted successfully"
            );

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }


    // =========================================================
    // GET ALL RESTAURANTS
    // =========================================================

    @Override
    public List<Restaurant> getAllRestaurant() {

        List<Restaurant> restaurantList =
                new ArrayList<>();

        String sql =
                "SELECT * FROM restaurant";

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            ResultSet rs =
                    pstmt.executeQuery();

            while (rs.next()) {

                Restaurant restaurant =
                        new Restaurant();

                restaurant.setRestaurantID(
                        rs.getInt("restaurantID")
                );

                restaurant.setName(
                        rs.getString("name")
                );

                restaurant.setCuisineType(
                        rs.getString("cuisineType")
                );

                restaurant.setDeliveryTime(
                        rs.getInt("deliveryTime")
                );

                restaurant.setAddress(
                        rs.getString("address")
                );

                restaurant.setAdminUserID(
                        rs.getInt("adminUserID")
                );

                restaurant.setRating(
                        rs.getDouble("rating")
                );

                restaurant.setActive(
                        rs.getBoolean("isActive")
                );

                // =============================================
                // IMPORTANT: GET IMAGE FROM DATABASE
                // =============================================

                restaurant.setImageUrl(
                        rs.getString("imageUrl")
                );

                restaurantList.add(restaurant);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return restaurantList;
    }
}