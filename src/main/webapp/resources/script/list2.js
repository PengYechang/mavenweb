var list2 = {
    init:function(pages){
        $("#search").keypress(function () {
            var name = $("#search").val();
            $.get("/seckill/list2/1/");
        })
        $("#page3").addClass("active");
        if(pages[2] == 1){
            $("#page0").hide();
        }
        if(pages[2] == pages[pages.length-1]){
            $("#page6").hide();
        }
        for(var i=0;i<pages.length;i++){
            if(pages[i]<1||pages[i]>pages[pages.length-1]){
                $("#page"+(i+1).toString()).hide();
            }
        }
    }
}