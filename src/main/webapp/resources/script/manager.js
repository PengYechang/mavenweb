var manager={
    URL: {
        commitSeckill:function () {
            return '/seckill/commitSeckill';
        }
    },

    init:function () {
        $('.form_datetime').datetimepicker({
            language:  'zh-CN',
            format: 'yyyy-mm-dd hh:ii:ss',
            autoclose: true,
            todayHighlight: true,
        });
        $("#addSeckill").click(function () {
            $('#seckillName').val("");
            $('#seckillNumber').val("");
            $('#dtp_input1').val("");
            $('#dtp_input2').val("");
            var addSeckillModel = $('#addSeckillModel');
            addSeckillModel.modal({
                show: true,//显示弹出层
            })
        });
        $("#seckillBtn").click(function () {
            var seckillName = $('#seckillName').val();
            var seckillNumber = $('#seckillNumber').val();
            var seckillStartTime = $('#dtp_input1').val();
            var seckillEndTime = $('#dtp_input2').val();
            if(seckillName && seckillNumber && seckillStartTime && seckillEndTime
                && manager.isPositiveInteger(seckillNumber)){
                $.post(manager.URL.commitSeckill(),{
                    name:seckillName,
                    number:seckillNumber,
                    startTime:seckillStartTime,
                    endTime:seckillEndTime
                },function () {
                    window.location.reload();
                });
            }else if(!(seckillName && seckillNumber && seckillStartTime && seckillEndTime)){
                $('#seckillCommitMsg').hide().html('<label class="label label-danger">输入信息为空！</label>').show(300);
            }else{
                $('#seckillCommitMsg').hide().html('<label class="label label-danger">库存输入错误！</label>').show(300);
            }
        });
    },

    isPositiveInteger:function(obj) {
        return obj%1 === 0 && obj>0;
    }

}