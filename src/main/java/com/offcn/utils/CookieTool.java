package com.offcn.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieTool {
	// 向cookie中保存数据
	public static void addCookie(String search, HttpServletResponse response, HttpServletRequest request) {
		String str = getCookie(request);

		if (str == "") {
			str = search;
		} else {
			// 判断cookie中的关键字不包含情况下再拼接
			if (!str.contains(search)) {
				// 判断#个数
				String[] split = str.split("#");
				if (split.length == 3) {
					str = split[1] + "#" + split[2];
				}
				str += "#" + search;// 冰箱#洗衣机
			}
		}
		// 1.创建一个cookie对象
		Cookie cookie = new Cookie("search", str);
		// 2.指定cookie的有效期
		cookie.setMaxAge(24 * 60 * 60);
		// 3.将cookie对象保存到本地文件
		response.addCookie(cookie);
	}

	// 读取cookie的数据
	public static String getCookie(HttpServletRequest request) {
		String str = "";// 保存cookie中读取出来的关键字信息
		// 获取cookie的信息
		Cookie[] cookies = request.getCookies();
		if (!(cookies == null || cookies.length == 0)) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("search")) {
					str = cookie.getValue();
				}
			}
		}
		return str;
	}
}
