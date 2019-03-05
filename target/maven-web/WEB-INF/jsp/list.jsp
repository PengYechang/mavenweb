<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>
<html>
<head>
    <title>秒杀列表页</title>
    <%@include file="common/head.jsp" %>
</head>
<body>
<form action="/seckill/list" id="mainForm" method="post">
    <input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/>
<div class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/seckill/list">秒杀详情页</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/seckill/manager">管理</a></li>
        </ul>
        <ul class="navbar-form navbar-right">
            <input id="search" name="search" type="text" class="input-sm" placeholder="Search..." value="${search}">
            <a href="javascript:changeCurrentPage('1')" class="btn btn-default btn-sm">搜索</a>
        </ul>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
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
                        <th>详情页</th>
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
                                <a class="btn btn-info" href="/seckill/${sk.seckillId}/detail" target="_blank">link</a>
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
</form>
</body>
<script src="${pageContext.request.contextPath}/resources/script/list.js"></script>
</html>