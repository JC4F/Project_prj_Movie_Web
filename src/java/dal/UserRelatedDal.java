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
    //Check when login
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
    
    // check username when sign up
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
    
    // add new account to dtb
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
    
    // add default info for account just create
    public void addDefaultInfo(int user_id){
        String sql = "insert into user_info (_user_id, avatar , acc_money) values(?, 'avatar_default.jpg', 500 ) ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    // get info from dtb to my-info
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
    
    // update information from my-info
    public void updateInfo(User_Info ui){
        String sql = "update user_info set avatar=?, fullname=?, email=?, phone=?, gender=?, birth=? where _user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ui.getAvatar());
            st.setString(2, ui.getFullname());
            st.setString(3, ui.getEmail());
            st.setString(4, ui.getPhone());
            st.setString(5, ui.isGender()+"");
            st.setDate(6, ui.getBirth());
            st.setInt(7, ui.getUser_id());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    //change password
    public void changePw(String newPw, int user_id){
        String sql = "update user_acc set password=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPw);
            st.setInt(2, user_id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
