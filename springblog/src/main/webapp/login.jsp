<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="Description" content="用于发布自己所学的相关前后端技术">
<meta name="Keywords"
	content="个人博客，blog，bokee，it，前端技术，后端技术，html，css，jsp，servlet，Android，sql">
<title>Admin|Login</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/login.css">
<script src = "js/jquery-2.2.3.min.js"></script>
</head>
 <body>
        <div class="header" id="head">  
            <div class="title">管理员登陆</div>	
        </div>	
        <div class="wrap" id="wrap">
        	<form action="/blog/ToLogin" method="post">	
            <div class="logGet">
                <div class="logD logDtip">				
                    <p class="p1">登录</p>			
                </div>						
                <div class="lgD">				
                    <img src="images/login_user.jpg" width="20" height="20" alt=""/>   <input type="text" id = "name" name="name" required="required" placeholder="请输入用户名"/>
                </div>			
                <div class="lgD">				
                    <img src="images/login_pwd.jpg" width="20" height="20" alt=""/>    <input type="password" id = "pwd" name="pwd" required="required" placeholder="请输入用户密码"/>			
                </div>			
                <div class="logC">				
                    <input type="button" class="login-submit" value="登录" style = "cursor:pointer" onclick = "login()" />			
                </div>		
            </div>
            </form>
        </div>	
        <div class="footer" id="foot">  
            <div class="copyright">    
                <p>Copyright © 2019 MyBokee.site. All Rights Reserved.</p>    
                <div class="img">		
                    <i class="icon"></i><span>建议邮箱：1415442331@qq.com</span>	
                </div>		
                <div class="img">		
                    <i class="icon1"></i><span>建议地址：南华大学</span>	
                </div>	  	
                <div class="img">	  
                    <i class="icon2"></i><span>建议电话：18370235200</span>	
                </div>    
            </div>	
        </div>		
    </body>
    
    <script src="js/user.js"></script>
</html>