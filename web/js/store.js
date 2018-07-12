$(function () {
    $(".pickers").each(function () {
        var self = this;
        $(this).on("click",function () {
            image = $(this).children("img:first-child").attr("src");
            $(".zoomContainer").css("background","url("+image+") no-repeat");
            $(".zoomContainer").css("background-size","cover");
            $(".zoomWindow").remove();
            $(".pickers").css("border","3px solid #e5e5e5");
            $(self).css("border","3px solid #2AC37D")
            $(".pickers").removeAttr("selected");
            $(self).attr("selected","true");
        })
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