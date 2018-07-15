<%@ page import="java.util.List" %>
<%@ page import="model.CommodityListItem" %>
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
	<title>商品列表</title>
	<!-- Fonts-->
	<link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/plugins/ps-icon/style.css">
	<!-- CSS Library-->
	<link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/plugins/owl-carousel/assets/owl.carousel.css">
	<link rel="stylesheet" href="/plugins/jquery-bar-rating/themes/fontawesome-stars.css">
	<link rel="stylesheet" href="/plugins/bootstrap-select/css/bootstrap-select.min.css">
	<link rel="stylesheet" href="/plugins/jquery-ui/jquery-ui.min.css">
	<!-- Custom-->
	<link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/list.css">
</head>
<%
	List<CommodityListItem> goodsList = (List<CommodityListItem>)request.getAttribute("CommodityListItem");
%>

<body class="ps-loading">
<%@ include file="header.jsp" %>
<main class="ps-main">
    <div class="ps-products-wrap pt-80 pb-80">
			<div class="ps-products" data-mh="product-listing">
				<div class="ps-product-action">
					<div class="ps-product__filter">
						<select class="ps-select selectpicker">
							<option value="1">筛选</option>
							<option value="2">价格升序</option>
							<option value="3">价格降序</option>
						</select>
					</div>
					<div class="ps-pagination">
						<ul class="pagination" id="page-select">
							<div style="display: none">
								<div id="lastPage">${requestScope.page.lastPage}</div>
								<div id="thisPage">${requestScope.page.thisPage}</div>
								<div id="nextPage">${requestScope.page.nextPage}</div>
								<div id="nextNextPage">${requestScope.page.nextNextPage}</div>
							</div>
							<c:if test="${requestScope.page.thisPage!=1}">
								<li><a id="page-select-1"><i class="fa fa-angle-left"></i></a></li>
							</c:if>
							<c:if test="${requestScope.page.lastPage!=-1}">
								<li><a id="page-select-2">${requestScope.page.lastPage}</a></li>
							</c:if>
							<c:if test="${requestScope.page.thisPage!=-1}">
								<li class="active"><a id="page-select-3">${requestScope.page.thisPage}</a></li>
							</c:if>
							<c:if test="${requestScope.page.nextPage!=-1}">
								<li><a id="page-select-4">${requestScope.page.nextPage}</a></li>
							</c:if>
							<c:if test="${requestScope.page.nextNextPage!=-1}">
								<li><a id="page-select-5">...</a></li>
							</c:if>
							<c:if test="${requestScope.page.nextPage!=-1}">
								<li><a id="page-select-6"><i class="fa fa-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
				</div>
                <% if (goodsList == null || goodsList.size()==0) {%>
                    <div class="ps-products-wrap pt-80 pb-80">
                        <div style="text-align: center;margin-bottom: 50px;">
                            <img src="/images/hint/hint_no_commodity.png" style="display: inline-block" >
                        </div>
                    </div>
                <% } else {%>
                    <div class="ps-product__columns">
                        <% for (int i = 0; i < goodsList.size(); i++) { %>
                            <div class="ps-product__column">
                            <div class="ps-shoe mb-30">
                                <div class="ps-shoe__thumbnail">
                                    <% if (goodsList.get(i).isNewProduct()) {%>
                                        <div class="ps-badge">
                                            <span>New</span>
                                        </div>
                                    <% } %>
                                    <% if (goodsList.get(i).isDiscount()) {%>
                                        <div class="ps-badge ps-badge--sale <% if (goodsList.get(i).isNewProduct()) {%>ps-badge--2nd<% } %>">
                                            <span><%=goodsList.get(i).getDiscount()%></span>
                                        </div>
                                    <% } %>
                                    <img src="<%=goodsList.get(i).getImages().get(0)%>" alt="">
                                    <a class="ps-shoe__overlay" href="/detail/<%=goodsList.get(i).getId()%>.html"></a>
                                </div>
                                <div class="ps-shoe__content">
                                    <div class="ps-shoe__variants">
                                        <div class="ps-shoe__variant normal">
                                            <% for (int j = 1; j <goodsList.get(i).getImages().size(); j++) {%>
                                                <img src="<%=goodsList.get(i).getImages().get(j)%>" alt="">
                                            <%}%>
                                        </div>
                                        <select class="ps-rating ps-shoe__rating">
                                            <% for (int cnt = 1; cnt <= 5; cnt++) {%>
                                                <% if (goodsList.get(i).getStarNum()<cnt ) { %>
                                                    <option value="1"><%=cnt%></option>
                                                <% } else { %>
                                                    <option value="2"><%=cnt%></option>
                                                <%}%>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="ps-shoe__detail">
                                        <a class="ps-shoe__name" href="/detail/<%=goodsList.get(i).getId()%>.html">
                                            <%=goodsList.get(i).getTitle()%>
                                        </a>
                                        <p class="ps-shoe__categories">
                                            <% for (int k = 0; k < goodsList.get(i).getTags().size(); k++) {%>
                                                <a href="/list.html?key=<%=goodsList.get(i).getTags().get(k)%>">
                                                <%=goodsList.get(i).getTags().get(k)%> </a>
                                            <%}%>
                                        </p>
                                        <span class="ps-shoe__price">
                                                <% if (goodsList.get(i).isDiscount()) {%>
                                                    <del>￥<%=goodsList.get(i).getoPrice()%></del>
                                                <% } %>
                                                ￥<%=goodsList.get(i).getdPrice()%>
                                            </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                <%}%>
			</div>
			<div class="ps-sidebar" data-mh="product-listing">
				<aside class="ps-widget--sidebar ps-widget--category">
					<div class="ps-widget__header">
						<h3>热门标签</h3>
					</div>
					<div class="ps-widget__content">
						<ul class="ps-list--arrow">
							<li><a href="/list.html?key=跑步鞋">跑步鞋</a></li>
							<li><a href="/list.html?key=篮球鞋">篮球鞋</a></li>
							<li><a href="/list.html?key=拖鞋">拖鞋</a></li>
							<li><a href="/list.html?key=Polo衫">Polo衫</a></li>
							<li><a href="/list.html?key=夹克">夹克</a></li>
							<li><a href="/list.html?key=装备">装备</a></li>
							<li><a href="/list.html?key=短裤">短裤</a></li>
						</ul>
					</div>
				</aside>
				<aside class="ps-widget--sidebar ps-widget--filter">
					<div class="ps-widget__header">
						<h3>价格区间</h3>
					</div>
					<div class="ps-widget__content">
						<div id="price-slider" class="ac-slider" data-default-min="300" data-default-max="2000" data-max="3450" data-step="50" data-unit="RMB"></div>
						<p class="ac-slider__meta">
                            价格:<span class="ac-slider__value ac-slider__min" id="min-price"></span>
                            -<span class="ac-slider__value ac-slider__max" id="max-price"></span>
                        </p>
                        <a class="ac-slider__filter ps-btn" id="price-filter-btn">筛选</a>
					</div>
				</aside>
				<div class="ps-sticky desktop">
					<aside class="ps-widget--sidebar">
						<div class="ps-widget__header">
							<h3>颜色</h3>
						</div>
						<div class="ps-widget__content">
							<ul class="ps-list--color">
								<li><a class="color-btn" value="绿"></a></li>
								<li><a class="color-btn" value="红"></a></li>
								<li><a class="color-btn" value="黄"></a></li>
								<li><a class="color-btn" value="棕"></a></li>
								<li><a class="color-btn" value="紫"></a></li>
								<li><a class="color-btn" value="蓝"></a></li>
								<li><a class="color-btn" value="黑"></a></li>
								<li><a class="color-btn" value="灰"></a></li>
								<li><a class="color-btn" value="褐"></a></li>
								<li><a class="color-btn" value="湖蓝"></a></li>
								<li><a class="color-btn" value="橙"></a></li>
								<li><a class="color-btn" value="青"></a></li>
							</ul>
						</div>
					</aside>
				</div>
			</div>
		</div>


	<%@ include file="footer.jsp" %>
</main>
<!-- JS Library-->
<script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/plugins/jquery-bar-rating/jquery.barrating.min.js"></script>
<script type="text/javascript" src="/plugins/owl-carousel/owl.carousel.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Custom scripts-->
<script type="text/javascript" src="/js/main.js"></script>
<script type="text/javascript" src="/js/list.js"></script>
</body>

</html>