<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <div id="page-my-info-change-password-box">
        <div class="container">
            <h2>Change password</h2>
            <div class="form-wrapper">
                <div class="error__mess-wrapper">
                    <span>${requestScope.mess}</span>
                    <i class="fas fa-times" onclick="document.querySelector('.error__mess-wrapper').style.display = 'none';"></i>
                </div>
                <form action="change-password" method="post">
                    <div class="PMI-wrapper">
                        <label for="oldPassword">Old Password</label>
                        <input type="password" name="oldPassword" value="" id="oldPassword" required>
                    </div>
                    <div class="PMI-wrapper">
                        <label for="newPassword">New Password</label>
                        <input type="password" name="newPassword" value="" id="newPassword" required>
                    </div>
                    <div class="PMI-wrapper">
                        <label for="cfNewPassword">Confirm New Password</label>
                        <input type="password" name="cfNewPassword" value="" id="cfNewPassword" required>
                    </div>
                    <input type="submit" value="Save">
                </form>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%> 
    <script src="./js/script.js"></script>
    <script>
        handleAll();
        handleChangePassword();
    </script>
</body>
</html>