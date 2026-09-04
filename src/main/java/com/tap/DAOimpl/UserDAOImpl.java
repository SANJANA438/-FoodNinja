package com.tap.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.UserDAO;
import com.tap.model.User;
import com.tap.utility.DBConnection;

public class UserDAOImpl implements UserDAO {

    // =====================================================
    // ADD USER
    // =====================================================

    @Override
    public int addUser(User user) {

        String INSERT_QUERY =
                "INSERT INTO tap_foods.user "
                + "(userName, email, Address, role, createdDate, lastLoginDate, password, phone) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(INSERT_QUERY);

            pstmt.setString(1, user.getUserName());

            pstmt.setString(2, user.getEmail());

            pstmt.setString(3, user.getAddress());

            pstmt.setString(4, user.getRole());

            Timestamp currentTime =
                    new Timestamp(System.currentTimeMillis());

            pstmt.setTimestamp(5, currentTime);

            pstmt.setTimestamp(6, currentTime);

            pstmt.setString(7, user.getPassword());

            // PHONE
            pstmt.setString(8, user.getPhone());

            int i = pstmt.executeUpdate();

            System.out.println(i + " user inserted");

            return i;

        } catch (SQLException e) {

            e.printStackTrace();

            return 0;
        }
    }


    // =====================================================
    // GET USER BY ID
    // =====================================================

    @Override
    public User getUser(int userID) {

        String GET_QUERY =
                "SELECT * FROM tap_foods.user WHERE userID = ?";

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_QUERY);

            pstmt.setInt(1, userID);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setUserID(
                        rs.getInt("userID")
                );

                user.setUserName(
                        rs.getString("userName")
                );

                user.setEmail(
                        rs.getString("email")
                );

                // PHONE
                user.setPhone(
                        rs.getString("phone")
                );

                user.setAddress(
                        rs.getString("Address")
                );

                user.setRole(
                        rs.getString("role")
                );

                user.setCreatedDate(
                        rs.getTimestamp("createdDate")
                );

                user.setLastLoginDate(
                        rs.getTimestamp("lastLoginDate")
                );

                user.setPassword(
                        rs.getString("password")
                );

                return user;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // GET USER BY EMAIL
    // =====================================================

    @Override
    public User getUserByEmail(String email) {

        String GET_EMAIL_QUERY =
                "SELECT * FROM tap_foods.user WHERE email = ?";

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_EMAIL_QUERY);

            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                User user = new User();

                user.setUserID(
                        rs.getInt("userID")
                );

                user.setUserName(
                        rs.getString("userName")
                );

                user.setEmail(
                        rs.getString("email")
                );

                // PHONE
                user.setPhone(
                        rs.getString("phone")
                );

                user.setAddress(
                        rs.getString("Address")
                );

                user.setRole(
                        rs.getString("role")
                );

                user.setCreatedDate(
                        rs.getTimestamp("createdDate")
                );

                user.setLastLoginDate(
                        rs.getTimestamp("lastLoginDate")
                );

                user.setPassword(
                        rs.getString("password")
                );

                return user;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    // =====================================================
    // UPDATE USER
    // =====================================================

    @Override
    public void updateUser(User user) {

        String UPDATE_QUERY =
                "UPDATE tap_foods.user SET "
                + "userName = ?, "
                + "email = ?, "
                + "Address = ?, "
                + "role = ?, "
                + "lastLoginDate = ?, "
                + "password = ?, "
                + "phone = ? "
                + "WHERE userID = ?";

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(UPDATE_QUERY);

            pstmt.setString(1, user.getUserName());

            pstmt.setString(2, user.getEmail());

            pstmt.setString(3, user.getAddress());

            pstmt.setString(4, user.getRole());

            pstmt.setTimestamp(
                    5,
                    new Timestamp(System.currentTimeMillis())
            );

            pstmt.setString(6, user.getPassword());

            // PHONE
            pstmt.setString(7, user.getPhone());

            pstmt.setInt(8, user.getUserID());

            int i = pstmt.executeUpdate();

            System.out.println(i + " user updated");

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }


    // =====================================================
    // DELETE USER
    // =====================================================

    @Override
    public void deleteUser(int userID) {

        String DELETE_QUERY =
                "DELETE FROM tap_foods.user WHERE userID = ?";

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(DELETE_QUERY);

            pstmt.setInt(1, userID);

            int i = pstmt.executeUpdate();

            System.out.println(i + " user deleted");

        } catch (SQLException e) {

            e.printStackTrace();
        }
    }


    // =====================================================
    // GET ALL USERS
    // =====================================================

    @Override
    public List<User> getAllUser() {

        List<User> list = new ArrayList<>();

        String GET_ALL_QUERY =
                "SELECT * FROM tap_foods.user";

        Connection connection = DBConnection.getConnection();

        try {

            PreparedStatement pstmt =
                    connection.prepareStatement(GET_ALL_QUERY);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                User user = new User();

                user.setUserID(
                        rs.getInt("userID")
                );

                user.setUserName(
                        rs.getString("userName")
                );

                user.setEmail(
                        rs.getString("email")
                );

                // PHONE
                user.setPhone(
                        rs.getString("phone")
                );

                user.setAddress(
                        rs.getString("Address")
                );

                user.setRole(
                        rs.getString("role")
                );

                user.setCreatedDate(
                        rs.getTimestamp("createdDate")
                );

                user.setLastLoginDate(
                        rs.getTimestamp("lastLoginDate")
                );

                user.setPassword(
                        rs.getString("password")
                );

                list.add(user);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return list;
    }
}