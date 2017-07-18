package com.test.bean;

import java.io.Serializable;

public class UID implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected String id;
	
	public UID() {
        this.id = java.util.UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
        this.id = id;
	}

}
