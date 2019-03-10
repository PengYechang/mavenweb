<%--
  Created by IntelliJ IDEA.
  User: pengy
  Date: 2019/3/6
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--登录弹出层--%>
<div id="loginModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    管理员登录
                </h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="loginName" class="col-sm-2 col-sm-offset-2 control-label">用户名</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="loginName" placeholder="请输入用户名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="loginPwd" class="col-sm-2 col-sm-offset-2 control-label">密码</label>
                        <div class="col-sm-6">
                            <input type="password" class="form-control" id="loginPwd" placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-offset-4">
                            &nbsp&nbsp&nbsp&nbsp<input type="checkbox" id="rememberPwd" name="rememberPwd" value="rememberPwd"> 记住密码
                        </label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <%--验证信息--%>
                <span class="glyphicon" id="loginMessage"></span>
                <button type="button" id="loginBtn" class="btn btn-primary">
                    <span class="glyphicon glyphicon-user"></span>
                    登录
                </button>
            </div>
        </div>
    </div>
</div>