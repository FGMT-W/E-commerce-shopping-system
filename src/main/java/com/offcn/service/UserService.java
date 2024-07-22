package com.offcn.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.offcn.dao.UserDao;
import com.offcn.entity.User;
import com.offcn.utils.PageTool;
import com.offcn.utils.SendSMS;

public class UserService {

	private UserDao userDao = new UserDao();
	
	//根据手机号查询用户对象
	public boolean checkPhone(String phone) {
		User user = userDao.checkPhone(phone);
		return user != null?true:false;
	}

	//根据用户名查询用户对象
	public boolean checkUserName(String username) {
		User user = userDao.checkUserName(username);
		return user != null?true:false;
	}

	//注册
	public boolean insertUser(User user) {
		return userDao.insertUser(user)>0?true:false;
	}
	
	//调用发送验证码的工具类，产生验证码并保存到session对象中
	public boolean sendCode(String phone, HttpSession session) {
		int code = SendSMS.createCode(phone);
		System.out.println(code);
		if(code != 0){
			String newCode = phone + "#" + code;
			System.out.println(newCode);
			//将生成的验证码存储到session对象中
			session.setAttribute("code",newCode);
			return true;
		}
		return false;
	}

	//登录验证
	public boolean login(String phone, String code, HttpSession session) {
		//页面获取的手机号和验证码
		String code1 = phone + "#" + code;
		//从session中获取保存的手机号和验证码
		String code2 = (String)session.getAttribute("code");
		System.out.println("code1:" + code1);
		System.out.println("code2:" + code2);
		//根据手机号查询用户对象
		User user = userDao.checkPhone(phone);
		
		if(code1.equals(code2)){
			return true;
		}
		return false;
	}

	//判断用户名、密码是否正确
	public boolean checkLogin(String username, String password,HttpSession session) {
		User user = userDao.checkLogin(username,password);
		//当前登录用户信息保存到session中
		session.setAttribute("user", user);
		if(user != null) {
			return true;
		}
		return false;
	}

	//判断后台管理员登录
	public boolean adminLogin(String username, String password, HttpSession session) {
		User user = userDao.adminLogin(username,password);
		if(user != null) {
			session.setAttribute("user", user);
			return true;
		}
		return false;
	}
	
	//查询记录数
	public int findAllUserCount() {
		return userDao.findAllUserCount();
	}
	
	//分页查询
	public List<User> findUserList(PageTool pageTool) {
		return userDao.findUserList(pageTool);
	}

	//修改用户角色
	public boolean updateManager(String uid, String manager) {
		return userDao.updateManager(uid,manager)>0?true:false;
	}

	//批量删除
	public boolean deleteUser(String ids) {
		return userDao.deleteUser(ids)>0?true:false;
	}



}
