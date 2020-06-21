//注销
function logout(){
	$.post("user/logout", null, function(data){
		if ( data == 1 ) {
			location.href = "index.jsp";
		} else {
			alert("注销失败！");
		}
	});
}

//专栏页面
function toClassify(){
	$.post("content/getContentByPage", {aid: 1, page: 1}, function(data){
		if (data == 1) {
			location.href = "classify.jsp";
		} else {
			alert("获取内容失败！");
		}
		
	});
}

//博客页面
function toBlog(){
	$.post("content/getAllContentByPage", {page: 1,condition: 'time'}, function(data){
		if ( data == 1 ) {
			location.href = "blogs.jsp";
		} else {
			alert("获取内容失败！");
		}
	});
}

//消息页面
function toMessage(id){
	$.post("user/getMessage", {id: id, type: 0}, function(date){
		date = parseInt(date);
		if (date == 1) {
			window.location.href = "message.jsp";
		} else {
			alert("获取内容失败！");
		}
	});
	
}

//阅读更多
function toSingle(id){
	
	$.post("content/getContentById", {
		id : id
	}, function(data) {
		data = parseInt($.trim(data));
		if (data == 1) {
			location.href = "single.jsp";
		} else {
			alert("读取数据失败！");
		}
	});
}

//所有博客按条件排序
function changeCondition(obj){
	var style = $(obj).attr("class");

	if (style == "nav-link active") {
		return;
	} else {
		var condition = "";
		var txt = $(obj).text();
		if (txt == "按时间排序") {
			condition = "time";
		} else if (txt == "按点赞数排序") {
			condition = "star";
		}
		
		$.post("content/getAllContentByPage", {page: 1,condition: condition}, function(data){
			data = parseInt($.trim(data));
			if (data == 1) {
				location.reload();
			} else {
				alert("读取数据失败！");
			}
		});
	}
}

//专栏选择部门博客
function changeType(aid){
	$.post("content/getContentByPage", {aid:aid, page:1}, function(data){
		data = parseInt(data);
		if (data > 0) {
			window.location.reload();
		} else {
			alert("获取数据失败！");
		}
	});
}

//所有博客改变页数
function blogsChangePage(num, condition){
	
	$.post("content/getAllContentByPage", {page: num,condition: condition}, function(data){
		data = parseInt($.trim(data));
		if (data == 1) {
			location.reload();
		} else {
			alert("读取数据失败！");
		}
	});
	
}

//所有博客移动页数
function blogsMovePage(str, condition, page, pages){
	page = parseInt(page);
	pages = parseInt(pages);
	
	if (str == "previous") {
		if (page == 1) {
			return;
		} else {
			var page = page - 1;
			$.post("content/getAllContentByPage", {page : page, condition : condition}, function(data){
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
			$.post("content/getAllContentByPage", {page : page, condition : condition}, function(data){
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

//专栏跳转到指定页
function classifyChangePage(num, aid) {

	$.post("content/getContentByPage", {
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
//专栏移动页数
function classifyMovePage(str, aid, page, pages){
	page = parseInt(page);
	pages = parseInt(pages);
	
	if (str == "previous") {
		if (page == 1) {
			return;
		} else {
			var page = page - 1;
			$.post("content/getContentByPage", {page : page, aid : aid}, function(data){
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
			$.post("content/getContentByPage", {page : page, aid : aid}, function(data){
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

//提交建议
function submitAdvise(flag){

	  if (flag == 'true') {
		  alert("请先登录！");
		  location.href = "signin.jsp";
	  } else {
		  var content = $("#iq").val();
		  var title = $("#subject").val();
		  
		  if ( title == "" || content == "" ) {
			  alert("主题或者建议不能为空！");
			  return;
		  }
		  $.post("user/submitAdvise", {content : content,title : title}, function(data){
			  data = parseInt($.trim(data));
			  if ( data > 0 ) {
				  $("#iq").val("");
				  $("#subject").val("");
				  alert("提交建议成功，我们会认真查看！");
			  } else {
				  alert("提交建议失败！");
			  }
		  });
	  }
}

//登录
function login(){
	var name = $("#name").val();
	var pwd = $("#pwd").val();
	
	if ( name == "" || pwd == "" ) {
		alert("用户名和密码不能为空！");
		return;
	}
	
	$.post("manager/login", {count : name, password : pwd}, function(data){
		data = parseInt($.trim(data));
		if ( data == 1 ) {
			//登录成功
			location.href = "back/main.jsp";
		} else if ( data == 0 ) {
			//登录失败
			alert("用户名或者密码错误！");
		}
	}, "text");
}

//查看消息
function lookMessage(id, cid, type) {
	type = parseInt(type) + 1;
	
	$.post("user/updateMessage", {
		id : id, cid:cid, type:type
	}, function(data) {
		data = parseInt($.trim(data));
		if (data == 1) {
			location.href = "single.jsp";
		} else {
			alert("读取数据失败！");
		}
	});
}

//切换消息页面
function changeMessage(obj, num, id){
	obj = $(obj);
	if ( obj.hasClass("active") ) {
		return;
	}

	$.post("user/getMessage", {id: id, type: num}, function(date){
		date = parseInt(date);
		if (date == 1) {
			window.location.reload();
		} else {
			alert("获取内容失败！");
		}
	});
}

//注册
function register(){
	var name = $("#name").val();
	var email = $("#email").val();
	var phone = $("#phone").val();
	var password = $("#password").val();
	
	var mreg = /\w+@\w+/;	//邮箱验证
		var preg = /\d+/;		//验证密码
		var hreg = /\d{11}/;	//验证手机号
	if ( name == "" || email == "" || phone == "" || password == "" ) {
		alert("请在信息填写完毕之后注册！");
		return;
	}
	if ( !mreg.test(email) ) {
			alert("邮箱格式不正确！   正确格式：xxx@xxx");
			return;
		}
		if ( !preg.test(password) ) {
			alert("密码格式不正确！   正确格式：只能包含数字");
			return;
		}
		if ( !hreg.test(phone) ) {
			alert("手机号格式不正确！   正确格式：只能包含数字且为十一位数");
			return;
		}
		$.post("user/register", {name : name, email : email, telephone : phone, password : password }, function(data) {
			data = parseInt($.trim(data));
			if ( data == -2 ) {
				alert("用户名已存在!");
			} else if ( data == -1 ) {
				alert("邮箱已存在!");
			} else if ( data > 0 ) {
				//注册成功，跳转到登录界面
				location.href = "signin.jsp";
			} else {
				//注册失败，提示信息
				alert("注册失败!");
			}
		});
}

//用户登录
function userLogin(){
	var email = $("#email").val();
	var password = $("#password").val();
	
	var mreg = /\w+@\w+/;	//邮箱验证
	var preg = /\d+/;		//验证密码
	if ( email == "" || password == "" ) {
		alert("邮箱和密码不能为空！");
		return;
	}
	if ( !mreg.test(email) ) {
		alert("邮箱格式不正确！   正确格式：xxx@xxx");
		return;
	}
	if ( !preg.test(password) ) {
		alert("密码格式不正确！   正确格式：只能包含数字");
		return;
	}
	
	$.post("user/login", {email : email, password : password}, function(data){
		data = parseInt($.trim(data));
		if ( data == 1 ) {
			//邮箱密码正确，登录成功
			$("#myform")[0].reset();
			// 判断是从注册界面过来的或者是直接进入登录界面
			var temp = document.referrer;
			if (temp == "" || temp.indexOf("register.jsp") > 0) {
				window.location.href = "index.jsp";
			} else {
				// 返回上一页并刷星
				window.location.href = document.referrer;
			}
			
		} else if ( data == 0 ) {
			//邮箱密码错误
			alert("邮箱或者密码错误！");
		}
	}, "text");
	
}

//点赞
function pick(type, cid, type_id, obj, flag){
	  //先判断用户是否登录
	  if (flag == 'true') {
		  alert("请先登录！");
		  location.href = "signin.jsp";
		  return;
	  }
	  
	  var option = "";
	  if (type == 1) {
		  option = changeBlogStar(obj);
	  } else {
		  option = changeOtherStar(obj);
	  }
	  
	  //修改数据库
	  if (option=="add"){
		  $.post("user/addStar", {cid: cid, type: type, type_id: type_id}, function(data){
			  data = parseInt(data);
			  
		  });
	  } else if (option=="subtract"){
		  $.post("user/subtractStar", {cid: cid, type: type, type_id: type_id}, function(data){
			  data = parseInt(data);
			  
		  });
	  }
}

//博客点赞
function changeBlogStar(obj){
	  obj = $(obj);
	  var iobj = obj.find("i");
	  var pobj = obj.find("p");
	  var style = iobj.attr("class");
	  var num = parseInt(pobj.text());
	  var option = "";
	  
	  if ( style == "iconfont icon-dianzan-yes" ){
		  //改变图标和数字
		  iobj.attr("class", "iconfont icon-dianzan-no");
		  num = num - 1;
		  pobj.text(num);
		  
		  option = "subtract";
		  
	  } else if ( style == "iconfont icon-dianzan-no" ){
		  //改变图标和数字
		  iobj.attr("class", "iconfont icon-dianzan-yes");
		  num = num + 1;
		  pobj.text(num);
		  
		  option = "add";
	  }
	  
	  return option;
}

//评论或者回复点赞
function changeOtherStar(obj){
	  var option = "";
	  obj = $(obj);
	  
	  var style = obj.attr("class");
	  var num = parseInt(obj.text());
	  if (style == 'iconfont icon-dianzan-yes') {
		  obj.attr("class", "iconfont icon-dianzan-no");
		  num = num - 1;
		  obj.text(num);
		  option = "subtract";
	  } else {
		  obj.attr("class", "iconfont icon-dianzan-yes");
		  num = num + 1;
		  obj.text(num);
		  option = "add";
	  }
	  
	  return option;
}

//取消
function toCancel(){
	  $("#iq").val("");
	  $("#iq").attr("placeholder", "想对作者说点什么。。。");
	  
	  type = "comment";
}

//提交评论
function toSubmit(id, flag){
	  if (flag == 'true') {
		  alert("请先登录！");
		  location.href = "signin.jsp";
		  return;
	  } else {
		  var text = $("#iq").val();
		  if ( text == "" ) {
			  alert("评论不能为空！");
			  return;
		  }
		  
		  if (type == "comment") {
			  //添加评论
			  $.post("user/addComment", {content: text, id: id}, function(data){
				  data = parseInt($.trim(data));
				  if ( data > 0 ) {
						// 刷新页面
						window.location.reload();
						$("#iq").val("");
					} else {
						alert("评论失败！");
					}
				});
		  } else {
			  //添加回复
			  $.post("user/addReply", {cid:id, comment_id:comment_id, to_uid:to_uid, content:text}, function(data){
				  data = parseInt($.trim(data));
				  if ( data > 0 ) {
						// 刷新页面
						window.location.reload();
						$("#iq").val("");
					} else {
						alert("回复失败！");
					}
			  });
		  }
		  
	  }
}

var type = "comment";
var to_uid = 0;
var comment_id = 0;
//点击回复
function reply(name, uid, cid){
	
	$("#iq").val("");
	$("#iq").attr("placeholder", "回复:   "+name);
	type = "reply";
	to_uid = uid;
	comment_id = cid;
}

//显示回复
function showReply(obj, num){
	var obj = $(obj);
	var par = obj.parents("li");
	var tem = par.next("li");
	
	var txt = obj.text();
	
	if (txt == "收起回复") {
		obj.text('查看回复('+num+')');
		tem.css("display","none");
	} else {
		obj.text('收起回复');
		tem.css("display","block");
	}	
}