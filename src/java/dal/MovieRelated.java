/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import model.Actor;
import model.Comment;
import model.Director;
import model.Genre;
import model.Movie;
import model.User_Info;

/**
 *
 * @author win
 */
public class MovieRelated extends DBContext {

    //get All genre
    public List<Genre> getAllGenre() {
        List<Genre> list = new ArrayList<>();
        String sql = "select * from genre";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
            while (rs.next()) {
                Director d = new Director(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                return d;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get all movie
    public List<Movie> getAllMovie() {
        List<Movie> list = new ArrayList<>();
        String sql = "select * from movie";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie g = new Movie(rs.getInt(1), rs.getString(2), getDirecById(rs.getInt(3)), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), getGenreByMovieId(rs.getInt(1)));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    // sort movie by type
    public List<Movie> sortMovieList(List<Movie> listMv, String type){
        Collections.sort(listMv, new Comparator<Movie>() {
            @Override
            public int compare(Movie o1, Movie o2) {
                if(type.equals("nameUP"))return o1.getName().compareTo(o2.getName());
                if(type.equals("nameDown"))return -o1.getName().compareTo(o2.getName());
                if(type.equals("priceUP")) return o1.getPrice() - o2.getPrice();
                if(type.equals("priceDown")) return o2.getPrice() - o1.getPrice();
                return 0;
            }
        });
        return listMv;
    } 
    
    // get genre by genreId
    public Genre getGenreById(int id) {
        String sql = "select * from genre where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public ArrayList<String> getStringGenre(List<Genre> listG){
        ArrayList<String> list = new ArrayList<>();
        for(Genre g:listG)
            list.add(g.getGenre_name());
        return list;
    }
    
    // sort movie by gemre
    public List<Movie> getMovieByGenre(List<Movie> listMv, List<Genre> listG){
        List<Movie> listMvRs = new ArrayList<>();
        for(Movie m: listMv){
            ArrayList<String> movieGList = getStringGenre(m.getGenre());
            ArrayList<String> gList = getStringGenre(listG);
            if(movieGList.containsAll(gList))
                listMvRs.add(m);
        }
        return listMvRs;
    } 
    
    // get movie follow by num of page
    public List<Movie> getMovieByPage(List<Movie> allM, int start, int end){
        List<Movie> list = new ArrayList<>();
        for(int i = start; i<end; i++){
            list.add(allM.get(i));
        }
        return list;
    }

    //get movie by movieid
    public Movie getMovieById(int id) {
        String sql = "select * from movie where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Movie g = new Movie(rs.getInt(1), rs.getString(2), getDirecById(rs.getInt(3)), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), getGenreByMovieId(rs.getInt(1)));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get actor by movieid
    public List<Actor> getActorById(int id) {
        List<Actor> list = new ArrayList<>();
        String sql = "select actor.id, fullname, birth, nationality from actor join movie_actor on actor.id = movie_actor._actor_id where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Actor g = new Actor(rs.getInt(1), rs.getString(2), rs.getDate(3), rs.getString(4));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get comment by movieid
    public List<Comment> getCmtById(int id) {
        List<Comment> list = new ArrayList<>();
        String sql = "select * from comment where _movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment g = new Comment(rs.getInt(1), getUiByCmtId(rs.getInt(2)), getMovieById(rs.getInt(3)),rs.getString(4), rs.getDate(5));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    //get segment comment
    public List<Comment> getCmtSegment(List<Comment> allCmt, int start, int end){
        List<Comment> list = new ArrayList<>();
        for(int i = start; i<end; i++){
            list.add(allCmt.get(i));
        }
        return list;
    }
    
    //add cmt to dtb
    public void addCmt(Comment c){
        String sql = "insert into comment values(?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, c.getUi().getId());
            st.setInt(2, c.getMovie().getId());
            st.setString(3, c.getCmt());
            st.setDate(4, c.getTimeCmt());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    //get Userinfo cmt by movie id
    public User_Info getUiByCmtId(int id) {
        String sql = "Select * from user_info where _user_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User_Info a = new User_Info(rs.getInt(1), rs.getInt(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getBoolean(7), rs.getDate(8),
                        rs.getDouble(9), getMovieIdByUserInfoId(rs.getInt(1)));
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //get genre by movie id
    public List<Genre> getGenreByMovieId(int id) {
        List<Genre> list = new ArrayList<>();
        String sql = "select genre.* from genre join movie_genre on genre.id = movie_genre._genre_id where movie_genre._movie_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Genre g = new Genre(rs.getInt(1), rs.getString(2));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //get result from search
    public List<Movie> getSearchedMovie(String type, String input) {
        List<Movie> list = new ArrayList<>();
        
        if(type.equals("Name") || type.equals("Country") || type.equals("Actor") || type.equals("Director")) {
            String sql ="";
            if(type.equals("Name")){
                sql = "select * from movie where name like ?";
            } else if(type.equals("Country")) {
                sql = "select * from movie where country like ?";
            } else if(type.equals("Actor")) {
                sql = "select  movie.* from movie join movie_actor on movie.id = movie_actor._movie_id  join actor on actor.id = movie_actor._actor_id where actor.fullname like ?";
            } else {
                sql = "select  movie.* from movie join director on movie._director_id = director.id where director.fullname like ?";
            }
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ("%" + input + "%"));
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Movie g = new Movie(rs.getInt(1), rs.getString(2), getDirecById(rs.getInt(3)), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), getGenreByMovieId(rs.getInt(1)));
                    list.add(g);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return list;
        }
        if (type.equals("Price")) {
            String sql = "select * from movie where price=?";
            int inputInt = -1;
            try {
                inputInt = Integer.parseInt(input);
            } catch (Exception e) {
            }
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, inputInt);
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Movie g = new Movie(rs.getInt(1), rs.getString(2), getDirecById(rs.getInt(3)), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), getGenreByMovieId(rs.getInt(1)));
                    list.add(g);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return list;
        }

        if (type.equals("All")) {
            String sql = "select distinct movie.* from movie \n"
                    + "join director on movie._director_id = director.id \n"
                    + "join movie_actor on movie.id = movie_actor._movie_id  join actor on actor.id = movie_actor._actor_id\n"
                    + "where actor.fullname like ? or director.fullname like ? or movie.price=? or movie.country like ? or movie.name like ?";
            int inputInt = -1;
            try {
                inputInt = Integer.parseInt(input);
            } catch (Exception e) {
            }
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, ("%" + input + "%"));
                st.setString(2, ("%" + input + "%"));
                st.setInt(3, inputInt);
                st.setString(4, ("%" + input + "%"));
                st.setString(5, ("%" + input + "%"));
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Movie g = new Movie(rs.getInt(1), rs.getString(2), getDirecById(rs.getInt(3)), rs.getDate(4), rs.getInt(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getString(9), rs.getInt(10), rs.getString(11), getGenreByMovieId(rs.getInt(1)));
                    list.add(g);
                }
            } catch (SQLException e) {
                System.out.println(e);
            }
            return list;
        }

        return null;
    }
    
    // get List id of movie by userinfo id
    public List<Integer> getMovieIdByUserInfoId(int id){
        List<Integer> list = new ArrayList<>();
        String sql = "select  movie_userInfo._movie_id from user_info join movie_userInfo on movie_userInfo._user_info_id = user_info._user_id where user_info._user_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    // get movie list paid
    public List<Movie> getMoviePaid(List<Integer> UiMovieIdList, List<Movie> mList, String paid){
        if(paid.equals("false")){
            return mList;
        }
        List<Movie> listMvRs = new ArrayList<>();
        for(Movie m: mList){
            if(UiMovieIdList.contains(m.getId()))
                listMvRs.add(m);
        }
        return listMvRs;
    }
}
