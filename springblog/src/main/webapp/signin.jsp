<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>Login</title>
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
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/portfolio.css">
    <link rel="stylesheet" href="css/aos.css">
    <link href='css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700i" rel="stylesheet">

</head>

<body>
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
                                <a class="nav-link" href="javascript:void(0);" onclick="toClassify()"> 专栏 </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="javascript:void(0);" onclick="toBlog()"> 全部博客 </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact.jsp"> 反馈 </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>

        <section class="banner-w3layouts">
            <div class="container">
                <div class="row banner-w3layouts-grids">
                    <div class="col-lg-5 sign-info" data-aos="fade-right">
                        <h3>登录</h3>
                        <p class="para-sign mt-2 mb-4 text-center">输入您的详细信息以登录帐户</p>

                        <form id="myform">
                            <div class="form-group">

                                <label>邮件*</label>
                                <div class="icon1">
                                    <input placeholder="" id = "email" name="mail" type="email" >
                                </div>
                            </div>
                            <div class="form-group">

                                <label>密码*</label>
                                <div class="icon2">
                                    <input placeholder="" id = "password" name="password" type="password" >
                                </div>
                            </div>
                            <input type="button" id="button" onclick="userLogin()" value="登录">
                            <p class="para-sign mt-3">是否拥有账号? <a href="register.jsp" class="ml-2"><strong>创建账号</strong></a></p>
                        </form>
                        
                        <a href = "login.jsp" style = "display:block;text-align:center;color:white"><strong>管理员登录</strong></a>
                    </div>
                    
                    <div class="col-lg-7 banner-w3layouts-image pl-md-5">
                        <div>
                            <img src="images/huaweipicture1.jpg" width="700px" height="589px">
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
    </div>

    <div class="cpy-right text-center py-3">
		<p class="copy-w3layouts">Copyright &copy; 2018.Company name All rights reserved.More Templates</p>
	</div>
	
    <!--model-forms-->
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
    
 	<script src="js/user.js"></script>
 	
</body>

</html>
