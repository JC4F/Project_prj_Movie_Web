/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

/**
 *
 * @author win
 */
public class CookieHandle {

    public List<Cart> getAllCartList(HttpServletRequest request) {
        List<Cart> cartList = new ArrayList<>();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        MovieRelated mrd = new MovieRelated();
        if (txt != null && !txt.equals("")) {
            String[] s = txt.split("/");
            for (String i : s) {
                String[] n = i.split(":");
                int filmId = Integer.parseInt(n[0]);
                String createdAt = n[1];
                Cart c = new Cart(mrd.getMovieById(filmId), createdAt);
                cartList.add(c);
            }
        }
        return cartList;
    }

    public List<Integer> getAllIdList(HttpServletRequest request) {
        List<Integer> list = new ArrayList<>();
        List<Cart> cartList = getAllCartList(request);
        for (Cart c : cartList) {
            list.add(c.getMovie().getId());
        }
        return list;
    }
}
