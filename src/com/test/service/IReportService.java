package com.test.service;

import java.util.List;
import java.util.Map;

public interface IReportService {

	/**
	 * 
	 *@Description: 获取举报列表
	 *@author yangzhou
	 *@date 2017年7月12日 下午5:45:46
	 *@return_type List<Map<String,Object>>
	 *@return
	 */
	public List<Map<String, Object>> reportList();
}
