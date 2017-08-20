package com.zedata.foodsafety.controller.system.msg;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zedata.foodsafety.controller.base.BaseController;
import com.zedata.foodsafety.entity.Page;
import com.zedata.foodsafety.service.system.column.ColumnService;
import com.zedata.foodsafety.service.system.msg.MsgService;
import com.zedata.foodsafety.util.AppUtil;
import com.zedata.foodsafety.util.Jurisdiction;
import com.zedata.foodsafety.util.PageData;

/**
 * @类名:ColumnController.java 
 * @全路径包名： com.zedata.foodsafety.controller.system.column.ColumnController.java
 * @类功能描述: 栏目管理控制器
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2017年1月17日 上午9:54:52 
 * @版本： V1.0   
 */
@Controller
@RequestMapping("/msg")
public class MsgController extends BaseController{
	@Resource(name="msgService")
	private MsgService msgService;
	
	@RequestMapping(value="/msgList")
	public ModelAndView coluList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		 List<PageData> msgList = msgService.listPdPageMsg(page);
		 mv.addObject("msgList", msgList);
		 mv.addObject("pd", pd);
		 mv.setViewName("system/msg/msg_list");
		return mv;
	}
	
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/msg/msg_add");
		return mv;
	}
	
	@RequestMapping(value="add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		msgService.addmsg(pd);
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = msgService.findByID(pd);
		mv.setViewName("system/msg/msg_edit");
		mv.addObject("msg", "编辑预警设置");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value="editMsg")
	public ModelAndView editClon() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		msgService.editMsg(pd);
		mv.setViewName("save_result");
		mv.addObject("msg", "success");
		return mv;
	}
	
	

}
