<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" 	 href="css/index.css">
    <script type="text/javascript" src="js/jquery-3.1.1.js"></script>
    <style type="text/css">
    	.register_boby_no2 input{
    		width: 300px;
		    height: 40px;
		    line-height: 40px;
		    padding: 13px 16px 13px 14px;
		    display: block; 
		    margin: 10px auto;
    	}
    	
    	#img_code{cursor: pointer;}
    	
    </style>
</head>
<body>
<div class="register_head_on">

</div>
<div class="register_head">
    <a href="index.html"><img src="img/logo.jpg" alt=""></a>
    <div class="register_head_right">
        <p class="register_head_right_p1">小 米 商 城</p>
        <p class="register_head_right_p2">让每个人都享受科技乐趣</p>
    </div>

</div>
<div class="register">
    <div class="register_boby">
        <div class="register_boby_min">
            <div class="register_boby_no1">
                <div class="register_boby_no1_in">
                    <span style="color: #ff6700">验证码登录 </span>
                </div>
            </div>
            <form id="f3" action="User" method="post">
            
            <!-- fs区分的方法 -->
            <input name="method" value="checkCode" type="hidden">
            
            <div class="register_boby_no2">
            	<span id="msg" style="color: red;font-size: 12px;margin-left: 20px;"></span>
                <input id="username" name="username" type="text" placeholder="输入账号">
                <input id="password" name="password" type="password" placeholder="输入密码">
                
                <input id="vercode" name="vercode"  type="text" placeholder="输入验证码" style="width: 120px; margin-left: 57px;display: inline-block;">
                <!-- 新增加 -->
                <img id="img_code" align="middle" src = "authImage" style="width: 100px;height: 40px;margin-left: 15px;  display:inline-block;"/>
                <div style="clear: both;">
                
                <div id="loginbtn" class="register_boby_no2_div">
                    <span id="sub">登录</span>
                </div>
            </div>
            </div>
            </form>
            
            <div class="register_boby_no3">
                <a href="javascript:void(0);" style="color: #ff6700">账号密码登录</a>
                <span class="register_boby_no3_span">
                    <a href="regist.jsp">立即注册</a>
                    <span>|</span>
                    <a href="avascript:void(0);">忘记密码?</a>
                </span>

            </div>
            <div class="register_boby_no4">
                <img src="img/register02.jpg" alt="">
            </div>

        </div>
    </div>
</div>
<div class="register_foot">
    <img  src="img/register03.jpg" alt="">
</div>
</body>
<script type="text/javascript">
	$("#img_code").click(function(){
		$(this).prop("src","authImage?date="+new Date());
	});

	$("#sub").click(function(){
		//清空错误消息
		$("#msg").text("");
		//获取账号、密码、验证码
		var username = $("#username").val();
		var password = $("#password").val();
		var vercode = $("#vercode").val();
		//非空验证
		if($.trim(username)==""){
			$("#msg").text("账号不能为空").css("color","red");
			return;
		}
		if($.trim(password)==""){
			$("#msg").text("密码不能为空").css("color","red");
			return;
		}
		if($.trim(vercode)==""){
			$("#msg").text("验证码不能为空").css("color","red");
			return;
		}
		//验证验证码是否正确
		 $.ajax({
			url:"User",
			data:{"vercode":vercode,"method":"checkeVercode"},
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj==true){
					//用户名和密码的验证
					window.location="User?method=checkLogin&username="+username+"&password="+password;
				}else{
					$("#msg").text("验证码不正确").css("color","red");
					//刷新验证码
					$("#img_code").prop("src","authImage?date="+new Date());
				}
			}
		}) 
	});
	
</script>
</html>


