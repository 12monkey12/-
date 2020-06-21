<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">
<style>
#hid p {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
<style>
.list-group-item:hover {
	background: skyblue;
}
</style>
<head>
<title>Classify</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords" content="" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	};
</script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/portfolio.css">
<link rel="stylesheet" href="css/aos.css">
<link href='css/aos-animation.css' rel='stylesheet prefetch'
	type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700i"
	rel="stylesheet">
<link rel="stylesheet" href="css/open-iconic-bootstrap.css" />
<link rel="stylesheet" href="css/iconfont.css" />

<style type="text/css">
#classify a {
	margin: 0px;
}

</style>
</head>
<body>
	<!-- mian-content -->
	<div class="main-content" id="home">
		<!-- header -->
		<header class="py-1">
			<div class="container">
				<nav class="navbar navbar-expand-lg navbar-light">
					<h1>
						<a class="navbar-brand" href="index.jsp"><i
							style="display: inline-block; background-image: url(images/huawei.jpg); z-index: 1000; width: 60px; height: 60px; background-size: 60px 60px"></i></a>
					</h1>
					
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-4 m-auto">
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);"> 专栏 </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="javascript:void(0);" onclick="toBlog()">全部博客 </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="contact.jsp"> 反馈 </a>
							</li>
						</ul>
						
						<c:if test="${empty user }">
							<div class="header-right">
								<a href="signin.jsp" class="signin mr-4"> 登录 <i
									class="fas fa-sign-in-alt"></i></a> <a href="register.jsp"
									class="contact">注 册</a>
							</div>
						</c:if>
						<c:if test="${not empty user }">
							<div class="header-right">
								<a href="javascript:void(0);" class="signin mr-4">${user.name } <i class="fas fa-sign-in-alt"></i>
								</a> <a href="javascript:void(0);" class="signin mr-4" onclick="logout()">注 销</a>
								<a href="javascript:void(0);" class="signin mr-4" onclick = "toMessage(${user.id })"><i class="iconfont icon-xiaoxi"></i></a>
							</div>
						</c:if>
						
					</div>
				</nav>
			</div>
		</header>
		<!-- //header -->
	</div>

	<div id="content" style="padding-top: 120px;">
		<div style="width: 90%; margin: 0px auto; height: 1100px;">
			<div style="position: fixed; width: 10%;">
				<ul class="nav flex-column" id="classify">
					<c:forEach items="${admins }" var="admin" varStatus="status">
						<c:if test="${admin.id == aid }">
							<li class="nav-item" onclick="changeType(${admin.id })">
					  			<a class="nav-link active" href="#">${admin.department }</a>
							</li>
						</c:if>
						<c:if test="${admin.id != aid }">
							<li class="nav-item" onclick="changeType(${admin.id })">
					  			<a class="nav-link" href="#">${admin.department }</a>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>

			<div style="width: 80%; height: 200px; float: right;">
				<c:if test="${empty contents }">
					<h4>该部门没有发布博客</h4>
				</c:if>
				<c:if test="${not empty contents }">
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
							<hr>
						</div>
					</c:forEach>
					<!-- 页数 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item" onclick="classifyMovePage('previous', ${aid }, ${page }, ${pages })">
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
									<li class="page-item" onclick="classifyChangePage(${i}, ${aid })">
										<a class="page-link" href="javascript:void(0)">${i }</a>
									</li>
								</c:if>
							</c:forEach>
							<li class="page-item" onclick="classifyMovePage('next', ${aid }, ${page }, ${pages })">
								<a class="page-link" href="javascript:void(0)" aria-label="Next"> 
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
				</c:if>
				
			</div>
		</div>
	</div>



	<div class="cpy-right text-center py-3">
		<p class="copy-w3layouts">Copyright &copy; 2018.Company name All rights reserved.More Templates</p>
	</div>

	<script src="https://cdn.bootcss.com/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="js/jquery-2.2.3.min.js"></script>
	<script src="js/aos.js"></script>
	<script>
		AOS.init({
			easing : 'ease-out-back',
			duration : 1000
		});
	</script>
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
		});
	</script>
	<script src="js/bootstrap.js"></script>
	<script src="js/user.js"></script>

</body>

</html>
