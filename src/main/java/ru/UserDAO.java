package ru;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
    public static String registerUser(String name, String email){
        String query="select * from "+ DBDetails.USER_TABLE+" where "+ DBDetails.EMAIL_COL+"=?";

        try {
            Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return "registered";
            }

            query = "insert into " + DBDetails.USER_TABLE + " (" + DBDetails.NAME_COL + "," + DBDetails.EMAIL_COL+") values (?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0){
                return "true";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "false";
    }

    public static String loginUser(String name, String email){
        String query = "select * from " + DBDetails.USER_TABLE + " where " + DBDetails.NAME_COL + " =? and " + DBDetails.EMAIL_COL + " =?";

        try{
            Connection con = DBConnect.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                return "true";
            }
            ps.close();
            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return "false";
    }
}
