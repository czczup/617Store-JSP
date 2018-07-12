<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>617Store 注册</title>
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

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <a href="index.html"><img src="images/logo.png" class="animate-box" alt="" id="logo"></a>
                <!-- Start Sign In Form -->
                <form action="/api/register" method="post" class="account-form animate-box" data-animate-effect="fadeIn">
                    <h2>注册</h2>
                    <c:if test="${ param.status == 'Error' }">
                        <div class="form-group">
                            <div class="alert alert-danger" role="alert">用户名已被注册</div>
                        </div>
                    </c:if>
                    <c:if test="${ param.status == 'Empty' }">
                        <div class="form-group">
                            <div class="alert alert-danger" role="alert">输入不能为空</div>
                        </div>
                    </c:if>
                    <c:if test="${ param.status == 'Success' }">
                        <div class="form-group">
                            <div class="alert alert-success" role="alert">注册成功</div>
                            <%response.setHeader("Refresh", "3;URL=index.html");%>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label for="name" class="sr-only">用户名</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="用户名" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密码</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="密码" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label for="email" class="sr-only">邮箱</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="邮箱" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <p>已注册？ <a href="login.html">登录</a></p>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="注册" class="btn btn-primary">
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
