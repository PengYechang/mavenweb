<%--
  Created by IntelliJ IDEA.
  User: pengy
  Date: 2019/3/6
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--添加seckill弹出层--%>
<div id="addSeckillModel" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    需要添加的秒杀项目
                </h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="seckillName" class="col-sm-2 col-sm-offset-2 control-label">名称</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="seckillName" placeholder="请输入名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="seckillNumber" class="col-sm-2 col-sm-offset-2 control-label">库存</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="seckillNumber" placeholder="请输入库存数">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dtp_input1" class="col-sm-2 col-sm-offset-2 control-label">开始时间</label>
                        <div class="col-sm-6">
                            <div class="input-group date form_datetime" data-link-field="dtp_input1">
                                <input class="form-control" type="text" id="dtp_input1" value="" readonly>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dtp_input2" class="col-sm-2 col-sm-offset-2 control-label">结束时间</label>
                        <div class="col-sm-6">
                            <div class="input-group date form_datetime" data-link-field="dtp_input2">
                                <input class="form-control" type="text" id="dtp_input2" value="" readonly>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <%--验证信息--%>
                <span class="glyphicon" id="seckillCommitMsg"></span>
                <button type="button" id="seckillBtn" class="btn btn-success">
                    <span class="glyphicon glyphicon-ok"></span>
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>
