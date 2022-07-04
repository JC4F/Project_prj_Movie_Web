/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Actor;

/**
 *
 * @author win
 */
public class ActorHandle extends DBContext{
    //add new director
    public void addNewActor(Actor d) {
        String sql = "insert into actor values(?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getFullName());
            st.setDate(2, d.getBirth());
            st.setString(3, d.getNationality());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //find director by Director d
    public Actor getActor(Actor d) {
        String sql = "Select * from actor where fullname=? and birth=? and nationality=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getFullName());
            st.setDate(2, d.getBirth());
            st.setString(3, d.getNationality());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Actor a = new Actor(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
