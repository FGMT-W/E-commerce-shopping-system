package com.offcn.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.offcn.entity.User;
import com.offcn.service.UserService;
import com.offcn.utils.PageTool;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/User")
@MultipartConfig
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserService userService = new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		case "checkPhone":
			checkPhone(request,response);
			break;
		case "checkUserName":
			checkUserName(request,response);
			break;
		case "insertUser":
			insertUser(request,response);
			break;
		case "sendCode":
			sendCode(request,response);
			break;
		case "login":
			login(request,response);
			break;
		case "checkeVercode":
			checkeVercode(request,response);
			break;
		case "checkLogin":
			checkLogin(request,response);
			break;
		case "adminLogin":
			adminLogin(request,response);
			break;
		case "adminLogout": 
			adminLogout(request,response);
			break; 
		case "findUserList": 
			findUserList(request,response); 
			break; 
		case "updateManager":
			updateManager(request,response); 
			break; 
		case "deleteUser":
			deleteUser(request,response); 
			break;
		default:
			break;
		
		}
		
		
	}
	

	//调用service层的方法手机号唯一验证
	private void checkPhone(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone_number = request.getParameter("phone_number");
		boolean flag = userService.checkPhone(phone_number);
		response.getWriter().print(flag);
	}
	
	//根据用户名查询用户对象
	private void checkUserName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		boolean flag = userService.checkUserName(username);
		response.getWriter().print(flag);
	}
	
	//添加操作
	private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String phone_number = request.getParameter("phone_number");
		String area = request.getParameter("area");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
//		String photo = request.getParameter("photo");
		Part part = request.getPart("photo");
		
		if(part.getSize()==0) {
			request.setAttribute("msg", "请选择头像");
			request.getRequestDispatcher("regist.jsp").forward(request, response);
			return;
		}
		
		String header = part.getHeader("content-disposition");
		String photo = header.substring(header.lastIndexOf("=") + 2,header.length() - 1);
		//截取文件的后缀名
		String type = photo.substring(photo.lastIndexOf(".") + 1);
		
		if(!(type.equals("jpg")||type.equals("jpeg")||type.equals("png"))) {
			request.setAttribute("msg", "图片格式不正确");
			request.getRequestDispatcher("regist.jsp").forward(request, response);
			return;
		}
		photo = UUID.randomUUID() + photo;
		//确定上传路径
		String path = "E:/JavaProject/XiaoMiSource/PictureSource";
		File file = new File(path);
		if(!file.exists()) {
			file.mkdir();	//创建一个路径
		}
		//上传图片
		part.write(path + "/" + photo);
		
		//封装实体类
		User user = new User(name,Integer.valueOf(sex),phone_number,area,username,password,photo,new Date());
		//调用service层的添加方法插入数据库
		boolean flag = userService.insertUser(user);
		if(flag) {
			response.sendRedirect("login.jsp");
		}else {
			response.sendRedirect("regist.jsp");
		}
		
	}
	
	//发送验证码
	private void sendCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone_number = request.getParameter("phone_number");
		HttpSession session = request.getSession();
		boolean flag = userService.sendCode(phone_number,session);
		response.getWriter().print(flag);
	}
	
	//登录验证
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phone_number = request.getParameter("phone_number");
		String code = request.getParameter("code");
		HttpSession session = request.getSession();
		boolean flag = userService.login(phone_number,code,session);
		response.getWriter().print(flag);
	}

	//检查验证码是否正确
	private void checkeVercode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//先从前端获取用户输入的验证码
		String vercode = request.getParameter("vercode");
		System.out.println(vercode);
		//获取之前生成的
		HttpSession session = request.getSession();
		String verCode = (String)session.getAttribute("verCode");
		
		boolean flag;
		if(vercode.equalsIgnoreCase(verCode)) {
			flag = true;
		}else {
			flag = false;
		}
		
		response.getWriter().print(flag);
	}
	
	//判断用户名、密码是否正确
	private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取前端传入的用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		boolean flag = userService.checkLogin(username,password,session);
		if(flag) {
			response.sendRedirect("index.jsp");
		}else {
			request.setAttribute("msg", "账号或用户名错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
	
	//后台管理员登录验证
	private void adminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		boolean flag = userService.adminLogin(username,password,session);
		if(flag) {
			response.sendRedirect("admin/main.jsp");
		}else {
			response.sendRedirect("admin/login.jsp");
		}
	}
	
	//后台管理员退出功能
	private void adminLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//销毁session
		HttpSession session = request.getSession();
		session.invalidate();
		//跳转到login.jsp页面
		response.sendRedirect("admin/login.jsp");
	}
	
	//分页查询
	private void findUserList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取总记录数
		int totalCount = userService.findAllUserCount();
		//获取当前页码
		String currentPage = request.getParameter("currentPage");
		//创建分页工具类对象
		PageTool pageTool = new PageTool(currentPage,totalCount);
		//分页查询
		List<User> list = userService.findUserList(pageTool);
		//分页工具类和集合保存request域中
		request.setAttribute("list", list);
		request.setAttribute("pageTool", pageTool);
		request.getRequestDispatcher("admin/user_list.jsp").forward(request, response);
		
	}

	//修改用户角色
	private void updateManager(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String manager = request.getParameter("manager");
		boolean flag = userService.updateManager(uid,manager);
		if(flag) {
			findUserList(request,response);
		}
		
	}
	
	//批量删除
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids = request.getParameter("ids");
		boolean flag = userService.deleteUser(ids);
		if(flag) {
			findUserList(request,response);
		}
		
	}
	
	
	
}
