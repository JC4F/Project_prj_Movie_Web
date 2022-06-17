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
            <div class="login-fail ${((requestScope.error==null)?'':'show')}">
                <h3>${requestScope.error}</h3>
                <span><i class="fas fa-times"></i></span>
            </div>
            <form action="login" method="post">
                <c:set value="${pageContext.request.cookies}" var="cookie"/>
                <h1>Login</h1>
                <div class="form-group">
                    <div class="form-control-wrapper ${((cookie.cname.value==null) ? '':'has-text')}">
                        <input type="text" name="username" class="form-control" id="username" value="${cookie.cname.value}">
                        <label for="username">Username</label>
                    </div>
                    <span class="form-message"></span>
                </div>
                <div class="form-group">
                    <div class="form-control-wrapper ${((cookie.cpass.value==null) ? '':'has-text')}">
                        <input type="password" name="password" class="form-control" id="password" value="${cookie.cpass.value}">
                        <label for="password">Password</label>
                    </div>
                    <span class="form-message"></span>
                </div>
                <button type="submit" class="form-submit">Login</button>
                <div class="other-wrapper d-flex justify-content-between">
                    <label class="keep-login" for="reminde-me">
                        Remind me
                        <input type="checkbox" ${(cookie.crem.value!=null?'checked':'')} name="reminde-me" id="reminde-me" value="On">
                        <span class="checkmark"></span>
                    </label>
                    <a href="#">Forgot Password?</a>
                </div>
            </form>
            <div class="link-to-rest">
                Don't have an account?
                <a href="signup">Sign up</a>
            </div>
            <!-- them none de an hien the p thu 2 -->
            <div class="captcha-wrapper none">
                <p>Trang này được Google reCAPTCHA bảo vệ để đảm bảo bạn không phải là robot.
                    <span>Tìm hiểu thêm.</span>
                </p>
                <p>Thông tin do Google reCAPTCHA thu thập sẽ tuân theo <span>Chính sách Quyền riêng tư</span> and <span>Điều khoản dịch vụ</span> của Google, và được dùng để cung cấp, duy trì và cải thiện dịch vụ reCAPTCHA cũng như các mục đích bảo mật nói chung (thông tin này không được dùng để cá nhân hóa quảng cáo của Google).</p>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%> 
    <script src="./js/script.js"></script>
    <script>
        handleLogin();
    </script>
</body>
</html>