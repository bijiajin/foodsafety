package com.zedata.foodsafety.service.system.job;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.zedata.foodsafety.dao.DaoSupport;
import com.zedata.foodsafety.entity.system.msg.MsgMail;
import com.zedata.foodsafety.service.app.AppContentService;
import com.zedata.foodsafety.service.system.msg.MsgService;
import com.zedata.foodsafety.support.RetObj;
import com.zedata.foodsafety.util.DBConnection;
import com.zedata.foodsafety.util.MapUtils;
import com.zedata.foodsafety.util.PageData;
import com.zedata.foodsafety.util.SendMainUtils;
import com.zedata.foodsafety.util.Factory;

/**
 * @类名:RunJobTask.java 
 * @全路径包名： com.zedata.foodsafety.service.system.job.RunJobTask.java
 * @类功能描述: TODO
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @联系方式：QQ173764520
 * @日期： 2017年9月7日 下午3:15:12 
 * @版本： V1.0   
 */
@Component
public class RunJobTask {
	private Connection conn;
	private ResultSet res;
	private PreparedStatement pst;
	
	private ResultSet res1;
	private PreparedStatement pst1;
	

	private PreparedStatement pst2;
	
	private String upSql = "UPDATE sys_mail SET last_update_time = ? WHERE id = ?";
	
	@Resource(name="appContentService")
	private AppContentService appContentService;
	
	public boolean runJob() throws Exception{
		boolean flag = true;
		conn=Factory.getDBConnection();
		try{
			//获取预警设置
			String sql = "select * from sys_mail";
			String sql2 = "SELECT count(*) as count,MAX(inerttime) AS maxTime FROM food_pagetable where 1=1 ";
			pst = conn.prepareStatement(sql);
			res = pst.executeQuery();
			if(res.next()){
				MsgMail msgmail = new MsgMail();
				msgmail.setId(res.getInt(1));
				msgmail.setSendToMail(res.getString(2));
				msgmail.setSubject(res.getString(3));
				msgmail.setKeyWord(res.getString(4));
				msgmail.setThreshold(res.getInt(5));
				msgmail.setLastUpdateTime(res.getString(6));
				msgmail.setContent(res.getString(7));
				
				//校验
				if(msgmail.getLastUpdateTime().length()>0){
					sql2 += "AND inerttime > '"+msgmail.getLastUpdateTime()+"' ";
				}
				
				String[] keyword = msgmail.getKeyWord().split(",");
				if (keyword.length > 0){
					sql2 += "AND ( ";
				for(int i = 0 ;i< keyword.length;i++){
					String key = keyword[i];
					
					if(i == keyword.length-1){
						sql2 +="keywords LIKE '%"+key+"%'";
					}else{
						sql2 +="keywords LIKE '%"+key+"%' OR ";
					}
				}
				sql2 += ") ";
				}
				
				pst1 = conn.prepareStatement(sql2);
				res1 = pst1.executeQuery();
				if(res1.next() || res1.getInt(1) > msgmail.getThreshold()){
					boolean sedFlag = SendMainUtils.sendMain(msgmail);
					if (sedFlag){
						//修改预警最后更新时间
						pst2 = conn.prepareStatement(upSql);
						pst2.setString(1, res1.getString(2));
						pst2.setInt(2, msgmail.getId());
						pst2.executeUpdate();
					}
					
				}
				
				
			}
		}catch(Exception e){
			e.printStackTrace();
			flag = false;
		}
		conn.close();
		return flag;
	}

}
