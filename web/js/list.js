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
    productVaritantsNormal();
    filterSlider();
});

function GetUrlRelativePath() {
    var url = document.location.toString();
    var arrUrl = url.split("//");
    var start = arrUrl[1].indexOf("/");
    var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符
    if(relUrl.indexOf("?") != -1){
        relUrl = relUrl.split("?")[0];
    }
    return relUrl;
}

function changeURLArg(url,arg,arg_val){
    var pattern=arg+'=([^&]*)';
    var replaceText=arg+'='+arg_val;
    if(url.match(pattern)){
        var tmp='/('+ arg+'=)([^&]*)/gi';
        tmp=url.replace(eval(tmp),replaceText);
        return tmp;
    }else{
        if(url.match('[\?]')){
            return url+'&'+replaceText;
        }else{
            return url+'?'+replaceText;
        }
    }
}

function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i=0;i<vars.length;i++) {
        var pair = vars[i].split("=");
        if(pair[0] == variable){return pair[1];}
    }
    return(false);
}

$(function () {
    $("#price-filter-btn").on('click',function () {
        var min_price = $("#min-price").html().slice(0,-3);
        var max_price = $("#max-price").html().slice(0,-3);
        var url = GetUrlRelativePath()+location.search;
        url = changeURLArg(url,"price",min_price+"/"+max_price).replace("#","");
        window.location.href = url;
    });
});

$(function () {
    $(".color-btn").each(function () {
        $(this).on('click',function () {
            var url = GetUrlRelativePath()+location.search;
            url = changeURLArg(url.replace("#",""),"color",$(this).attr("value"));
            window.location.href = url;
        });
    })
});

$(document).ready(function () {
    var priceList,maxPrice,minPrice;
    var queryPrice = getQueryVariable("price");
    if (queryPrice) {
        priceList = queryPrice.split("/");
        minPrice = priceList[0];
        maxPrice = priceList[1];
        $("#price-slider").attr("data-min", minPrice);
        $("#price-slider").attr("data-max", maxPrice);
        $("#min-price").html(minPrice+"RMB");
        $("#max-price").html(maxPrice+"RMB");
    }
    var querySort = getQueryVariable("sort");
    if (querySort) {
        if (querySort == "asc") {
            $(".filter-option.pull-left").html("价格升序");
        } else if (querySort == "desc") {
            $(".filter-option.pull-left").html("价格降序");
        }
    }
});

function deleteURLArg(name){
    var local = window.location;
    var baseUrl = local.origin + local.pathname + "?";
    var query = local.search.substr(1);
    if (query.indexOf(name)>-1) {
        var obj = {}
        var arr = query.split("&");
        for (var i = 0; i < arr.length; i++) {
            arr[i] = arr[i].split("=");
            obj[arr[i][0]] = arr[i][1];
        };
        delete obj[name];
        var url = baseUrl + JSON.stringify(obj).replace(/[\"\{\}]/g,"").replace(/\:/g,"=").replace(/\,/g,"&");
        return url
    };
}


$(function () {
    $(".dropdown-menu.inner").find("li").on('click',function () {
        var index = $(this).attr("data-original-index");
        var url = GetUrlRelativePath()+location.search;
        if (index == 1) {
            url = changeURLArg(url.replace("#",""),"sort","asc");
        } else if (index == 2) {
            url = changeURLArg(url.replace("#",""),"sort","desc");
        } else {
            url = deleteURLArg("sort");
        }
        window.location.href = url;
    })
});
