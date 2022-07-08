/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CookieHandle;
import dal.MovieRelated;
import dal.UserRelatedDal;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;
import model.Actor;
import model.Comment;
import model.Genre;
import model.Movie;
import model.User_Info;

/**
 *
 * @author win
 */
@WebServlet(name = "MovieDetail", urlPatterns = {"/movie-detail"})
public class MovieDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CookieHandle chl = new CookieHandle();
        MovieRelated mrd = new MovieRelated();
        
        String id_raw = request.getParameter("id");
        int id = Integer.parseInt(id_raw);

        Movie movie = mrd.getMovieById(id);
        List<Actor> actorList = mrd.getActorById(id);
        List<Comment> cmtListTmp = mrd.getCmtById(id);
        int numCmt = cmtListTmp.size();
        List<Comment> cmtList = mrd.getCmtSegment(cmtListTmp, 0, Math.min(numCmt, 2));
        List<Genre> genreList = mrd.getGenreByMovieId(id);
        List<Integer> listId = chl.getAllIdList(request);

        request.setAttribute("listId", listId);
        request.setAttribute("movie", movie);
        request.setAttribute("actorList", actorList);
        request.setAttribute("numOfCmt", numCmt);
        request.setAttribute("cmtList", cmtList);
        request.setAttribute("genreList", genreList);

        request.getRequestDispatcher("main/movie/movie-detail.jsp").forward(request, response);
    }

    //handle comment
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        MovieRelated mrd = new MovieRelated();
        PrintWriter out = response.getWriter();

        if (action.equals("load")) {
            String xnumOfCmt = request.getParameter("numOfCmt");
            String xfilmId = request.getParameter("filmId");
            int numOfCmt = Integer.parseInt(xnumOfCmt);
            int filmId = Integer.parseInt(xfilmId);
            List<Comment> cmtListTmp = mrd.getCmtById(filmId);

            if (numOfCmt == cmtListTmp.size()) {
                return;
            }
            int start = numOfCmt;
            int end = Math.min(cmtListTmp.size(), numOfCmt + 2);
            List<Comment> cmtList = mrd.getCmtSegment(cmtListTmp, start, end);
            String signal="";
            if(cmtListTmp.size()==end) signal="|no-more";

            String commentItem = "";
            for (Comment c : cmtList) {
                String Item = "<div class=\"comment-item\">\n"
                        + "                 <img src=\"./images/"+c.getUi().getAvatar()+"\" alt=\"\">\n"
                        + "                 <div class=\"comment-item-right\">\n"
                        + "                     <p>\n"
                        + "                         <strong>"+c.getUi().getFullname()+"</strong>\n"
                        + "                         <span>"+c.getTimeCmt()+"</span>\n"
                        + "                     </p>\n"
                        + "                     <p>"+c.getCmt()+"</p>\n"
                        + "                     <div class=\"commnent-react\">\n"
                        + "                         <i class=\"fas fa-thumbs-up\"></i>\n"
                        + "                         <span>1+</span>\n"
                        + "                     </div>\n"
                        + "                 </div>\n"
                        + "             </div>";
                commentItem += Item;
            }
            out.println(commentItem+signal);
        }
        
        else if(action.equals("add")){
            UserRelatedDal urd = new UserRelatedDal();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            java.sql.Date sqlDate = new Date(System.currentTimeMillis());
            
            String inputCmt = request.getParameter("inputCmt");
            String xuiId = request.getParameter("uiId");
            String xmId = request.getParameter("mId");
            int uiId = Integer.parseInt(xuiId);
            int mId = Integer.parseInt(xmId);
            
            User_Info ui = urd.getUserInfoByUser_InfoId(uiId);
            Movie m = mrd.getMovieById(mId);
            Comment c = new Comment(0, ui, m, inputCmt, sqlDate);
            mrd.addCmt(c);
            
            out.println("<div class=\"comment-item\">\n"
                        + "                 <img src=\"./images/"+c.getUi().getAvatar()+"\" alt=\"\">\n"
                        + "                 <div class=\"comment-item-right\">\n"
                        + "                     <p>\n"
                        + "                         <strong>"+c.getUi().getFullname()+"</strong>\n"
                        + "                         <span>"+c.getTimeCmt()+"</span>\n"
                        + "                     </p>\n"
                        + "                     <p>"+c.getCmt()+"</p>\n"
                        + "                     <div class=\"commnent-react\">\n"
                        + "                         <i class=\"fas fa-thumbs-up\"></i>\n"
                        + "                         <span>1+</span>\n"
                        + "                     </div>\n"
                        + "                 </div>\n"
                        + "             </div>");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
