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
    <link rel="stylesheet" href="/plugins/revolution/css/settings.css">
    <link rel="stylesheet" href="/plugins/revolution/css/layers.css">
    <!-- 自定义CSS-->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/custom.css">
</head>

<body class="ps-loading">
    <%@ include file="header.jsp" %>
    <main class="ps-main">
        <div class="ps-banner">
            <div class="rev_slider fullscreenbanner" id="home-banner">
                <ul>
                    <c:forEach items="${requestScope.sliderList}" var="slider">
                        <c:if test="${slider.color=='white'}">
                            <li class="ps-banner" data-index="rs-${slider.id}" data-transition="random" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-rotate="0"><img class="rev-slidebg" src="${slider.image}" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" data-no-retina>
                                <div class="tp-caption ps-banner__header" data-x="left" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-150','-120','-150','-170']" data-width="['none','none','none','400']" data-type="text"
                                     data-responsive_offset="on" data-frames="[{&quot;delay&quot;:1000,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    <p>${slider.subtitle}</p>
                                </div>
                                <div class="tp-caption ps-banner__title" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-60','-40','-50','-70']" data-type="text" data-responsive_offset="on"
                                     data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    <p class="text-uppercase">${slider.title}</p>
                                </div>
                                <div class="tp-caption ps-banner__description" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['30','50','50','50']" data-type="text" data-responsive_offset="on"
                                     data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    <p>${slider.description}</p>
                                </div><a class="tp-caption ps-btn" href="/detail/${slider.commodityID}.html" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['120','140','200','200']" data-type="text"
                                         data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    立即选购<i class="ps-icon-next"></i></a>
                            </li>
                        </c:if>
                        <c:if test="${slider.color=='black'}">
                            <li class="ps-banner ps-banner--white" data-index="rs-${slider.id}" data-transition="random" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-rotate="0"><img class="rev-slidebg" src="${slider.image}" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" data-no-retina>
                                <div class="tp-caption ps-banner__header" data-x="left" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-150','-120','-150','-170']" data-width="['none','none','none','400']" data-type="text"
                                     data-responsive_offset="on" data-frames="[{&quot;delay&quot;:1000,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    <p>${slider.subtitle}</p>
                                </div>
                                <div class="tp-caption ps-banner__title" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['-60','-40','-50','-70']" data-type="text" data-responsive_offset="on"
                                     data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    <p class="text-uppercase">${slider.title}</p>
                                </div>
                                <div class="tp-caption ps-banner__description" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['30','50','50','50']" data-type="text" data-responsive_offset="on"
                                     data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1200,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    <p>${slider.description}</p>
                                </div><a class="tp-caption ps-btn" href="/detail/${slider.commodityID}.html" data-x="['left','left','left','left']" data-hoffset="['-60','15','15','15']" data-y="['middle','middle','middle','middle']" data-voffset="['120','140','200','200']" data-type="text"
                                         data-responsive_offset="on" data-textAlign="['center','center','center','center']" data-frames="[{&quot;delay&quot;:1500,&quot;speed&quot;:1500,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;x:50px;opacity:0;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]">
                                    立即选购<i class="ps-icon-next"></i></a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="ps-section--features-product ps-section masonry-root pt-100 pb-100">
            <div class="ps-container">
                <div class="ps-section__header mb-50">
                    <h3 class="ps-section__title" data-mask="features">- 特色商品</h3>
                </div>
                <div class="ps-section__content pb-50">
                    <div class="masonry-wrapper" data-col-md="4" data-col-sm="2" data-col-xs="1" data-gap="30" data-radio="100%">
                        <div class="ps-masonry">
                            <% List<CommodityListItem> recommendList = (List<CommodityListItem>)request.getAttribute("recommendList");%>
                            <div class="grid-sizer"></div>
                            <% for (int i = 0; i < recommendList.size(); i++) { %>
                                <% CommodityListItem recommend = recommendList.get(i); %>
                                <div class="grid-item">
                                    <div class="grid-item__content-wrapper">
                                        <div class="ps-shoe mb-30">
                                            <div class="ps-shoe__thumbnail">
                                                <% if (recommend.isNewProduct()) { %>
                                                    <div class="ps-badge"><span>New</span></div>
                                                <% } %>
                                                <% if (recommend.isDiscount()) { %>
                                                    <div class="ps-badge ps-badge--sale ps-badge--2nd">
                                                        <span><%=recommend.getDiscount()%></span>
                                                    </div>
                                                <% } %>
                                                <a class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a>
                                                <img src="<%=recommend.getImages().get(0)%>" alt="">
                                                <a class="ps-shoe__overlay" href="/detail/<%=recommend.getId()%>.html"></a>
                                            </div>
                                            <div class="ps-shoe__content">
                                                <div class="ps-shoe__variants">
                                                    <div class="ps-shoe__variant normal">
                                                        <% for (int j = 1; j <recommend.getImages().size(); j++) {%>
                                                        <img src="<%=recommend.getImages().get(j)%>" alt="">
                                                        <%}%>
                                                    </div>
                                                    <select class="ps-rating ps-shoe__rating">
                                                        <% for (int cnt = 1; cnt <= 5; cnt++) {%>
                                                            <% if (recommend.getStarNum()<cnt ) { %>
                                                                <option value="1"><%=cnt%></option>
                                                            <% } else { %>
                                                                <option value="2"><%=cnt%></option>
                                                            <%}%>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="ps-shoe__detail">
                                                    <a class="ps-shoe__name" href="/detail/<%=recommend.getId()%>.html"><%=recommend.getTitle()%></a>
                                                    <p class="ps-shoe__categories">
                                                        <% for (int k = 0; k < recommend.getTags().size(); k++) {%>
                                                            <% if (k == 0) { %>
                                                                <a href="/list.html?key=<%=recommend.getTags().get(k)%>">
                                                                    <%=recommend.getTags().get(k)%>
                                                                </a>
                                                            <% } else { %>
                                                                , <a href="/list.html?key=<%=recommend.getTags().get(k)%>">
                                                                    <%=recommend.getTags().get(k)%>
                                                                </a>
                                                            <% } %>
                                                        <% } %>
                                                    </p>
                                                    <span class="ps-shoe__price">
                                                        <% if (recommend.isDiscount()) {%>
                                                            <del>￥<%=recommend.getoPrice()%></del>
                                                        <%}%>
                                                        ￥<%=recommend.getdPrice()%>
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
        <div class="ps-section--offer">
            <%-- 两个黑色广告 --%>
            <div class="ps-column"><a class="ps-offer" href="list.html"><img src="images/banner/home-banner-1.png" alt=""></a></div>
            <div class="ps-column"><a class="ps-offer" href="list.html"><img src="images/banner/home-banner-2.png" alt=""></a></div>
        </div>

        <div class="ps-section ps-section--top-sales ps-owl-root pt-80 pb-80">
            <div class="ps-container">
                <div class="ps-section__header mb-50">
                    <div class="row">
                        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
                            <h3 class="ps-section__title" data-mask="BEST SALE">- 销量排行</h3>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 ">
                            <div class="ps-owl-actions">
                                <a class="ps-prev" href="#"><i class="ps-icon-arrow-right"></i>向前</a>
                                <a class="ps-next" href="#">向后<i class="ps-icon-arrow-left"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ps-section__content">
                    <div class="ps-owl--colection owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="30" data-owl-nav="false" data-owl-dots="false" data-owl-item="4" data-owl-item-xs="1" data-owl-item-sm="2" data-owl-item-md="3" data-owl-item-lg="4"
                        data-owl-duration="1000" data-owl-mousedrag="on">
                        <% List<CommodityListItem> rankList = (List<CommodityListItem>)request.getAttribute("rankList"); %>
                        <% for (int i = 0; i < rankList.size(); i++) { %>
                            <div class="ps-shoes--carousel">
                            <div class="ps-shoe">
                                <div class="ps-shoe__thumbnail">
                                    <% if (rankList.get(i).isNewProduct()) {%>
                                        <div class="ps-badge">
                                            <span>New</span>
                                        </div>
                                    <% } %>
                                    <% if (rankList.get(i).isDiscount()) {%>
                                        <div class="ps-badge ps-badge--sale <% if (rankList.get(i).isNewProduct()) {%>ps-badge--2nd<% } %>">
                                            <span><%=rankList.get(i).getDiscount()%></span>
                                        </div>
                                    <% } %>
                                    <a class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a>
                                    <img src="<%=rankList.get(i).getImages().get(0)%>" alt="">
                                    <a class="ps-shoe__overlay" href="/detail/<%=rankList.get(i).getId()%>.html"></a>
                                </div>
                                <div class="ps-shoe__content">
                                    <div class="ps-shoe__variants">
                                        <div class="ps-shoe__variant normal">
                                            <% for (int j = 1; j < rankList.get(i).getImages().size(); j++) {%>
                                                <img src="<%=rankList.get(i).getImages().get(j)%>" alt="">
                                            <%}%>
                                        </div>
                                        <select class="ps-rating ps-shoe__rating">
                                            <% for (int cnt = 1; cnt <= 5; cnt++) {%>
                                                <% if (rankList.get(i).getStarNum()<cnt ) { %>
                                                    <option value="1"><%=cnt%></option>
                                                <% } else { %>
                                                    <option value="2"><%=cnt%></option>
                                                <%}%>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="ps-shoe__detail">
                                        <a class="ps-shoe__name" href="/detail/<%=rankList.get(i).getId()%>.html">
                                            <%=rankList.get(i).getTitle()%>
                                        </a>
                                        <p class="ps-shoe__categories">
                                            <% for (int k = 0; k < rankList.get(i).getTags().size(); k++) {%>
                                                <a href="/list.html?key=<%=rankList.get(i).getTags().get(k)%>">
                                                <%=rankList.get(i).getTags().get(k)%> </a>
                                            <%}%>
                                        </p>
                                        <span class="ps-shoe__price">
                                        <% if (rankList.get(i).isDiscount()) {%>
                                            <del>￥<%=rankList.get(i).getoPrice()%></del>
                                        <%}%>
                                        ￥<%=rankList.get(i).getdPrice()%>
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
        <div class="ps-home-testimonial bg--parallax pb-80" data-background="images/background/parallax.jpg">
            <div class="container">
                <div class="owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="0" data-owl-nav="false" data-owl-dots="true" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000"
                    data-owl-mousedrag="on" data-owl-animate-in="fadeIn" data-owl-animate-out="fadeOut">
                    <%-- 个人介绍 --%>
                    <div class="ps-testimonial">
                        <div class="ps-testimonial__thumbnail"><img src="images/testimonial/1.jpg" alt=""><i class="fa fa-quote-left"></i></div>
                        <header>
                            <select class="ps-rating">
                                <option value="1">1</option>
                                <option value="1">2</option>
                                <option value="1">3</option>
                                <option value="1">4</option>
                                <option value="5">5</option>
                            </select>
                            <p>陈喆 - 信息与电子工程学院 & 软件工程162</p>
                        </header>
                        <footer>
                            <p>“风雨坎坷人生路，不经历风雨怎能见彩虹，成功也好，失败也罢，所有的事情都来的很自然，有失败就会有成功，有完美就会有缺陷，保持顺其自然的心境面对生活，面对正在发生的新鲜事物。曾经拥有的不要忘记，已经得到的要更加珍惜，属于自己的不要放弃，已经失去的就留作回忆，想要得到的就要更加努力。”</p>
                        </footer>
                    </div>
                    <div class="ps-testimonial">
                        <div class="ps-testimonial__thumbnail"><img src="images/testimonial/2.jpg" alt=""><i class="fa fa-quote-left"></i></div>
                        <header>
                            <select class="ps-rating">
                                <option value="1">1</option>
                                <option value="1">2</option>
                                <option value="1">3</option>
                                <option value="1">4</option>
                                <option value="5">5</option>
                            </select>
                            <p>许楠钒 - 信息与电子工程学院 & 软件工程162</p>
                        </header>
                        <footer>
                            <p>“每天每夜人们都庸庸碌碌，不管你付出的贡献或大或小，不管你的职责或轻或重，这些都是你的使命，不要那么不满足，想想自己已经很幸福了，还有许多许多人根本连生命都似乎都无法维持住，可他们还是那么顽强的坚持着，珍惜自己那无比宝贵的生命。在考虑问题时，要多些知足少些计较，只要知足就会快乐。”</p>
                        </footer>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-section ps-home-blog pt-80 pb-80">
            <div class="ps-container">
                <div class="ps-section__header mb-50">
                    <h2 class="ps-section__title" data-mask="Stories">- 品牌故事</h2>
                    <div class="ps-section__action"><a class="ps-morelink text-uppercase" href="#">查看全部<i class="fa fa-long-arrow-right"></i></a></div>
                </div>
                <div class="ps-section__content">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                            <div class="ps-post">
                                <div class="ps-post__thumbnail"><a class="ps-post__overlay" href="#"></a><img src="images/blog/1.jpg" alt=""></div>
                                <div class="ps-post__content"><a class="ps-post__title" href="#">An Inside Look at the Breaking2 Kit</a>
                                    <p class="ps-post__meta"><span>By:<a class="mr-5" href="#">Alena Studio</a></span> -<span class="ml-5">Jun 10, 2017</span></p>
                                    <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further…</p><a class="ps-morelink" href="#">Read more<i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                            <div class="ps-post">
                                <div class="ps-post__thumbnail"><a class="ps-post__overlay" href="#"></a><img src="images/blog/2.jpg" alt=""></div>
                                <div class="ps-post__content"><a class="ps-post__title" href="#">Unpacking the Breaking2 Race Strategy</a>
                                    <p class="ps-post__meta"><span>By:<a class="mr-5" href="#">Alena Studio</a></span> -<span class="ml-5">Jun 10, 2017</span></p>
                                    <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further…</p><a class="ps-morelink" href="#">Read more<i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 ">
                            <div class="ps-post">
                                <div class="ps-post__thumbnail"><a class="ps-post__overlay" href="#"></a><img src="images/blog/3.jpg" alt=""></div>
                                <div class="ps-post__content"><a class="ps-post__title" href="#">Nike’s Latest Football Cleat Breaks the Mold</a>
                                    <p class="ps-post__meta"><span>By:<a class="mr-5" href="#">Alena Studio</a></span> -<span class="ml-5">Jun 10, 2017</span></p>
                                    <p>Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further…</p><a class="ps-morelink" href="#">Read more<i class="fa fa-long-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ps-home-contact">
            <iframe src="http://www.google.cn/maps/embed?pb=!1m18!1m12!1m3!1d3447.6251654146267!2d120.02706231552949!3d30.21924398181902!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x344b7b079ea16cd9%3A0xb27b0cd2bf481461!2z5rWZ5rGf56eR5oqA5a2m6ZmiKOWwj-WSjOWxsSk!5e0!3m2!1szh-CN!2scn!4v1531022239026" id="contact-map" allowfullscreen></iframe>
            <div class="ps-home-contact__form">
                <header>
                    <h3>加入我们</h3>
                    <p>了解我们的公司概况、社区影响、发展动力<br/>与我们一起努力，打造更好的电商平台</p>
                </header>
                <footer>
                    <form action="product-listing.html" method="post">
                        <div class="form-group">
                            <label>姓名<span>*</span></label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label>邮箱<span>*</span></label>
                            <input class="form-control" type="email">
                        </div>
                        <div class="form-group">
                            <label>你的想法<span>*</span></label>
                            <textarea class="form-control" rows="4"></textarea>
                        </div>
                        <div class="form-group text-center">
                            <button class="ps-btn">发送<i class="fa fa-angle-right"></i></button>
                        </div>
                    </form>
                </footer>
            </div>
        </div>
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
    <script type="text/javascript" src="/plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script type="text/javascript" src="/plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
    <!-- Custom scripts-->
    <script type="text/javascript" src="/js/main.js"></script>
    <script type="text/javascript" src="/js/index.js"></script>
</body>

</html>
