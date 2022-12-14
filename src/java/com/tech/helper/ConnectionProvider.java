package com.tech.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con = null;

    public static Connection getConnection() {

        if (con == null) {
            try {
//            load driver 
                Class.forName("com.mysql.cj.jdbc.Driver");

                con = DriverManager.getConnection("jdbc:mysql:/techblog", "root", "root");

            } catch (ClassNotFoundException | SQLException e) {
                System.out.println(e);
            }

        }

        return con;
    }

}
