<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>
<html>
<head>
    <title>管理秒杀页</title>
    <%@include file="common/head.jsp" %>
    <link href="/resources/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body>
<form action="/seckill/manager" id="mainForm" method="post">
    <input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/>
</form>
<div class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/se">管理秒杀页</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a id="addSeckill">添加</a></li>
            <li><a href="/seckill/list">返回</a></li>
        </ul>
        <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
        </form>
    </div>
</div>
<div class="container-fluid">
    <div class="col-sm-3 col-md-2 sidebar">
        <ul class="nav nav-sidebar">
            <li class="open"><a href="#">电子产品</a></li>
            <li><a href="#">衣服</a></li>
            <li><a href="#">食物</a></li>
        </ul>
    </div>

    <div class="col-sm-9  col-md-10 main">
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>名称</th>
                    <th>库存</th>
                    <th>开始时间</th>
                    <th>结束时间</th>
                    <th>创建时间</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sk" items="${list}">
                    <tr>
                        <td>${sk.name}</td>
                        <td>${sk.number}</td>
                        <td>
                            <fmt:formatDate value="${sk.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <fmt:formatDate value="${sk.endTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <fmt:formatDate value="${sk.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <a class="btn btn-danger"  href="#">
                                <span class="glyphicon glyphicon-remove"></span>
                                删除
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row text-right">
            共 <b>${page.totalNumber}</b> 条
            <c:if test="${page.currentPage != 1}">
                <a href="javascript:changeCurrentPage('1')" class="btn btn-default btn-sm">首页</a>
                <a href="javascript:changeCurrentPage('${page.currentPage-1}')" class="btn btn-default btn-sm">上一页</a>
            </c:if>
            当前第<span>${page.currentPage}/${page.totalPage}</span>页
            <c:if test="${page.currentPage != page.totalPage}">
                <a href="javascript:changeCurrentPage('${page.currentPage+1}')" class="btn btn-default btn-sm">下一页</a>
                <a href="javascript:changeCurrentPage('${page.totalPage}')" class="btn btn-default btn-sm">末页</a>
            </c:if>
            跳至&nbsp;<input id="currentPageText" type='text' value='${page.currentPage}'
                           class="input-sm" style="width: 4%"/>&nbsp;页&nbsp;
            <a href="javascript:changeCurrentPage($('#currentPageText').val())" class="btn btn-default btn-sm">GO</a>
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    </div>
</div>
<%--登录弹出层--%>
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
</body>
</body>
<!--日期脚本-->
<script type="text/javascript" src="/resources/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/resources/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<!--开始交互编程-->
<script src="/resources/script/manager.js" type="text/javascript"></script>
<script src="/resources/script/list.js"></script>
<script type="text/javascript">
    manager.init();
</script>
</html>