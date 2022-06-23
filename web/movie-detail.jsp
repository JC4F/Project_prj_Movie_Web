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
    <script src="./js/bootstrap.bundle.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
</head>
<body>
    <div id="page-heading">
        <!-- them onactive de thay doi size cua header -->
        <%@include file="header.jsp"%> 
    </div>
    <div id="page-movie-detail-box">
        <div class="container">
            <div class="MD-main">
                <div class="MD__main-trailer">
                    <iframe
                    src="https://www.youtube.com/embed/tgbNymZ7vqY">
                    </iframe>
                </div>
                <div class="MD__main-info">
                    <h1>13 Reasons Why - S01E02 - Tape 1, Side B
                        <span>$29.00</span>
                    </h1>
                    <div class="info-rating">
                        <div class="IF-left">
                            <span class="IF-left-span">40min</span>
                            <span>Added: 31.03.2017</span>
                            <div class="view-like-wrapper">
                                <div class="VL-view">
                                    <i class="fas fa-eye"></i>
                                    <span>202 views</span>
                                </div>
                                <!-- them liked de chuyen mau btn like -->
                                <div class="VL-like">
                                    <!-- button dung before de chen icon ~ content dung unicode de hien icon like thay vi tag i-->
                                    <span>1+</span>
                                </div>
                            </div>
                        </div>
                        <!-- rating -->
                        <div class="IF-right">
                            <div class="IF-right-wrapper">
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="IF-voted-quantity">
                                <span>1 Voted</span>
                            </div>
                        </div> 
                    </div>
                    <div class="info-content">
                        <!-- them class show de hien het content -->
                        <div class="IC-left">
                            <div class="IC-left-wrapper">
                                <p>Praesent iaculis, purus ac vehicula mattis, arcu lorem blandit nisl, non laoreet dui mi eget elit. Donec porttitor ex vel augue maximus luctus. Vivamus finibus nibh eu nunc volutpat suscipit. Nam vulputate libero quis nisi euismod rhoncus. Sed eu euismod felis. Aenean ullamcorper dapibus odio ac tempor. Aliquam iaculis, quam vitae imperdiet consectetur, mi ante semper metus, ac efficitur nisi justo ut eros. Maecenas suscipit turpis fermentum elementum scelerisque.</p>
                                <p>Sed leo elit, volutpat quis aliquet eu, elementum eget arcu. Aenean ligula tellus, malesuada eu ultrices vel, vulputate sit amet metus. Donec tincidunt sapien ut enim feugiat, sed egestas dolor ornare.</p>
                            </div>
                            <!-- overflow:hiden, chi thay cai height voi set cai transition cho muot la dc-->
                            <span>Read Mores</span>
                        </div>
                        <div class="IC-right">
                            <span>Tags: </span>
                            <a href="#">Brother</a>
                            <a href="#">Brother Relationship</a>,
                            <a href="#">King</a>,
                            <a href="#">Vikings</a>
                        </div>
                    </div>
                    <button class="btn">
                        <i class="fas fa-shopping-cart"></i>
                        ADD TO CARD</button>
                </div>
                <div class="MD__main-comment">
                    <!-- onclick de hien cmt -->
                    <h1>Comment (<span>50</span>)</h1>
    
                    <div class="MDM-comment-wrapper">
                        <!-- hien dong cmt cua minh dau tien neu da login/ neu chua thi hien thong bao -->
                        <div class="myselft_cmt show">
                            <p class="ms_mustbelog">You must be <a href="#">Logged in</a> to post a review.</p>
                            <div class="comment-item">
                                <img src="./images/avatar.jpg" alt="">
                                <div class="comment-item-right">
                                    <input type="text" name="ms_cmt" placeholder="How do you feel about film...">
                                    <!-- ranh lam them cai btn binh luan + btn huy -->
                                </div>
                            </div>
                        </div>
                        <!-- chua cac cmt -->
                        <div class="comment-list">
                            <div class="comment-item">
                                <img src="./images/avatar.jpg" alt="">
                                <div class="comment-item-right">
                                    <p>
                                        <strong>Akther Jabeen</strong>
                                        <span>March 4, 2019</span>
                                    </p>
                                    <p>Good</p>
                                    <div class="commnent-react">
                                        <!-- to mau neu like -->
                                        <i class="fas fa-thumbs-up"></i>
                                        <span>1+</span>
                                    </div>
                                </div>
                            </div>
                            <!-- load du lieu lay cmt tiep -->
                            <a href="#" class="load-more">Read Mores</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="MD-other">
                <h1>YOU MAY ALSO LIKE</h1>
                <hr>
                <div class="row">
                    <div class="col-lg-3 col-sm-6 col-12">
                        <div class="movie-img-wrapper">
                            <a href="#">
                                <div>
                                    <img src="./images/gallery-1.jpg" alt="movie-img">
                                </div>
                            </a>
                        </div>
                        <div class="movie-description">
                            <h6><a href="#">Ant-Man and the Wasp</a></h6>
                            <p>2018, USA, Action</p>
                            <div class="description-star">
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="movie-price">
                                <p>$29.00</p>
                                <a href="#">BUY MOVIE</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-12">
                        <div class="movie-img-wrapper">
                            <a href="#">
                                <div>
                                    <img src="./images/gallery-1.jpg" alt="movie-img">
                                </div>
                            </a>
                        </div>
                        <div class="movie-description">
                            <h6><a href="#">Ant-Man and the Wasp</a></h6>
                            <p>2018, USA, Action</p>
                            <div class="description-star">
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="movie-price">
                                <p>$29.00</p>
                                <a href="#">BUY MOVIE</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-12">
                        <div class="movie-img-wrapper">
                            <a href="#">
                                <div>
                                    <img src="./images/gallery-1.jpg" alt="movie-img">
                                </div>
                            </a>
                        </div>
                        <div class="movie-description">
                            <h6><a href="#">Ant-Man and the Wasp</a></h6>
                            <p>2018, USA, Action</p>
                            <div class="description-star">
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="movie-price">
                                <p>$29.00</p>
                                <a href="#">BUY MOVIE</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-12">
                        <div class="movie-img-wrapper">
                            <a href="#">
                                <div>
                                    <img src="./images/gallery-1.jpg" alt="movie-img">
                                </div>
                            </a>
                        </div>
                        <div class="movie-description">
                            <h6><a href="#">Ant-Man and the Wasp</a></h6>
                            <p>2018, USA, Action</p>
                            <div class="description-star">
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star voted"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <div class="movie-price">
                                <p>$29.00</p>
                                <a href="#">BUY MOVIE</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%> 
    <script src="./js/script.js"></script>
    <script>
        handleAll();
    </script>
</body>
</html>