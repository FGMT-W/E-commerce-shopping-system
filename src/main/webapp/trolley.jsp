<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/xmpic/";
	
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
    <link rel="stylesheet" href="css/index.css">
    <script type="text/javascript" src="js/jquery-3.1.1.js"></script>
</head>
<body>
    <div class="order_head">
        <div class="head_background">
            <div class="head_box">
                <a href="index.html" class="head_left_a"><img src="img/logo.jpg" alt="" class="head_left_p"></a>
                <h1 class="head_h1">我的购物车</h1>
                <div class="head_right">
                    <span class="head_right_in"> ${user.name }/${user.username }</span>
                    <span class="head_right_in">|</span>
                    <a href="" class="head_right_in">我的订单</a>
                </div>

            </div>
        </div>
    </div>
    <div class="trolley_background">
        <div class="trolley_background_in">
            <div class="tro_tab_h">
                <div class="col tro_tab_check">
                    <h1 class="tro_tab_check_p">√</h1>
                    <span class="tro_tab_check_sp">全选</span>

                </div>
                <div class="col tro_tab_img">

                </div>
                <p class="col tro_tab_name">商品名称</p>
                <div class="col tro_tab_price">单价</div>
                <div class="col tro_tab_num">数量</div>
                <div class="col tro_tab_total">小计</div>
                <div class="col tro_tab_action">操作</div>
            </div>
            <c:set var="sum_price" value="0"></c:set>
            <c:set var="count_number" value="0"></c:set>
            <c:forEach items="${tlist }" var="trolley">
	            <div class="tro_tab_h1">
	                <div class="col tro_tab_check">
	                    <h1 class="tro_tab_check_p" style="background-color: #fff">
							<input type="checkbox" name="ids">
						</h1>
	                    <span class="tro_tab_check_sp"></span>
	
	                </div>
	                <div class="col tro_tab_img">
	                    <img src="<%=imgPath %>${trolley.goods.pic}" alt="">
	
	                </div>
	                <div class="col tro_tab_name">
	                <!--<h2 tro_tab_name_h2>小米电视4A 32英寸 黑色 32英寸</h2>-->
	               <li class="tro_tab_name_li1" style="font-size: 16px;">${trolley.goods.gname }&nbsp;${trolley.goods.color }</li>
	                </div>
	                <div class="col tro_tab_price">
	                    <span  id="price">${trolley.goods.price }</span><span>元</span>
	                </div>
	                <div class="col tro_tab_num">
	                    <a class="tro_tab_num_p1" id="subtract" href="javascript:void(0)" onclick="addOrDeleteNumber(${trolley.tid},${trolley.number-1 })">-</a>
	                    <input type="text" disabled="disabled" value="${trolley.number }" id="num">
	                    <c:set var="count_number" value="${count_number + trolley.number}"></c:set>
	                    <a class="tro_tab_num_p2" id="plus" href="javascript:void(0)" onclick="addOrDeleteNumber(${trolley.tid},${trolley.number+1 })">+</a>
	                </div>
	                <div class="col tro_tab_total ">
	                <span class="tro_tab_total_value" id="prices" >${trolley.number*trolley.goods.price }</span>元
	                 <c:set var="sum_price" value="${sum_price+trolley.number*trolley.goods.price}"></c:set>
	                </div>
	                <div class="col tro_tab_action" style="cursor: pointer;width: 40px;height: 40px;" onclick="delTrolley(${trolley.tid})">删除</div>
	            </div>
            </c:forEach>
        </div>
        
        <div class="tro_close_bot ">
            <!--<p class="tro_bot_ppp">+</p>-->
            <p class="tro_close_p "> <a href="index.jsp">继续购物 </a>  | 共<span>${list.size() }</span>种商品|共<span>${count_number }</span>件商品</p>
           
            <p class="tro_close_p_c">合计:<span id="close">${sum_price }</span>元</p>
            
            <p class="tro_close_p_r" style="cursor: pointer;" onclick="pay(${sum_price},${sum_number })">去结算</p>
        </div>

    </div>
   <jsp:include page="footer.jsp"></jsp:include>   
</body>

<script type="text/javascript">
	//加减数量
	function addOrDeleteNumber(tid,number) {
		if(number<1){
			number=1;
			$("#num").val(number);
			alert("商品数量不能是负数，如果不想买了可以删除！！");
		}
		if(number>5){
			number=5;
			$("#num").val(number);
			alert("商品数量不能大于5，库存不足请等待！！");
		}
		window.location="Trolley?method=updateNumber&tid="+tid+"&number="+number;
	}	
	//删除购物车记录
	function delTrolley(tid) {
		if(confirm("确定要删除吗？")){
			window.location="Trolley?method=deleteTrolley&tid="+tid;
		}
	}
	//去结算
	function pay(sum_price,sum_number ){
		//判断如果参数为0表示没有购物，先去首页购物
		if(sum_price==0||sum_number==0){
			alert("请先去购物！~~~~");
			window.location="index?method=indexInfo";
		}else{
			window.location="order?method=InsertOrder&sumPrice="+sum_price+"&sumNumber="+sum_number;
		}
	}
</script>
</html>