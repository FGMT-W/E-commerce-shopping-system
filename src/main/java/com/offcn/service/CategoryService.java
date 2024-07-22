package com.offcn.service;

import java.util.List;

import com.offcn.dao.CategoryDao;
import com.offcn.entity.Category;
import com.offcn.utils.PageTool;

public class CategoryService {

	private CategoryDao categoryDao = new CategoryDao();
	private GoodsService goodsService = new GoodsService();
	
	//查询记录总数
	public int getAllCategoryCount() {
		return categoryDao.getAllCategoryCount();
	}

	//分页查询
	public List<Category> findCategoryList(PageTool pageTool) {
		return categoryDao.findCategoryList(pageTool);
	}

	//添加商品分类
	public boolean insertCategory(Category category) {
		return categoryDao.insertCategory(category)>0?true:false;
	}

	//查询商品类别对象
	public Category findCategoryByCid(String cid) {
		return categoryDao.findCategoryByCid(cid);
	}
	
	//修改商品分类
	public boolean updateCategory(Category category) {
		return categoryDao.updateCategory(category)>0?true:false;
	}

	//删除商品分类
	public boolean deleteCategory(String ids) {
		//先删除商品信息
		goodsService.deleteGoodsByCid(ids);
		//再删除商品分类信息
		return categoryDao.deleteCategory(ids)>0?true:false;
	}

	//查询所有启用的分类信息
	public List<Category> findCategoryList() {
		return categoryDao.findCategoryList();
	}
	
	///////////////////////////////////////前台Dao层/////////////////////////////////////////
	//首页中查询商品分类信息,限制返回count条数据
	public List<Category> findCategoryList(int count){
		return categoryDao.findCategoryList(count);
	}
	
}
