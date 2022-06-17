/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User_Acc;
import model.User_Info;

/**
 *
 * @author win
 */
public class UserRelatedDal extends DBContext{
    public User_Acc findAcc(String username, String password){
	String sql="Select * from user_acc where username=? and password=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User_Acc a = new User_Acc(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                return a;
            }
        } catch (SQLException e) {
        System.out.println(e);
        }
        return null;
    }
    public User_Acc checkSignUp(String username){
        String sql="Select * from user_acc where username=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                User_Acc a = new User_Acc(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void addSignUpAcc(String username, String password){
        String sql = "insert into user_acc values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setInt(3, 0);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public User_Info getUserInfo(int user_id){
        String sql = "Select * from user_info where _user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                User_Info a = new User_Info(rs.getInt(1), rs.getInt(2), 
                        rs.getString(3), rs.getString(4), rs.getString(5), 
                        rs.getString(6), rs.getBoolean(7), rs.getDate(8), 
                        rs.getDouble(9));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
