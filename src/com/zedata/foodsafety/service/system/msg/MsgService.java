package com.zedata.foodsafety.service.system.msg;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zedata.foodsafety.dao.DaoSupport;
import com.zedata.foodsafety.entity.Page;
import com.zedata.foodsafety.entity.system.column.Column;
import com.zedata.foodsafety.entity.system.msg.MsgMail;
import com.zedata.foodsafety.util.BeanToMapUtils;
import com.zedata.foodsafety.util.MapUtils;
import com.zedata.foodsafety.util.PageData;

/**
 * @类名:ColumnService.java 
 * @全路径包名： com.zedata.foodsafety.service.system.column.ColumnService.java
 * @类功能描述: 预警Service
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2017年1月17日 上午10:31:05 
 * @版本： V1.0   
 */
@Service("msgService")
public class MsgService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	@SuppressWarnings("unchecked")
	public List<PageData> listPdPageMsg(Page pd) throws Exception{
		return (List<PageData>)dao.findForList("MsgMapper.findAll", pd);
	}
	
	public void addmsg(PageData pd) throws Exception{
		dao.save("MsgMapper.addMsg", pd);
	}
	
	public PageData findByID(PageData pd) throws Exception{
		return (PageData)dao.findForObject("MsgMapper.findByID", pd);
	}
	
	public void editMsg(PageData pd) throws Exception{
		MsgMail msgmail = (MsgMail)MapUtils.mapToBean(pd, MsgMail.class);
		dao.update("MsgMapper.editMsg", msgmail);
	}
	
	@SuppressWarnings("unchecked")
	public List<PageData> findAll() throws Exception{
		return (List<PageData>)dao.findForList("MsgMapper.findAll", null);
	}
	
	/**
	 * 修改最后更新时间
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public Integer updateLastUpdateTime(PageData pd) throws Exception{
		return (Integer) dao.update("MsgMapper.updateLastTime", pd);
	}
	
	
	
	
	
	
	

}
