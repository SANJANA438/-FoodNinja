package com.tap.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

    private Connection connection;


    // =====================================================
    // CONSTRUCTOR
    // =====================================================

    public MenuDAOImpl() {

        connection = DBConnection.getConnection();

    }


    // =====================================================
    // 1. ADD MENU
    // =====================================================

    @Override
    public void addMenu(Menu menu) {

        String sql = "INSERT INTO menu "
                + "(RestaurantID, ItemName, Description, Price, IsAvailable, "
                + "Category, Rating, ImageUrl, CreatedAt, UpdateAt, DeletedAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(sql);


            pstmt.setInt(
                    1,
                    menu.getRestaurantId()
            );


            pstmt.setString(
                    2,
                    menu.getItemName()
            );


            pstmt.setString(
                    3,
                    menu.getDescription()
            );


            pstmt.setDouble(
                    4,
                    menu.getPrice()
            );


            pstmt.setBoolean(
                    5,
                    menu.isAvailable()
            );


            pstmt.setString(
                    6,
                    menu.getCategory()
            );


            // Rating
            pstmt.setDouble(
                    7,
                    menu.getRating()
            );


            // Image URL
            pstmt.setString(
                    8,
                    menu.getImageUrl()
            );


            // CreatedAt
            if (menu.getCreatedAt() != null) {

                pstmt.setTimestamp(
                        9,
                        new Timestamp(
                                menu.getCreatedAt().getTime()
                        )
                );

            } else {

                pstmt.setTimestamp(
                        9,
                        null
                );
            }


            // UpdateAt
            if (menu.getUpdatedAt() != null) {

                pstmt.setTimestamp(
                        10,
                        new Timestamp(
                                menu.getUpdatedAt().getTime()
                        )
                );

            } else {

                pstmt.setTimestamp(
                        10,
                        null
                );
            }


            // DeletedAt
            if (menu.getDeletedAt() != null) {

                pstmt.setTimestamp(
                        11,
                        new Timestamp(
                                menu.getDeletedAt().getTime()
                        )
                );

            } else {

                pstmt.setTimestamp(
                        11,
                        null
                );
            }


            int rows =
                    pstmt.executeUpdate();


            if (rows > 0) {

                System.out.println(
                        "Menu added successfully"
                );
            }


        } catch (SQLException e) {

            e.printStackTrace();

        }

    }



    // =====================================================
    // 2. GET MENU BY ID
    // =====================================================

    @Override
    public Menu getMenu(int menuId) {

        String sql =
                "SELECT * FROM menu WHERE MenuID = ?";

        Menu menu = null;


        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(sql);


            pstmt.setInt(
                    1,
                    menuId
            );


            ResultSet rs =
                    pstmt.executeQuery();


            if (rs.next()) {

                menu =
                        extractMenu(rs);

            }


        } catch (SQLException e) {

            e.printStackTrace();

        }


        return menu;

    }



    // =====================================================
    // 3. UPDATE MENU
    // =====================================================

    @Override
    public void updateMenu(Menu menu) {

        String sql =
                "UPDATE menu SET "
                + "RestaurantID = ?, "
                + "ItemName = ?, "
                + "Description = ?, "
                + "Price = ?, "
                + "IsAvailable = ?, "
                + "Category = ?, "
                + "Rating = ?, "
                + "ImageUrl = ?, "
                + "UpdateAt = ? "
                + "WHERE MenuID = ?";


        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(sql);


            pstmt.setInt(
                    1,
                    menu.getRestaurantId()
            );


            pstmt.setString(
                    2,
                    menu.getItemName()
            );


            pstmt.setString(
                    3,
                    menu.getDescription()
            );


            pstmt.setDouble(
                    4,
                    menu.getPrice()
            );


            pstmt.setBoolean(
                    5,
                    menu.isAvailable()
            );


            pstmt.setString(
                    6,
                    menu.getCategory()
            );


            // Rating
            pstmt.setDouble(
                    7,
                    menu.getRating()
            );


            // Image URL
            pstmt.setString(
                    8,
                    menu.getImageUrl()
            );


            // UpdateAt
            if (menu.getUpdatedAt() != null) {

                pstmt.setTimestamp(
                        9,
                        new Timestamp(
                                menu.getUpdatedAt().getTime()
                        )
                );

            } else {

                pstmt.setTimestamp(
                        9,
                        null
                );

            }


            // MenuID
            pstmt.setInt(
                    10,
                    menu.getMenuId()
            );


            int rows =
                    pstmt.executeUpdate();


            if (rows > 0) {

                System.out.println(
                        "Menu updated successfully"
                );

            }


        } catch (SQLException e) {

            e.printStackTrace();

        }

    }



    // =====================================================
    // 4. DELETE MENU
    // =====================================================

    @Override
    public void deleteMenu(int menuId) {

        String sql =
                "DELETE FROM menu WHERE MenuID = ?";


        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(sql);


            pstmt.setInt(
                    1,
                    menuId
            );


            int rows =
                    pstmt.executeUpdate();


            if (rows > 0) {

                System.out.println(
                        "Menu deleted successfully"
                );

            }


        } catch (SQLException e) {

            e.printStackTrace();

        }

    }



    // =====================================================
    // 5. GET ALL MENUS
    // =====================================================

    @Override
    public List<Menu> getAllMenus() {

        String sql =
                "SELECT * FROM menu";


        List<Menu> menuList =
                new ArrayList<>();


        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(sql);


            ResultSet rs =
                    pstmt.executeQuery();


            while (rs.next()) {

                Menu menu =
                        extractMenu(rs);


                menuList.add(menu);

            }


        } catch (SQLException e) {

            e.printStackTrace();

        }


        return menuList;

    }



    // =====================================================
    // 6. GET MENUS BY RESTAURANT ID
    // =====================================================

    @Override
    public List<Menu> getAllMenus(int restaurantId) {

        String sql =
                "SELECT * FROM menu "
                + "WHERE RestaurantID = ?";


        List<Menu> menuList =
                new ArrayList<>();


        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(sql);


            pstmt.setInt(
                    1,
                    restaurantId
            );


            ResultSet rs =
                    pstmt.executeQuery();


            while (rs.next()) {

                Menu menu =
                        extractMenu(rs);


                menuList.add(menu);

            }


        } catch (SQLException e) {

            e.printStackTrace();

        }


        return menuList;

    }



    // =====================================================
    // 7. COMMON METHOD
    // RESULTSET -> MENU OBJECT
    // =====================================================

    private Menu extractMenu(ResultSet rs)
            throws SQLException {

        Menu menu =
                new Menu();


        // MenuID
        menu.setMenuId(
                rs.getInt("MenuID")
        );


        // RestaurantID
        menu.setRestaurantId(
                rs.getInt("RestaurantID")
        );


        // ItemName
        menu.setItemName(
                rs.getString("ItemName")
        );


        // Description
        menu.setDescription(
                rs.getString("Description")
        );


        // Price
        menu.setPrice(
                rs.getDouble("Price")
        );


        // IsAvailable
        menu.setAvailable(
                rs.getBoolean("IsAvailable")
        );


        // Category
        menu.setCategory(
                rs.getString("Category")
        );


        // Rating
        menu.setRating(
                rs.getDouble("Rating")
        );


        // Image URL
        menu.setImageUrl(
                rs.getString("ImageUrl")
        );


        // CreatedAt
        menu.setCreatedAt(
                rs.getTimestamp("CreatedAt")
        );


        // UpdateAt
        menu.setUpdatedAt(
                rs.getTimestamp("UpdateAt")
        );


        // DeletedAt
        menu.setDeletedAt(
                rs.getTimestamp("DeletedAt")
        );


        return menu;

    }

}