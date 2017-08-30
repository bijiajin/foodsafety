package com.zedata.foodsafety.controller.system.task;

import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.quartz.CronScheduleBuilder;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zedata.foodsafety.controller.base.BaseController;
import com.zedata.foodsafety.entity.Page;
import com.zedata.foodsafety.entity.system.job.ScheduleJob;
import com.zedata.foodsafety.service.system.job.JobTaskService;
import com.zedata.foodsafety.support.RetObj;
import com.zedata.foodsafety.support.spring.SpringUtils;
import com.zedata.foodsafety.util.PageData;



@Controller
@RequestMapping("/task")
public class JobTaskController extends BaseController{
	// 日志记录器
	public final Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private JobTaskService taskService;

	@RequestMapping("taskList")
	public ModelAndView taskList(Page page) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<ScheduleJob> restList = taskService.getTasklistPage(page);
		mv.addObject("taskList", restList);
		 mv.addObject("pd", pd);
		 mv.setViewName("system/task/task_list");
		
		return mv;
	}
	
	@RequestMapping("goAdd")
	public ModelAndView goAdd() throws Exception {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/task/task_add");
		return mv;
	}
	
	@RequestMapping("goEdit")
	public ModelAndView goEdit() throws Exception {
		ModelAndView mv = this.getModelAndView();
		mv.setViewName("system/task/task_edit");
		PageData pd = new PageData();
		pd = this.getPageData();
		ScheduleJob scheduleJob = taskService.getTaskById(Long.parseLong(pd.get("taskId").toString().trim()));
		mv.addObject("ScheduleJob", scheduleJob);
		return mv;
	}

	@RequestMapping("add")
	@ResponseBody
	public ModelAndView addTesk(ScheduleJob scheduleJob) {
		ModelAndView mv = this.getModelAndView();
		RetObj retObj = new RetObj();
		retObj.setFlag(false);
		try {
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression());
		} catch (Exception e) {
			retObj.setMsg("cron表达式有误，不能被解析！");
			mv.setViewName("save_error");
			mv.addObject("msg", "cron表达式有误，不能被解析！");
			return mv;
		}
		Object obj = null;
		try {
			if (StringUtils.isNotBlank(scheduleJob.getSpringId())) {
				obj = SpringUtils.getBean(scheduleJob.getSpringId());
			} else {
				Class clazz = Class.forName(scheduleJob.getBeanClass());
				obj = clazz.newInstance();
			}
		} catch (Exception e) {
			// do nothing.........
		}
		if (obj == null) {
			mv.setViewName("save_error");
			mv.addObject("msg", "未找到目标类！");
			return mv;
		} else {
			Class clazz = obj.getClass();
			Method method = null;
			try {
				method = clazz.getMethod(scheduleJob.getMethodName(), null);
			} catch (Exception e) {
				// do nothing.....
			}
			if (method == null) {
				mv.setViewName("save_error");
				mv.addObject("msg", "未找到目标方法！");
				return mv;
			}
		}
		try {
			taskService.addTask(scheduleJob);
		} catch (Exception e) {
			
			
			mv.setViewName("save_error");
			mv.addObject("msg", "保存失败，检查 name group 组合是否有重复！");
			return mv;
		}

		mv.setViewName("save_success");
		return mv;
	}

	@RequestMapping("changeJobStatus")
	@ResponseBody
	public RetObj changeJobStatus(Long jobId, String cmd) {
		RetObj retObj = new RetObj();
		retObj.setFlag(false);
		try {
			taskService.changeStatus(jobId, cmd);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			retObj.setMsg("任务状态改变失败！");
			return retObj;
		}
		retObj.setFlag(true);
		return retObj;
	}

	@RequestMapping("updateCron")
	@ResponseBody
	public ModelAndView updateCron() {
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		try {
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(pd.getString("cron_expression"));
		} catch (Exception e) {
			mv.setViewName("save_result");
		}
		
			try {
				taskService.updateCron(pd);
			} catch (Exception e) {
				
			}
			mv.setViewName("save_result");
		
		return mv;
	}
	
	
}
