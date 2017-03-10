package com.zedata.foodsafety.service.system.column;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zedata.foodsafety.dao.DaoSupport;
import com.zedata.foodsafety.entity.Page;
import com.zedata.foodsafety.entity.system.column.Column;
import com.zedata.foodsafety.util.PageData;

/**
 * @类名:ColumnService.java 
 * @全路径包名： com.zedata.foodsafety.service.system.column.ColumnService.java
 * @类功能描述: 栏目管理Service
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2017年1月17日 上午10:31:05 
 * @版本： V1.0   
 */
@Service("columnService")
public class ColumnService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<PageData> listPdPageColumn(Page pd) throws Exception{
		return (List<PageData>)dao.findForList("ColumnMapper.colnmulistPage", pd);
	}
	
	public void addColumn(PageData pd) throws Exception{
		dao.save("ColumnMapper.addColumn", pd);
	}
	
	public PageData findByID(PageData pd) throws Exception{
		return (PageData)dao.findForObject("ColumnMapper.findByID", pd);
	}
	
	public void editClon(PageData pd) throws Exception{
		dao.update("ColumnMapper.editClon", pd);
	}
	
	public void deleteColn(PageData pd) throws Exception{
		dao.delete("ColumnMapper.delClon", pd);
	}
	
	/*
	* 批量删除栏目
	*/
	public void deleteAll(String[] clon_id)throws Exception{
		dao.delete("ColumnMapper.deleteAll", clon_id);
	}
	
	public List<Column> listAllColumn() throws Exception{
		return (List<Column>) dao.findForList("ColumnMapper.listAllColumn", null);
	}
	
	/**
	 * 修改栏目icon
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData editicon(PageData pd) throws Exception {
		return (PageData)dao.findForObject("ColumnMapper.editicon", pd);
	}

}
