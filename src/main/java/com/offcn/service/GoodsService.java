package com.offcn.service;

import java.util.List;

import com.offcn.dao.CategoryDao;
import com.offcn.dao.GoodsDao;
import com.offcn.entity.Category;
import com.offcn.entity.Goods;
import com.offcn.utils.PageTool;

public class GoodsService {
	
	private GoodsDao goodsDao = new GoodsDao();
	private CategoryDao categoryDao = new CategoryDao();
	
	//删除商品列表
	public boolean deleteGoodsByCid(String ids) {
		return goodsDao.deleteGoodsByCid(ids)>0?true:false;
	}
	
	//查询商品记录总条数
	public int getAllGoodsCount() {
		return goodsDao.getAllGoodsCount();
	}

	//分页查询商品信息
	public List<Goods> findGoodsList(PageTool pageTool) {
		List<Goods> list = goodsDao.findGoodsList(pageTool);
		for(Goods goods : list) {
			Category category = categoryDao.findCategoryByCid(goods.getCid()+"");
			goods.setCategory(category);
		}
		return list;
	}

	//添加商品信息
	public boolean insertGoods(Goods goods) {
		return goodsDao.insertGoods(goods)>0?true:false;
	}

	//查询商品信息
	public Goods findGoodsByGid(String gid) {
		return goodsDao.findGoodsByGid(gid);
	}

	//修改商品信息
	public boolean updateGoods(Goods goods) {
		return goodsDao.updateGoods(goods)>0?true:false;
	}

	//删除商品
	public boolean deleteGoods(String ids) {
		return goodsDao.deleteGoods(ids)>0?true:false;
	}
	
	///////////////////////////////////////前台Dao层/////////////////////////////////////////
	//根据小分类编号state查询，并限制返回count行
	public List<Goods> findGoodsList(int state,int count){
		return goodsDao.findGoodsList(state,count);
	}
	
	//根据大分类编号cid查询,并限制返回count行
	public List<Goods> findGoodsByCidList(int cid,int count){
		return goodsDao.findGoodsByCidList(cid,count);
	}
	
	//为你推荐通过cookie中的关键字进行模糊查询
	public List<Goods> findGoodsByCookie(String search,int count){
		return goodsDao.findGoodsByCookie(search,count);
	}
	
	//为你推荐板块
	public List<Goods> findGoodsTJ(String search){
		List<Goods> list=null;
		if(search==null||search.equals("")) {
			list=findGoodsList(2,5);
		}else {
			list=findGoodsByCookie(search,5);
		}
		return list;
	}

}
