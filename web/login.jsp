<%@ page import="tools.UrlFilter" %>
<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>617Store 登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- logo -->
    <link rel="shortcut icon" href="images/favicon.png">
    <!-- css -->
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/animate/animate.css">
    <link rel="stylesheet" href="css/account.css">
    <!-- js -->
    <script src="plugins/modernizr/modernizr-2.6.2.min.js"></script>
</head>

<%
    String referer = request.getHeader("referer");
    if (referer != null) {
        String pageURL = referer.substring(referer.lastIndexOf("/")+1);
        if (!pageURL.startsWith("login.html"))  {
            referer = UrlFilter.filterLogin(referer);
            session.setAttribute("referer",referer);
        }
    } else {
        session.setAttribute("referer","/index.html");
    }
%>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <a href="index.html"><img src="images/logo.png" class="animate-box" alt="" id="logo"></a>
                <!-- Start Sign In Form -->
                <form action="/api/login" method="post" class="account-form animate-box" data-animate-effect="fadeIn">
                    <h2>登录</h2>
                    <c:if test="${ param.status == 'Error' }">
                        <div class="form-group">
                            <div class="alert alert-danger" role="alert">用户名或密码错误</div>
                        </div>
                    </c:if>

                    <div class="form-group">
                        <label for="username" class="sr-only">用户名</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="用户名" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密码</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="密码" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="remember">
                            <input type="checkbox" id="remember"> 记住密码</label>
                    </div>
                    <div class="form-group">
                        <p>还没注册？ <a href="register.html">注册</a> | <a href="forgot.html">忘记密码？</a></p>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="登录" class="btn btn-primary">
                    </div>
                </form>
                <!-- END Sign In Form -->
            </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Placeholder -->
    <script src="plugins/jquery/jquery.placeholder.min.js"></script>
    <!-- Waypoints -->
    <script src="plugins/jquery/jquery.waypoints.min.js"></script>
    <!-- Main JS -->
    <script src="js/account.js"></script>
</body>

</html>
