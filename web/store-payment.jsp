<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>结算清单</title>
<link type="text/css" rel="stylesheet" href="/css/payment.css">
</head>
<body>
<div class="container">
  <div class="receipt">
    <h2 class="receipt__title">感谢您的惠顾！</h2>
        <p class="receipt__subtitle">以下是您的购物清单：</p>
    <ul class="receipt__lines">
      <c:forEach items="${ requestScope.historyOrderList }" var="item" >
        <li class="receipt__line">
          <span class="receipt__line__item">${item.title}（数量${item.quantity}）</span>
          <span class="receipt__line__price">¥ ${item.sumPrice}</span>
        </li>
      </c:forEach>
    </ul>
    <p class="receipt__total">
      <span class="receipt__total__item">合计：</span>
      <span class="receipt__total__price">¥ ${requestScope.historySumPrice}</span>
    </p>
    <p class="receipt__back">
      <a href="/index.html">再去逛逛</a>
    </p>
  </div>
</div>
</body>
</html>
