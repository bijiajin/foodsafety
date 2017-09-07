package com.zedata.foodsafety.task;

import com.zedata.foodsafety.service.system.job.RunJobTask;

public class JobTask {
	
	
	public void run() throws Exception{
		RunJobTask runJob = new RunJobTask();
		runJob.runJob();
	}

}
