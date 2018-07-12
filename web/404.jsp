<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/images/favicon.png">
    <title>您要访问的页面不存在</title>
    <!-- 图标与字体-->
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/ps-icon/style.css">
    <!-- CSS框架-->
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/owl-carousel/assets/owl.carousel.css">
    <!-- 自定义CSS-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/custom.css">
    <link rel="stylesheet" href="/css/404.css">
</head>

<body class="ps-loading">
    <%@ include file="header.jsp" %>
    <main class="ps-main">
        <div class="hint">
            <img class="hint_image" src="/images/hint/hint_404.png" >
        </div>
        <section class="error-container">
            <span class="four"><span class="screen-reader-text">4</span></span>
            <span class="zero"><span class="screen-reader-text">0</span></span>
            <span class="four"><span class="screen-reader-text">4</span></span>
        </section>
    </main>
    <%@ include file="footer.jsp" %>
    <!-- JS Library-->
    <script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-bar-rating/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="/plugins/owl-carousel/owl.carousel.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="/js/main.js"></script>
</body>

</html>
