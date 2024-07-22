package com.offcn.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.entity.Category;
import com.offcn.service.CategoryService;
import com.offcn.utils.PageTool;
import com.offcn.utils.DateTool;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/Category")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置HttpServletResponse使用UTF-8
		request.setCharacterEncoding("utf-8");
		// 通知浏览器使用UTF-8解码
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		
		String method = request.getParameter("method");
		
		switch(method) {
		  	case "findCategoryList": 
		  		findCategoryList(request,response); 
		  		break; 
		  	case "insertCategory": 
		  		insertCategory(request,response); 
		  		break; 
		  	case "findCategoryByCid": 
		  		findCategoryByCid(request,response); 
		  		break; 
		    case "updateCategory": 
		    	updateCategory(request,response);
		    	break; 
		    case "deleteCategory": 
		    	deleteCategory(request,response); 
		    	break;
		    case "findAllCategory":
		 		findAllCategory(request,response); 
		 		break;
		default:
			break;
		
		}
		
		
	}

    

	//分页查询
	private void findCategoryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取当前页码
		String currentPage = request.getParameter("currentPage");
		//获取商品类别总记录总条数
		int totalCount = categoryService.getAllCategoryCount();
		//创建工具类对象
		PageTool pageTool = new PageTool(currentPage,totalCount);
		//分页查询
		List<Category> list = categoryService.findCategoryList(pageTool);
		request.setAttribute("list",list);
		request.setAttribute("pageTool",pageTool);
		request.getRequestDispatcher("admin/category_list.jsp").forward(request,response);
	}
    
	//添加商品分类
    private void insertCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name = request.getParameter("name");
    	String state = request.getParameter("state");
    	String order_number = request.getParameter("order_number");
    	String description = request.getParameter("description");
    	String create_time = request.getParameter("create_time");
    	//封装实体类
    	Category category = new Category(name,Integer.valueOf(state),Integer.valueOf(order_number),description,DateTool.stringToDate(create_time));
    	System.out.println(category);
    	boolean flag = categoryService.insertCategory(category);
    	if(flag) {
    		findCategoryList(request,response);
    	}
	}

    //查询商品类别对象
	private void findCategoryByCid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		Category category = categoryService.findCategoryByCid(cid);
		request.setAttribute("category", category);
		request.getRequestDispatcher("admin/category_update.jsp").forward(request, response);
	}
    
    //修改商品分类
	private void updateCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		String name = request.getParameter("name");
		String state = request.getParameter("state");
		String order_number = request.getParameter("order_number");
		String description = request.getParameter("description");
		String create_time = request.getParameter("create_time");
		//封装实体
		Category category = new Category(Integer.valueOf(cid),name,Integer.valueOf(state),Integer.valueOf(order_number),description,DateTool.stringToDate(create_time));
		boolean flag = categoryService.updateCategory(category);
		if(flag) {
			findCategoryList(request,response);
		}
		
	}

	//删除商品分类
	private void deleteCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids = request.getParameter("ids");
		boolean flag = categoryService.deleteCategory(ids);
		if(flag) {
			findCategoryList(request,response);
		}
	}
	
	//查询所有启用的分类信息
    private void findAllCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Category> list = categoryService.findCategoryList();
		request.setAttribute("alllist", list);
		request.getRequestDispatcher("admin/goods_add.jsp").forward(request, response);
	}
	

}
