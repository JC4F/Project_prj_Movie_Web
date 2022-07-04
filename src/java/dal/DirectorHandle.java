/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Director;

/**
 *
 * @author win
 */
public class DirectorHandle extends DBContext {

    //add new director
    public void addNewDirector(Director d) {
        String sql = "insert into director values(?,?,?)";
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
    public Director getDirector(Director d) {
        String sql = "Select * from director where fullname=? and birth=? and nationality=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getFullName());
            st.setDate(2, d.getBirth());
            st.setString(3, d.getNationality());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Director a = new Director(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
