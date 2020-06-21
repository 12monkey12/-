<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- css -->
	<link rel="stylesheet" href="css/bootstrap.css" />
	<!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/portfolio.css">
    <link rel="stylesheet" href="css/aos.css">
    <link href='css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />
    <!-- iconfont css -->
    <link rel="stylesheet" href="css/iconfont.css" />
	<title>消息</title>
	<style>
		#content li{
			padding:10px 0px;
			border-bottom:1px solid black;
			position:relative;
		}
		.notice-active:before{
			position:absolute;
			content:"";
			width:6px;
			height:6px;
			border-radius:50%;
			background-color:#ca0c16;
			top:20px;
			left:-10px;
		}
		
		html,body{
			margin:0px;
			padding:0px;
			height:100%
		}
		#container{
			min-height:100%;
			height:auto !important;
			height:100%;
			position:relative;
		}
		#page{
			padding-bottom:77px;
		}
		#footer{
			height:77px;
			position:absolute;
			width:100%;
			bottom:0px;
		}
	</style>
</head>
<body>
	<div id="container">
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
                                <a class="nav-link" href="javascript:void(0);" onclick="toBlog()"> 全部博客 </a>
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
                            <a href="javascript:void(0);" class="signin mr-4"><i class="iconfont icon-xiaoxi"></i></a>
                        </div>
                        </c:if>
                    </div>
                </nav>
            </div>
        </header>
		<div style="width:70%;margin:0px auto;padding-top:130px;overflow:hidden" id="page">
			<div style="width:150px;float:left;">
				<ul class="nav flex-column" id="navigation">
					<li class="nav-item">
						<a class="nav-link" style="padding:10px 0px;" href="javascript:void(0);" onclick="changeMessage(this,0,${user.id })">回复</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" style="padding:10px 0px;" href="javascript:void(0);" onclick="changeMessage(this,1,${user.id })">点赞</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" style="padding:10px 0px;" href="javascript:void(0);" onclick="changeMessage(this,2,${user.id })">系统通知</a>
					</li>
				</ul>

			</div>
			<div style="width:930px;float:left;margin-left:20px;">
				<c:if test="${empty messages }">
					<span>没有消息</span>
				</c:if>
				<c:if test="${not empty messages }">
					<c:if test="${type == 2 }">
						<ul style="list-style:none;padding:0px;margin:0px;" id="content">
							<c:forEach items="${messages }" var="message" varStatus="status">
								<li>
									<div>
										<span style="color:blue;margin-right:10px;">系统回复</span>
										<span style="position:relative;left:80%;color:#ccc">${message.date }</span>
									</div>
									<div style="margin-top:5px;">
										${message.content }
									</div>
								</li>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${type != 2 }">
						<ul style="list-style:none;padding:0px;margin:0px;" id="content">
							<c:forEach items="${messages }" var="message" varStatus="status">
								<li>
									<div>
										<c:if test="${message.status == 0 }">
										<span style="color:blue;margin-right:10px;" class="notice-active">${message.uname }</span>
										</c:if>
										<c:if test="${message.status == 1 }">
										<span style="color:blue;margin-right:10px;">${message.uname }</span>
										</c:if>
										<c:choose>
											<c:when test="${type == 0 }">
												<span>回复了你的评论</span>
											</c:when>
											<c:when test="${type == 1 }">
												<span>点赞了你的评论</span>
											</c:when>
										</c:choose>
									</div>
									<div style="margin-top:5px;">
										<a href="javascript:void(0);" onclick="lookMessage(${message.id}, ${message.cid }, ${type })"><span style="font-weight:bold;">${message.content_title }</span></a>
										<span style="position:relative;left:80%;color:#ccc">${message.date }</span>
									</div>
								</li>
							</c:forEach>
						</ul>
					</c:if>
				</c:if>
			</div>
		</div>
	
		<div class="cpy-right text-center py-3" id="footer">
			<p class="copy-w3layouts">Copyright &copy; 2020.sofeware engineering of USC</p>
		</div>
	</div>
	
	
	
	<!-- js -->
	<script src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script src="js/user.js"></script>
	
	<script>
		$(function(){
			var type = parseInt('${type }');
			$("#navigation").find("a").eq(type).addClass("active");
		})
	</script>
</body>
</html>