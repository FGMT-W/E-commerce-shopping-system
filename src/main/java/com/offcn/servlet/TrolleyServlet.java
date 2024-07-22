package com.offcn.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.offcn.entity.Trolley;
import com.offcn.entity.User;
import com.offcn.service.TrolleyService;

/**
 * Servlet implementation class TrolleyServlet
 */
@WebServlet("/Trolley")
public class TrolleyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TrolleyService trolleyService = new TrolleyService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrolleyServlet() {
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
				case "addTrolley":
					addTrolley(request,response);
					break;
				case "findTrolleyCountByUid":
					findTrolleyCountByUid(request,response);
					break;
				case "findTrolleyList":
					findTrolleyList(request,response);
					break;
				case "updateNumber":
					updateNumber(request,response);
					break;
				case "deleteTrolley":
					deleteTrolley(request,response);
					break;
				default:
					break;
				
				}
	}


	//删除操作
	private void deleteTrolley(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tid = request.getParameter("tid");
		boolean flag = trolleyService.deleteTrolley(tid);
		if(flag) {
			findTrolleyList(request,response);
		}
	}
	
	//修改商品数量
	private void updateNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tid = request.getParameter("tid");
		String number = request.getParameter("number");
		boolean flag = trolleyService.updateNumber(Integer.valueOf(tid),Integer.valueOf(number));
		if(flag) {
			findTrolleyList(request,response);
		}
	}
	
	//查询当前用户的所有购物车记录
	private void findTrolleyList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Trolley> tlist = trolleyService.findTrolleyList(user);
		request.setAttribute("tlist", tlist);
		request.getRequestDispatcher("trolley.jsp").forward(request, response);
	}
	
	//查询当前用户购物车记录数
	private void findTrolleyCountByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int count = trolleyService.findTrolleyCountByUid(user.getUid());
		response.getWriter().print(count);
	}

	//添加购物车
	private void addTrolley(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String gid = request.getParameter("gid");//商品编号
		//获取session并从session中获取用户对象
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//构建购物车的实体对象
		Trolley trolley = new Trolley(user.getUid(),Integer.valueOf(gid));
		boolean flag = trolleyService.addTrolley(trolley);
		response.getWriter().print(flag);
	}

}
