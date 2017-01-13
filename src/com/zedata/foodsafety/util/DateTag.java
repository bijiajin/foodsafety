package com.zedata.foodsafety.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

/**
 * @类名:DateTag.java 
 * @全路径包名： com.fh.util.DateTag.java
 * @类功能描述: 用于页面中使用标签将时间戳转为字符串类型的时间
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2016年12月14日 上午10:52:15 
 * @版本： V1.0   
 */
public class DateTag extends TagSupport{
	 private static final long serialVersionUID = 6464168398214506236L;
	 	
	 	/*标签中的属性，需要些set方法*/
	    private String value;
	    private String parttern;
	    /*处理函数*/
	    @Override
	    public int doStartTag() throws JspException {
	        String vv = "" + value;
	        try {
	            long time = Long.valueOf(vv.trim());
	            Calendar c = Calendar.getInstance();
	            c.setTimeInMillis(time);
	            SimpleDateFormat dateformat = new SimpleDateFormat(parttern);
	            String s = dateformat.format(c.getTime());
	            pageContext.getOut().write(s);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return super.doStartTag();
	    }

	    public void setValue(String value) {
	        this.value = value;
	    }
	    
	    public void setParttern(String parttern){
	    	this.parttern = parttern;
	    }
}
