var manager={
    init:function () {
        $("#addSeckill").click(function () {
            var addSeckillModel = $('#addSeckillModel');
            addSeckillModel.modal({
                show: true,//显示弹出层
            })
        });
        $("#seckillBtn").click(function () {
            window.location.reload();
        });
    }

}