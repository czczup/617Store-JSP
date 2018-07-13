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
</head>
<%
	List<CommodityListItem> goodsList = (List<CommodityListItem>)request.getAttribute("CommodityListItem");
%>

<body class="ps-loading">
<%@ include file="header.jsp" %>
<main class="ps-main">
    <% if (goodsList == null) {%>
		<div class="ps-products-wrap pt-80 pb-80"><h1 class="h1" style="text-align: center">当前无商品数据，请稍后重试</h1></div>
	<% } %>
    <% if (goodsList != null) {%>
		<div class="ps-products-wrap pt-80 pb-80">
			<div class="ps-products" data-mh="product-listing">
				<div class="ps-product-action">
					<div class="ps-product__filter">
						<select class="ps-select selectpicker">
							<option value="1">筛选</option>
							<option value="2">商品名</option>
							<option value="3">价格升序</option>
							<option value="3">价格降序</option>
						</select>
					</div>
					<div class="ps-pagination">
						<ul class="pagination">
							<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
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
                                            <%}%>
                                            ￥<%=goodsList.get(i).getdPrice()%>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
				</div>
				<div class="ps-product-action">
					<div class="ps-product__filter">
						<select class="ps-select selectpicker">
							<option value="1">筛选</option>
							<option value="2">商品名</option>
							<option value="3">价格升序</option>
							<option value="3">价格降序</option>
						</select>
					</div>
					<div class="ps-pagination">
						<ul class="pagination">
							<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">...</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="ps-sidebar" data-mh="product-listing">
				<aside class="ps-widget--sidebar ps-widget--category">
					<div class="ps-widget__header">
						<h3>标签</h3>
					</div>
					<div class="ps-widget__content">
						<ul class="ps-list--checked">
							<li class="current"><a href="product-listing.html">Life(521)</a></li>
							<li><a href="product-listing.html">Running(76)</a></li>
							<li><a href="product-listing.html">Baseball(21)</a></li>
							<li><a href="product-listing.html">Football(105)</a></li>
							<li><a href="product-listing.html">Soccer(108)</a></li>
							<li><a href="product-listing.html">Trainning & game(47)</a></li>
							<li><a href="product-listing.html">More</a></li>
						</ul>
					</div>
				</aside>
				<aside class="ps-widget--sidebar ps-widget--filter">
					<div class="ps-widget__header">
						<h3>Category</h3>
					</div>
					<div class="ps-widget__content">
						<div class="ac-slider" data-default-min="300" data-default-max="2000" data-max="3450" data-step="50" data-unit="$"></div>
						<p class="ac-slider__meta">Price:<span class="ac-slider__value ac-slider__min"></span>-<span class="ac-slider__value ac-slider__max"></span></p><a class="ac-slider__filter ps-btn" href="#">Filter</a>
					</div>
				</aside>
				<aside class="ps-widget--sidebar ps-widget--category">
					<div class="ps-widget__header">
						<h3>Shoe Brand</h3>
					</div>
					<div class="ps-widget__content">
						<ul class="ps-list--checked">
							<li class="current"><a href="product-listing.html">Nike(521)</a></li>
							<li><a href="product-listing.html">Adidas(76)</a></li>
							<li><a href="product-listing.html">Baseball(69)</a></li>
							<li><a href="product-listing.html">Gucci(36)</a></li>
							<li><a href="product-listing.html">Dior(108)</a></li>
							<li><a href="product-listing.html">B&G(108)</a></li>
							<li><a href="product-listing.html">Louis Vuiton(47)</a></li>
						</ul>
					</div>
				</aside>
				<div class="ps-sticky desktop">
					<aside class="ps-widget--sidebar">
						<div class="ps-widget__header">
							<h3>Size</h3>
						</div>
						<div class="ps-widget__content">
							<table class="table ps-table--size">
								<tbody>
								<tr>
									<td class="active">3</td>
									<td>5.5</td>
									<td>8</td>
									<td>10.5</td>
									<td>13</td>
								</tr>
								<tr>
									<td>3.5</td>
									<td>6</td>
									<td>8.5</td>
									<td>11</td>
									<td>13.5</td>
								</tr>
								<tr>
									<td>4</td>
									<td>6.5</td>
									<td>9</td>
									<td>11.5</td>
									<td>14</td>
								</tr>
								<tr>
									<td>4.5</td>
									<td>7</td>
									<td>9.5</td>
									<td>12</td>
									<td>14.5</td>
								</tr>
								<tr>
									<td>5</td>
									<td>7.5</td>
									<td>10</td>
									<td>12.5</td>
									<td>15</td>
								</tr>
								</tbody>
							</table>
						</div>
					</aside>
					<aside class="ps-widget--sidebar">
						<div class="ps-widget__header">
							<h3>Color</h3>
						</div>
						<div class="ps-widget__content">
							<ul class="ps-list--color">
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
							</ul>
						</div>
					</aside>
				</div>
			</div>
		</div>
    <%}%>

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