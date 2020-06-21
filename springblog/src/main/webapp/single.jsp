<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>Single</title>
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

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/aos.css">
<link href='css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />
<link href="css/font-awesome.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700i"
	rel="stylesheet">
<link rel="stylesheet" href="css/iconfont.css" />

<style>
	#tool li{
		margin-bottom:1px;
	}
	#tool button{
		cursor: pointer;
		padding: 0px 15px;
		border: none;
	}
	#tool button:hover{
		background-color: #f44444;
	}
	#comment button{
		cursor: pointer;
		border: none;
		background-color: grey;
		padding: 8px 16px;
	}
	#comment button:hover{
		background-color: #f44444;
	}
	body{
		background-image: url(images/bg.png);
		background-repeat: repeat;
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
						<a class="navbar-brand" href="index.jsp">
						<i style="display: inline-block; background-image: url(images/huawei.jpg); z-index: 1000; width: 60px; 
						height: 60px; background-size: 60px 60px"></i></a>
					</h1>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-4 m-auto">
							<li class="nav-item"><a class="nav-link" href="javascript:void(0);" onclick="toClassify()"> 专栏 </a></li>
							<li class="nav-item"><a class="nav-link" href="javascript:void(0);" onclick="toBlog()">全部博客 </a></li>
							<li class="nav-item"><a class="nav-link" href="contact.jsp"> 反馈 </a></li>
						</ul>

						<c:if test="${empty user }">
							<div class="header-right">
								<a href="signin.jsp" class="signin mr-4"> 登录 <i
									class="fas fa-sign-in-alt"></i></a> <a href="register.jsp"
									class="contact"> 注 册 </a>
							</div>
						</c:if>
						<c:if test="${not empty user }">
							<div class="header-right">
								<a href="javascript:void(0);" class="signin mr-4">${user.name } <i class="fas fa-sign-in-alt"></i>
								</a> <a href="javascript:void(0);" class="signin mr-4" onclick="logout()">注 销</a>
								<a href="javascript:void(0);" class="signin mr-4" onclick="toMessage(${user.id })"><i class="iconfont icon-xiaoxi"></i></a>
							</div>
						</c:if>
					</div>
				</nav>
			</div>
		</header>
	</div>
	
	<div id="tool" style="position:fixed; top: 120px; right: 100px; background-color: white; ">
		<ul style="list-style:none">
			<li>
				<button onclick="pick(1, ${content.id }, ${content.id }, this, '${empty user }')">
					<c:if test="${content.uid == user.id }">
						<i class="iconfont icon-dianzan-yes"></i>
					</c:if>
					<c:if test="${content.uid != user.id }">
						<i class="iconfont icon-dianzan-no"></i>
					</c:if>
					<p style="color: black;">${content.star }</p>
				</button>
			</li>
			<li>
				<a href="#comment">
					<button>
							<i class="iconfont icon-pinglun"></i>
							<p style="color: black;">${content.comment }</p>
					</button>
				</a>
			</li>
		</ul>
	</div>
	
	<div id="content" style="padding-top: 120px; margin-bottom: 40px;">
		<div id="blog" style="width:80%; margin: 0px auto; background-color: white; padding: 20px;">
			<div id="title">
				<h1>${content.title }</h1>
				<div style="margin: 20px 0px 0px 20px;">
					<span>By ${content.admin_department }</span>
					<span style="margin-left: 50px;">${content.date }</span>
				</div>
			</div>
			<hr/>
			<div>
				<p>
					${content.content }
				</p>
			</div>
		</div>
		<div id="comment" style="width:80%; margin: 0px auto; background-color: white; padding:105px 20px 20px 20px;">
			
			<div>
				<img src="images/login_user.jpg" alt="" style="width:40px; height:40px; border:1px solid black; border-radius:50%; float: left;"/>
				<div style="margin-left:50px;">
					<textarea id="iq" style="width:100%; height:90px; padding:10px 10px;" placeholder="想对作者说点什么。。。"></textarea>
					<div style="padding-left:85%; margin-top:10px;">
						<button onclick="toSubmit(${content.id })">发布</button>
						<button onclick="toCancel()">取消</button>
					</div>
				</div>
			</div>
			<hr/>
			<div>
				<h5>全部评论</h5>
				<div style="margin-top:20px;">
					<c:if test="${empty comments }">
						<p>该博客暂无评论。。。</p>
					</c:if>
					<c:if test="${not empty comments }">
						<c:forEach items="${comments }" var="comment" varStatus="status">
							<ul style="list-style:none;padding:16px 0px;border-bottom:1px dashed #e0e0e0;">
								<li>
									<div>
										<img src="images/login_user.jpg" alt="" style="width:40px; height:40px; border:1px solid black; border-radius:50%;"/>
										<span style="margin-left:20px;">${comment.uname }</span>
										<span style="padding-left:50px;color:#999;">${comment.date }</span>
										
										<c:choose>
											<c:when test="${comment.guid == user.id }">
												<i class="iconfont icon-dianzan-yes" style="cursor:pointer;float:right;margin:0px 7px;width:32px;" onclick="pick(2, ${content.id }, ${comment.id }, this, '${empty user }')">${comment.star }</i>
											</c:when>
											<c:otherwise>
												<i class="iconfont icon-dianzan-no" style="cursor:pointer;float:right;margin:0px 7px;width:32px;" onclick="pick(2, ${content.id }, ${comment.id }, this, '${empty user }')">${comment.star }</i>
											</c:otherwise>
										</c:choose>
										<c:if test="${comment.reply_count > 0 }">
											<a href="javascript:void(0)" style="float:right;margin:0px 7px" onclick="showReply(this, ${comment.reply_count })">查看回复(${comment.reply_count })</a>
										</c:if>
										<a href="#comment" style="float:right;margin:0px 7px" onclick="reply('${comment.uname }',${comment.uid },${comment.id })">回复</a>
										
									</div>
									<div style="margin-left:60px;margin-top:10px;">
										${comment.content }
									</div>
								</li>
								<c:if  test="${comment.reply_count > 0 }">
									<li style="display:none">
										<ul style="list-style:none;margin-left:40px;margin-top:10px;border-left:2px solid black;padding-left:10px;">
											<c:forEach items="${comment.replies }" var="reply" varStatus="status">
												<li>
													<div>
														<img src="images/login_user.jpg" alt="" style="width:40px; height:40px; border:1px solid black; border-radius:50%;"/>
														<span style="margin:0px 20px;">${reply.from_uname }</span>
														<span style="color:#999;">回复</span>
														<span style="margin-left:20px;">${reply.to_uname }</span>
														<span style="padding-left:50px;color:#999;">${reply.date }</span>
														
														<c:choose>
															<c:when test="${reply.guid == user.id }">
															<i class="iconfont icon-dianzan-yes" style="cursor:pointer;float:right;margin:0px 7px;width:32px;" onclick="pick(3, ${content.id }, ${reply.id }, this, '${empty user }')">${reply.star }</i>
															</c:when>
															<c:otherwise>
															<i class="iconfont icon-dianzan-no" style="cursor:pointer;float:right;margin:0px 7px;width:32px;" onclick="pick(3, ${content.id }, ${reply.id }, this, '${empty user }')">${reply.star }</i>
															</c:otherwise>
														</c:choose>
														<a href="#comment" style="float:right;margin:0px 7px;" onclick="reply('${reply.from_uname }', ${reply.from_uid }, ${reply.comment_id })">回复</a>
														
													</div>
													<div style="margin-left:60px;margin-top:10px;">
														${reply.content }
													</div>
												</li>
											</c:forEach>
										</ul>
									</li>
								</c:if>
							</ul>
						</c:forEach>
					</c:if>

				</div>
			</div>
		</div>
	</div>

	<div class="cpy-right text-center py-3">
		<p class="copy-w3layouts">Copyright &copy; 2018.Company name All rights reserved.More Templates</p>
	</div>

	<script src="js/jquery-2.2.3.min.js"></script>
	
	<script src="js/move-top.js"></script>
	<script src="js/easing.js"></script>
	<script>
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });
    </script>
	

	<script src="js/bootstrap.js"></script>

	<script src="js/user.js"></script>

</body>

</html>
