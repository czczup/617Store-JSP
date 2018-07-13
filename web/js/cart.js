$(function () {
    $(".deleteBtn").on('click',function () {
        var data = {};
        var tr = $(this).parent().parent();
        var quantity = tr.find(".numInput").val();
        var cartId = tr.find(".cartId").html();
        var totalPrice = tr.find(".totalPrice").html();
        data["src"] = tr.find(".goodImg").attr("src");
        data["alt"] = tr.find(".goodAttr-1").html();
        data["attr"] = tr.find(".goodAttr-2").html();
        data["commodity_id"] = tr.find(".goodId").html();
        data["user_id"] = $("#user-id").html();
        data["amount"] = -1;
        console.log(data);
        if (quantity > 1){
            $.ajax({
                type:"POST",
                url:"/api/addCart",
                data:data,
                dataType:'text',
                async: true,
                success:function(result){
                    if (result=='OK') {
                        tr.find(".numInput").val(quantity-1);
                        tr.find(".totalPrice").html(totalPrice-tr.find(".danPrice").html());
                        $(".totalMoneyClass").html($(".totalMoneyClass").html()-tr.find(".danPrice").html());
                        $(".goodsNum").html($(".goodsNum").html()-1);
                        $(".cart-amount").html($(".goodsNum").html());
                        $(".cart-price").html($(".totalMoneyClass").html());
                    } else {
                        alert("修改失败");
                    }
                },
            });
        } else if (quantity == 1){
            if(confirm("确认删除？")) {
                $.ajax({
                    type:"POST",
                    url:"/api/deleteCart",
                    data:{"cartId":cartId},
                    dataType:'text',
                    async: true,
                    success:function(result){
                        if (result=='OK') {
                            alert("删除成功");
                            $(".totalMoneyClass").html($(".totalMoneyClass").html()-tr.find(".danPrice").html());
                            $(".goodsNum").html($(".goodsNum").html()-1);
                            $(".cart-amount").html($(".goodsNum").html());
                            $(".cart-price").html($(".totalMoneyClass").html());
                            tr.remove();
                            if($(".cart-amount").html() == 0) {
                                location.reload();
                            }
                        } else {
                            alert("删除失败");
                        }
                    },
                });
            } else {
                return;
            }
        }
    })
});

$(function () {
    $(".addBtn").on('click',function () {
        var data = {};
        var tr = $(this).parent().parent();
        var quantity = tr.find(".numInput").val();
        var totalPrice = tr.find(".totalPrice").html();
        data["src"] = tr.find(".goodImg").attr("src");
        data["alt"] = tr.find(".goodAttr-1").html();
        data["attr"] = tr.find(".goodAttr-2").html();
        data["commodity_id"] = tr.find(".goodId").html();
        data["user_id"] = $("#user-id").html();
        data["amount"] = 1;
        console.log(data);
        $.ajax({
            type:"POST",
            url:"/api/addCart",
            data:data,
            dataType:'text',
            async: true,
            success:function(result){
                if (result=='OK') {
                    tr.find(".numInput").val(parseInt(quantity)+1);
                    tr.find(".totalPrice").html(parseInt(totalPrice)+parseInt(tr.find(".danPrice").html()));
                    $(".totalMoneyClass").html(parseInt($(".totalMoneyClass").html())+parseInt(tr.find(".danPrice").html()));
                    $(".goodsNum").html(parseInt($(".goodsNum").html())+1);
                    $(".cart-amount").html($(".goodsNum").html());
                    $(".cart-price").html($(".totalMoneyClass").html());
                } else {
                    alert("修改失败");
                }
            },
        });
    })
});

$(function () {
    $(".deletegoods").on('click',function () {
        var tr = $(this).parent().parent();
        var cartId = tr.find(".cartId").html();
        if(confirm("确认删除？")) {
            $.ajax({
                type:"POST",
                url:"/api/deleteCart",
                data:{"cartId":cartId},
                dataType:'text',
                async: true,
                success:function(result){
                    if (result=='OK') {
                        alert("删除成功");
                        $(".totalMoneyClass").html($(".totalMoneyClass").html()-tr.find(".danPrice").html()*tr.find(".numInput").val());
                        $(".goodsNum").html($(".goodsNum").html()-tr.find(".numInput").val());
                        $(".cart-amount").html($(".goodsNum").html());
                        $(".cart-price").html($(".totalMoneyClass").html());
                        tr.remove();
                        if($(".cart-amount").html() == 0) {
                            location.reload();
                        }
                    } else {
                        alert("删除失败");
                    }
                },
            });
        }
    })
});