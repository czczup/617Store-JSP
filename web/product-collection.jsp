<%@ page import="model.CommodityListItem" %>
<%@ page import="java.util.List" %>
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
    <title>首页</title>
    <!-- 图标与字体-->
    <link rel="stylesheet" href="/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/plugins/ps-icon/style.css">
    <!-- CSS框架-->
    <link rel="stylesheet" href="/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/owl-carousel/assets/owl.carousel.css">
    <link rel="stylesheet" href="/plugins/jquery-bar-rating/themes/fontawesome-stars.css">
    <link rel="stylesheet" href="/plugins/slick/slick.css">
    <!-- 自定义CSS-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="ps-loading">
    <%@ include file="header.jsp" %>
    <main class="ps-main">
        <c:if test="${ sessionScope.user == null }">
            <div style="text-align: center;margin-bottom: 50px;">
                <img src="/images/hint/hint_collection_login.png" style="display: inline-block" >
            </div>
        </c:if>
        <c:if test="${ sessionScope.user != null }">
            <% List<CommodityListItem> collectionList = (List<CommodityListItem>)request.getAttribute("collectionList");%>
            <c:if test="${ fn:length(requestScope.collectionList) == 0 }">
                <div style="text-align: center;margin-bottom: 50px;">
                    <img src="/images/hint/hint_empty_collection.png" style="display: inline-block" >
                </div>
            </c:if>
            <c:if test="${ fn:length(requestScope.collectionList) != 0 }">
                <div class="ps-section--features-product ps-section masonry-root pt-100 pb-100">
                    <div class="ps-container">
                        <div class="ps-section__header mb-50">
                            <h3 class="ps-section__title" data-mask="collections">- 我的收藏（共有<%=collectionList.size()%>件商品）</h3>
                        </div>
                        <div class="ps-section__content pb-50">
                            <div class="masonry-wrapper" data-col-md="4" data-col-sm="2" data-col-xs="1" data-gap="30" data-radio="100%">
                                <div class="ps-masonry">
                                    <div class="grid-sizer"></div>
                                    <% for (int i = 0; i < collectionList.size(); i++) { %>
                                    <% CommodityListItem collection = collectionList.get(i); %>
                                    <div class="grid-item">
                                        <div class="grid-item__content-wrapper">
                                            <div class="ps-shoe mb-30">
                                                <div class="ps-shoe__thumbnail">
                                                    <% if (collection.isNewProduct()) { %>
                                                    <div class="ps-badge"><span>New</span></div>
                                                    <% } %>
                                                    <% if (collection.isDiscount()) { %>
                                                    <div class="ps-badge ps-badge--sale ps-badge--2nd">
                                                        <span><%=collection.getDiscount()%></span>
                                                    </div>
                                                    <% } %>
                                                    <a class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a>
                                                    <img src="<%=collection.getImages().get(0)%>" alt="">
                                                    <a class="ps-shoe__overlay" href="/detail/<%=collection.getId()%>.html"></a>
                                                </div>
                                                <div class="ps-shoe__content">
                                                    <div class="ps-shoe__variants">
                                                        <div class="ps-shoe__variant normal">
                                                            <% for (int j = 1; j <collection.getImages().size(); j++) {%>
                                                            <img src="<%=collection.getImages().get(j)%>" alt="">
                                                            <%}%>
                                                        </div>
                                                        <select class="ps-rating ps-shoe__rating">
                                                            <% for (int cnt = 1; cnt <= 5; cnt++) {%>
                                                            <% if (collection.getStarNum()<cnt ) { %>
                                                            <option value="1"><%=cnt%></option>
                                                            <% } else { %>
                                                            <option value="2"><%=cnt%></option>
                                                            <%}%>
                                                            <%}%>
                                                        </select>
                                                    </div>
                                                    <div class="ps-shoe__detail">
                                                        <a class="ps-shoe__name" href="/detail/<%=collection.getId()%>.html"><%=collection.getTitle()%></a>
                                                        <p class="ps-shoe__categories">
                                                            <% for (int k = 0; k < collection.getTags().size(); k++) {%>
                                                            <% if (k == 0) { %>
                                                            <a href="/list.html?key=<%=collection.getTags().get(k)%>">
                                                                <%=collection.getTags().get(k)%>
                                                            </a>
                                                            <% } else { %>
                                                            , <a href="/list.html?key=<%=collection.getTags().get(k)%>">
                                                            <%=collection.getTags().get(k)%>
                                                        </a>
                                                            <% } %>
                                                            <% } %>
                                                        </p>
                                                        <span class="ps-shoe__price">
						                                    <% if (collection.isDiscount()) {%>
                                                                <del>￥<%=collection.getoPrice()%></del>
                                                            <%}%>
                                                            ￥<%=collection.getdPrice()%>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <% } %>
                                </div>
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
    <script type="text/javascript" src="/plugins/imagesloaded.pkgd.js"></script>
    <script type="text/javascript" src="/plugins/isotope.pkgd.min.js"></script>
    <script type="text/javascript" src="/plugins/bootstrap-select/js/bootstrap-select.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="/js/main.js"></script>
    <script type="text/javascript" src="/js/list.js"></script>
</body>

</html>
