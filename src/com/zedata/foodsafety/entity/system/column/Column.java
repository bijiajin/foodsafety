package com.zedata.foodsafety.entity.system.column;

import java.io.Serializable;

/**
 * @类名:Column.java 
 * @全路径包名： com.zedata.foodsafety.entity.system.column.Column.java
 * @类功能描述: TODO
 * @公司名称：北龙泽达
 * @作者：bijiajin
 * @日期： 2017年1月17日 上午10:15:01 
 * @版本： V1.0   
 */
public class Column implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer clon_id;//栏目ID
	private String clon_name;//栏目名称
	private Integer clon_state;//栏目状态(1:使用，2:禁用)
	private boolean checked = false;
	public Integer getClon_id() {
		return clon_id;
	}
	public void setClon_id(Integer clon_id) {
		this.clon_id = clon_id;
	}
	public String getClon_name() {
		return clon_name;
	}
	public void setClon_name(String clon_name) {
		this.clon_name = clon_name;
	}
	public Integer getClon_state() {
		return clon_state;
	}
	public void setClon_state(Integer clon_state) {
		this.clon_state = clon_state;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	

}
