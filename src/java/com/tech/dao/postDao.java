package com.tech.dao;

import com.tech.entities.Categories;
import com.tech.entities.Posts;
import java.sql.*;
import java.sql.Timestamp;
import java.util.ArrayList;

public class postDao {

    private Connection con;

    public postDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getCategories() {
        ArrayList<Categories> list = new ArrayList<>();

        try {
            String query = "select * from categories";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("cid");
                String name = rs.getString("name");
                String disc = rs.getString("discription");

                Categories c = new Categories(id, name, disc);
//                System.out.println(c.getcID());
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public boolean savePost(Posts p) {

        boolean flag = false;

        try {
            String query = "insert into post (pTitle , pContent , pCode, pic , catId  , userId) values(?,?,?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, p.getpTitle());
            pst.setString(2, p.getpContent());
            pst.setString(3, p.getpCode());
            pst.setString(4, p.getPic());
            pst.setInt(5, p.getCatID());
            pst.setInt(6, p.getUserID());
            pst.executeUpdate();
            flag = true;
            System.out.println("Done.....................................");
        } catch (SQLException e) {
            System.out.println(e);
            System.out.println("Erroooooooooooooooooooooooooooooooooooooorrrrrrrrrrrrrrrrrr/");
        }

        return flag;
    }

//    GET ALL THE POST FROM DATABASE....
    public ArrayList<Posts> getAllposts() {
        ArrayList<Posts> post = new ArrayList<>();

        try {
            String query = "select * from post order by pid desc";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("pid");
                String ptitle = rs.getString("pTitle");
                String pcontent = rs.getString("pContent");
                String pCode = rs.getString("pContent");
                String pic = rs.getString("pic");
//                Timestamp pDate = rs.getTimestamp("pDate");
                Timestamp pDate = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");

                int userID = rs.getInt("userId");

                Posts p = new Posts(id, ptitle, pcontent, pCode, pic, pDate, catId, userID);
                post.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return post;
    }

    public ArrayList<Posts> getAllpostsById(int catId) {
        ArrayList<Posts> postID = new ArrayList<>();

        try {
            String query = "select * from post where catId =?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, catId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("pid");
                String ptitle = rs.getString("pTitle");
                String pcontent = rs.getString("pContent");
                String pCode = rs.getString("pContent");
                String pic = rs.getString("pic");
//                Timestamp pDate = rs.getTimestamp("pDate");
                Timestamp pDate = rs.getTimestamp("pDate");

                int userID = rs.getInt("userId");

                Posts p = new Posts(id, ptitle, pcontent, pCode, pic, pDate, catId, userID);
                postID.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return postID;
    }
    
    public Posts getpostsById(int pid){
    Posts post = null;
        try {
            String query = "select * from post where pid = ?";
            
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            if(rs.next()){
                
                String ptitle = rs.getString("pTitle");
                String pcontent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pic = rs.getString("pic");
//                Timestamp pDate = rs.getTimestamp("pDate");
                Timestamp pDate = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userID = rs.getInt("userId");

                post = new Posts(pid,ptitle, pcontent, pCode, pic, pDate, catId, userID);
                
            
            
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    
    return post;
    }

}
