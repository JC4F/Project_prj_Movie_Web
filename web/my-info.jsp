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
            <h2>Your Information</h2>
            <div class="form-wrapper">
                <form action="my-info" method="post"  enctype="multipart/form-data">
                    <div class="PMI-wrapper">
                        <img src="./images/${sessionScope.user_info.avatar}" alt="">
                        <label for="avatar">
                            <div class="change-avatar">
                                <i class="fas fa-camera"></i>
                            </div>
                            <input type="file" name="avatar" id="avatar">
                        </label>
                    </div>
                    <div class="PMI-wrapper">
                        <label for="fullname">Full Name</label>
                        <input type="text" name="fullname" value="${sessionScope.user_info.fullname}" id="fullname">
                    </div>
                    <div class="PMI-wrapper">
                        <label for="email">Email</label>
                        <input type="text" name="email" value="${sessionScope.user_info.email}" id="email">
                    </div>
                    <div class="PMI-wrapper">
                        <label for="phone">Phone Number</label>
                        <input type="text" name="phone" value="${sessionScope.user_info.phone}" id="phone">
                    </div>
                    <div class="PMI-wrapper">
                        <label for="male">Male</label>
                        <input type="radio" name="gender" value="1" id="male" ${((sessionScope.user_info.gender==true)?'checked':'')}/> 
                        &nbsp; &nbsp; &nbsp;
                        <label for="female">Female</label>
                        <input type="radio" name="gender" value="0" id="female" ${((sessionScope.user_info.gender==false)?'checked':'')}/>
                    </div>
                    <div class="PMI-wrapper">
                        <label for="birthday">Birthday</label>
                        <input type="date" name="birthday" value="${sessionScope.user_info.birth}" id="birthday" >
                    </div>
                    <div class="PMI-wrapper">
                        <div class="money-wrapper">
                            <label for="money">Account Money</label>
                            <a href="#">Earn more money</a>
                        </div>
                        <input type="text" name="money" value="$${sessionScope.user_info.acc_money}" id="money" readonly>
                    </div>
                    <input type="submit" value="Update">
                </form>
            </div>
        </div>
    </div>
    <%@include file="footer.jsp"%> 
    <script src="./js/script.js"></script>
    <script>
        handleAll();
        handleMyInfo();
    </script>
</body>
</html>