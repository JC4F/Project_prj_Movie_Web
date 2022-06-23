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
import model.Actor;
import model.Comment;
import model.Director;
import model.Genre;
import model.Movie;

/**
 *
 * @author win
 */
public class MovieRelated extends DBContext{
    //get All genre
    public List<Genre> getAllGenre(){
        List<Genre> list = new ArrayList<>();
        String sql = "select * from genre";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get director by movieid
    public Director getDirecById(int id) {
        String sql = "Select * from director where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Director d = new Director(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //get all movie
    public List<Movie> getAllMovie(){
        List<Movie> list = new ArrayList<>();
        String sql = "select * from movie";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Movie g = new Movie(rs.getInt(1), rs.getString(2), getDirecById(rs.getInt(3)), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get movie by movieid
    public Movie getMovieById(int id){
        String sql = "select * from movie where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Movie g = new Movie(rs.getInt(1), rs.getString(2), getDirecById(rs.getInt(3)), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    //get actor by movieid
    public List<Actor> getActorById(int id){
        List<Actor> list = new ArrayList<>();
        String sql = "select actor.id, fullname, birth, nationality from actor join movie_actor on actor.id = movie_actor._actor_id where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Actor g = new Actor(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get comment by movieid
    public List<Comment> getCmtById(int id){
        List<Comment> list = new ArrayList<>();
        String sql = "select actor.id, fullname, birth, nationality from actor join movie_actor on actor.id = movie_actor._actor_id where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                Actor g = new Actor(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
//                list.add(g);===========================================================
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
