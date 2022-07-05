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
    //add new actor
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

    //find actor by actor d
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
    
    //delete actor by movie id
    public void deleteActorByMovieId(int id) {
        String sql = "delete from movie_actor where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
