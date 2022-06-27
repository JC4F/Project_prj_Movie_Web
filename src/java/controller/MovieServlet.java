/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.MovieRelated;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Genre;
import model.Movie;

/**
 *
 * @author win
 */
@WebServlet(name="MovieServlet", urlPatterns={"/movies"})
public class MovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        MovieRelated mrd = new MovieRelated();
        List<Genre> listGenre = mrd.getAllGenre();
        List<Movie> listMovieTmp = mrd.getAllMovie();
        
        int page, numperpage = 8;
        int size = listMovieTmp.size();
        int num = (size%8==0?(size/8):((size/8)+1));
        String xpage = request.getParameter("page");
        if(xpage==null){
            page=1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage, size);
        
        List<Movie> listMovie = mrd.getMovieByPage(listMovieTmp, start, end);
        request.setAttribute("listGenre", listGenre);
        request.setAttribute("listMovie", listMovie);
        request.setAttribute("page", page);
        request.setAttribute("num", num);
        
        request.getRequestDispatcher("movies.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
