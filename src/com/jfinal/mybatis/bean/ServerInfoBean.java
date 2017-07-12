package com.jfinal.mybatis.bean;

/**
 * 服务器信息配置
 * 
 * @author mengxin 2016年8月14日 下午3:53:54
 */
public class ServerInfoBean {

	private String code;
	private String saveRootPath;
	private String urlHeader;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getSaveRootPath() {
		return saveRootPath;
	}
	public void setSaveRootPath(String saveRootPath) {
		this.saveRootPath = saveRootPath;
	}
	public String getUrlHeader() {
		return urlHeader;
	}
	public void setUrlHeader(String urlHeader) {
		this.urlHeader = urlHeader;
	}
	
}
