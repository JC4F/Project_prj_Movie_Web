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