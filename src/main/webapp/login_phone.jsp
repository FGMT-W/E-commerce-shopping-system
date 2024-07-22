<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" href="css/index.css">
    <script src="js/jquery-3.1.1.js"></script>
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
                    <span style="color: #ff6700">手机验证码登录 </span>
                </div>
            </div>
            <form id="f3" action="User" method="post">
            <!-- fs区分的方法 -->
            <input name="fs" value="checkCode" type="hidden">
            <div class="register_boby_no2">
            	<span id="msg" style="color: red;font-size: 12px;margin-left: 20px;"></span>
                <input id="phone_number" name="phone_number" type="text" placeholder="手机号码">
                <input id="code" name="code" type="text" placeholder="手机校验码" style="width: 200px; margin-left: 15px;float: left;">
                <!-- 新增加 -->
                <input id="zphone" type="button" value=" 获取手机验证码 " style="width: 138px;float: left;height: 53px;margin-left: 5px;"> 
                <div style="clear: both;">
                <div id="login" class="register_boby_no2_div">
                    <span id="sub">登录</span>
                </div>
            </div>
            </div>
            </form>
            
            <div class="register_boby_no3">
                <a href="javascript:void(0);" style="color: #ff6700">账号密码登录</a>
                <span class="register_boby_no3_span">
                    <a href="register.jsp">立即注册</a>
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

<script type="text/javascript">
//读秒的方法
var iTime = 59;
var Account;
function RemainTime(){
	document.getElementById('zphone').disabled = true;
	var iSecond,sSecond="",sTime="";
	if (iTime >= 0){
		iSecond = parseInt(iTime%60);
		iMinute = parseInt(iTime/60)
		if (iSecond >= 0){
			if(iMinute>0){
				sSecond = iMinute + "分" + iSecond + "秒";
			}else{
				sSecond = iSecond + "秒";
			}
		}
		sTime=sSecond;
		if(iTime==0){
			clearTimeout(Account);
			sTime='获取手机验证码';
			iTime = 59;
			document.getElementById('zphone').disabled = false;
		}else{
			Account = setTimeout("RemainTime()",1000);
			iTime=iTime-1;
		}
	}else{
		sTime='没有倒计时';
	}
	document.getElementById('zphone').value = sTime;
}

	//验证手机号的非空、格式、是否已注册
	$("#zphone").click(function(){
		//获取手机号
		var phone_number=$("#phone_number").val();
		//判断
		if(phone_number==null||phone_number==""){
			$("#msg").text("手机号不能为空").css("color","red");
			$("#phone_number").focus();//将光标定位到当前文本框中
		}else if(!(/^1[3456789]\d{9}$/.test(phone_number))){ 
			$("#msg").text("手机号格式不正确").css("color","red"); 
			$("#phone_number").focus();
	    } else{
	    	$.ajax({
	    		url:"User",
	    		type:"post",
	    		data:{"phone_number":phone_number,"method":"checkPhone"},
	    		dataType:"json",
	    		success:function(obj){
	    			if(obj){
	    				//true表示已注册，允许登录
	    				//1.读秒
	    				RemainTime();
	    				//2.发送验证码
	    				sendCode(phone_number);
	    			}else{
	    				$("#msg").html("<a href='regist.jsp'>该手机号尚未注册，请前往先注册再登录！<a>");
	    			}
	    		}
	    	})
	    }
	})
	
	//发送验证码
	function  sendCode(phone_number) {
		$.ajax({
			url:"User",
			type:"post",
			data:{"phone_number":phone_number,"method":"sendCode"},
			dataType:"json",
			success:function(obj){
				if(obj){
					$("#msg").text("验证码发送成功").css("color","green");
				}else{
					$("#msg").text("验证码发送失败！").css("color","red");
				}
			}
		})
	}
	
	//登录功能 
	$("#login").click(function(){
		//获取手机号
		var phone=$("#phone_number").val();
		//获取验证码
		var code=$("#code").val();
		if(code==null||code==""){
			$("#msg").text("请输入验证码").css("color","red");
		}else{
			$.ajax({
				url:"User",
				type:"post",
				data:{"phone_number":phone_number,"code":code,"method":"login"},
				dataType:"json",
				success:function(obj){
					if(obj){
						//登录成功跳转到index.jsp页面
						window.location="index.jsp";
					}else{
						//登录失败跳转到login.jsp页面
						window.location="login.jsp";
					}
				}
			})
		}
	});
	
</script>

</body>
</html>