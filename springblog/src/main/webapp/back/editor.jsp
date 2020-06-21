<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->

<title>editor</title>

<!-- Bootstrap -->
<link href="../bootstrap3/bootstrap.css" rel="stylesheet">
<!-- 引入kindeditor -->
<script type="text/javascript" charset="utf-8" src="../kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="../kindeditor/lang/zh-CN.js"></script>

<script type="text/javascript">
	KindEditor.ready(function(K){
		window.editor = K.create("#editor_id" , {
			allowFileManager: true,
			uploadJson: '../KindEditor/uploadImage',
			fileManagerJson: '../kindeditor/jsp/file_manager_json.jsp'
		});
	});
	
</script>

</head>
<body>
	<!-- 导航栏 -->
	<nav class="navbar navbar-default" style="margin-bottom:0px;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<span class="navbar-brand">企业博客后台</span>
			</div>
			
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">首页</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="javascript:void(0);" onclick="logout()">注销</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- 面板 -->
  	<div class="panel panel-default" style="border: none;">
		<div class="panel-body" style = "width:95%;margin:0px auto">
			<!-- 表单 -->
			<form id = "form" enctype = "multipart/form-data">
				<div class="form-group" style="margin-bottom:30px;">
					<input type="text" class="form-control" id="title" placeholder="输入文章标题" style="height:50px" value="${content.title }">
				</div>
				
				<textarea id="editor_id" style="width:100%; height:1000px; margin:0px auto;">${content.content }</textarea>
				<div class="form-group" style = "text-align:center; margin-top:20px;">
					<button type="button" class="btn btn-primary btn-lg btn-default" onclick = "resubmitBlog(${content.id })">发布博客</button>
				</div>
			</form>
		</div>
	</div>
	
	
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="../js/jquery-2.2.3.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="../bootstrap3/bootstrap.js"></script>
	
	<script src="../js/companyblog.js"></script>
</body>
</html>