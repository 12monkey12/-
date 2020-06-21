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
    <title>main</title>
    <!-- Bootstrap -->
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
					<li class="active"><a href="javascript:void(0);">首页</a></li>
					<li><a href="javascript:void(0);" onclick = "toUser()">用户信息</a></li>
					<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">博客管理 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0);" onclick = "toContent(${admin.id})">博客首页</a></li>
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
		</ol>
		<!-- 巨幕 -->
		<div class="jumbotron">
		  <h1>尊敬的管理员：${admin.department }</h1>
		  <h3>您好！</h3>
		  <h3 id="nowTime"></h3>
		</div>
	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-2.2.3.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../bootstrap3/bootstrap.js"></script>
    <script type="text/javascript" src="../js/companyblog.js"></script>
    
    <script>
    	$(function(){
    		var date = new Date();
    		var str = date.toLocaleString();
    		$("#nowTime").text(str);
    	})
    </script>
    
  </body>
</html>