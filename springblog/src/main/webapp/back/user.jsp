<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>user</title>
<link href="../bootstrap3/bootstrap.css" rel="stylesheet">
</head>
<body>
	<!-- 导航栏 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<span class="navbar-brand">企业博客后台</span>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">首页</a></li>
					<li class="active"><a href="#">用户信息</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">博客管理 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0);" onclick = "toContent(${admin.id })">博客首页</a></li>
							<li><a href="addcontent.jsp">添加博客</a></li>
						</ul></li>
					<c:if test="${admin.id == 1 }">
						<li><a href="javascript:void(0);" onclick = "toAdvise()">用户反馈</a></li>
						<li><a href="notice.jsp"> 通知 </a></li>
					</c:if>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="javascript:void(0);" onclick="logout()">注销</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container" style = "width : 95%">
		<!-- 路径导航 -->
		<ol class="breadcrumb">
		  <li><a href="javascript:void(0);">首页</a></li>
		  <li><a href="javascript:void(0);">用户信息</a></li>
		</ol>
		<p>总用户数: <span>${fn:length(users) }</span></p>
		<!-- 表格 -->
		<table class="table table-striped table-bordered table-hover table-condensed">
			<tr>
				<th style = "text-align:center">用户编号</th>
				<th style = "text-align:center">用户昵称</th>
				<th style = "text-align:center">用户邮箱</th>
				<th style = "text-align:center">用户密码</th>
				<th style = "text-align:center">用户电话</th>
			</tr>
			<c:forEach var = "user" items = "${users }" varStatus = "status">
				<tr align = "center">
					<td>${user.id }</td>
					<td>${user.name }</td>
					<td>${user.email }</td>
					<td>${user.password }</td>
					<td>${user.telephone }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script src="../js/jquery-2.2.3.min.js"></script>
	<script src="../bootstrap3/bootstrap.js"></script>
	
	<script src="../js/companyblog.js"></script>
</body>
</html>