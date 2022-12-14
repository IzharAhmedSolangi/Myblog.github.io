package com.tech.dao;

import java.sql.*;

public class likeDao {

    Connection con;

    public likeDao(Connection con) {
        this.con = con;
    }

    public boolean likePost(int uid, int pid) {

        boolean flag = false;
        try {
            String q = "insert into liked (uId , pId) values(?,?)";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setInt(1, uid);
            pst.setInt(2, pid);
            pst.executeUpdate();
            flag = true;
        } catch (Exception e) {
            System.out.println(e);
        }
        return flag;
    }

    public int countLike(int pid) {

        int count = 0;

        try {
            String q = "select count(*) from liked where pId = ?";
            PreparedStatement pst = this.con.prepareStatement(q);
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return count;
    }

    public boolean isLiked(int uid, int pid) {

        boolean flag = false;

        try {
            String q = "select * from liked where pId = ? and uId = ?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, pid);
            ps.setInt(2, uid);

            ps.executeUpdate();
            flag = true;

        } catch (Exception e) {
            System.out.println(e);
        }
        return flag;
    }

    public boolean deleteLike(int uid, int pid) {

        boolean flag = false;

        try {

            PreparedStatement ps = this.con.prepareStatement("delete from liked where uId = ? and pId = ?");
            ps.setInt(1, uid);
            ps.setInt(2, pid);
            ps.executeUpdate();
            flag = true;

        } catch (Exception e) {
            System.out.println(e);
        }
        return flag;
    }
}
