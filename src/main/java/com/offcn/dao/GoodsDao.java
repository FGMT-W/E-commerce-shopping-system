package com.offcn.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.offcn.entity.Goods;
import com.offcn.utils.PageTool;

public class GoodsDao {
	//连接数据库
	QueryRunner qrRunner = new QueryRunner(new ComboPooledDataSource());	

	//删除商品列表
	public int deleteGoodsByCid(String ids) {
		String sql = "DELETE FROM goods WHERE cid IN("+ids+")";
		try {
			qrRunner.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//查询商品记录总条数
	public int getAllGoodsCount() {
		String sql = "SELECT count(*) FROM goods";
		int count = 0;
		try {
			Long cLong = (Long)qrRunner.query(sql, new ScalarHandler());
			count = cLong.intValue();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	//分页查询商品信息
	public List<Goods> findGoodsList(PageTool pageTool) {
		String sql = "SELECT * FROM goods LIMIT ?,?";
		try {
			return qrRunner.query(sql, new BeanListHandler<Goods>(Goods.class),pageTool.getStartIndex(),pageTool.getPageSize());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//添加商品
	public int insertGoods(Goods goods) {
		String sql = "INSERT INTO goods (cid,gname,color,size,price,description,full_description,pic,state,version,product_date)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			return qrRunner.update(sql,goods.getCid(),goods.getGname(),goods.getColor(),goods.getSize(),goods.getPrice(),goods.getDescription(),goods.getFull_description(),goods.getPic(),goods.getState(),goods.getVersion(),goods.getProduct_date());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//查询商品信息
	public Goods findGoodsByGid(String gid) {
		String sql = "SELECT * FROM goods WHERE gid=?";
		try {
			return qrRunner.query(sql, new BeanHandler<Goods>(Goods.class),gid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//修改商品信息
	public int updateGoods(Goods goods) {
		String sql = "UPDATE goods SET cid=?,gname=?,color=?,size=?,price=?,description=?,full_description=?,pic=?,state=?,version=?,product_date=? WHERE gid=?";
		try {
			return qrRunner.update(sql,goods.getCid(),goods.getGname(),goods.getColor(),goods.getSize(),goods.getPrice(),goods.getDescription(),goods.getFull_description(),goods.getPic(),goods.getState(),goods.getVersion(),goods.getProduct_date(),goods.getGid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//删除商品
	public int deleteGoods(String ids) {
		String sql = "DELETE FROM goods WHERE gid IN("+ids+")";
		try {
			return qrRunner.update(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	
	///////////////////////////////////////前台Dao层/////////////////////////////////////////
	//根据小分类编号state查询，并限制返回count行
	public List<Goods> findGoodsList(int state, int count) {
		String sql = "SELECT * FROM goods WHERE state=? ORDER BY product_date DESC LIMIT ?";
		try {
			return qrRunner.query(sql, new BeanListHandler<Goods>(Goods.class),state,count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//根据大分类编号cid查询,并限制返回count行
	public List<Goods> findGoodsByCidList(int cid, int count) {
		String sql = "SELECT * FROM goods WHERE cid=? ORDER BY product_date DESC LIMIT ?";
		try {
			return qrRunner.query(sql, new BeanListHandler<Goods>(Goods.class),cid,count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//为你推荐通过cookie中的关键字进行模糊查询
	public List<Goods> findGoodsByCookie(String search, int count) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM goods WHERE");
		//将传递过来search关键字使用#进行分割
		String[] split = search.split("#");
		for(int i = 0;i < split.length;i++) {
			if(i == 0) {
				sql.append(" gname LIKE '%"+split[0]+"%'");
			}else {
				sql.append(" or gname LIKE '%"+split[i]+"%'");
			}
		}
		sql.append(" ORDER BY product_date LIMIT ?");
		try {
			return qrRunner.query(sql.toString(), new BeanListHandler<Goods>(Goods.class),count);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	

}
