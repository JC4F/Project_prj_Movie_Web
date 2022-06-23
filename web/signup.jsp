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
</head>
<body>
    <div id="form-content">
        <div class="form-background">
            <img src="./images/yone-yasuo.gif" alt="bg">
        </div>
        <div class="logo-wrapper">
            <a href="./index.jsp" class="fixed-logo">
                <img src="./images/logo-default.png" alt="logo-img">
            </a>
        </div>
        <div class="form-wrapper mx-auto">
            <form action="signup" method="post">
                <h1>Sign up</h1>
                <div class="form-group">
                    <div class="form-control-wrapper">
                        <input type="text" name="username" class="form-control" id="username" value="">
                        <label for="username">Username</label>
                    </div>
                    <span class="form-message input_un">${requestScope.errorU}</span>
                </div>
                <div class="form-group">
                    <div class="form-control-wrapper">
                        <input type="password" name="password" class="form-control" id="password"  value="">
                        <label for="password">Password</label>
                    </div>
                    <span class="form-message input_pw">${requestScope.errorP}</span>
                </div>
                <div class="form-group">
                    <div class="form-control-wrapper">
                        <input type="password" name="password_confirmation" class="form-control" id="password_confirmation" value="">
                        <label for="password_confirmation">Confirm Password</label>
                    </div>
                    <span class="form-message re_password">${requestScope.errorRP}</span>
                </div>
                <button class="form-submit">Login</button>
                <div class="other-wrapper d-flex justify-content-between">
                    <label class="keep-login" for="agree-policy">
                        I agree with Terms of Service.
                        <input type="checkbox" name="agree-policy" id="agree-policy">
                        <span class="checkmark"></span>
                        <p class="agree-error"></p>
                    </label>
                    <a href="#">Help</a>
                </div>
            </form>
            <div class="link-to-rest">
                Already a Member?
                <a href="./login.jsp">Go to login</a>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%> 
    <script src="./js/script.js"></script>
    <script>
       handleSignUp();
    </script>
</body>
</html>