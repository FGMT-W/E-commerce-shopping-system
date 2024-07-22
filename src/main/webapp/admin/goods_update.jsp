<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/xmpic/";
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改商品</title>
<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="<%=basePath %>admin/js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">修改商品</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>商品信息</span></div>
    
    <form action="Goods?method=updateGoods&gid=${goods.gid }" method="post" enctype="multipart/form-data">
	    <ul class="forminfo">
	    	 
	    	 <!-- 商品分类信息 -->
	    	 <li>
	    	 	<label>商品分类</label>
	    	 	<select name="cid" class="dfinput">
	    	 		<option value="0">===请选择===</option>
	    	 		<c:forEach items="${cateList }" var="cate">
	    	 			<option value="${cate.cid }"
	    	 			<c:if test="${cate.cid eq goods.cid }"> selected="selected"</c:if>
	    	 			>${cate.name }</option>
	    	 		</c:forEach>
	    	 	</select>
	    	 </li>
	    	 
	    	 
		    <li><label>商品名称</label><input value="${goods.gname }" name="gname" type="text" class="dfinput" /><i>商品名称不能超过30个字符</i></li>
		    <li><label>颜色</label><input value="${goods.color }" name="color" type="text" class="dfinput" /></li>
		    <li><label>规格尺寸</label><input value="${goods.size }" name="size" type="text" class="dfinput" /></li>
		    <li><label>单价</label><input value="${goods.price }" name="price" type="text" class="dfinput" /></li>
		    <li><label>简介</label>
		    	<textarea name="description" cols="10" rows="10" class="textinput" style="height: 80px">${goods.description }</textarea>
		    </li>
		    <li><label>完整介绍</label>
		    	<textarea name="full_description" cols="10" rows="10" class="textinput" style="height: 80px">${goods.full_description }</textarea>
		    </li>
		    <li><label>商品展示图</label>
		    	<input name="hid" type="hidden" value="${goods.pic }"/>
		    	<input name="pic" type="file"/>
				<img src="<%=imgPath %>${goods.pic }" width="50px" height="50px"/>
		    </li>
		    <li><label>商品小类别</label>
			    <cite>
				    <input name="state" type="radio" value="0" <c:if test="${goods.state eq 0 }">checked="checked" </c:if>/>正常&nbsp;&nbsp;&nbsp;&nbsp;
				    <input name="state" type="radio" value="1" <c:if test="${goods.state eq 1 }">checked="checked" </c:if>/>热门产品
				    <input name="state" type="radio" value="2" <c:if test="${goods.state eq 2 }">checked="checked" </c:if>/>为你推荐
				    <input name="state" type="radio" value="3" <c:if test="${goods.state eq 3 }">checked="checked" </c:if>/>新品
				    <input name="state" type="radio" value="4" <c:if test="${goods.state eq 4 }">checked="checked" </c:if>/>小米明星单品
			    </cite>
		    </li>
		    <li><label>型号</label><input value="${goods.version }" name="version" type="text" class="dfinput" /></li>
		    
		    <li><label>生产日期</label>
		    	<input class="Wdate" style="width: 345px;height: 32px;line-height: 32px;" onclick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})" name="product_date" type="text" class="dfinput" value="${goods.product_date }" />
		    </li>
		    
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>
