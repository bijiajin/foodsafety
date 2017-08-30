package com.zedata.foodsafety.service.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zedata.foodsafety.dao.DaoSupport;
import com.zedata.foodsafety.entity.Page;
import com.zedata.foodsafety.entity.system.msg.MsgMail;
import com.zedata.foodsafety.support.RetObj;
import com.zedata.foodsafety.util.PageData;
import com.zedata.foodsafety.util.SendMainUtils;

/**
 * @类名:AppContentService.java 
 * @全路径包名： com.zedata.foodsafety.service.app.AppContentService.java
 * @类功能描述: 获取新闻Service
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2017年1月20日 上午10:25:45 
 * @版本： V1.0   
 */
@Service("appContentService")
public class AppContentService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<PageData> listPdPageContent(Page pd) throws Exception{
		return (List<PageData>)dao.findForList("ContentMapper.contentlistPage", pd);
	}
	
	public List<PageData> listPdPageContents(Page pd) throws Exception{
		return (List<PageData>)dao.findForList("ContentMapper.contentslistPage", pd);
	}
	
	public List<PageData> findContentsList(Page pd) throws Exception{
		return (List<PageData>)dao.findForList("ContentMapper.listContents", pd);
	}
	
	public PageData findByID(PageData pd) throws Exception{
		return (PageData)dao.findForObject("ContentMapper.findByID", pd);
	}
	
	/**
	 * 
	 * @param msg
	 * @return
	 * @throws Exception 
	 */
	public RetObj doJobTask(MsgMail msg) throws Exception{
		RetObj retObj = new RetObj();
		boolean flag = false;
		PageData pd = new PageData();
		pd.put("lastupdateTime", msg.getLastUpdateTime());
		String[] keyword = msg.getKeyWord().split(",");
		List<Map<String,Object>> keyList = new ArrayList<Map<String,Object>>();
		for(String key : keyword){
			Map<String,Object> keyMap = new HashMap<String,Object>();
			keyMap.put("key", key);
			keyList.add(keyMap);
		}
		pd.put("keyList", keyList);
		Map<String,Object> rest = (Map<String, Object>) dao.findForObject("ContentMapper.warning", pd);
		
		if(Integer.parseInt(rest.get("count").toString()) >msg.getThreshold()){
			flag = SendMainUtils.sendMain(msg);
		}
		retObj.setFlag(flag);
		retObj.setObj(rest);
		return retObj;
	}
	
	

}
