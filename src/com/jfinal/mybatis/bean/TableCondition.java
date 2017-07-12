package com.jfinal.mybatis.bean;

import java.util.List;

public class TableCondition<PK> {

	private PK id;
	
	private String tableName;
	
	private List<PK> idList;

	public PK getId() {
		return id;
	}

	public void setId(PK id) {
		this.id = id;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public List<PK> getIdList() {
		return idList;
	}

	public void setIdList(List<PK> idList) {
		this.idList = idList;
	}
}
