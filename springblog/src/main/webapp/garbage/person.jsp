<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Bootstrap 101 Template</title>
    <!-- Bootstrap -->
    <link href="bootstrap3/bootstrap.css" rel="stylesheet">
    <link href="css/information.css" rel="stylesheet">
    <style>
    	body{
    		background-color:skyblue;
    	}
    </style>
  </head>
  <body>

	<form action="" method="post" >
		<table align="center" border = "0px" bordercolor="#0000FF" width="400px" height="500px" cellpadding="0" cellspacing="0"
			class="usertable">
				<h2 class="h2-1" >个人信息</h2><br>
			<tbody>
				<tr>
					<th>用户头像</th>
					<th><label for = "image" style = "cursor:pointer;">
						<img src="../upload/user/${user.photo }" align="bottom" height="180" width="150" class="userimg" for = "image">
						</label>
						<input type="file" id = "image" name = "image" accept = "image/*" style="position:absolute;clip:rect(0 0 0 0);" 
						onchange = "chooseimage()">
					</th>
				</tr>
				<tr>
					<th>用户序号</th>
					<th><p class="form-control-static">${user.uid }</p></th>
				</tr>
				<tr>
					<th>用户名</th>
					<th><p class="form-control-static">${user.uname }</p>
					</th>
				</tr>
				<tr>
					<th>邮箱</th>
					<th><p class="form-control-static">${user.email }</p></th>
				</tr>
				<tr>
					<th>电话号码</th>
					<th><p class="form-control-static">${user.telephone }</p></th>
				</tr>
			</tbody>
		</table>
	</form>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src = "js/ajaxfileupload.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="bootstrap3/bootstrap.js"></script>
    
    <script>
    	//选择图片 修改头像
    	function chooseimage(){
    		//要转换成dom元素对象
	    	var files = $("#image")[0].files;
    		if ( files.length == 0 ) {
    			return;
    		}
    		//发送ajax请求
    		$.ajaxFileUpload({
    				url : 'user/alterImage',
    				secureuri : false,
    				fileElementId : "image",
    				dataType : "json",
    				success : function(data){
    					data = parseInt($.trim(data));
    					if ( data > 0 ) {
    						//修改成功
    						alert("修改成功！");
    						location.reload();
    					} else {
    						//修改失败
    						alert("修改失败！");
    					}
    				}
    		});
    	}
    </script>
  </body>
</html>