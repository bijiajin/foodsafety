package com.zedata.foodsafety.entity.app;

import java.io.Serializable;

/**
 * @类名:ContentVO.java 
 * @全路径包名： com.zedata.foodsafety.entity.app.ContentVO.java
 * @类功能描述: 新闻内容实体类
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2017年1月20日 上午10:36:16 
 * @版本： V1.0   
 */
public class ContentVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String infoid;
	private String title;
	private String content;
	private String keywords;
	private String summary;
	private String source;
	private String link;
	private String inerttime;
	private String pubtime;
	private String author;
	private String is_dongguan;
	private String is_guangdong;
	private String state;
	public String getInfoid() {
		return infoid;
	}
	public void setInfoid(String infoid) {
		this.infoid = infoid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getInerttime() {
		return inerttime;
	}
	public void setInerttime(String inerttime) {
		this.inerttime = inerttime;
	}
	public String getPubtime() {
		return pubtime;
	}
	public void setPubtime(String pubtime) {
		this.pubtime = pubtime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getIs_dongguan() {
		return is_dongguan;
	}
	public void setIs_dongguan(String is_dongguan) {
		this.is_dongguan = is_dongguan;
	}
	public String getIs_guangdong() {
		return is_guangdong;
	}
	public void setIs_guangdong(String is_guangdong) {
		this.is_guangdong = is_guangdong;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
