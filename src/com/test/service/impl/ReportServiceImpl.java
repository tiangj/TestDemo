package com.test.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.test.bean.ReportEnum;
import com.test.util.BaseConditionVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;



import org.springframework.stereotype.Service;

import com.test.service.impl.ReportServiceImpl;
import com.test.bean.mapper.ReportEnumMapper;
import com.test.service.IReportService;

@Service("reportService")
public class ReportServiceImpl implements IReportService {

	private static Logger logger = Logger.getLogger(ReportServiceImpl.class);
	
	@Autowired
	private ReportEnumMapper reportEnumMapper;
	
	@Override
	public Page<Map<String, Object>> reportList(BaseConditionVO vo) {
		Map<String, Object> example = new HashMap<String, Object>();
		example.put("interface", "getReportTypeList1");
		example.put("orderField",vo.getOrderField());
		example.put("orderDirection",vo.getOrderDirection());
		example.put("keywords",vo.getKeywords());
		Page<Map<String, Object>> retList = reportEnumMapper.selectListColumnsByExample(example);
		logger.info("retList:"+retList);
		return retList;
	}

	public Integer save(ReportEnum reportEnum){
		return reportEnumMapper.insert(reportEnum);
	}

	@Override
	public Integer del(String id) {
		return reportEnumMapper.deleteByPrimaryKey(id);
	}

	@Override
	public ReportEnum getByID(String id) {
		return reportEnumMapper.selectByPrimaryKey(id);
	}

	@Override
	public Integer update(ReportEnum reportEnum) {
		return reportEnumMapper.updateByPrimaryKey(reportEnum);
	}

}
