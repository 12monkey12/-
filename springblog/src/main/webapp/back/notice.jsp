<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>main</title>
    <!-- Bootstrap -->
    <link href="../bootstrap3/bootstrap.css" rel="stylesheet">
	<title>notice</title>
	
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
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">博客管理 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0);" onclick = "toContent(${admin.id})">博客首页</a></li>
							<li><a href="addcontent.jsp">添加博客</a></li>
						</ul></li>
					<li><a href="javascript:void(0);" onclick = "toAdvise()">用户反馈</a></li>
					<li class="active"><a href="javascript:void(0);"> 通知 </a></li>
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
		  <li><a href="javascript:void(0);">通知</a></li>
		</ol>
	</div>
	
	<div class="panel panel-default" style="width:80%;margin:20px auto;">
		<div class="panel-body">
			<form>
				<div class="form-group">
					<label>通知</label>
					<textarea rows="10" class="form-control" id="iq"></textarea>
				</div>
				<div style="text-align:right;margin-top:20px;">
					<button type="button" class="btn btn-default" onclick="submitNotice()">提交</button>
				</div>
			</form>
		</div>
	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-2.2.3.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../bootstrap3/bootstrap.js"></script>
    
    <script type="text/javascript" src="../js/companyblog.js"></script>
</body>
</html>