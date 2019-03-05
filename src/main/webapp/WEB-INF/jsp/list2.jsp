<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="common/tag.jsp" %>
<html>
<head>
    <title>秒杀列表页</title>
    <%@include file="common/head.jsp" %>
</head>
<body>
<div class="navbar navbar-inverse">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/seckill/list2/${pages[2]}">秒杀详情页</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/seckill/manager/1">管理</a></li>
        </ul>
        <form class="navbar-form navbar-right">
            <input id="search" type="text" class="form-control" placeholder="Search...">
        </form>
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
            <div class="row text-center">
                <ul class="pagination">
                    <li id="page0"><a href="/seckill/list2/1">&laquo;</a></li>
                    <li id="page1"><a href="/seckill/list2/${pages[0]}">${pages[0]}</a></li>
                    <li id="page2"><a href="/seckill/list2/${pages[1]}">${pages[1]}</a></li>
                    <li id="page3"><a href="/seckill/list2/${pages[2]}">${pages[2]}</a></li>
                    <li id="page4"><a href="/seckill/list2/${pages[3]}">${pages[3]}</a></li>
                    <li id="page5"><a href="/seckill/list2/${pages[4]}">${pages[4]}</a></li>
                    <li id="page6"><a href="/seckill/list2/${pages[5]}">&raquo;</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
</body>
<!--开始交互编程-->
<script src="${pageContext.request.contextPath}/resources/script/list2.js" type="text/javascript"></script>
<script type="text/javascript">
    var pages = new Array();
    pages[0] = ${pages[0]};
    pages[1] = ${pages[1]};
    pages[2] = ${pages[2]};
    pages[3] = ${pages[3]};
    pages[4] = ${pages[4]};
    pages[5] = ${pages[5]};
    list2.init(pages);
</script>
</html>