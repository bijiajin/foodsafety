package com.zedata.foodsafety.util;

import com.zedata.foodsafety.entity.system.msg.MsgMail;
import com.zedata.foodsafety.util.mail.SimpleMailSender;

/**
 * @类名:SenMainUtils.java 
 * @全路径包名： com.zedata.foodsafety.util.SenMainUtils.java
 * @类功能描述: TODO
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @联系方式：QQ173764520
 * @日期： 2017年7月10日 上午12:30:09 
 * @版本： V1.0   
 */
public class SendMainUtils {
	
	private static String strEMAIL = Tools.readTxtFile(Const.EMAIL);		//读取邮件配置
	private static String strEM[] = strEMAIL.split(",fh,");
	
	
	public static boolean sendMain(MsgMail msg){
		boolean flag;
		String toEMAIL = msg.getSendToMail();
		toEMAIL = toEMAIL.replaceAll("；", ";");
		toEMAIL = toEMAIL.replaceAll(" ", "");
		String[] arrTITLE = toEMAIL.split(";");
		try {
			for(int i=0;i<arrTITLE.length;i++){
				if(Tools.checkEmail(arrTITLE[i])){		//邮箱格式不对就跳过
					SimpleMailSender.sendEmail(strEM[0], strEM[1], strEM[2], strEM[3], arrTITLE[i], msg.getSubject(), msg.getContent(), "1");//调用发送邮件函数
					
				}else{
					continue;
				}
			}
			flag = true;
			
		} catch (Exception e) {
			flag = false;
		} 
		
		return flag;
	}

}
