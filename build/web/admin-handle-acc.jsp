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
        <div id="admin-wrapper">
            <%@include file="admin-sidebar.jsp" %>
            <div class="admin-main">
                <div class="main-cotainer">
                    <div class="main-header">
                        <h1>Block account</h1>
                        <ul>
                            <li class="breadcrumb-item"><a href="#">Admin</a></li>
                            <li class="breadcrumb-item active"><a href="#">Block account</a></li>
                        </ul>
                    </div>
                    <div class="main-form">
                        <div class="search-wrapper">
                            <select class="custom-select custom__own-select custom-label-ip" id="inputGroupSelect01">
                                <option value="0" selected>All</option>
                                <option value="1">Block</option>
                                <option value="2">Unblock</option>
                            </select>
                            <input class="form-control custom-label-ip custom-search" id="search-info" type="text"
                                   placeholder="Search..">
                        </div>
                        <div class="result_acc-wrapper">
                            <table class="table table-striped table-hover custom-label-ip">
                                <thead class="">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">FullName</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Phone</th>
                                        <th scope="col">Gender</th>
                                        <th scope="col">Birth</th>
                                        <th scope="col">Acc Money</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody class="customm-tableBody">
                                    <tr onclick="">
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>Otto</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>Thornton</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>the Bird</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>Otto</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>Thornton</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>the Bird</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                        <td>Otto</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                        <td>Thornton</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                    <tr onclick="">
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                        <td>the Bird</td>
                                        <td>
                                            <i class="fas fa-lock-open"></i>
                                            <i class="fas fa-lock"></i>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <nav aria-label="Page navigation">
                                <ul class="pagination custom-nav">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%> 
        <script src="./js/script.js"></script>
        <script src="./js/ajax.js"></script>
        <script>
            handleAll();
            handleAdmin();
        </script>
    </body>
</html>