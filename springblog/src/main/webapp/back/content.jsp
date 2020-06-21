<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>content</title>

<!-- Bootstrap -->
<link href="../bootstrap3/bootstrap.css" rel="stylesheet">
<style type="text/css">
	#content > div:hover{
		background-color: #ddd;
	}
	#content > div{
		border-bottom: 1px solid black;
		padding: 5px 0px;
	}
	#content > div > h4{
		margin-top: 0px;
	}
	#content button{
		border: none;
	}
	#content button:hover{
		background-color: #f44444;
	}
</style>
</head>
<body>
	<!-- 导航栏 -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<span class="navbar-brand">企业博客后台</span>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="main.jsp">首页</a></li>
					<li><a href="javascript:void(0);" onclick="toUser()">用户信息</a></li>
					<li class="dropdown active"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">博客管理 <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="javascript:void(0);">博客首页</a></li>
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

	<div class="container" style="width: 95%">
		<!-- 路径导航 -->
		<ol class="breadcrumb">
			<li><a href="javascript:void(0);">首页</a></li>
			<li><a href="javascript:void(0);">博客管理</a></li>
			<li><a href="javascript:void(0);">博客首页</a></li>
		</ol>
	</div>
	
	<div id="content" style="width: 80%; margin: 0px auto;">
		<p>博客篇数: <span>${contents_size }</span></p>
		<c:if test="${empty contents }">
			<h3 style="text-align:center;">你还没有上传博客，快写一篇吧！</h3>
		</c:if>
		<c:if test="${not empty contents }">
			<c:forEach items="${contents }" var="content" varStatus="status">
				<div>
					<h4>${content.title }</h4>
					<div style="display: -webkit-box; height:62px; overflow:hidden; margin-bottom:10px;
					text-overflow:ellipsis; -webkit-box-orient:vertical; -webkit-line-clamp:3">
						${content.content }
					</div>
					<div>
						<table style="display:inline-block;">
							<tr>
								<td style="border-right: 1px solid black; padding-right: 10px;">
									<span>${content.date }</span>
								</td>
								<td style="border-right: 1px solid black; padding: 0px 10px;">
									<span>点赞数</span>
									<span>${content.star }</span>
								</td>
								<td style="padding: 0px 10px;">
									<span>评论数</span>
									<span>${content.comment }</span>
								</td>
							</tr>
						</table>
						<div style="display:inline-block; padding-left:800px;">
							<button onclick="editorBlog(${content.id })">编辑</button>
							<button onclick="deleteBlog(${content.id })">删除</button>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<!-- 分页 -->
			<nav aria-label="Page navigation" style="text-align:center;">
				<ul class="pagination">
					<li onclick="movePage('previous', ${aid }, ${page }, ${pages })">
						<a href="javascript:void(0);" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					
					<c:forEach var="i" begin="1" end="${pages }">
						<c:if test="${page == i }">
							<li class="active">
								<a href="javascript:void(0)">${i }</a>
							</li>
						</c:if>
						<c:if test="${page != i }">
							<li onclick="changePage(${i}, ${aid })">
								<a href="javascript:void(0)">${i }</a>
							</li>
						</c:if>
					</c:forEach>
					
					<li onclick="movePage('next', ${aid }, ${page }, ${pages })">
						<a href="javascript:void(0);" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</c:if>
	</div>
	

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="../js/jquery-2.2.3.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="../bootstrap3/bootstrap.js"></script>

	<script src="../js/companyblog.js"></script>
</body>
</html>