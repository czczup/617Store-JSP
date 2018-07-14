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
    <title>购物车</title>
    <!-- 图标与字体-->
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/ps-icon/style.css">
    <!-- CSS框架-->
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/plugins/jquery-bar-rating/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/plugins/bootstrap-select/css/bootstrap-select.min.css">
    <!-- 自定义CSS-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/custom.css">
    <link rel="stylesheet" href="/plugins/layui/layui.css" />
    <link rel="stylesheet" href="/css/shoppingCart.css" />
</head>

<body class="ps-loading">
    <%@ include file="header.jsp" %>
    <main class="ps-main">
        <!--主要内容-->
        <c:if test="${ sessionScope.user == null }">
            <div style="text-align: center;margin-bottom: 50px;">
                <img src="/images/hint/hint_cart_login2.png" style="display: inline-block" >
            </div>
        </c:if>
        <c:if test="${ sessionScope.user != null }">
            <c:if test="${fn:length(requestScope.cartList)==0}">
                <div style="text-align: center;margin-bottom: 50px;">
                    <img src="/images/hint/hint_cart_empty.png" style="display: inline-block" >
                </div>
            </c:if>
            <c:if test="${fn:length(requestScope.cartList)!=0}">
                <div style="text-align: center">
                    <h1 class="cart-title">购物车</h1>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1" >
                        <div class="layui-form">
                            <table class="ShopCartTable layui-table">
                                <thead>
                                    <tr>
                                        <th><span>商品名称与具体信息</span></th>
                                        <th>单价</th>
                                        <th width="200px">数量</th>
                                        <th>小计</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${ requestScope.cartList }" var="cart" >
                                    <tr>
                                        <td class="selectLeft">
                                            <span class="goodName">
                                                <a href="/detail/${cart.commodityId}.html"><img class="goodImg" src="${cart.image}"/></a>
                                            </span>
                                            <span class="goodName goodsName">
                                                <div style="display: none" class="cartId">${cart.id}</div>
                                                <div style="display: none" class="goodId">${cart.commodityId}</div>
                                                <h2 class="goodname">${cart.title}</h2>
                                                <p class="goodGary">
                                                    <c:if test="${cart.attrWithImage == 'null'}">
                                                        <span class="goodAttr-1" style="display: none">${cart.attrWithImage}</span><br>
                                                    </c:if>
                                                    <c:if test="${cart.attrWithImage != 'null'}">
                                                        <span class="goodAttr-1">${cart.attrWithImage}</span><br>
                                                    </c:if>

                                                    <c:if test="${cart.attrWithoutImage == 'null'}">
                                                        <span class="goodAttr-2" style="display: none">${cart.attrWithoutImage}</span><br>
                                                    </c:if>
                                                    <c:if test="${cart.attrWithoutImage != 'null'}">
                                                        <span class="goodAttr-2">${cart.attrWithoutImage}</span>
                                                    </c:if>
                                                </p>
                                            </span>
                                        </td>
                                        <td class="danPrice">${cart.price}</td>
                                        <td>
                                            <i class="fa deleteBtn" aria-hidden="true">-</i>
                                            <input type="text" class="form-control numInput" value="${cart.quantity}">
                                            <i class="fa addBtn" aria-hidden="true">+</i>
                                        </td>
                                        <td>
                                            <p class="totalPrice">${cart.sumPrice}</p>
                                        </td>
                                        <td>
                                            <p class="deletegoods">删除</p>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="row tablefooter">
                                <span class="servicenum">已选择<span class="goodsNum">${requestScope.cartSimple.cartAmount}</span>件商品</span>
                                <span class="SettlementBtn">
                            <span class="totalclassPoin">
                                总价：<span class="totalMoneyClass">${requestScope.cartSimple.cartPrice}</span>&nbsp;元
                            </span>
                            <a href="/payment.html"><span class="SettlementBtn">去结算</span></a>
                        </span>
                            </div>

                        </div>
                    </div>
                </div>
            </c:if>
        </c:if>
    </main>
    <%@ include file="footer.jsp" %>
    <!-- JS Library-->
    <script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/plugins/jquery-bar-rating/jquery.barrating.min.js"></script>
    <script type="text/javascript" src="/plugins/owl-carousel/owl.carousel.min.js"></script>
    <%--<!-- Custom scripts-->--%>
    <script type="text/javascript" src="/js/main.js"></script>
    <script type="text/javascript" src="/js/cart.js"></script>
</body>

</html>
