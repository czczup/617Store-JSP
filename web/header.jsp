<%@ page import="tools.UrlFilter" %>
<%@ page import="controller.HandleDisplayCart" %>
<%@ page import="model.User" %>
<%@ page import="model.CartSimple" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String url = request.getQueryString();
    System.out.println(url);
    String href = UrlFilter.filterLogout(url);
    User user = (User)session.getAttribute("user");
    CartSimple cart = null;
    if (user != null) {
        cart = HandleDisplayCart.getSimpleInfo(user.getId());
    }
%>
<div class="header--sidebar"></div>
<header class="header">
    <div class="header__top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 ">
                    <p>浙江科技学院，信息与电子工程学院，陈喆 许楠钒</p>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12 ">
                    <div class="header__actions">
                        <c:if test="${ param.status == 'Logout' }">
                            <% session.removeAttribute("user"); %>
                        </c:if>
                        <c:if test="${ sessionScope.user == null }">
                            <a href="/login.html">登录</a>
                            <a href="/register.html">注册</a>
                        </c:if>
                        <c:if test="${ sessionScope.user != null }">
                            <div class="btn-group ps-dropdown">
                                <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    ${ user.username }
                                    <div style="display: none" id="user-id">${user.id}</div>
                                    <i class="fa fa-angle-down"></i>
                                </a>

                                <ul class="dropdown-menu">
                                    <li><a href="/login.html">切换账户</a></li>
                                    <%--<li><a href="&status=123">退出登录</a></li>--%>
                                    <li><a href="<%=href%>">退出登录</a></li>
                                </ul>
                            </div>
                        </c:if>
                        <div class="btn-group ps-dropdown">
                            <a href="/collection.html">收藏夹</a>
                        </div>
                        <div class="btn-group ps-dropdown">
                            <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">我的账户<i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">我的资料</a></li>
                                <li><a href="#">收货地址</a></li>
                                <li><a href="#">投诉订单</a></li>
                            </ul>
                        </div>
                        <div class="btn-group ps-dropdown">
                            <a href="#">我的订单</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <nav class="navigation">
        <div class="container-fluid">
            <div class="navigation__column left">
                <div class="header__logo"><a class="ps-logo" href="/index.html"><img src="/images/logo.png" alt=""></a></div>
            </div>
            <div class="navigation__column center">
                <ul class="main-menu menu">
                    <li class="menu-item"><a href="/index.html">首页</a></li>
                    <li class="menu-item menu-item-has-children has-mega-menu"><a href="/list.html?class=男">男子</a>
                        <div class="mega-menu">
                            <div class="mega-wrap">
                                <div class="mega-column">
                                    <ul class="mega-item mega-features">
                                        <li><a href="/list.html">全部新品</a></li>
                                        <li><a href="/list.html">销售排名</a></li>
                                        <li><a href="/list.html">优惠折扣</a></li>
                                        <li><a href="/list.html">热门鞋款</a></li>
                                        <li><a href="/list.html">REACT 任我去跑</a></li>
                                        <li><a href="/list.html">NBA系列</a></li>
                                        <li><a href="/list.html">足球精选系列</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">所有产品</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=男&key=鞋">鞋类</a></li>
                                        <li><a href="/list.html?class=男&key=夹克/连帽衫">夹克/连帽衫</a></li>
                                        <li><a href="/list.html?class=男&key=长裤/紧身裤">长裤/紧身裤</a></li>
                                        <li><a href="/list.html?class=男&key=上衣/T恤">上衣/T恤</a></li>
                                        <li><a href="/list.html?class=男&key=短裤">短裤</a></li>
                                        <li><a href="/list.html?class=男&key=紧身运动服">紧身运动服</a></li>
                                        <li><a href="/list.html?class=男&key=装备/配件">装备/配件</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">休闲</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=男&key=休闲鞋">休闲鞋</a></li>
                                        <li><a href="/list.html?class=男&key=夹克/连帽衫">夹克/连帽衫</a></li>
                                        <li><a href="/list.html?class=男&key=长裤">长裤</a></li>
                                        <li><a href="/list.html?class=男&key=休闲T恤/POLO衫">休闲T恤/POLO衫</a></li>
                                        <li><a href="/list.html?class=男&key=短裤">短裤</a></li>
                                        <li><a href="/list.html?class=男&key=背包/帽袜">背包/帽袜</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">跑步</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=男&key=跑步鞋">跑步鞋</a></li>
                                        <li><a href="/list.html?class=男&key=夹克/连帽衫">夹克/连帽衫</a></li>
                                        <li><a href="/list.html?class=男&key=长裤">长裤</a></li>
                                        <li><a href="/list.html?class=男&key=上衣/T恤">上衣/T恤</a></li>
                                        <li><a href="/list.html?class=男&key=短裤">短裤</a></li>
                                        <li><a href="/list.html?class=男&key=配件/装备">配件/装备</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">足球</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=男&key=足球鞋">足球鞋</a></li>
                                        <li><a href="/list.html?class=男&key=国际俱乐部">国际俱乐部</a></li>
                                        <li><a href="/list.html?class=男&key=中超">中超</a></li>
                                        <li><a href="/list.html?class=男&key=训练">训练</a></li>
                                        <li><a href="/list.html?class=男&key=国家队">国家队</a></li>
                                        <li><a href="/list.html?class=男&key=小场地足球">小场地足球</a></li>
                                        <li><a href="/list.html?class=男&key=配件/装备">配件/装备</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="menu-item menu-item-has-children has-mega-menu"><a href="/list.html?class=女">女子</a>
                        <div class="mega-menu">
                            <div class="mega-wrap">
                                <div class="mega-column">
                                    <ul class="mega-item mega-features">
                                        <li><a href="/list.html">全部新品</a></li>
                                        <li><a href="/list.html">销售排名</a></li>
                                        <li><a href="/list.html">优惠折扣</a></li>
                                        <li><a href="/list.html">Air force 1系列</a></li>
                                        <li><a href="/list.html">Air max系列</a></li>
                                        <li><a href="/list.html">挑选适合你的运动内衣</a></li>
                                        <li><a href="/list.html">挑选适合你的运动裤/紧身裤</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">所有产品</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=女&key=鞋">鞋类</a></li>
                                        <li><a href="/list.html?class=女&key=运动内衣">专业运动内衣</a></li>
                                        <li><a href="/list.html?class=女&key=长裤/紧身裤">长裤/紧身裤</a></li>
                                        <li><a href="/list.html?class=女&key=上衣/T恤">上衣/T恤</a></li>
                                        <li><a href="/list.html?class=女&key=短裤">短裤</a></li>
                                        <li><a href="/list.html?class=女&key=夹克/连帽衫">夹克/连帽衫</a></li>
                                        <li><a href="/list.html?class=女&key=装备/配件">装备/配件</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">休闲</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=女&key=休闲鞋">休闲鞋</a></li>
                                        <li><a href="/list.html?class=女&key=休闲上衣/T恤">休闲上衣/T恤</a></li>
                                        <li><a href="/list.html?class=女&key=休闲裤">休闲裤</a></li>
                                        <li><a href="/list.html?class=女&key=休闲夹克/连帽衫">休闲夹克/连帽衫</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">跑步</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=女&key=跑步鞋">跑步鞋</a></li>
                                        <li><a href="/list.html?class=女&key=上衣/T恤">上衣/T恤</a></li>
                                        <li><a href="/list.html?class=女&key=夹克/连帽衫">夹克/连帽衫</a></li>
                                        <li><a href="/list.html?class=女&key=长裤/紧身裤">长裤/紧身裤</a></li>
                                        <li><a href="/list.html?class=女&key=短裤">短裤</a></li>
                                        <li><a href="/list.html?class=女&key=配件/装备">配件/装备</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">健身/训练</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=女&key=健身鞋/训练鞋">健身训练鞋</a></li>
                                        <li><a href="/list.html?class=女&key=运动内衣">专业运动内衣</a></li>
                                        <li><a href="/list.html?class=女&key=上衣/T恤">上衣/T恤</a></li>
                                        <li><a href="/list.html?class=女&key=紧身/运动服">紧身运动服</a></li>
                                        <li><a href="/list.html?class=女&key=紧身裤">紧身裤</a></li>
                                        <li><a href="/list.html?class=女&key=瑜伽/瑜伽装备">瑜伽/瑜伽装备</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="menu-item menu-item-has-children has-mega-menu"><a href="/list.html?class=儿童">儿童</a>
                        <div class="mega-menu">
                            <div class="mega-wrap">
                                <div class="mega-column">
                                    <ul class="mega-item mega-features">
                                        <li><a href="/list.html">全部新品</a></li>
                                        <li><a href="/list.html">销量排名</a></li>
                                        <li><a href="/list.html">优惠折扣</a></li>
                                        <li><a href="/list.html">儿童夏日精选</a></li>
                                        <li><a href="/list.html">凉鞋挑选指南</a></li>
                                        <li><a href="/list.html">DYNAMO系列</a></li>
                                        <li><a href="/list.html">超值精选</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">所有产品</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=儿童&key=鞋">鞋类</a></li>
                                        <li><a href="/list.html?class=儿童&key=外套">外套</a></li>
                                        <li><a href="/list.html?class=儿童&key=上衣/T恤">上衣/T恤</a></li>
                                        <li><a href="/list.html?class=儿童&key=短裤">短裤</a></li>
                                        <li><a href="/list.html?class=儿童&key=长裤/紧身裤">长裤/紧身裤</a></li>
                                        <li><a href="/list.html?class=儿童&key=背包/配件">背包/配件</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">休闲</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=儿童&key=休闲鞋">休闲鞋</a></li>
                                        <li><a href="/list.html?class=儿童&key=上衣">上衣</a></li>
                                        <li><a href="/list.html?class=儿童&key=裤装">裤装</a></li>
                                        <li><a href="/list.html?class=儿童&key=外套">外套</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">运动</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html?class=儿童&key=跑步">跑步</a></li>
                                        <li><a href="/list.html?class=儿童&key=健身/训练">健身/训练</a></li>
                                        <li><a href="/list.html?class=儿童&key=篮球">篮球</a></li>
                                        <li><a href="/list.html?class=儿童&key=足球">足球</a></li>
                                    </ul>
                                </div>
                                <div class="mega-column">
                                    <h4 class="mega-heading">年龄</h4>
                                    <ul class="mega-item">
                                        <li><a href="/list.html">婴童(0-3岁)</a></li>
                                        <li><a href="/list.html">幼童(4-6岁)</a></li>
                                        <li><a href="/list.html">大童(7岁及以上)</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="menu-item"><a href="/list.html?class=新品">新品</a></li>
                    <li class="menu-item"><a href="/list.html">销量排名</a></li>
                </ul>
            </div>
            <div class="navigation__column right">
                <form class="ps-search--header" action="/api/search" method="post">
                    <input class="form-control" type="text" placeholder="搜索心仪的商品…">
                    <button><i class="ps-icon-search"></i></button>
                </form>
                <div class="ps-cart">
                    <a class="ps-cart__toggle" style="cursor: pointer">
                        <c:if test="${ sessionScope.user != null }">
                            <span><i class="cart-amount"><%=cart.getCartAmount()%></i></span>
                        </c:if>
                        <i class="ps-icon-shopping-cart"></i>
                    </a>
                    <div class="ps-cart__listing">
                        <c:if test="${ sessionScope.user == null }">
                            <div style="">
                                <div style="text-align: center">
                                    <img src="/images/hint/hint_cart_login.png" style="display: inline-block" >
                                </div>
                            </div>
                            <div class="ps-cart__footer"><a class="ps-btn" href="/login.html">登录<i class="ps-icon-arrow-left"></i></a></div>
                        </c:if>
                        <c:if test="${ sessionScope.user != null }">
                            <div class="ps-cart__total">
                                <p>商品总数：<span class="cart-amount"><%=cart.getCartAmount()%></span></p>
                                <p>总金额：<span class="cart-price"><%=cart.getCartPrice()%></span></p>
                            </div>
                            <div class="ps-cart__footer"><a class="ps-btn" href="/cart.html">结算<i class="ps-icon-arrow-left"></i></a></div>
                        </c:if>
                    </div>
                </div>
                <div class="menu-toggle"><span></span></div>
            </div>
        </div>
    </nav>
</header>
<div class="header-services">
    <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1"
         data-owl-duration="1000" data-owl-mousedrag="on">
        <p class="ps-service"><i class="ps-icon-delivery"></i><strong>免费配送</strong>：在本店购物满200元人民币全国顺丰包邮（不包括港澳台）</p>
        <p class="ps-service"><i class="ps-icon-customer-service"></i><strong>急速发货</strong>：本店承诺，所有订单在24小时内发货</p>
        <p class="ps-service"><i class="ps-icon-heart"></i><strong>添加至收藏夹</strong>：若本店的服务令您满意，请添加本店至收藏夹</p>
    </div>
</div>
