$(function () {
    $(".pickers").each(function () {
        var self = this;
        $(this).on("click",function () {
            var image = $(this).children("img:first-child").attr("src");
            $(".zoomContainer").css("background","url("+image+") no-repeat");
            $(".zoomContainer").css("background-size","cover");
            $(".zoomWindow").remove();
            $(".pickers").css("border","3px solid #e5e5e5");
            $(self).css("border","3px solid #2AC37D")
            $(".pickers").removeAttr("selected");
            $(self).attr("selected","true");
            var alt = $(this).children("img:first-child").attr("alt");

        })
    })
    $("#cartButton").on('click',function () {
        var cnt = 0;
        var data = {};
        data["user_id"] = $("#user-id").html();
        if (!$("#user-id").html()) {
            alert("请先登录");
            return;
        }
        $(".pickers").each(function () {
            if ($(this).attr("selected")=="selected") {
                cnt++;
                data["alt"] = $(".select-1").html().substring(2) + "：" + $(this).children("img:first-child").attr("alt");
                data["src"] = $(this).children("img:first-child").attr("src");
            }
        })
        if (cnt==0) {
            alert("请"+$(".select-1").html());
            return;
        }
        var selectItem = $(".btn.dropdown-toggle.btn-primary").attr("title");
        if(selectItem){
            if(selectItem.startsWith("选择")) { // 如果以选择开头，说明用户没有选择
                alert("请"+selectItem);
                return;
            } else {
                data["attr"] = $(".select-2").html().substring(2) + "：" + selectItem;
            }
        }
        data["commodity_id"] = $("#commodity-id").html();
        if ($("#amount-choose").val() > 0) {
            data["amount"] = $("#amount-choose").val();
        } else {
            alert("请输入商品数量");
            return;
        }
        var flag;
        console.log($(".select-1").html());
        console.log($(".select-2").html());

        if($(".select-1").html() && $(".select-2").html()) {
            console.log(1);
            flag = data.alt && data.attr && data.amount && data.user_id;
        } else if($(".select-1").html() && !$(".select-2").html()){
            console.log(2);
            flag = data.alt && data.amount && data.user_id;
        } else {
            console.log(3);
            flag = data.attr && data.amount && data.user_id;
        }
        console.log(flag);
        if(flag){
            $.ajax({
                type:"POST",
                url:"/api/addCart",
                data:data,
                dataType:'text',
                async: true,
                success:function(result){
                    if (result=='OK') {
                        alert("加入购物车成功");
                        $(".cart-amount").html(parseInt($(".cart-amount").html())+parseInt($("#amount-choose").val()));
                        $(".cart-price").html(parseInt($(".cart-price").html())+parseInt($(".discount-price").html()));
                    } else {
                        alert("加入购物车失败");
                    }
                },
            });
        }
    })
});


$(function () {
    $("#collection-heart").on('click',function () {
        if($("#user-id").html()) {
            var commend;
            if ($("#collection-heart").attr("collected")=="true") {
                commend = "Cancel";
            } else {
                commend = "Collect";
            }
            $.ajax({
                type:"POST",
                url:"/api/updateCollection",
                data:{
                    "user_id": $("#user-id").html(),
                    "commodity_id": $("#commodity-id").html(),
                    "commend": commend
                },
                dataType:'text',
                async: true,
                success:function(result){
                    if (result == "OK") {
                        if ($("#collection-heart").attr("collected")=="true") {
                            $("#collection-heart").removeAttr("collected");
                            $("#collection-heart").css("background-color","#999999");
                            alert("取消收藏成功");
                        } else {
                            $("#collection-heart").attr("collected","true");
                            $("#collection-heart").css("background-color","#2AC37D");
                            alert("收藏成功");
                        }
                    } else {
                        alert("服务器出现异常");
                    }
                },
            });
        } else {
            alert("请先登录");
        }
    })
});


$(document).ready(function() {
    parallax();
    rating();
    menuBtnToggle();
    subMenuToggle();
    owlCarousel($('.owl-slider'));
    navigateOwlCarousel();
    countDown();
    masonry();
    stickyHeader();
    productVariantsAjax();
    productThumbnailChange();
    bootstrapSelect();
    slickConfig();
    zoomInit();
    magnificPopup();
    productVaritantsNormal();
    revolution();
    filterSlider();
});