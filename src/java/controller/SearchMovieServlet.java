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
@WebServlet(name = "SearchMovieServlet", urlPatterns = {"/search-movie"})
public class SearchMovieServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a = request.getParameter("isPaid");
//        String b = request.getParameter("data");
//        List<Movie> b1 = (List<Movie>) b;
        PrintWriter out = response.getWriter();
//        out.println(a);
        if (a.equals("true")) {
            out.println("sa");
        } else {
            out.println("bbb");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
        String searchHeader = "", searchContent = "", pagination = "";
        MovieRelated mrd = new MovieRelated();
        List<Movie> listMovieTmp = mrd.getSearchedMovie(selectSearch, inputSearch);
        int page, numperpage = 8;
        int size = listMovieTmp.size();
        int num = (size % 8 == 0 ? (size / 8) : ((size / 8) + 1));
        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }
        int start, end;
        start = (page-1)*numperpage;
        end = Math.min(page*numperpage, size);
        List<Movie> listMovie = mrd.getMovieByPage(listMovieTmp, start, end);
        
        PrintWriter out = response.getWriter();
        searchHeader = "<div class=\"RC-search-header\">\n"
                + "                    <form>\n"
                + "                        <select name=\"RC-search-type\">\n"
                + "                            <option " + (selectSearch.equals("All") == true ? "selected" : "") + " value=\"All\">All</option>\n"
                + "                            <option " + (selectSearch.equals("Name") == true ? "selected" : "") + " value=\"Name\">Name</option>\n"
                + "                            <option " + (selectSearch.equals("Actor") == true ? "selected" : "") + " value=\"Actor\">Actor</option>\n"
                + "                            <option " + (selectSearch.equals("Director") == true ? "selected" : "") + " value=\"Director\">Director</option>\n"
                + "                            <option " + (selectSearch.equals("Country") == true ? "selected" : "") + " value=\"Country\">Country</option>\n"
                + "                            <option " + (selectSearch.equals("Price") == true ? "selected" : "") + " value=\"Price\">Price</option>\n"
                + "                        </select>\n"
                + "                        <div class=\"RC-search_wrapper\">\n"
                + "                            <input id =\"somebutton\" type=\"text\" name=\"RC-ip-search\" value=\"" + inputSearch + "\" id=\"\" placeholder=\"Find ...\">\n"
                + "                        </div>\n"
                + "                    </form>\n"
                + "                </div>\n"
                + "                <div class=\"RC-search-content\">\n"
                + "                    <div class=\"row\">\n";

        for (Movie m : listMovie) {
            String movieItemAbove = "<div class=\"col-lg-3 col-md-4 col-sm-6 col-12\">\n"
                    + "                                <div class=\"movie-img-wrapper\">\n"
                    + "                                    <a href=\"movie-detail?id=" + m.getId() + "\">\n"
                    + "                                        <div>\n"
                    + "                                            <img src=\"https://i.ytimg.com/vi/" + m.getSrc() + "/maxresdefault.jpg\" alt=\"movie-img\">\n"
                    + "                                        </div>\n"
                    + "                                    </a>\n"
                    + "                                </div>\n"
                    + "                                <div class=\"movie-description\">\n"
                    + "                                    <h6><a href=\"movie-detail?id=${m.id}\">" + m.getName() + "</a></h6>\n"
                    + "                                    <p>" + m.getRealse_year() + ", " + m.getCountry() + ", Action</p>\n";
            String movieItemMid = "<div class=\"description-star\">\n";
            for (int i = 1; i <= 5; i++) {
                if (i < m.getRating()) {
                    movieItemMid += "<i class=\"fas fa-star voted\"></i>\n";
                } else {
                    movieItemMid += "<i class=\"fas fa-star\"></i>\n";
                }
            }
            movieItemMid += "</div>\n"
                    + "<div class=\"movie-price\">\n"
                    + "            <p>$" + m.getPrice() + "</p>\n"
                    + "            <a href=\"#\">ADD TO CART</a>\n"
                    + "      </div>\n"
                    + "    </div>\n"
                    + "</div>\n";
            searchContent += movieItemAbove + movieItemMid;
        }
        searchContent += "</div>\n"
                + "</div>\n";

        pagination = "<div class=\"RC-pagination\">\n";
        if (size >= 1) {
            for(int i=1; i<=num; i++){
                pagination+= "<a onclick=\"handleAjaxPag(this)\" class=\""+(i==page?"active":"")+"\" data-index=\""+i+"\">"+i+"</a>\n";
            }
        }
        pagination+="</div>\n";
        
        out.println(searchHeader + searchContent+pagination);
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
