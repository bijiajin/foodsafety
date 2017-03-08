package com.zedata.foodsafety.controller.system.column;

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
	
	@RequestMapping(value="/goAdd")
	public ModelAndView goAdd(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/column/column_add");
		return mv;
	}
	
	@RequestMapping(value="add")
	public ModelAndView add() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		columnService.addColumn(pd);
		mv.setViewName("save_result");
		return mv;
	}
	@RequestMapping(value="goEdit")
	public ModelAndView goEdit() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = columnService.findByID(pd);
		mv.setViewName("system/column/column_edit");
		mv.addObject("msg", "editU");
		mv.addObject("pd", pd);
		return mv;
	}
	
	@RequestMapping(value="editClon")
	public ModelAndView editClon() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		columnService.editClon(pd);
		mv.setViewName("save_result");
		return mv;
	}
	
	
	@RequestMapping(value="deleteColn")
	public ModelAndView deleteColn() throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		columnService.deleteColn(pd);
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value="/deleteAll")
	@ResponseBody
	public Object deleteAll() {
		PageData pd = new PageData();
		Map<String,Object> map = new HashMap<String,Object>();
		try {
			pd = this.getPageData();
			List<PageData> pdList = new ArrayList<PageData>();
			String clon_id = pd.getString("clon_id");
			
			if(null != clon_id && !"".equals(clon_id)){
				String Arrayclon_id[] = clon_id.split(",");
				columnService.deleteAll(Arrayclon_id);
				pd.put("msg", "ok");
			}else{
				pd.put("msg", "no");
			}
			
			pdList.add(pd);
			map.put("list", pdList);
		} catch (Exception e) {
			logger.error(e.toString(), e);
		} finally {
			logAfter(logger);
		}
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 请求编辑菜单图标页面
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/toEditicon")
	public ModelAndView toEditicon(String ColumnID)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("ColumnID",ColumnID);
			mv.addObject("pd", pd);
			mv.setViewName("system/column/column_icon");
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
	}
	
	/**
	 * 保存菜单图标 (顶部菜单)
	 * @param 
	 * @return
	 */
	@RequestMapping(value="/editicon")
	public ModelAndView editicon()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
//			pd = menuService.editicon(pd);
			mv.addObject("msg","success");
		} catch(Exception e){
			logger.error(e.toString(), e);
			mv.addObject("msg","failed");
		}
		mv.setViewName("save_result");
		return mv;
	}
	
	

}
