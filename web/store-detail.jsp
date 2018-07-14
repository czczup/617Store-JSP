<%@ page pageEncoding="utf-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.CommodityListItem" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %>
<%@ page import="controller.HandleProductDetail" %>
<%@ page import="model.Detail" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/images/favicon.png">
    <title>${requestScope.detail.commodity.title}</title>
    <!-- Fonts-->
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/ps-icon/style.css">
    <!-- CSS Library-->
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/plugins/jquery-bar-rating/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/plugins/slick/slick.css">
    <link rel="stylesheet" href="/plugins/bootstrap-select/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/plugins/Magnific-Popup/magnific-popup.css">
    <!-- Custom-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>


<body class="ps-loading">
    <%@ include file="header.jsp" %>
    <main class="ps-main">
        <div class="test">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-product--detail pt-60">
            <div class="ps-container">
                <div class="row">
                    <div class="col-lg-10 col-md-12 col-lg-offset-1">
                        <div class="ps-product__thumbnail">
                            <div class="ps-product__preview">
                                <div class="ps-product__variants">
                                    <c:forEach items="${requestScope.detail.images}" var="image">
                                        <div class="item"><img src="${image}" alt=""></div>
                                    </c:forEach>
                                </div><a class="popup-youtube ps-product__video" href=""><img src="${requestScope.detail.images[0]}" alt=""><i class="fa fa-play"></i></a>
                            </div>
                            <div class="ps-product__image">
                                <c:forEach items="${requestScope.detail.images}" var="image">
                                    <div class="item"><img class="zoom" src="${image}" alt="" data-zoom-image="${image}"></div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="ps-product__thumbnail--mobile">
                            <div class="ps-product__main-img"><img src="${requestScope.detail.images[0]}" alt=""></div>
                            <div class="ps-product__preview owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="20" data-owl-nav="true" data-owl-dots="false" data-owl-item="3" data-owl-item-xs="3" data-owl-item-sm="3" data-owl-item-md="3" data-owl-item-lg="3"
                                data-owl-duration="1000" data-owl-mousedrag="on">
                                <c:forEach items="${requestScope.detail.images}" var="image">
                                    <img src="${image}" alt="">
                                </c:forEach>
                            </div>
                        </div>
                        <div class="ps-product__info">
                            <div class="ps-product__rating">
                                <select class="ps-rating">
                                    <c:forEach var="i" begin="1" end="5">
                                        <c:choose>
                                            <c:when test="${i <= requestScope.detail.starNum}">
                                                <option value="1">${i}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="2">${i}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                                &nbsp;&nbsp;
                                <fmt:formatNumber value="${requestScope.detail.starNum}" maxFractionDigits="1" />星
                                <a>(共有${fn:length(requestScope.detail.comments)}篇评论)</a>
                            </div>
                            <div style="display: none" id="commodity-id">${requestScope.detail.commodity.id}</div>
                            <h1>${ requestScope.detail.commodity.title }</h1>
                            <p class="ps-product__category">
                                <c:forEach items="${requestScope.detail.tags}" var="tag" varStatus="status">
                                    <c:if test="${status.count != 1}">,</c:if>
                                    <a href="/list.html?key=${tag}">${tag}</a>
                                </c:forEach>
                            </p>
                            <h3 class="ps-product__price" id="product-price">
                                <c:choose>
                                    <c:when test="${requestScope.detail.commodity.discountPrice == requestScope.detail.commodity.originalPrice}">
                                        ¥ <span class="discount-price"><fmt:formatNumber value="${requestScope.detail.commodity.discountPrice}" maxFractionDigits="2" /></span>
                                    </c:when>
                                    <c:otherwise>
                                        ¥ <span class="discount-price"><fmt:formatNumber value="${requestScope.detail.commodity.discountPrice}" maxFractionDigits="2" /></span>
                                        <del> ¥ <fmt:formatNumber value="${requestScope.detail.commodity.originalPrice}" maxFractionDigits="2" /></del>
                                    </c:otherwise>
                                </c:choose>
                            </h3>
                            <div class="ps-product__block ps-product__quickview">
                                <h4>简介</h4>
                                <p>${ requestScope.detail.commodity.quickReview }</p>
                            </div>
                            <c:forEach items="${ requestScope.detail.paramWithImage }" var="map" >
                                <div class="ps-product__block ps-product__style">
                                    <h4 class="select-1">选择${map.key}</h4>
                                    <ul>
                                        <c:forEach items="${ map.value }" var="image" >
                                            <li><a class="pickers"><img src="${image.value}" alt="${image.key}"></a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:forEach>


                            <div class="ps-product__block ps-product__size">
                                <c:forEach items="${ requestScope.detail.paramWithoutImage }" var="map" >
                                    <h4><span class="select-2">选择${map.key}</span><a href="#">尺码对照表</a></h4>
                                    <select class="ps-select selectpicker">
                                        <option value="1">选择${map.key}</option>
                                        <c:forEach items="${ map.value }" var="item" >
                                            <option value="2">${item}</option>
                                        </c:forEach>
                                    </select>
                                </c:forEach>
                                <c:if test="${fn:length(requestScope.detail.paramWithoutImage)==0}">
                                    <h4>选择商品数量</h4>
                                </c:if>
                                <div class="form-group">
                                    <input id="amount-choose" class="form-control" type="number" value="1">
                                </div>
                            </div>
                            <div class="ps-product__shopping"><a class="ps-btn mb-10" style="cursor:pointer" id="cartButton">加入购物车<i class="ps-icon-next"></i></a>
                                <div class="ps-product__actions">
                                    <c:if test="${ sessionScope.user == null }">
                                        <a class="mr-10" id="collection-heart" style="cursor:pointer"><i class="ps-icon-heart"></i></a>
                                    </c:if>
                                    <c:if test="${ sessionScope.user != null }">
                                        <%
                                            Detail detail = (Detail)request.getAttribute("detail");
                                            int id = detail.getCommodity().getId();
                                            int userId = user.getId();
                                            Boolean flag = HandleProductDetail.getIsCollection(id,userId);
                                        %>
                                        <% if (flag) { %>
                                            <a class="mr-10" id="collection-heart" style="cursor:pointer;background-color:#50CF96;" collected="true"><i class="ps-icon-heart"></i></a>
                                        <% } else { %>
                                            <a class="mr-10" id="collection-heart" style="cursor:pointer"><i class="ps-icon-heart"></i></a>
                                        <% } %>
                                    </c:if>

                                    <a style="cursor:pointer"><i class="ps-icon-share"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="ps-product__content mt-50">
                            <ul class="tab-list" role="tablist">
                                <li class="active"><a href="#tab_01" aria-controls="tab_01" role="tab" data-toggle="tab">商品详情</a></li>
                                <li><a href="#tab_02" aria-controls="tab_02" role="tab" data-toggle="tab">用户评论</a></li>
                                <li><a href="#tab_03" aria-controls="tab_03" role="tab" data-toggle="tab">商品标签</a></li>
                            </ul>
                        </div>
                        <div class="tab-content mb-60">
                            <div class="tab-pane active" role="tabpanel" id="tab_01" style="text-align: center">
                                <img src="${requestScope.detail.commodity.overview}" style="display: inline-block" >
                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab_02">
                                <p class="mb-20"><strong>本商品共有${ fn:length(requestScope.detail.comments) }条评论</strong></p>
                                <c:forEach items="${ requestScope.detail.comments }" var="comment" varStatus="status">
                                    <div class="ps-review">
                                        <div class="ps-review__thumbnail"><img src="${comment.user.avatar}" alt=""></div>
                                        <div class="ps-review__content">
                                            <header>
                                                <select class="ps-rating">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <c:choose>
                                                            <c:when test="${i <= comment.starNum }">
                                                                <option value="1">${i}</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="2">${i}</option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                                <p><a href="">${comment.user.username}</a> - ${comment.postDate}</p>
                                            </header>
                                            <p>${comment.comment}</p>
                                        </div>
                                    </div>
                                </c:forEach>

                                <form class="ps-product__review" action="_action" method="post">
                                    <c:if test="${ sessionScope.user == null }">
                                        <div style="text-align: center">
                                            <img src="/images/hint/hint_comment_login.png" style="display: inline-block" >
                                        </div>
                                    </c:if>
                                    <c:if test="${ sessionScope.user != null }">
                                        <h4>发布您的评价</h4>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 ">
                                                <div class="form-group">
                                                    <label>您的评分<span></span></label>
                                                    <select class="ps-rating">
                                                        <option value="1">1</option>
                                                        <option value="1">2</option>
                                                        <option value="1">3</option>
                                                        <option value="1">4</option>
                                                        <option value="5">5</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-8 col-sm-6 col-xs-12 ">
                                                <div class="form-group">
                                                    <label>您的评价：</label>
                                                    <textarea class="form-control" rows="6"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <button class="ps-btn ps-btn--sm">提交评论<i class="ps-icon-next"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </form>
                            </div>
                            <div class="tab-pane" role="tabpanel" id="tab_03">
                                <c:if test="${ sessionScope.user == null }">
                                    <div style="text-align: center">
                                        <img src="/images/hint/hint_tag_login.png" style="display: inline-block" >
                                    </div>
                                </c:if>
                                <c:if test="${ sessionScope.user != null }">
                                    <p>添加你的标签 <span> *</span></p>
                                    <form class="ps-product__tags" action="_action" method="post">
                                        <div class="form-group">
                                            <input class="form-control" type="text" placeholder="">
                                            <button class="ps-btn ps-btn--sm">添加标签</button>
                                        </div>
                                    </form>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-section ps-section--top-sales ps-owl-root pt-40 pb-80">
            <div class="ps-container">
                <div class="ps-section__header mb-50">
                    <div class="row">
                        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
                            <h3 class="ps-section__title" data-mask="Related">- 猜你喜欢</h3>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                            <div class="ps-owl-actions"><a class="ps-prev" href="#"><i class="ps-icon-arrow-right"></i>Prev</a><a class="ps-next" href="#">Next<i class="ps-icon-arrow-left"></i></a></div>
                        </div>
                    </div>
                </div>
                <div class="ps-section__content">
                    <div class="ps-owl--colection owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="30" data-owl-nav="false" data-owl-dots="false" data-owl-item="4" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4"
                        data-owl-duration="1000" data-owl-mousedrag="on">
                        <% List<CommodityListItem> goodsList = (List<CommodityListItem>)request.getAttribute("CommodityListItem"); %>
                        <% for (int i = 0; i < goodsList.size(); i++) { %>
                            <div class="ps-shoes--carousel">
                                <div class="ps-shoe">
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
                                        <a class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a>
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
    <script type="text/javascript" src="/plugins/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="/plugins/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="/plugins/slick/slick.min.js"></script>
    <script type="text/javascript" src="/plugins/elevatezoom/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="/plugins/Magnific-Popup/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="/js/main.js"></script>
    <script type="text/javascript" src="/js/store.js"></script>
</body>

</html>
