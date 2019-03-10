<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>
<html>
<head>
    <title>管理秒杀页</title>
    <%@include file="common/head.jsp" %>
    <link href="${pageContext.request.contextPath}/resources/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>
<body>
<form action="/seckill/manager" id="mainForm" method="post">
    <input type="hidden" name="currentPage" id="currentPage" value="${page.currentPage}"/>
    <input type="hidden" name="seckillId" id="seckillId" value=""/>
<div class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/seckill/manager">管理秒杀页</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a id="addSeckill">添加</a></li>
            <li><a href="/seckill/list">返回</a></li>
        </ul>
        <ul class="navbar-form navbar-right">
            <input id="search" name="search" type="text" class="input-sm" placeholder="Search..." value="${search}">
            <a href="javascript:changeCurrentPage('1')" class="btn btn-default btn-sm">搜索</a>
        </ul>
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
                            <a class="btn btn-danger"  href="javascript:deleteOne(${sk.seckillId})">
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
</form>
<%@include file="popups/loginModal.jsp" %>
<%@include file="popups/addSeckillModal.jsp" %>
</body>

<%--jQuery cookie--%>
<script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<!--日期脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<!--开始交互编程-->
<script src="${pageContext.request.contextPath}/resources/script/manager.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/script/list.js"></script>
<script type="text/javascript">
    manager.init();
</script>
</html>