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
        <!-- them onactive + bo container de thay doi size cua header -->
        <%@include file="header.jsp"%> 
    </div>
    <div id="page-movies-box">
        <div class="left-content">
            <form>
                <button data-toggle="collapse" data-target="#LC-filter">Filter <i class="fas fa-dot-circle"></i></button>
                <div id="LC-filter" class="collapse">
                    <input type="checkbox" name="isPaid" id="isPaid" value="1">
                    <label for="isPaid">Have owned</label>
                </div>
                <button data-toggle="collapse" data-target="#LC-sort">Sort By <i class="fas fa-dot-circle"></i></button>
                <div id="LC-sort" class="collapse">
                    <select name="sort-select">
                        <option value="nameDown">Name &#xf063;</option>
                        <option value="nameUP">Name &#xf062;</option>
                        <option value="priceDown">Price &#xf063;</option>
                        <option value="priceUP">Price &#xf062;</option>
                    </select>
                </div>
                <button data-toggle="collapse" data-target="#LC-choice-list">Type Of Film <i class="fas fa-dot-circle"></i></button>
                <div id="LC-choice-list" class="collapse">
                    <input type="checkbox" name="typeOfFilm" id="value1" value="1">
                    <label for="value1">Action</label><br/>
                    <hr>
                    <input type="checkbox" name="typeOfFilm" id="value2" value="2">
                    <label for="value2">Adventure</label><br/>
                    <hr>
                    <input type="checkbox" name="typeOfFilm" id="value3" value="3">
                    <label for="value3">Anime</label><br/>
                    <hr>
                    <input type="checkbox" name="typeOfFilm" id="value4" value="4">
                    <label for="value4">Comedy</label><br/>
                    <hr>
                    <input type="checkbox" name="typeOfFilm" id="value5" value="5">
                    <label for="value5">Drama</label><br/>
                    <hr>
                    <input type="checkbox" name="typeOfFilm" id="value6" value="6">
                    <label for="value6">Honor</label><br/>
                    <hr>
                    <input type="checkbox" name="typeOfFilm" id="value7" value="7">
                    <label for="value7">Romantic</label><br/>
                    <hr>
                    <input type="checkbox" name="typeOfFilm" id="value8" value="8">
                    <label for="value8">Sport</label><br/>
                </div>
            </form>
        </div>
        <div class="right-content">
            <div class="RC-search-header">
                <form>
                    <select name="RC-search-type">
                        <option value="1">All</option>
                        <option value="2">Moives</option>
                        <option value="3">Actors</option>
                        <option value="4">Country</option>
                        <option value="5">Price</option>
                    </select>
                    <div class="RC-search_wrapper">
                        <input type="text" name="RC-ip-search" id="" placeholder="Find ...">
                    </div>
                </form>
            </div>
            <div class="RC-search-content">
                <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
                    <div class="col-lg-3 col-md-4 col-sm-6 col-12">
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
            <div class="RC-pagination">
                <a href="#" data-index="0">&laquo;</a>
                <a href="#" data-index="1">1</a>
                <a class="active" href="#" data-index="2">2</a>
                <a href="#" data-index="3">3</a>
                <a href="#" data-index="4">4</a>
                <a href="#" data-index="5">5</a>
                <a href="#" data-index="6">6</a>
                <a href="#" data-index="7">&raquo;</a>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%> 
    <script src="./js/script.js"></script>
    <script>
        handleMovies();
        handleAll_Except_Login_SignOut();
    </script>
</body>
</html>