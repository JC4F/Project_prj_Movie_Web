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
@WebServlet(name="SearchMovieServlet", urlPatterns={"/search-movie"})
public class SearchMovieServlet extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
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
        String selectSearch = request.getParameter("selectSearch");
        String inputSearch = request.getParameter("inputSearch");
        
        MovieRelated mrd = new MovieRelated();
        List<Genre> listGenre = mrd.getAllGenre();
        List<Movie> listMovie = mrd.getSearchedMovie(selectSearch, inputSearch);
        request.setAttribute("listMovie", listMovie);
        request.setAttribute("listGenre", listGenre);
        request.getRequestDispatcher("movies.jsp").forward(request, response);
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
