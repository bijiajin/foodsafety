package com.zedata.foodsafety.controller.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zedata.foodsafety.controller.base.BaseController;
import com.zedata.foodsafety.util.Const;
import com.zedata.foodsafety.util.PageData;
import com.zedata.foodsafety.util.Tools;

/**
 * @类名:AppController.java 
 * @全路径包名： com.zedata.foodsafety.controller.app.AppController.java
 * @类功能描述: TODO
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2017年1月16日 上午10:25:38 
 * @版本： V1.0   
 */
@Controller
@RequestMapping("/App")
public class AppController extends BaseController{
	
	@RequestMapping(value="index")
	public ModelAndView toAppIndex(){
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("newpage/newsline/timeline");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**
	 * 进入tab标签
	 * @return
	 */
	@RequestMapping(value="/tab")
	public String tab(){
		return "newpage/newsline/tab";
//		return "system/admin/tab";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 */
	@RequestMapping(value="/new_default")
	public String defaultPage(){
		return "newpage/newsline/new_list";
//		return "system/admin/default";
	}

}
