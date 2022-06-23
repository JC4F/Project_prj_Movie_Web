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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User_Acc;

/**
 *
 * @author win
 */
@WebServlet(name="ChangePasswordServlet", urlPatterns={"/change-password"})
public class ChangePasswordServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("account")==null){
            response.sendRedirect("http://localhost:9999/Movie_Web/");
            return;
        }
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String oldPw = request.getParameter("oldPassword");
        String newPw = request.getParameter("newPassword");
        String cf_newPw = request.getParameter("cfNewPassword");
        
        if(!newPw.equals(cf_newPw)){
            request.setAttribute("mess", "Confirm password error!");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }
        
        HttpSession session = request.getSession();
        UserRelatedDal urd = new UserRelatedDal();
        User_Acc ua = (User_Acc) session.getAttribute("account");
        
        if(!oldPw.equals(ua.getPassword())){
            request.setAttribute("mess", "Wrong old password!");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }
        
        urd.changePw(newPw, ua.getId());
        request.setAttribute("mess", "Change successfully!");
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
        return;
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
