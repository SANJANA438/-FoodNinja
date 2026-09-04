package com.tap.model;

import java.util.HashMap;

import java.util.Map;

public class Cart {

    Map<Integer, CartItem> items;

    public Cart() {

        items = new HashMap<Integer, CartItem>();

    }

    public Map<Integer, CartItem> getItem() {

        return items;

    }

    // ADD ITEM

    public void addItem(CartItem cartItem) {

        int menuID = cartItem.getMenuID();

        if (items.containsKey(menuID)) {

            CartItem existingCartItem = items.get(menuID);

            existingCartItem.setQty(
                existingCartItem.getQty() + cartItem.getQty()
            );

        } else {

            items.put(menuID, cartItem);

        }

    }

    // UPDATE ITEM QUANTITY

    public void updateItem(int menuID, int quantity) {

        if (items.containsKey(menuID)) {

            CartItem cartItem = items.get(menuID);

            if (quantity <= 0) {

                items.remove(menuID);

            } else {

                cartItem.setQty(quantity);

            }

        }

    }

    // REMOVE ITEM

    public void removeItem(int menuID) {

        items.remove(menuID);

    }

}