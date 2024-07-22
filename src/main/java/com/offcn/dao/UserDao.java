package com.offcn.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.offcn.entity.User;
import com.offcn.utils.PageTool;

public class UserDao {
	//连接数据库
	QueryRunner qrRunner = new QueryRunner(new ComboPooledDataSource());	
	
	//根据手机号查询用户对象
	public User checkPhone(String phone) {
		String sql = "SELECT * FROM USER WHERE phone_number=?";
		try {
			return qrRunner.query(sql,new BeanHandler<User>(User.class),phone);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//根据用户名查询用户对象
	public User checkUserName(String username) {
		String sql = "SELECT * FROM USER WHERE username=?";
		try {
			return qrRunner.query(sql,new BeanHandler<User>(User.class),username);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//添加用户对象
	public int insertUser(User user) {
		String sql = "INSERT INTO USER(NAME,sex,phone_number,AREA,username,PASSWORD,photo,create_time)VALUES(?,?,?,?,?,?,?,?)";
		try {
			return qrRunner.update(sql, user.getName(),user.getSex(),user.getPhone_number(),user.getArea(),user.getUsername(),user.getPassword(),user.getPhoto(),user.getCreate_time());
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	//判断用户密码是否正确
	public User checkLogin(String username, String password) {
		String sql = "SELECT * FROM USER WHERE username=? AND password=?";
		try {
			return qrRunner.query(sql,new BeanHandler<User>(User.class),username,password);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//判断后台管理员登录
	public User adminLogin(String username, String password) {
		String sql = "SELECT * FROM USER WHERE username=? AND password=? AND manager=0";
		try {
			return qrRunner.query(sql,new BeanHandler<User>(User.class),username,password);
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//查询所有用户记录数目
	public int findAllUserCount(){
		String sql = "SELECT count(*) FROM USER";
		int count = 0;
		
		try {
			Long c = (Long)qrRunner.query(sql,new ScalarHandler());
			count = c.intValue();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	//分页查询
	public List<User> findUserList(PageTool pageTool) {
		String sql = "SELECT * FROM USER LIMIT ?,?";
		try {
			return qrRunner.query(sql,new BeanListHandler<User>(User.class),pageTool.getStartIndex(),pageTool.getPageSize());
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	//修改用户角色
	public int updateManager(String uid, String manager) {
		String sql = "UPDATE USER SET manager=? WHERE uid=?";
		try {
			return qrRunner.update(sql,manager,uid);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//批量删除
	public int deleteUser(String ids) {
		String sql = "DELETE FROM USER WHERE uid IN("+ids+")";
		try {
			return qrRunner.update(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	
}
