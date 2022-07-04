/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Genre;

/**
 *
 * @author win
 */
public class GenreHandle extends DBContext{
    //add new genre
    public void addNewGenre(Genre d) {
        String sql = "insert into genre values(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getGenre_name());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    //find genre by genre d
    public Genre getGenre(Genre d) {
        String sql = "Select * from genre where genre_name = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, d.getGenre_name());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Genre a = new Genre(rs.getInt(1), rs.getString(2));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
