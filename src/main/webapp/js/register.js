$(function(){
	$("#btn").click(function(){
		var name = $("[name='name']").val();			
		var phone_number = $("[name='phone_number']").val();
		var username = $("[name='username']").val();
		var password = $("[name='password']").val();
		if("" == name){
			$("#s_name").html("姓名不能为空");
			return;
		}
		
		if("" == username){
			$("#s_username").html("用户名不能为空");
			return;
		}
		if("" == password){
			$("#s_password").html("密码不能为空");
			return;
		}
		
		$("#f4").submit();
	});
	
	//手机号唯一校验
	$("#phone_number").blur(function(){
		//为空判断
		if("" == $("#phone_number").val()){
			$("#s_phone_number").html("<font style='color:red'>手机号不能为空</font>");
			$("#phone_number").focus();
			return;
		}
		$.ajax({
			url:"userServlet",
			data:{"phone_number":$("#phone_number").val(),"mark":"checkPhoneNumber"},
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj == true){
					$("#s_phone_number").html("<font style='color:green'>手机号可以注册</font>");
				}else{
					$("#s_phone_number").html("<font style='color:red'>手机号已被注册</font>");
					$("#phone_number").focus();
				}
			}
		});
	});
	
	//手机号唯一校验
	$("#username").blur(function(){
		//为空判断
		if("" == $("#username").val()){
			$("#username").html("<font style='color:red'>账号不能为空</font>");
			$("#username").focus();
			return;
		}
		$.ajax({
			url:"userServlet",
			data:{"username":$("#username").val(),"mark":"checkUserName"},
			type:"post",
			dataType:"json",
			success:function(obj){
				if(obj == true){
					$("#s_username").html("<font style='color:green'>账号允许注册</font>");
				}else{
					$("#s_username").html("<font style='color:red'>账号已被注册</font>");
					$("#username").focus();
				}
			}
		});
	});
});