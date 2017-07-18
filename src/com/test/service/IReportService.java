package com.test.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.test.bean.ReportEnum;
import com.test.util.BaseConditionVO;

import java.util.List;
import java.util.Map;

public interface IReportService extends IBaseService<ReportEnum> {

	/**
	 * 
	 *@Description: 获取举报列表
	 *@author yangzhou
	 *@date 2017年7月12日 下午5:45:46
	 *@return_type List<Map<String,Object>>
	 *@return
	 */
	Page<Map<String, Object>> reportList(BaseConditionVO vo);

	/**
	 * 保存的方法
	 * @param reportEnum
	 * @return
	 */
	//Integer save(ReportEnum reportEnum);

	/**
	 * 删除的方法
	 * @param id
	 * @return
	 */
	//Integer del(String id);

	/**
	 * 根据id获取数据
	 * @param id
	 * @return
	 */
	ReportEnum getByID(String id);

	/**
	 * 更新操作
	 * @param reportEnum
	 * @return
	 */
	//Integer update(ReportEnum reportEnum);
}
