<%@ page import="com.offcn.utils.PageTool" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/xmpic/";
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品信息</title>
<link href="<%=basePath %>admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>admin/js/jquery-3.1.1.js"></script>

<script type="text/javascript">

// old write 
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});

//添加商品
function add_goods(){
	window.location="Category?method=findAllCategory";
}

//批量删除
function batchDelete(){
	var ids="";//拼接所有要删除的选项的gid号
	//获取所有被选中的复选框，并获取gid进行拼接
	$('[name="chk"]:checked').each(function(){
		ids+=","+$(this).val();
	})
	//非空验证
	if(ids==""){
		alert("请选择要删除的记录！");
		return;
	}
	//删除提示
	if(confirm("确认要删除吗？")){
		ids=ids.substring(1);
		window.location="Goods?method=deleteGoods&ids="+ids;
	}
}

</script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">商品管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        
        <!-- 
        
        <li class="click"><span><img src="images/t02.png" /></span>修改</li>
        <li><span><img src="images/t04.png" /></span>统计</li>
         -->
        <li style="cursor: pointer;" onclick="add_goods()"><span><img src="admin/images/t01.png"  /></span>添加商品</li>
        <li style="cursor: pointer;" onclick="batchDelete()"><span><img src="admin/images/t03.png" /></span>批量删除</li>
        </ul>

    </div>
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>序号<i class="sort"><img src="admin/images/px.gif" /></i></th>
        <th>商品类别</th>
        <th>商品名称</th>
        <th>商品颜色</th>
        <th>商品价格</th>
        <th width="10%">简介</th>
        <th width="20%">详情</th>
       	<th>商品展示图</th>
       	<th>是否热推</th>
       	<th>型号</th>
       	<th>生产日期</th>
       	<th>操作</th>
        </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="good" varStatus="i">
        		<tr>
        			<td><input name="chk" type="checkbox" value="${good.gid }"/></td>
        			<td>${i.count }</td>
        			<td>${good.category.name }</td>
        			<td>${good.gname }</td>
        			<td>${good.color }</td>
        			<td>${good.price }</td>
        			<td width="10%">
        				<c:if test="${good.description.length()<=8 }">${good.description }</c:if>
        				<c:if test="${good.description.length()>8 }">${good.description.substring(0,8) }...</c:if>
        			</td>
        			<td width="20%">
        				<c:if test="${good.description.length()<=12 }">${good.full_description }</c:if>
        				<c:if test="${good.description.length()>12 }">${good.full_description.substring(0,12) }...</c:if>
        			</td>
        			<td>
        				<img src="<%=imgPath %>${good.pic }" width="30px" height="30px"/>
        			</td>
        			<td>
        				<c:if test="${good.state eq 0}">正常</c:if>
        				<c:if test="${good.state eq 1}">热门产品</c:if>
        				<c:if test="${good.state eq 2}">为你推荐</c:if>
        				<c:if test="${good.state eq 3}">新品</c:if>
        				<c:if test="${good.state eq 4}">小米明星单品</c:if>
        			</td>
        			<td>${good.version }</td>
        			<td>
        				<fmt:formatDate value="${good.product_date }" pattern="yyyy-MM-dd"/>
        			</td>
        			<td><a href="Goods?method=findGoodsByGid&gid=${good.gid }">修改</a></td>
        		</tr>
        	</c:forEach>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${pageTool.totalCount }</i>条记录，当前显示第&nbsp;<i class="blue">${pageTool.currentPage }&nbsp;</i>页</div>
        <ul class="paginList">
	        
	         <li class="paginItem"><a href="Goods?method=findGoodsList&currentPage=1">首页</a></li>
	         <li class="paginItem"><a href="Goods?method=findGoodsList&currentPage=${pageTool.prePage }">上一页</a></li>
	         <li class="paginItem"><a href="Goods?method=findGoodsList&currentPage=${pageTool.nextPage }">下一页</a></li>
	         <li class="paginItem"><a href="Goods?method=findGoodsList&currentPage=${pageTool.totalPages }">尾页</a></li>
	         
	        
        </ul>
    </div>
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
