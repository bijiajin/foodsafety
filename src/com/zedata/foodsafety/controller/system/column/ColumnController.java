package com.zedata.foodsafety.controller.system.column;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zedata.foodsafety.controller.base.BaseController;
import com.zedata.foodsafety.entity.Page;
import com.zedata.foodsafety.service.system.column.ColumnService;
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
@RequestMapping("/Column")
public class ColumnController extends BaseController{
	@Resource(name="columnService")
	private ColumnService columnService;
	
	@RequestMapping(value="/coluList")
	public ModelAndView coluList(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		 List<PageData> columnList = columnService.listPdPageColumn(page);
		 mv.addObject("columnList", columnList);
		 mv.addObject("pd", pd);
		 mv.setViewName("system/column/column_list");
		return mv;
	}

}
