<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- 导入Bootstrap的css样式 -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	
	<title>Blogs</title>
    
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/portfolio.css">
    <link rel="stylesheet" href="css/aos.css">
    <link href='css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />
    <link rel="stylesheet" href="css/iconfont.css" />
    
</head>
<body>
	<div class="main-content" id="home">
        <header class="py-1">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <h1>
                        <a class="navbar-brand" href="index.jsp"><i style=
                        "display: inline-block; background-image: url(images/huawei.jpg); z-index: 1000; width: 60px; height: 60px;
                        background-size: 60px 60px"></i></a>
                    </h1>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-4 m-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="javascript:void(0);" onclick="toClassify()"> 专栏 </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="javascript:void(0);"> 全部博客 </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp"> 反馈 </a>
                            </li>
                        </ul>
                        
                        <c:if test="${empty user }">
                        <div class="header-right">
                            <a href="signin.jsp" class="signin mr-4"> 登录 <i class="fas fa-sign-in-alt"></i></a>
                            <a href="register.jsp" class="contact"> 注 册 </a>
                        </div>
                        </c:if>
                        <c:if test="${not empty user }">
                        <div class="header-right">
                            <a href="javascript:void(0);" class="signin mr-4"> ${user.name } <i class="fas fa-sign-in-alt"></i></a>
                            <a href="javascript:void(0);" class="signin mr-4" onclick = "logout()">注 销</a>
                            <a href="javascript:void(0);" class="signin mr-4" onclick = "toMessage(${user.id })"><i class="iconfont icon-xiaoxi"></i></a>
                        </div>
                        </c:if>
                    </div>
                </nav>
            </div>
        </header>
    </div>
    
    <div id="content" style="padding-top:120px;">
    	<div style="width:80%; margin:0px auto;">
   			<ul class="nav nav-pills" style="border-bottom:1px solid grey; padding-bottom:10px;">
				<c:if test="${condition == 'time' }">
					<li class="nav-item">
						<a class="nav-link active" href="javascript:void(0);" onclick="changeCondition(this)">按时间排序</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="javascript:void(0);" onclick="changeCondition(this)">按点赞数排序</a>
					</li>	
				</c:if>
				
				<c:if test="${condition == 'star' }">
					<li class="nav-item">
						<a class="nav-link" href="javascript:void(0);" onclick="changeCondition(this)">按时间排序</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="javascript:void(0);" onclick="changeCondition(this)">按点赞数排序</a>
					</li>
				</c:if>
			</ul>
    		<div style="margin-top:30px">
    			<c:forEach items="${contents }" var="content" varStatus="status">
    			
	    			<div id="blog">
	    				<div style="cursor:pointer;" onclick="toSingle(${content.id })">
							<span style="font-size: 25px;">${content.title }</span>
							<span style="float: right;">${content.date }</span>
		
							<c:if test="${not empty content.pic }">
								<div style="padding-top: 20px; height:130px;">
									<div style="width: 85%; display: -webkit-box; height:70px; overflow:hidden;
									text-overflow:ellipsis; float:left; -webkit-box-orient:vertical; -webkit-line-clamp:3;
									color:grey; font-size:15px;">
										${content.content }
									</div>
									<img alt="" src="${content.pic }" style="width: 13%; float: right;">
								</div>
							</c:if>
							<c:if test="${empty content.pic }">
								<div style="padding-top: 20px; height:130px;">
									<div style="display: -webkit-box; height:70px; overflow:hidden;
									text-overflow:ellipsis; -webkit-box-orient:vertical; -webkit-line-clamp:3;
									color:grey; font-size:15px;">
										${content.content }
									</div>
								</div>
							</c:if>
	    				</div>
						<table style="text-align: center;width: 150px;">
							<tr>
								<td><a><i class="iconfont icon-dianzan"></i> <span>${content.star }</span></a></td>
								<td><a><i class="iconfont icon-liulan"></i> <span>${content.view }</span></a></td>
								<td><a><i class="iconfont icon-pinglun"></i> <span>${content.comment }</span></a></td>
							</tr>
						</table>
						<span style="position: relative; left: 300px; top: -30px;">By: ${content.admin_department }</span>
						<hr>
					</div>
    			</c:forEach>
    		</div>
    		<div style="margin-bottom: 50px;">
    			<!-- 页数 -->
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item" onclick="blogsMovePage('previous', '${condition }', ${page }, ${pages })">
							<a class="page-link" href="javascript:void(0)" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach var="i" begin="1" end="${pages }">
							<c:if test="${page == i }">
								<li class="page-item active">
									<a class="page-link" href="javascript:void(0)">${i }</a>
								</li>
							</c:if>
							<c:if test="${page != i }">
								<li class="page-item" onclick="blogsChangePage(${i}, '${condition }')">
									<a class="page-link" href="javascript:void(0)">${i }</a>
								</li>
							</c:if>
						</c:forEach>
						<li class="page-item" onclick="blogsMovePage('next', '${condition }', ${page }, ${pages })">
							<a class="page-link" href="javascript:void(0)" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
    		</div>
    	</div>
    </div>
    
    
    <div class="cpy-right text-center py-3">
		<p class="copy-w3layouts">Copyright &copy; 2018.Company name All rights reserved.More Templates</p>
	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.js"></script>
    
    <script type="text/javascript" src="js/user.js"></script>
</body>
</html>