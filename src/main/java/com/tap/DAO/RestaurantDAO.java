package com.tap.DAO;

import java.util.List;

import com.tap.model.Restaurant;

public interface RestaurantDAO {

    // Add restaurant
    void addRestaurant(Restaurant restaurant);

    // Get restaurant by ID
    Restaurant getRestaurant(int restaurantID);

    // Update restaurant
    void updateRestaurant(Restaurant restaurant);

    // Delete restaurant
    void deleteRestaurant(int restaurantID);

    // Get all restaurants
    List<Restaurant> getAllRestaurant();
}