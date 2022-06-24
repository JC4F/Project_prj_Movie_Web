<%-- 
    Document   : header
    Created on : Jun 15, 2022, 9:27:55 PM
    Author     : win
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-dark onactive">
            <a class="navbar-brand" href="index.jsp">
                <img src="./images/logo-default.png" alt="Logo" style="width:164px; height: 47px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <!-- them d-flex justify-content-between nav-width de tao khoang cach khi login-->
                <ul class="navbar-nav ml-auto d-flex justify-content-between nav-width" id="collapsibleNavbar">
                    <div class="const-component-wrapper d-flex">
                        <li class="nav-item active">
                            <a class="nav-link ${(!!pageContext.request.requestURI.contains('index') || !!pageContext.request.requestURI.equals('/Movie_Web/'))?'active':''}" href="./index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link ${(!!pageContext.request.requestURI.contains('movie'))?'active':''}" href="movies">Movies</a>
                        </li>
                        <li class="nav-item ${(!!pageContext.request.requestURI.contains('about-us'))?'active':''}">
                            <a class="nav-link" href="#">About us</a>
                        </li>
                        <!-- them not-admin de an link nay -->
                        <li class="nav-item ${((sessionScope.account.role!=1)?'not-admin':'')} ${(!!pageContext.request.requestURI.contains('admin'))?'active':''}">
                            <a class="nav-link" href="#">Admin Manager</a>
                        </li>
                        <!-- <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="fas fa-shopping-bag"></i>
                                <span>2</span>
                            </a>
                        </li> -->
                    </div>
                    <!-- them d-flex de hien -->
                    <div class="connecting-to-web ${((sessionScope.account==null)?'d-flex':'')}"> 
                        <li class="nav-item">
                            <a class="nav-link" href="login">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="signup">Sign up</a>
                        </li>
                    </div>
                    <div class="connected-to-web ${((sessionScope.account==null)?'':'d-flex')}">
                        <div class="shopping-card-wrapper">
                            <!-- them class onclick de hien demo-card-film -->
                            <span class="shoping-card-title">Shopping Card</span>
                            <div class="demo-card-film">
                                <div class="MyCard-header d-flex">
                                    <h6>Shopping Card</h6>
                                    <a href="./shop-card.jsp">View all card</a>
                                </div>
                                <div class="MyCard-content">
                                    <div class="MyCard-content-item">
                                        <a href="#">
                                            <img src="./images/gallery-1.jpg">
                                        </a>
                                        <div class="card-film-info">
                                            <h3><a href="#">Twenty Five Twenty One Twenty Five Twenty One</a></h3>
                                            <p class="card-last-access">Last access was 13 day ago</p>
                                            <!-- mac dinh la chua tra, them paid de hien tra roi -->
                                            <div class="card-checkpay paid">
                                                <span>Paid</span> 
                                                <!-- dung after de hien tich -->
                                                <a href="#">Pay Now$$</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- <div class="notification-wrapper">
                            <span><i class="fas fa-bell"></i></span>
                            <div class="notification-list"></div>
                        </div> -->
                        <!-- add class onclick to appear avatar-down-->
                        <div class="avatar-wrapper">
                            <img src="./images/${sessionScope.user_info.avatar}" alt="avatar">
                            <div class="avatar-down">
                                <div class="avatar__down-header">
                                    <img src="./images/${sessionScope.user_info.avatar}" alt="avatar">
                                    <div class="name__money-wrapper">
                                        <p>${sessionScope.user_info.fullname}</p>
                                        <span>${sessionScope.user_info.acc_money}</span>
                                    </div>
                                </div>
                                <hr>
                                <div class="avatar__down-info">
                                    <a href="my-info">Your Info</a>
                                </div>
                                <hr>
                                <div class="avatar__down-change-password">
                                    <a href="./change-password.jsp">Change password</a>
                                </div>
                                <hr>
                                <div class="avatar__down-setting">
                                    <a href="#">Setting</a>
                                </div>
                                <hr>
                                <div class="avatar__down-singout">
                                    <a href="signout">Sign out</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ul>
            </div>
        </nav>
    </body>
</html>
