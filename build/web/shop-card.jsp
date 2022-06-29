<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script src="./js/jquery-3.6.0.min.js"></script>
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="./js/bootstrap.bundle.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id="page-heading">
            <!-- them onactive de thay doi size cua header -->
            <%@include file="header.jsp"%> 
        </div>
        <div id="page-shop-card-box">
            <div class="container">
                <h2>Shopping Card</h2>
                <div class="shopping-card-list">
                    <div class="SCL-heading">
                        <div class="markAll-wrapper">
                            <input type="checkbox" id="markAll" onclick="handleCheckAll(this)" checked>
                            <label for="markAll">Choose All</label>
                        </div>
                        <input onkeyup="handldeSearchCart(this)" type="text" name="card-find-film" id="">
                        <p><span>3 items</span> in Card</p>
                    </div>
                    <c:forEach items="${requestScope.cartList}" var="c">
                        <div class="shopping-card-item">
                            <input onclick="handleCheckItem(this)" type="checkbox" name="item-index" checked>
                            <a href="movie-detail?id=${c.movie.id}">
                                <img src="https://i.ytimg.com/vi/${c.movie.src}/maxresdefault.jpg" alt="movie-img">
                            </a>
                            <div class="card-film-info">
                                <h3><a href="movie-detail?id=${c.movie.id}">${c.movie.name}</a></h3>
                                <p class="card-director">${c.movie.director.fullName}</p>                      
                            </div>
                            <div class="card__film-created">
                                <h3>Created At:</h3>
                                <p>${c.createdAt}</p>
                            </div>
                            <div class="price-delete-wrapper">
                                <p>$${c.movie.price}</p>
                                <span onclick="handleAjaxShopCart(this)" data-id="${c.movie.id}"><i class="fas fa-trash"></i></span>
                            </div>
                        </div>
                    </c:forEach>
                    
                </div>
                <div class="shopping-card-total">
                    <p>Toltal: <span>$29.00</span></p>
                </div>
                <div class="btn-nav">
                    <a href="#">CONTINUE SHOPPING</a>
                    <a href="#">CHECK OUT</a>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%> 
        <script src="./js/script.js"></script>
        <script src="./js/ajax.js"></script>
        <script>
            handleAll();
            handleMoneys();
            handleCountItem();
        </script>
        
    </body>
</html>