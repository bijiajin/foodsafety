package com.zedata.foodsafety.service.app;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zedata.foodsafety.dao.DaoSupport;

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
	
	
	

}