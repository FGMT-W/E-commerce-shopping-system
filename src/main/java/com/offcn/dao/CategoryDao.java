package com.offcn.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.offcn.entity.Category;
import com.offcn.utils.PageTool;

public class CategoryDao {
	//连接数据库
	QueryRunner qrRunner = new QueryRunner(new ComboPooledDataSource());	

	//获取商品类别总记录数
	public int getAllCategoryCount() {
		String sql = "SELECT count(*) FROM category";
		int count = 0;
		try {
			Long c = (Long)qrRunner.query(sql,new ScalarHandler());
			count = c.intValue();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	//分页查询
	public List<Category> findCategoryList(PageTool pageTool) {
		String sql = "SELECT * FROM category LIMIT ?,?"; 
		try {
			return qrRunner.query(sql,new BeanListHandler<Category>(Category.class),pageTool.getStartIndex(),pageTool.getPageSize());//PageTool起始页和每页显示的条数
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//添加商品分类
	public int insertCategory(Category category) {
		String sql = "INSERT INTO category(NAME,state,order_number,description,create_time)VALUES(?,?,?,?,?)";
		try {
			return qrRunner.update(sql,category.getName(),category.getState(),category.getOrder_number(),category.getDescription(),category.getCreate_time());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//查询商品类别对象
	public Category findCategoryByCid(String cid) {
		String sql = "SELECT * FROM category WHERE cid=?";
		try {
			return qrRunner.query(sql, new BeanHandler<Category>(Category.class),cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//修改商品分类
	public int updateCategory(Category category) {
		String sql = "UPDATE category SET NAME=?,state=?,order_number=?,description=?,create_time=? WHERE cid=?";
		try {
			return qrRunner.update(sql,category.getName(),category.getState(),category.getOrder_number(),category.getDescription(),category.getCreate_time(),category.getCid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//删除商品分类
	public int deleteCategory(String ids) {
		String sql = "DELETE FROM category WHERE cid IN("+ids+")";
		try {
			return qrRunner.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	public List<Category> findCategoryList() {
		String sql = "SELECT  * FROM category WHERE state=1";
		try {
			return qrRunner.query(sql, new BeanListHandler<Category>(Category.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	///////////////////////////////////////前台Dao层/////////////////////////////////////////
	//首页中查询商品分类信息,限制返回count条数据
	public List<Category> findCategoryList(int count) {
		String sql = "SELECT * FROM category WHERE state=1 ORDER BY order_number LIMIT ?";
		try {
			return qrRunner.query(sql, new BeanListHandler<Category>(Category.class),count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
