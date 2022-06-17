/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserRelatedDal;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User_Acc;

/**
 *
 * @author win
 */
@WebServlet(name="LoginServlet", urlPatterns={"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String reminde_me = request.getParameter("reminde-me");
        Cookie cu = new Cookie("cname", username);
        Cookie cp = new Cookie("cpass", password);
        Cookie cr = new Cookie("crem", reminde_me);
        if(reminde_me!=null){
            cu.setMaxAge(60*60*7);
            cp.setMaxAge(60*60*7);
            cr.setMaxAge(60*60*7);
        }
        else {
            cu.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        response.addCookie(cu);
        response.addCookie(cp);
        response.addCookie(cr);
        
        UserRelatedDal uad = new UserRelatedDal();
        User_Acc ua = uad.findAcc(username, password);
        HttpSession session = request.getSession();
        if(ua==null){
            request.setAttribute("error", "Wrong username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else {
            session.setAttribute("account", ua);
            response.sendRedirect("http://localhost:9999/Movie_Web/");
        }
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
