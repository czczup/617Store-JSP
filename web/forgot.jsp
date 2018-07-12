<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>617Store 找回密码</title>
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
                <form action="#" class="account-form animate-box" data-animate-effect="fadeIn">
                    <h2>忘记密码</h2>
                    <%--<div class="form-group">--%>
                        <%--<div class="alert alert-success" role="alert">重置密码邮件已发送。</div>--%>
                    <%--</div>--%>
                    <div class="form-group">
                        <label for="email" class="sr-only">邮箱</label>
                        <input type="email" class="form-control" id="email" placeholder="邮箱" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <p><a href="login.html">登录</a> or <a href="register.html">注册</a></p>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="发送邮件" class="btn btn-primary">
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
