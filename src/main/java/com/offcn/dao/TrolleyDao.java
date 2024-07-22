package com.offcn.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.offcn.entity.Trolley;

public class TrolleyDao {
	//连接数据库
	QueryRunner qrRunner = new QueryRunner(new ComboPooledDataSource());

	//根据用户编号和商品编号查询记录是否存在
	public Trolley findTrolleyExists(Trolley trolley) {
		String sql = "SELECT * FROM trolley WHERE uid=? AND gid=? AND orders_number IS NULL";
		try {
			return qrRunner.query(sql, new BeanHandler<Trolley>(Trolley.class),trolley.getUid(),trolley.getGid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//添加购物车
	public int addTrolley(Trolley trolley) {
		String sql = "INSERT INTO trolley(uid,gid,number)VALUES(?,?,?)";
		try {
			return qrRunner.update(sql,trolley.getUid(),trolley.getGid(),trolley.getNumber());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//修改购物车记录的商品数量
	public int updateTrolleyNumber(Trolley trolley) {
		String sql = "UPDATE trolley SET number=? WHERE tid=?";
		try {
			return qrRunner.update(sql,trolley.getNumber(),trolley.getTid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//根据用户编号查询购物车记录数
	public int findTrolleyCountByUid(int uid) {
		int count=0;
		String sql = "SELECT COUNT(*) FROM trolley WHERE uid=? AND orders_number IS NULL";
		try {
			Long c = (Long)qrRunner.query(sql, new ScalarHandler(),uid);
			count=c.intValue();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	//查询当前用户的所有购物车记录，同时将uid/gid转换成对象
	public List<Trolley> findTrolleyList(int uid) {
		String sql = "SELECT * FROM trolley WHERE uid=? AND orders_number IS NULL";
		try {
			return qrRunner.query(sql, new BeanListHandler<Trolley>(Trolley.class),uid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//修改商品数量
	public int updateNumber(int tid, int number) {
		String sql = "UPDATE trolley SET number=? WHERE tid=?";
		try {
			return qrRunner.update(sql,number,tid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	//根据购物车记录编号删除
	public int deleteTrolley(String tid) {
		String sql = "DELETE FROM trolley WHERE tid=?";
		try {
			return qrRunner.update(sql,tid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	

}
