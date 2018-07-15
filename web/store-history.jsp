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
                <img src="/images/hint/hint_payment_login.png" style="display: inline-block" >
            </div>
        </c:if>
        <c:if test="${ sessionScope.user != null }">
            <c:if test="${fn:length(requestScope.historyPaymentList)==0}">
                <div style="text-align: center;margin-bottom: 50px;">
                    <img src="/images/hint/hint_no_history_payment.png" style="display: inline-block" >
                </div>
            </c:if>
            <c:if test="${fn:length(requestScope.historyPaymentList)!=0}">
                <div style="text-align: center">
                    <h1 class="cart-title">历史订单</h1>
                </div>
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1" >
                        <div class="layui-form">
                            <c:forEach items="${ requestScope.historyPaymentList }" var="payment" >
                                <table class="ShopCartTable layui-table" style="margin-bottom: 50px">
                                    <thead>
                                    <tr>
                                        <th colspan="4" style="background-color: #e2e2e2">
                                            <b style="color: #5e5e5e">
                                                订单编号：${payment.id}&nbsp;&nbsp;
                                                付款日期：${payment.payDate}&nbsp;&nbsp;
                                                商品数量：${payment.quantity}&nbsp;&nbsp;
                                                总金额：${payment.price}&nbsp;&nbsp;
                                            </b>
                                        </th>

                                    </tr>
                                    </thead>
                                    <thead>
                                        <tr>
                                            <th><span>商品名称与具体信息</span></th>
                                            <th>单价</th>
                                            <th width="200px">数量</th>
                                            <th>小计</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ payment.orderList }" var="order" >
                                            <tr>
                                                <td class="selectLeft">
                                                    <span class="goodName">
                                                        <a href="/detail/${order.commodityId}.html"><img class="goodImg" src="${order.image}"/></a>
                                                    </span>
                                                    <span class="goodName goodsName">
                                                        <div style="display: none" class="goodId">${order.commodityId}</div>
                                                        <h2 class="goodname">${order.title}</h2>
                                                        <p class="goodGary">
                                                            <c:if test="${order.attrWithImage == 'null'}">
                                                                <span class="goodAttr-1" style="display: none">${order.attrWithImage}</span><br>
                                                            </c:if>
                                                            <c:if test="${order.attrWithImage != 'null'}">
                                                                <span class="goodAttr-1">${order.attrWithImage}</span><br>
                                                            </c:if>

                                                            <c:if test="${order.attrWithoutImage == 'null'}">
                                                                <span class="goodAttr-2" style="display: none">${order.attrWithoutImage}</span><br>
                                                            </c:if>
                                                            <c:if test="${order.attrWithoutImage != 'null'}">
                                                                <span class="goodAttr-2">${order.attrWithoutImage}</span>
                                                            </c:if>
                                                        </p>
                                                    </span>
                                                </td>
                                                <td class="danPrice">${order.price}</td>
                                                <td>
                                                    <p>${order.quantity}</p>
                                                </td>
                                                <td>
                                                    <p class="totalPrice">${order.sumPrice}</p>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:forEach>
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
