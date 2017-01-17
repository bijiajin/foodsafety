package com.zedata.foodsafety.service.system.column;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zedata.foodsafety.dao.DaoSupport;
import com.zedata.foodsafety.entity.Page;
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

}
