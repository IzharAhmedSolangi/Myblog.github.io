package com.tech.dao;

import com.tech.entities.User;
import java.sql.*;

public class userDao {

    private Connection con;

    public userDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "insert into users (Name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(query);

            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());

            pst.setString(3, user.getPassword());

            pst.setString(4, user.getGender());

            pst.setString(5, user.getAbout());
            pst.executeUpdate();
            f = true;

        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

    public User getUserByEmailandPassword(String mail, String password) {
        User user = null;

        try {
//            String query = "select * from users where email ='"+mail+"' , password ='"+password+"'";
            String query = "select * from users where email =? and password =?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, mail);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {

                user = new User();
                user.setName(rs.getString("Name"));
                user.setId(rs.getInt("Id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return user;
    }
    
    
    
    
    public boolean updateUser(User user){
    
        boolean flag = false;
         try {
            String query = "update users set name=? , email =? , password =? , about =? , profile =? where id =?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getAbout());
            pst.setString(5, user.getProfile());
            pst.setInt(6, user.getId());
            pst.executeUpdate();
            
            flag = true;
        } catch (Exception e) {
             System.out.println(e);
        }
        return flag;
    }

    
    
    public User getUserByUserId(int userId){
    User user = null;
    
        try {
            String q = "select * from users where id=?";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setInt(1, userId);
            ResultSet rs =pst.executeQuery();
            if(rs.next()){
            
                user = new User();
                user.setName(rs.getString("Name"));
                user.setId(rs.getInt("Id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    
    return user;
    }
}
