package com.test.bean;

import java.util.Date;

public class BaseBean extends UID {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    protected String createUser;

    protected Date createDate;

    protected String updateUser;

    protected Date updateDate = new Date();

    //默认为正常
    protected Boolean deleteFlag=false;
    
	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public Date getCreateDate() {
		return createDate;
	}

	/**
	 * 只在第一次保存到数据库时都保存当前时间
	 * @param createDate
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate==null ? new Date() : createDate;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	/**
	 * 更新时间每次保存到数据库时都保存当前时间
	 * @param updateDate
	 */
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Boolean getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Boolean deleteFlag) {
		this.deleteFlag = deleteFlag==null ? false : deleteFlag;
	}

}
