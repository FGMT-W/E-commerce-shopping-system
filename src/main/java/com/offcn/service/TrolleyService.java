package com.offcn.service;

import java.util.List;

import com.offcn.dao.GoodsDao;
import com.offcn.dao.TrolleyDao;
import com.offcn.entity.Trolley;
import com.offcn.entity.User;

public class TrolleyService {

	private TrolleyDao trolleyDao = new TrolleyDao();
	private GoodsDao goodsDao = new GoodsDao();
	
	//添加购物车
	public boolean addTrolley(Trolley trolley) {
		//根据要添加的购物车记录查询数据表中是否已经存在
		//如果已经存在了，做修改记录的商品数量number
		//不存在向购物车记录表中添加
		Trolley ty = trolleyDao.findTrolleyExists(trolley);
		if(ty == null) {
			//不存在做插入
			trolley.setNumber(1);
			trolleyDao.addTrolley(trolley);
			return true;
		}else {
			//存在做修改number
			ty.setNumber(ty.getNumber() + 1);
			trolleyDao.updateTrolleyNumber(ty);
			return false;
		}
	}

	//根据用户编号查询购物车记录数
	public int findTrolleyCountByUid(int uid) {
		return trolleyDao.findTrolleyCountByUid(uid);
	}

	//查询当前用户的所有购物车记录，同时将uid/gid转换成对象
	public List<Trolley> findTrolleyList(User user) {
		List<Trolley> tlist = trolleyDao.findTrolleyList(user.getUid());
		for(Trolley trolley : tlist) {
			trolley.setUser(user);
			trolley.setGoods(goodsDao.findGoodsByGid(trolley.getGid()+""));
		}
		return tlist;
	}

	//修改商品数量
	public boolean updateNumber(int tid, int number) {
		return trolleyDao.updateNumber(tid,number)>0?true:false;
	}

	//删除操作
	public boolean deleteTrolley(String tid) {
		return trolleyDao.deleteTrolley(tid)>0?true:false;
	}
	

}
