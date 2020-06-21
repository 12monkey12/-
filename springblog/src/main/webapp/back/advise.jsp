<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户反馈</title>
    <!-- Bootstrap -->
    <link href="../bootstrap3/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/iconfont.css" />

  </head>
  <body>
    <!-- 导航栏 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:void(0);">企业博客后台</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">首页</a></li>
					<li><a href="javascript:void(0);" onclick = "toUser()">用户信息</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">博客管理 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0);" onclick = "toContent(${admin.id})">博客首页</a></li>
							<li><a href="addcontent.jsp">添加博客</a></li>
						</ul></li>
					<li class="active"><a href="#">用户反馈</a></li>
					<li><a href="notice.jsp"> 通知 </a></li>
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
		  <li><a href="javascript:void(0);">用户反馈</a></li>
		</ol>
	</div>
	
	
	<div style="width:70%; margin:0px auto;" id="content">
		<table class="table table-bordered table-hover">
			<thead>
		  		<tr>
		  			<td style="width:250px;">发件人</td>
					<td style="width:500px;">标题</td>
					<td>发送时间</td>
					<td>状态</td>
		  		</tr>
			</thead>
			<tbody>
		  		<c:forEach items="${advises }" var="advise" varStatus="status">
			  		<tr style="cursor:pointer;" onclick="getAdvise(${advise.id }, ${advise.status })">
			  			<td>${advise.uname }</td>
						<td>${advise.title }</td>
						<td>${advise.date }</td>
						<c:if test="${advise.status == 0 }">
							<td>未读</td>
						</c:if>
						<c:if test="${advise.status == 1 }">
							<td>已读</td>
						</c:if>
			  		</tr>
		  		</c:forEach>
	  		</tbody>
		</table>
	</div>
		
	
	
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-2.2.3.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../bootstrap3/bootstrap.js"></script>
    
    <script src="../js/companyblog.js"></script>
    
  </body>
</html>