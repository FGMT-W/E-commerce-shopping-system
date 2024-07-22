<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<!-- 引入必要的js文件 -->
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/messages_zh.js"></script>

<link type="text/css" rel="stylesheet" href="css/index.css"/> 

<style type="text/css">
	/* 设置验证消息样式 */
	.error{
		font-size: 14px;
		color: red;
		font-style: italic;
	}
	
<%-- 	<%@ include file="css/index.css" %>	 --%>
	
	 <%-- <jsp:include page="css/index.css"></jsp:include> 
	 --%>
</style>
</head>
<body>
	<div class="sign_background">
		<div class="sign_background_in">
			<div class="sign_background_no1">
				<a href="index.html"><img src="img/logo.jpg" alt=""></a>
			</div>
			<div class="sign_background_no2">注册小米帐号</div>
			<div class="sign_background_no3">
				<div class="sign_background_no5">
					<span style="color:red;font-size:16px;font-weight: bold;">${msg }</span>
					<form action="User?method=insertUser" method="post" enctype="multipart/form-data">
						<table style="width: 500px;" border="0" cellspacing="0">
							<tr>
								<td width="25%" class="_left">姓名：</td>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<td width="25%" class="_left">性别：</td>
								<td>男<input type="radio" name="sex" checked="checked"
									value="1"> 女<input type="radio" name="sex" value="0">
								</td>
							</tr>
							<tr>
								<td width="25%" class="_left">电话号码：</td>
								<td>
								<input type="text" id="phone_number" name="phone_number">
								<span id="phone_number_msg"></span>
								</td>
							</tr>
							<tr>
								<td width="25%" class="_left">所在地区：</td>
								<td><input type="text" name="area"></td>
							</tr>
							<tr>
								<td width="25%" class="_left">账号：</td>
								<td>
								<input type="text" id="username" name="username">
								<span id="username_msg">&nbsp;</span>
								</td>
							</tr>
							<tr>
								<td width="25%" class="_left">密码：</td>
								<td><input type="password" name="password"></td>
							</tr>
							<tr>
								<td width="25%" class="_left">上传头像：</td>
								<td><input type="file" name="photo"></td>
							</tr>
						</table>
						<div class="sign_background_no6" id="btn">立即注册</div>
					</form>

				</div>
			</div>
			<div class="sign_background_no7">
				注册帐号即表示您同意并愿意遵守小米 <span>用户协议</span>和<span>隐私政策</span>
			</div>
		</div>
		<div class="sign_background_no8">
			<img src="img/sign01.jpg" alt="">
		</div>
	</div>
</body>

<script type="text/javascript">
	$("form").validate({
		rules:{
			"name":{
				required:true
			},
			"area":{
				required:true
			},
			"password":{
				required:true
			}
		},
		messages:{
			"name":{
				required:"姓名不能为空"
			},
			"area":{
				required:"所在区域不能为空"
			},
			"password":{
				required:"密码不能为空"
			}
		},
		errorElement:"error"
	});
	
	/* 验证手机号码不能为空、格式是否正确、唯一验证 */
	$("#phone_number").blur(function(){
		//获取手机号码
		var phone_number=$("#phone_number").val();
		//判断非空
		if(phone_number==null||phone_number==""){
			$("#phone_number_msg").text("手机号码不能为空").css({"font-size":"14px","color":"red","font-style":"italic"});
			$("#phone_number").focus();
			return;
		}
		//格式验证，正则表达式
		if(!(/^1[3456789]\d{9}$/.test(phone_number))){
			$("#phone_number_msg").text("手机号码格式不正确").css({"font-size":"14px","color":"red","font-style":"italic"});
			$("#phone_number").focus();
		}else{
			//唯一验证，与数据库连接校验，使用ajax
			$.ajax({
				url:"User",//请求的servlet
				type:"post",//提交方式
				data:{"phone_number":phone_number,"method":"checkPhone"},//传递参数
				dataType:"json",//返回数据类型
				success:function(obj){
					/* 判断返回值obj（即servlet中返回的boolean类型的值） 
					   如果为true表示已注册过，不能再注册
					   如果为false表示未注册过，可以注册
					*/
					if(obj){
						$("#phone_number_msg").text("手机号码已被注册").css({"font-size":"14px","color":"red","font-style":"italic"});
						$("#phone_number").focus();
					}else{
						$("#phone_number_msg").text("手机号码可以注册").css({"font-size":"14px","color":"green"});
					}
				}
			})
		}	
	});
	
	/* 验证用户名非空且唯 一*/
	$("#username").blur(function(){
		var username=$("#username").val();
		if(username==null||username==""){
			$("#username_msg").text("用户名不能为空").css({"font-size":"14px","color":"red","font-style":"italic"});
			$("#username").focus();
		}else{
			$.ajax({
				url:"User",
				type:"post",
				data:{"username":username,"method":"checkUserName"},
				dataType:"json",
				success:function(obj){
					if(obj){
						$("#username_msg").text("用户名已被注册").css({"font-size":"14px","color":"red","font-style":"italic"});
						$("#username").focus();
					}else{
						$("#username_msg").text("该用户名可以注册").css({"font-size":"14px","color":"green"});
					}
				}
			});
		}
	});
	
	$(function(){
		$("#btn").click(function(){
			$("form").submit();
		})
	});
</script>
</html>