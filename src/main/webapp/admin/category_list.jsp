<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品分类</title>
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

//添加跳转到category_add.jsp页面
function add_category(){
	window.location="admin/category_add.jsp";	
}

//批量删除
function batchDelete(){
	//保存所有被选中的记录的uid,ids=2,3,4
	var ids="";
	//循环所有被选中的复选框获取id号并进行拼接
	$('[name="chk"]:checked').each(function(){
		ids+=","+$(this).val(); //ids=",2,3,4"
	})
	//判断非空
	if(ids==""){
		alert("请选择要删除的记录");
		return;
	}
	//判断是否确定要删除
	var bl=confirm("确定要删除吗？");
	if(bl){
		//将ids字符串中第一个逗号截取掉
		ids=ids.substring(1);
		//向服务器提交
		window.location="Category?method=deleteCategory&ids="+ids;
	}
}

</script>
</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">分类管理</a></li>
    </ul>
    </div>
    
    <div class="tools">
    
    	<ul class="toolbar">
        
        
        <li class="click"><span><img src="<%=basePath %>admin/images/t02.png" /></span>修改</li>
        <li><span><img src="<%=basePath %>admin/images/t04.png" /></span>统计</li>
        <li style="cursor: pointer;" onclick="add_category()"><span><img src="<%=basePath %>admin/images/t01.png"  /></span>添加类别</li>
        <li style="cursor: pointer;" onclick="batchDelete()"><span><img src="<%=basePath %>admin/images/t03.png" /></span>批量删除</li>
        </ul>

    </div>
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>序号<i class="sort"><img src="<%=basePath %>admin/images/px.gif" /></i></th>
        <th>类别名称</th>
        <th>启用状态</th>
        <th>排序序号</th>
        <th>创建时间</th>
        <th>描述</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list }" var="cate" varStatus="i">
        	<tr>
        		<td><input name="chk" type="checkbox" value="${cate.cid }"/></td>
        		<td>${i.count }</td>
        		<td>${cate.name }</td>
        		<td>
        			<c:if test="${cate.state eq 1}">启用</c:if>
        			<c:if test="${cate.state eq 0}">未启用</c:if>
        		</td>
        		<td>${cate.order_number }</td>
        		<td>
        			<fmt:formatDate value="${cate.create_time }" pattern="yyyy-MM-dd"/>
        		</td>
        		<td>${cate.description }</td>
        		<td><a href="Category?method=findCategoryByCid&cid=${cate.cid }">修改</a></td>
        	</tr>
        	</c:forEach>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${pageTool.totalCount }</i>条记录，当前显示第&nbsp;<i class="blue">${pageTool.currentPage }&nbsp;</i>页</div>
        <ul class="paginList">
	        
	         <li class="paginItem"><a href="Category?method=findCategoryList&currentPage=1">首页</a></li>
	         <li class="paginItem"><a href="Category?method=findCategoryList&currentPage=${pageTool.prePage}">上一页</a></li>
	         <li class="paginItem"><a href="Category?method=findCategoryList&currentPage=${pageTool.nextPage}">下一页</a></li>
	         <li class="paginItem"><a href="Category?method=findCategoryList&currentPage=${pageTool.totalPages}">尾页</a></li>
	         
	        
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
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
