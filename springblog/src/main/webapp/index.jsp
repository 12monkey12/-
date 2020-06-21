<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="zxx">
<head>
    <title>Home</title>
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

    <!-- Custom-Files -->
    <link rel="stylesheet" href="css/bootstrap.css">
    <!-- Bootstrap-Core-CSS -->
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/portfolio.css">
    <link rel="stylesheet" href="css/aos.css">
    <link href='css/aos-animation.css' rel='stylesheet prefetch' type="text/css" media="all" />
    <link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700i" rel="stylesheet">
    <!-- //Fonts -->
    <link rel="stylesheet" href="css/iconfont.css"/>

</head>

<body>
    <div class="main-content" id="home">
        <header class="py-1">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <h1>
                        <a class="navbar-brand" href="javascript:void(0)"><i style=
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
                            <a href="javascript:void(0);" class="signin mr-4" onclick = "toMessage(${user.id })"><i class="iconfont icon-xiaoxi"></i></a>
                        </div>
                        </c:if>
                    </div>
                </nav>
            </div>
        </header>
        
        <section class="banner-w3layouts">
            <div class="container">
                <div class="row banner-w3layouts-grids">
                    <div class="col-lg-6 banner-w3layouts-info">
                        <p class="mb-4" data-aos="fade-up"> 华为技术有限公司成立于1987年，总部位于广东省深圳市龙岗区。华为是全球领先的信息与通信技术（ICT）解决方案供应商，专注于ICT领域，坚持稳健经营、持续创新、开放合作，在电信运营商、企业、终端和云计算等领域构筑了端到端的解决方案优势，为运营商客户、企业客户和消费者提供有竞争力的ICT解决方案、产品和服务，并致力于实现未来信息社会、构建更美好的全联接世界。2013年，华为首超全球第一大电信设备商爱立信，排名《财富》世界500强第315位。截至2016年底，华为有17多万名员工，华为的产品和解决方案已经应用于全球170多个国家，服务全球运营商50强中的45家及全球1/3的人口。</p>
                    </div>
                    <div class="col-lg-6 banner-w3layouts-image">
                        <div>
                            <img src="images/poster.jpg" alt="" class="img-fluid image1">
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- //banner-w3layouts -->
    </div>
    <!--/ab -->
    <section class="about py-lg-5 py-md-5 py-3">
        <div class="container">
            <div class="inner-sec-wthree py-lg-5 py-3">
                <!-- services -->
                <div class="fetured-info pt-lg-5">
                    <h3 class="tittle text-uppercase text-center my-lg-5 my-3"><span class="sub-tittle"> 产品服务 </span> 业务领域 </h3>
                    <div class="row fetured-sec mt-lg-5">

                        <div class="col-lg-6 serv_bottom">
                            <div class="featured-left text-center">
                                <div class="bottom-gd fea p-5 my-3" data-aos="fade-left">
                                    <span class="fa fa-lightbulb-o" aria-hidden="true"></span>
                                    <p class="px-lg-3">华为聚焦ICT基础设施领域，围绕政府及公共事业、金融、能源、电力和交通等客户需求持续创新，提供可被合作伙伴集成的ICT产品和解决方案，帮助企业提升通信、办公和生产系统的效率，降低经营成本。华为还将对网络、云计算、未来个人和家庭融合解决方案的理解融入到各种终端产品中，坚持“开放、合作与创新”，与操作系统厂家、芯片供应商和内容服务商等建立良好的合作关系，构建健康完整的终端生态系统。</p>
                                </div>
                                <div class="bottom-gd fea active p-5" data-aos="fade-left">
                                    <span class="fa fa-laptop" aria-hidden="true"></span>
                                    <p class="px-lg-3">华为技术（华为）是全球领先的电信解决方案供应商，专注于与运营商建立长期合作伙伴关系。华为拥有热诚的员工和强大的研发能力，快速响应客户需求，提供客户化的产品和端到端的服务，助力客户商业成功。华为产品和解决方案涵盖移动、宽带、IP、光网络、网络能源、电信增值业务和终端等领域，致力于提供全IP融合解决方案，使最终用户在任何时间、任何地点都可以通过任何终端享受一致的通信体验，方便人们的沟通和丰富人们的生活。</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 p-0">
                            <img src="images/img1.jpg" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
                <!-- //services -->
            </div>
        </div>
    </section>
    <!--//team -->
    <section class="banner-w3layouts-bottom py-lg-5 py-4">
        <div class="container">
            <div class="inner-sec-wthree py-lg-5 py-4 speak">
                <h3 class="tittle text-uppercase text-center my-lg-5 my-3"><span class="sub-tittle">关键人物</span> 我们伟大的团队 </h3>
                <div class="row mt-lg-5 mt-4">
                    <div class="col-md-4 team-gd text-center" data-aos="fade-right">
                        <div class="team-img mb-4">
                            <img src="images/people1.jpg" class="img-fluid rounded-circle" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Designer</span> 任正非 </h3>
                            <p>自律永远是管理的低成本。</p>
                        </div>
                    </div>

                    <div class="col-md-4 team-gd second text-center">
                        <div class="team-img mb-4">
                            <img src="images/people2.jpg" class="img-fluid rounded-circle" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Designer</span> 梁 华 </h3>
                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-4 team-gd text-center" data-aos="fade-left">
                        <div class="team-img mb-4">
                            <img src="images/people3.jpg" class="img-fluid rounded-circle" alt="user-image">
                        </div>
                        <div class="team-info">
                            <h3 class="mt-md-4 mt-3"><span class="sub-tittle-team">Designer</span> 孟晚舟 </h3>
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- copy-w3layoutsright -->
    <div class="cpy-right text-center py-3">
        <p class="copy-w3layouts">Copyright &copy; 2018.Company name All rights reserved.More Templates</p>
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
    <!--/counter-->
    <script src="js/counternew.js"></script>
    <!--//counter-->
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
