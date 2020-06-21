//用户信息
function toUser(){
	$.post("../content/getAllUser", null, function(data){
		data = parseInt($.trim(data));
		if ( data == 1 ) {
			location.href = "user.jsp";
		} else {
			alert("获取数据失败！");
		}
		
	}, "text");
}
	    
//注销
function logout(){
	$.post("../manager/logout", null, function(data){
		data = parseInt($.trim(data));
		if ( data == 1 ) {
			location.href = "../index.jsp";
		} else {
			alert("注销失败！");
		}
	});
}
	    
//内容首页
function toContent(id){
	
	$.post("../content/getContentByPage", {aid : id, page:1}, function(data){
		data = parseInt($.trim(data));
		if ( data == 1 ) {
			location.href = "content.jsp";
		} else {
			alert("获取数据失败！");
		}
		
	});
}

//用户建议
function toAdvise(){
	$.post("../content/getAllAdvise", null, function(data){
		data = parseInt($.trim(data));
		if ( data == 1 ) {
			location.href = "advise.jsp";
		} else {
			alert("获取数据失败！");
		}
		
	});
}

//添加博客
function addcontent(){
	
	var title = $("#title").val();
	var content = editor.html();
	
	$.post("../manager/insertBlog", {content:content, title:title}, function(data){
		
		data = parseInt(data);
		if (data == 1) {
			window.location.href = "content.jsp";
		} else if(data == 0){
			alert("添加博客失败！请重试！");
		} else if(data == -1){
			alert("找不到图片！请重试！");
		}
	});
	
}

//查看建议
function getAdvise(id, status){
	
	$.post("../manager/getContactById", {id:id,status:status}, function(data){
		if (data == "") {
			alert("获取数据失败！请重试！");
		} else {
			var json = JSON.parse(data);
			
			var str = '<div class="panel panel-default"><div class="panel-heading" style="cursor:pointer; color:#23527c" onclick="back()">返回</div>';
			str += '<div class="panel-body"><div class="panel-heading">';
			str += '<div>标题：<span style="font-weight:bold;font-size:15px;">'+ json.title +'</span></div>';
			str += '<div style="margin-top:10px;">';
			str += '发件人:<span style="margin:0px 10px 0px 5px;font-weight:bold;">'+ json.uname +'</span>时 间:<span style="margin-left:5px;font-weight:bold;">'+ json.date +'</span>';
			str += '</div></div><div class="panel-body" style="width:90%; margin:0px auto;">'+ json.content +'</div>';
			str += '</div></div>';
			
			$("#content").html(str);
			
		}
	});
}

function back(){
	window.location.reload();
}

//选择页面
function movePage(str, aid, page, pages){
	page = parseInt(page);
	pages = parseInt(pages);
	
	if (str == "previous") {
		if (page == 1) {
			return;
		} else {
			var page = page - 1;
			$.post("../content/getContentByPage", {page : page, aid : aid}, function(data){
				data = parseInt($.trim(data));
				if (data == 0) {
					alert("获取数据失败！");
				} else if (data == 1) {
					location.reload(); //重新加载页面
				}
			});
		}
	} else if (str == "next") {
		if (page == pages) {
			return;
		} else {
			var page = page + 1;
			$.post("../content/getContentByPage", {page : page, aid : aid}, function(data){
				data = parseInt($.trim(data));
				if (data == 0) {
					alert("获取数据失败！");
				} else if (data == 1) {
					location.reload(); //重新加载页面
				}
			});
		}
	}
	
}

//跳转到指定页
function changePage(num, aid){
	
	$.post("../content/getContentByPage", {
		page : num,
		aid : aid
	}, function(data) {
		data = parseInt($.trim(data));
		if (data == 0) {
			alert("获取数据失败！");
		} else if (data == 1) {
			location.reload(); //重新加载页面
		}
	});
	
}

//编辑博客
function editorBlog(cid){
	$.post("../content/getContentById", {
		id : cid
	}, function(data) {
		data = parseInt($.trim(data));
		if (data == 1) {
			location.href = "editor.jsp";
		} else {
			alert("读取数据失败！");
		}
	});
}

//删除博客
function deleteBlog(cid) {
	var flag = confirm("确定删除该篇博客吗？");
	if (flag) {
		$.post("../manager/deleteblog", {
			cid : cid
		}, function(data) {
			data = parseInt($.trim(data));
			if (data == 1) {
				alert("删除成功！");
				location.href = "content.jsp";
			} else {
				alert("删除失败！请重试！");
			}
		});
	}
}

//重新提交博客
function resubmitBlog(cid){
	var title = $("#title").val();
	var content = editor.html();
	
	$.post("../manager/resubmitBlog", {cid:cid, title:title, content:content}, function(data){
		data = parseInt(data);
		if (data == 1) {
			window.location.href = "content.jsp";
		} else if (data == 0) {
			alert("获取数据失败！");
		}
	});
}

//提交系统通知	
function submitNotice(){
		var content = $("#iq").val();
		if (content == "") {
			alert("输入内容为空！");
			return;
		}
		
		$.post("../manager/insertSys_notice", {content:content}, function(data){
			data = parseInt(data);
			console.log(data);
			if (data == 1) {
				$("#iq").val("");
				alert("提交成功！");
			} else {
				alert("提交失败！");
			}
		});
	}
