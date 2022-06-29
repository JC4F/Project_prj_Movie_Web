/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CookieHandle;
import dal.MovieRelated;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Cart;

/**
 *
 * @author win
 */
@WebServlet(name = "ShopCartServlet", urlPatterns = {"/shop-cart"})
public class ShopCartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("account") == null) {
            response.sendRedirect("http://localhost:9999/Movie_Web/");
            return;
        }
        CookieHandle chl = new CookieHandle();
        List<Cart> cartList = chl.getAllCartList(request);
        request.setAttribute("cartList", cartList);
        request.getRequestDispatcher("shop-card.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filmId = request.getParameter("id");
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        Date date = new Date();
        Cookie[] arr = request.getCookies();
        String txt = "", txtRs="";
        boolean checkExist = false;
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        if ((filmId != null)) {
            if (txt.isEmpty()) {
                txtRs = filmId + ":" + formatter.format(date);
            } else {
                String[] s = txt.split("/");
                for (int i=0; i<s.length; i++) {
                    String[] n = s[i].split(":");
                    String id = n[0];
                    if(id.equals(filmId)){
                        checkExist=true;
                        continue;
                    }
                    txtRs += n[0] + ":" + n[1];
                    if(i!=s.length-1) txtRs+="/";
                }
                if(!checkExist)
                    txtRs+= "/" + filmId + ":" + formatter.format(date);
            }
            
        }
        Cookie c = new Cookie("cart", txtRs);
        c.setMaxAge(2 * 24 * 60 * 60);
        response.addCookie(c);
        PrintWriter out = response.getWriter();
        
        if(checkExist) out.print("delete");
        else out.print("add");
        return;
//        request.getRequestDispatcher("movies").forward(request, response); => them vao thi khong tra ve data dc
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
