<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="/images/favicon.png">
    <title>您要访问的页面不存在</title>
    <!-- 图标与字体-->
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/ps-icon/style.css">
    <!-- CSS框架-->
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <!-- 自定义CSS-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/custom.css">
    <link rel="stylesheet" href="/css/404.css">
    <link rel="stylesheet" href="/plugins/layui/layui.css" />
    <link rel="stylesheet" href="/css/shoppingCart.css" />2
</head>

<body class="ps-loading">
    <%@ include file="header.jsp" %>
    <main class="ps-main">
        <!--主要内容-->
        <div style="text-align: center"><h1 style="font-size: 20px;">购物车</h1></div>
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1" >
                <div class="layui-form">
                    <table class="ShopCartTable layui-table">
                        <thead>
                            <tr>
                                <th>
                                    <span>商品或服务名称</span>
                                </th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>小计</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="selectLeft">
                                    <span class="goodName">
                                        <img class="goodImg" />
                                    </span>
                                    <span class="goodName goodsName">
                                        <h2 class="goodname"></h2>
                                        <p class="goodGary">
                                            信息一<br>信息二
                                        </p>
                                    </span>
                                </td>
                                <td class="danPrice">{{tabledatas.price | moneyFiler}}</td>
                                <td>
                                    <i class="fa deleteBtn" aria-hidden="true">-</i>
                                    <input type="text" class="form-control numInput">
                                    <i class="fa addBtn" aria-hidden="true">+</i>
                                </td>
                                <td>
                                    <p class="totalPrice">{{tabledatas.price*tabledatas.num | moneyFiler}}</p>
                                </td>
                                <td>
                                    <p class="deletegoods">删除</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    <%@ include file="footer.jsp" %>
    <!-- JS Library-->
    <script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/plugins/owl-carousel/owl.carousel.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="/js/main.js"></script>
</body>

</html>
