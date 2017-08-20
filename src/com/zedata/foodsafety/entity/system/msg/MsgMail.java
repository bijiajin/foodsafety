package com.zedata.foodsafety.entity.system.msg;

public class MsgMail {
	/**
	 * ID
	 */
	private Integer id;
	/**
	 * 通知邮箱
	 */
	private String sendToMail;
	/**
	 * 邮件标题
	 */
	private String subject;
	/**
	 * 触发警报关键词
	 */
	private String keyWord;
	/**
	 * 报警阀值
	 */
	private Integer threshold;
	/**
	 * 最后更新日期
	 */
	private String lastUpdateTime;
	/**
	 * 邮件中心内容
	 */
	private String content;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSendToMail() {
		return sendToMail;
	}
	public void setSendToMail(String sendToMail) {
		this.sendToMail = sendToMail;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public Integer getThreshold() {
		return threshold;
	}
	public void setThreshold(Integer threshold) {
		this.threshold = threshold;
	}
	public String getLastUpdateTime() {
		return lastUpdateTime;
	}
	public void setLastUpdateTime(String lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
	

}
