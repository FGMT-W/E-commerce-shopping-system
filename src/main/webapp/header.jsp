<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
</head>
<body>

<div class="box">
      <div class="inner whiteGL">
          <div class="left">
              <a class="mix" href="">仿小米商城-学习专用</a>
          </div>
          <div class="right">
          <c:if test="${sessionScope.user == null }">
              <a class="mix" href="login.jsp">登录</a>
              <a href="regist.jsp">注册</a>
           </c:if>
           <c:if test="${sessionScope.user != null }">
           		<span style="color:white;font-size: 12px;">欢迎${user.username }来到小米商城</span>
           </c:if>
              <a class="max"  href="">消息通知</a>
              <a href="Trolley?method=findTrolleyList">
              	<span>购物车(<span id="trolleyNumber" style="color:white;">0</span>)</span>
              </a>
          </div>
      </div>
  </div>
  <div class="logo">
      <div class="logo_left">
          <div>
              <a href="javascript:void(0);" title="小米官网"><img class="xiaomi" src="img/logo.jpg"></a>
          </div>
      </div>
      <ul class="logo_center orangeGL">
          <a href="">小米手机</a>
          <a href="">红米</a>
          <a href="">笔记本</a>
          <a href="">电视</a>
          <a href="">盒子</a>
          <a href="">新品</a>
          <a href="">路由器</a>
          <a href="">智能硬件</a>
          <a href="">服务</a>
          <a href="">社区</a>
      </ul>
      <form class="logo_right">
         <div class="logo_input"><input id="search" type="text"></div>
          <a class="logo_right_a"><img src="img/find.jpg"></a>
          <!--<a href="">红米5新品</a>-->
          <!--<a href="">小米Noto 3</a>-->
      </form>
  </div>
  
  <script type="text/javascript">
	//页面加载时强制执行查询数据表获取购物车记录显示到页面中的购物车数量
	var user="${sessionScope.user}";
	if(user!=null&&user!=""){
		//请求后台servlet查询当前用户对应的购物车记录
		$.ajax({
			url:"Trolley",
			type:"post",
			data:{"method":"findTrolleyCountByUid"},
			dataType:"text",
			success:function(obj){
				//obj代表当前用户的购物车记录数
				$("#trolleyNumber").text(obj);
			}
		})
	}
	
  	$(".logo_right_a").click(function(){
  		$.ajax({
  			url:"Index",
  			type:"post",
  			data:{"method":"searchGoods","search":$("#search").val()},
  			dataType:"json",
  			success:function(obj){
  				if(obj){
  					alert("cookie添加成功");
  				}
  			}
  		})
  	})
  </script>
</body>
</html>