<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- //Meta tag Keywords -->

<!-- Custom-Files -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- Bootstrap-Core-CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/aos.css">
<link href='css/aos-animation.css' rel='stylesheet prefetch'
	type="text/css" media="all" />
<!-- Style-CSS -->
<!-- font-awesome-icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome-icons -->
<!-- /Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900"
	rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700i"
	rel="stylesheet">
<!-- //Fonts -->

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
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-4 m-auto">
							<li class="nav-item"><a class="nav-link" href="classify.jsp"
								onclick="toBlog()"> 专栏 </a></li>
							<li class="nav-item"><a class="nav-link" href="blogs.jsp">
									全部博客 </a></li>
							<li class="nav-item"><a class="nav-link" href="contact.jsp">
									建议 </a></li>
						</ul>
						<!-- ls -->
						<c:if test="${empty user }">
							<div class="header-right">
								<a href="signin.jsp" class="signin mr-4"> 登录 <i
									class="fas fa-sign-in-alt"></i></a> <a href="register.jsp"
									class="contact">启 程</a>
							</div>
						</c:if>
						<c:if test="${not empty user }">
							<div class="header-right">
								<a href="javascript:void(0);" class="signin mr-4">
									${user.uname } <i class="fas fa-sign-in-alt"></i>
								</a> <a href="javascript:void(0);" class="signin mr-4"
									onclick="logout()">注 销</a>
							</div>
						</c:if>
						<!-- ls -->
					</div>
				</nav>
			</div>
		</header>
		<!-- //header -->
	</div>
	
	<section class="ab-info-main py-md-5 py-5">
		<!-- 
		<div style="position: fixed; top: 160px; right: 140px; z-index: 999; width: 60px;">
			<a href="javascript:void(0);" onclick="pick($(this), ${content.cid})">
				<c:choose>
					<c:when test="${empty user }">
						<span class="glyphicon glyphicon-star-empty"
							style="font-size: 30px; color: blue;"></span>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${empty greats }">
								<span class="glyphicon glyphicon-star-empty"
									style="font-size: 30px; color: blue; cursor: pointer;"></span>
							</c:when>
							<c:otherwise>
								<c:set var="flag" value="0"></c:set>
								<c:forEach var="great" items="${greats }" varStatus="status">
									<c:if test="${great.cid == content.cid }">
										<c:set var="flag" value="1"></c:set>
										<span class="glyphicon glyphicon-star"
											style="font-size: 30px; color: blue; cursor: pointer;"></span>
									</c:if>
								</c:forEach>
								<c:if test="${flag == 0 }">
									<span class="glyphicon glyphicon-star-empty"
										style="font-size: 30px; color: blue; cursor: pointer;"></span>
								</c:if>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</a> <span id="star" style="font-size: 20px;"> <c:if
					test="${content.star != 0 }">
					${content.star }
				</c:if> <c:if test="${content.star == 0 }">
				</c:if>
			</span><br /> <a href="#miao"> <span class="glyphicon glyphicon-comment"
				style="font-size: 30px; margin-top: 20px; color: blue; letter-spacing: 0px;"></span>
			</a> <span style="font-size: 20px;"> <c:if
					test="${fn:length(comments) != 0 }">
            		${fn:length(comments) }
            	</c:if> <c:if test="${fn:length(comments) == 0 }">
				</c:if>
			</span>
		</div>
  -->
		<div class="container py-md-5 py-5">
			<div class="ab-info-grids pt-md-5 pt-0">
				<div class="blog-sec pt-md-3 pt-0">
					<div class="row mt-lg-5 mt-3">
						<!--  
                        <div class=" blog-left-content">
                            <div class="card" data-aos="fade-up">
                                <div class="card-body" style="width: 1126px;">
                                    <h5 class="card-title"><a class="b-post text-dark" href="javascript:void(0);">${content.title }</a></h5>
                                    <h6 class="date"><span>By: ${content.admin.department }</span> ${content.addtime }</h6>
                                    <p class="card-text">${content.content }</p>
                                    
                                </div>
                            </div>
							<a name="miao"></a>
                            <div class="comment-top contact">
                                 
                                <form name="contactform" id="contactform" method="post" action="#" onsubmit="return(validate());" novalidate="novalidate">
                                    <div class="form-group" data-aos="fade-up">
                                        <textarea name="issues" class="form-control" id="iq" placeholder="写下你的评论。。。"
                                        style = "height:180px"></textarea>
                                    </div>
                                    <button type="button" class="btn btn-primary" style="" onclick = "toComment(${content.cid})">提交评论</button>
                                </form>

                            </div>
                            
                            <div class="comment-top">
                                <h4>Comments</h4>
                                <c:if test="${empty comments }">
                                	<span style="display: block;text-align: center;">暂无评论</span>
                                </c:if>
                                <c:forEach var = "comment" items = "${comments }" varStatus = "status">
                                <div class="media">
                                    <img src="../upload/user/${comment.user.photo }" alt="" class="img-fluid" style = "width:80px;height:80px;"/>
                                    <div class="media-body">
                                    	<div style = "border-bottom:1px solid">
                                        	<h5 class="mt-0" style = "display:inline">${comment.user.uname }</h5>
                                        	<span style = "float:right">${comment.date }</span>
                                        </div>
                                        <p>${comment.comment }</p>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        -->
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="cpy-right text-center py-3">
		<p class="copy-w3layouts">Copyright &copy; 2018.Company name All
			rights reserved.More Templates</p>
	</div>

	<script src="js/jquery-2.2.3.min.js"></script>
	<!--/aos -->
	<script src="js/aos.js"></script>
	<script>
        AOS.init({
            easing: 'ease-out-back',
            duration: 1000
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
                    scrollTop: $(this.hash).offset().top
                }, 900);
            });
        });

    </script>
	<script>
        $(document).ready(function() {
            $().UItoTop({
                easingType: 'easeOutQuart'
            });

        });

    </script>

	<script src="js/bootstrap.js"></script>

	<script>
		  //注销
			function logout(){
				alert("从首页进。。。");
			}
		  
		  // 点赞
		  function pick(obj, cid){
			  var spanobj = obj.find("span");
			  //console.log(spanobj);
			  var str = spanobj.attr("class");
			  //console.log(str);
			  var url = 'user/alterStar';
			  var uid;
			  
			  if ( ${empty user} ) {
				  alert("请先登录！");
				  location.href = "signin.jsp";
			  } else {
				  uid = '${user.uid }';
				  // 修改页面
				  if (str == 'glyphicon glyphicon-star-empty'){
					  // 点赞
					  url += '?option=add';
					  spanobj.attr("class", "glyphicon glyphicon-star");
					  var num = $.trim($("#star").text());
					  //console.log(num);
					  if (num == "") {
						  //console.log("aaaa");
						  num = "0";
					  }
					  $("#star").text(parseInt(num) + 1);
					  
				  } else if (str == 'glyphicon glyphicon-star') {
					  // 取消赞
					  url += '?option=subtract';
					  spanobj.attr("class", "glyphicon glyphicon-star-empty");
					  var num = parseInt($.trim($("#star").text())) - 1;
					  if (num == 0) {
						  $("#star").text("");
					  } else {
						  $("#star").text(num);
					  }
				  }
			  }
			  
			  // 修改数据库
			  //console.log(url);
			  $.post(url, {uid: uid, cid: cid}, function(data){
				  data = parseInt($.trim(data));
				  if (data == 1) {
					  alert("点赞成功！");
				  } else {
					  alert("点赞失败！");
				  }
			  });
		  }
		  
		  //提交评论
		  function toComment(cid){
			  if (${empty user }) {
				  alert("请先登录！");
				  location.href = "signin.jsp";
			  } else {
				  
				  var text = $("#iq").val();
				  if ( text == "" ) {
					  alert("评论不能为空！");
					  return;
				  }
				  $.post("user/addComment", {comment: text, cid: cid}, function(data){
					  data = parseInt($.trim(data));
					  if ( data > 0 ) {
							// 刷新页面
							window.location.reload();
							$("#iq").val("");
						} else {
							alert("评论失败！");
						}
					});
			  }
		  }
    </script>

</body>

</html>
