package com.offcn.servlet;

import java.io.File;
import java.io.IOException;

import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.offcn.entity.Category;
import com.offcn.entity.Goods;
import com.offcn.service.CategoryService;
import com.offcn.service.GoodsService;
import com.offcn.utils.DateTool;
import com.offcn.utils.PageTool;

/**
 * Servlet implementation class GoodsServlet
 */
@WebServlet("/Goods")
@MultipartConfig
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GoodsService goodsService = new GoodsService();
    private CategoryService categoryService = new CategoryService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置HttpServletResponse使用UTF-8
		request.setCharacterEncoding("utf-8");
		// 通知浏览器使用UTF-8解码
		response.setHeader("Content-Type", "text/html;charset=utf-8");
		
		String method = request.getParameter("method");
		
		switch(method) {
		 	case "findGoodsList": 
		 		findGoodsList(request,response); 
		 		break;
		 	case "insertGoods":
		 		insertGoods(request,response); 
		 		break;
		 	case "findGoodsByGid":
		 		findGoodsByGid(request,response); 
		 		break;
		 	case "updateGoods":
		 		updateGoods(request,response); 
		 		break;
		 	case "deleteGoods":
		 		deleteGoods(request,response); 
		 		break;
		 	default:
		 		break;
		
		}
		
		
	}
 
    

	//分页查询商品信息
	private void findGoodsList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//当前页码
		String currentPage = request.getParameter("currentPage");
		//记录总数
		int totalCount = goodsService.getAllGoodsCount();
		//创建工具类对象
		PageTool pageTool = new PageTool(currentPage,totalCount);
		List<Goods> list = goodsService.findGoodsList(pageTool);
		request.setAttribute("pageTool", pageTool);
		request.setAttribute("list", list);
		request.getRequestDispatcher("admin/goods_list.jsp").forward(request, response);
	}

    //添加商品信息
	private void insertGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		String gname = request.getParameter("gname");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		String full_description = request.getParameter("full_description");
		String state = request.getParameter("state");
		String version = request.getParameter("version");
		String product_date = request.getParameter("product_date");
		
		//图片上传
		Part part = request.getPart("pic");
		String header = part.getHeader("content-disposition");
		String pic = header.substring(header.lastIndexOf("=")+2,header.length()-1);
		String type = pic.substring(pic.lastIndexOf(".")+1);
		
		if(!(type.equals("jpg")||type.equals("jpeg")||type.equals("png"))) {
			request.setAttribute("msg", "图片格式不正确");
			request.getRequestDispatcher("admin/goods_add.jsp").forward(request, response);
			return;
		}
		pic = UUID.randomUUID()+pic;
		String path = "E:/JavaProject/XiaoMiSource/PictureSource";
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();
		}
		part.write(path+"/"+pic);
		//封装实体
		Goods goods = new Goods(Integer.valueOf(cid),gname,color,size,Double.valueOf(price),description,full_description,pic,Integer.valueOf(state),version,DateTool.stringToDate(product_date));
		boolean flag = goodsService.insertGoods(goods);
		if(flag) {
			findGoodsList(request,response);
		}
	}

    //查询商品信息
	private void findGoodsByGid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid = request.getParameter("gid");
		Goods goods = goodsService.findGoodsByGid(gid);
		request.setAttribute("goods", goods);
		List<Category> cateList = categoryService.findCategoryList();
		request.setAttribute("cateList", cateList);
		request.getRequestDispatcher("admin/goods_update.jsp").forward(request, response);
	}

	//修改商品信息
	private void updateGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid = request.getParameter("gid");
		String cid = request.getParameter("cid");
		String gname = request.getParameter("gname");
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		String full_description = request.getParameter("full_description");
		String state = request.getParameter("state");
		String version = request.getParameter("version");
		String product_date = request.getParameter("product_date");
		
		//图片上传
		String pic = request.getParameter("pic");
		Part part=request.getPart("pic");
		if(part.getSize()!=0) {
			String header = part.getHeader("content-disposition");
			pic = header.substring(header.lastIndexOf("=")+2, header.length()-1);
			String type = pic.substring(pic.lastIndexOf(".")+1);
			if(!(type.equals("jpg")||type.equals("jpeg")||type.equals("png"))) {
				request.setAttribute("msg", "图片格式不正确");
				request.getRequestDispatcher("admin/goods_add.jsp").forward(request, response);
				return;
			}
			pic = UUID.randomUUID()+pic;
			String path = "E:/JavaProject/XiaoMiSource/PictureSource";
			File file = new File(path);
			if(!file.exists()) {
				file.mkdir();
			}
			part.write(path+"/"+pic);
			//封装实体
			Goods goods = new Goods(Integer.valueOf(gid),Integer.valueOf(cid),gname,color,size,Double.valueOf(price),description,full_description,pic,Integer.valueOf(state),version,DateTool.stringToDate(product_date));
			boolean flag = goodsService.updateGoods(goods);
			if(flag) {
				findGoodsList(request,response);
			}
		}
	}

    //删除商品
	private void deleteGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids = request.getParameter("ids");
		boolean flag = goodsService.deleteGoods(ids);
		if(flag) {
			findGoodsList(request,response);
		}
	}

	
    
}
