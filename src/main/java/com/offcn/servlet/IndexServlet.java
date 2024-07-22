package com.offcn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.offcn.entity.Category;
import com.offcn.entity.Goods;
import com.offcn.service.CategoryService;
import com.offcn.service.GoodsService;
import com.offcn.utils.CookieTool;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/Index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryService categoryService = new CategoryService();
    private GoodsService goodsService = new GoodsService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
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
		case "indexInfo":
			indexInfo(request,response);
			break;
		case "findGoodsByGid":
			findGoodsByGid(request,response);
			break;
		default:
			break;
		
		}

}

   
	//查询index.jsp页面中需要显示的所有数据
	private void indexInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.查询左侧导航中显示的商品分类信息
		List<Category> cateList = categoryService.findCategoryList(10);
		request.setAttribute("cateList", cateList);
		//2.根据小分类编号查询小米明星单品，限制返回5条数据
		List<Goods> starList = goodsService.findGoodsList(4, 5);
		request.setAttribute("starList", starList);
		//3.根据小分类编号查询热门产品1限制返回4行
		List<Goods> hotList = goodsService.findGoodsList(1, 4);
		request.setAttribute("hotList", hotList);
		//4.根据商品大分类编号查询家电(4)，同时限制返回8条
		List<Goods> jdList = goodsService.findGoodsByCidList(4, 8);
		//5.根据商品大分类编号查询智能(3)，同时限制返回10条
		List<Goods> znList = goodsService.findGoodsByCidList(3, 10);
		request.setAttribute("znList", znList);
		//6.为你推荐板块
		String search = CookieTool.getCookie(request);
		List<Goods> tjList = goodsService.findGoodsTJ(search);
		request.setAttribute("tjList", tjList);
		
		//转发到index.jsp页面
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	//根据商品编号查询商品对象
	 private void findGoodsByGid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid = request.getParameter("gid");
		Goods goods = goodsService.findGoodsByGid(gid);
		request.setAttribute("goods", goods);
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}

	
}
