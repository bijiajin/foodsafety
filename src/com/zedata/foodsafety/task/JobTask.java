package com.zedata.foodsafety.task;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.zedata.foodsafety.entity.system.msg.MsgMail;
import com.zedata.foodsafety.service.app.AppContentService;
import com.zedata.foodsafety.service.system.msg.MsgService;
import com.zedata.foodsafety.support.RetObj;
import com.zedata.foodsafety.util.DateUtil;
import com.zedata.foodsafety.util.MapUtils;
import com.zedata.foodsafety.util.PageData;

public class JobTask {
	@Resource(name="msgService")
	private MsgService msgService;
	
	@Resource(name="appContentService")
	private AppContentService appContentService;
	
	public void run() throws Exception{
		//获取预警设置
		List<PageData> mailList = msgService.findAll();
		if(mailList.size()>0){
			PageData pd = mailList.get(0);
			MsgMail msgmail = (MsgMail)MapUtils.mapToBean(pd, MsgMail.class);
			//执行预警任务
			RetObj retObj = appContentService.doJobTask(msgmail);
			Map<String,Object> rest = (Map<String, Object>) retObj.getObj();
			
			if(retObj.isFlag()){
				//修改最后更新时间
				pd.put("lastUpdateTime", rest.get("maxTime").toString());
				msgService.updateLastUpdateTime(pd);
			}
			
		}
		
	}

}
