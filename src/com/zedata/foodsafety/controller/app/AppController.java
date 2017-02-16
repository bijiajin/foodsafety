package com.zedata.foodsafety.controller.app;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.zedata.foodsafety.controller.base.BaseController;
import com.zedata.foodsafety.entity.Page;
import com.zedata.foodsafety.entity.system.column.Column;
import com.zedata.foodsafety.entity.system.menu.Menu;
import com.zedata.foodsafety.entity.system.role.Role;
import com.zedata.foodsafety.entity.system.user.User;
import com.zedata.foodsafety.service.app.AppContentService;
import com.zedata.foodsafety.service.system.column.ColumnService;
import com.zedata.foodsafety.service.system.user.UserService;
import com.zedata.foodsafety.util.Const;
import com.zedata.foodsafety.util.PageData;
import com.zedata.foodsafety.util.RightsHelper;
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
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="columnService")
	private ColumnService columnService;
	@Resource(name="appContentService")
	private AppContentService appContentService;
	
	@RequestMapping(value="index")
	public ModelAndView toAppIndex(){
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("newpage/newsline/timeline");
		PageData pd = new PageData();
		pd = this.getPageData();
		try {
			pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
			//shiro管理的session
			Subject currentUser = SecurityUtils.getSubject();  
			Session session = currentUser.getSession();
			
			//从session中获取登录用户
			User user = (User)session.getAttribute(Const.SESSION_USER);
			if (user != null) {
				User userr = (User)session.getAttribute(Const.SESSION_USERROL);
				if(null == userr){
					user = userService.getUserAndRoleById(user.getUSER_ID());
					session.setAttribute(Const.SESSION_USERROL, user);
				}else{
					user = userr;
				}
				Role role = user.getRole();
				
				String columnRights = role!=null ? role.getRH_COLUMNS() : "";
				//避免每次拦截用户操作时查询数据库，以下将用户所属角色权限、用户权限限都存入session
				session.setAttribute(Const.SESSION_ROLE_RH_COLUMN, columnRights); 		//将角色栏目权限存入session
				
				
				List<Column> columnList = new ArrayList<Column>();
				if(null == session.getAttribute(Const.SESSION_allColumnList)){
					columnList = columnService.listAllColumn();
					if(Tools.notEmpty(columnRights)){
						for(Column colu : columnList){
							colu.setChecked(RightsHelper.testRights(columnRights, colu.getClon_id()));
							
						}
					}
					
					session.setAttribute(Const.SESSION_allColumnList, columnList);			//菜单权限放入session中
				}else{
					columnList = (List<Column>)session.getAttribute(Const.SESSION_allColumnList);
				}
				mv.addObject("columnList", columnList);
				mv.addObject("user", user);
			}else{
				mv.setViewName("system/admin/login");//session失效后跳转登录页面
			}
			
			
		} catch (Exception e) {
			mv.setViewName("system/admin/login");
			logger.error(e.getMessage(), e);
		}
		
		
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
	 * @throws Exception 
	 */
	@RequestMapping(value="/new_default")
	public ModelAndView defaultPage(Page page) throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("newpage/newsline/new_list2");
		PageData pd = new PageData();
		pd = this.getPageData();
		String colunm = pd.getString("clon_name");
		if(!StringUtils.isEmpty(colunm)){
			switch (colunm) {
			case "今日关注":
				pd.put("jr", "jr");
				break;
			case "一周要闻":
				pd.put("yz", "yz");
				break;
			case "东莞信息":
				pd.put("is_dongguan", "is_dongguan");
				break;
			case "广东信息":
				pd.put("is_guangdong", "is_guangdong");
				break;
			default:
				break;
			}
		}
		page.setPd(pd);
		List<PageData> contentList = appContentService.listPdPageContent(page);
		mv.addObject("contentList", contentList);
		mv.addObject("pd", pd);
		return mv;
//		return "system/admin/default";
	}
	
	/**
	 * 进入首页后的默认页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/new_def")
	public ModelAndView defPage(Page page) throws Exception{
		String gotoHtml = "jinri_list";
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		String newsType = pd.getString("n");
		if(!StringUtils.isEmpty(newsType)){
			switch (newsType) {
			case "jr":
				pd.put("jr", "jr");
				pd.put("n", "jr");
				gotoHtml = "jinri_list";
				break;
			case "yz":
				pd.put("yz", "yz");
				pd.put("n", "yz");
				gotoHtml = "yizhou_list";
				break;
			case "dg":
				pd.put("is_dongguan", "is_dongguan");
				pd.put("n", "dg");
				gotoHtml = "dongguan_list";
				break;
			case "gd":
				pd.put("is_guangdong", "is_guangdong");
				pd.put("n", "gd");
				gotoHtml = "guangdong_list";
				break;
			default:
				break;
			}
		}
		
//		String colunm = pd.getString("clon_name");
//		if(!StringUtils.isEmpty(colunm)){
//			switch (colunm) {
//			case "今日关注":
//				pd.put("jr", "jr");
//				break;
//			case "一周要闻":
//				pd.put("yz", "yz");
//				break;
//			case "东莞信息":
//				pd.put("is_dongguan", "is_dongguan");
//				break;
//			case "广东信息":
//				pd.put("is_guangdong", "is_guangdong");
//				break;
//			default:
//				break;
//			}
//		}
		page.setPd(pd);
		List<PageData> contentList = appContentService.listPdPageContent(page);
		mv.addObject("contentList", contentList);
		
		
		mv.addObject("pd", pd);
		mv.setViewName("newpage/newsline/"+gotoHtml);
		return mv;
//		return "system/admin/default";
	}
	
	@RequestMapping(value="/checkDetails")
	public ModelAndView checkDetails() throws Exception{
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("newpage/newsline/new_details");
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = appContentService.findByID(pd);
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
		
	}

}
