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
    <title>addcontent</title>

    <!-- Bootstrap -->
    <link href="../bootstrap3//bootstrap.css" rel="stylesheet">
    
    <!-- 引入kindeditor KindEditor/uploadImage   kindeditor/jsp/upload_json.jsp-->
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
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="javascript:void(0);">企业博客后台</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">首页</a></li>
					<li><a href="javascript:void(0);" onclick = "toUser()">用户信息</a></li>
					<li class="dropdown active"><a href="#" class="dropdown-toggle"
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
		  <li><a href="javascript:void(0);">博客管理</a></li>
		  <li><a href="javascript:void(0);">添加博客</a></li>
		</ol>
	</div>
  	<!-- 面板 -->
  	<div class="panel panel-default">
		<div class="panel-body" style = "width:95%;margin:0px auto">
			<!-- 表单 -->
			<form id = "form" enctype = "multipart/form-data">
				<div class="form-group">
					<input type="text" class="form-control" id = "title" placeholder="输入文章标题" style = "height:50px">
				</div>
				
				<textarea id="editor_id" style="width:100%; height:1000px; margin:0px auto;"></textarea>
				<div class="form-group" style = "text-align:center; margin-top:20px;">
					<button type="button" class="btn btn-primary btn-lg btn-default" onclick = "addcontent()">发布博客</button>
				</div>
			</form>
		</div>
	</div>
	

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../js/jquery-2.2.3.min.js"></script>
    <script src="../js/ajaxfileupload.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../bootstrap3/bootstrap.js"></script>
    
    <script src="../js/companyblog.js"></script>
  </body>
</html>