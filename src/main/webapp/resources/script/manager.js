var manager={
    URL: {
        commitSeckill:function () {
            return '/seckill/commitSeckill';
        }
    },

    init:function () {
        var loginName = $.cookie('loginName');
        if (!loginName) {
            var loginModal = $('#loginModal');
            loginModal.modal({
                show: true,//显示弹出层
                backdrop: 'static',//禁止位置关闭
                keyboard: false //关闭键盘事件
            });
            $('#loginBtn').click(function () {
                var loginName = $('#loginName').val();
                var loginPwd = $('#loginPwd').val();
                if (loginName == 'pengyechang' && loginPwd == '123456') {
                    var isRememberPwd = $('#rememberPwd').prop('checked');
                    if(isRememberPwd){
                        $.cookie('loginName', loginName, {expires: 30, path: '/seckill'});
                    }else{
                        $.cookie('loginName', loginName, {expires: 1, path: '/seckill'});
                    }
                    window.location.reload();
                } else {
                    $('#loginMessage').hide().html('<label class="label label-danger">用户名或密码错误！</label>').show(300);
                }
            });
        }
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
                && manager.isPositiveInteger(seckillNumber) && seckillStartTime<seckillEndTime){
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
            }else if (seckillStartTime>=seckillEndTime){
                alert('秒杀开始时间大于结束时间');
            }else{
                $('#seckillCommitMsg').hide().html('<label class="label label-danger">库存输入错误！</label>').show(300);
            }
        });
    },

    isPositiveInteger:function(obj) {
        return obj%1 === 0 && obj>0;
    }

}