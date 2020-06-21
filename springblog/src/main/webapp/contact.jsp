<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<title>Contact</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<meta name="keywords" content="" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);

	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- //Meta tag Keywords -->

<!-- Custom-Files -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
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
<!-- iconfont -->
<link rel="stylesheet" href="css/iconfont.css" />

</head>

<body>
	<!-- mian-content -->
	<div class="main-content" id="home">
		<!-- header -->
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
                                <a class="nav-link" href="classify.jsp" onclick="toBlog()"> 专栏 </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="blogs.jsp"> 全部博客 </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="javascript:void(0);"> 反馈 </a>
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
		<!-- //header -->
	</div>

	<section class="ab-info-main py-md-5 py-5">
		<div class="container py-md-5 py-5">
			<div class="ab-info-grids pt-md-5 pt-3">
				<div class="contact-info pt-md-5 pt-0 text-center">
					<h3
						class="tittle text-uppercase text-center mb-lg-5 mb-3 inner-tittle">
						联系我们
					</h3>
					<p class="text-center" data-aos="fade-up">如果你对我们的网站有建议，请写下来发给我们，我们会认真阅读.</p>
					<div class="contact-form mt-md-5">
						<div class="contact-form-inner mx-auto text-left">
							<form name="contactform " id="contactform" method="post" action="#" onsubmit="return(validate());"
								novalidate="novalidate">
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group" data-aos="fade-up">
											<label>标题：</label> 
											<input type="text" class="form-control" id="subject" placeholder="标题" name="subject">
										</div>
									</div>
								</div>
								<div class="form-group" data-aos="fade-up">
									<label>详情：</label>
									<textarea name="issues" class="form-control" id="iq" placeholder="在这输入你的建议"></textarea>
								</div>
								<button type="button" class="btn btn-default" id="button" style="display:block; margin: 0px auto;" onclick="submitAdvise('${empty user }')">提交</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="cpy-right text-center py-3">
		<p class="copy-w3layouts">Copyright &copy; 2018.Company name All rights reserved.More Templates</p>
	</div>
	
	<script src="js/jquery-2.2.3.min.js"></script>
	<!--/aos -->
	<script src="js/aos.js"></script>
	<script>
		AOS.init({
			easing : 'ease-out-back',
			duration : 1000
		});
	</script>
	<!--//aos -->
	<!--/ start-smoth-scrolling -->
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
