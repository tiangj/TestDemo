package com.test.service.impl;

import com.github.pagehelper.Page;
import com.test.bean.ReportEnum;
import com.test.bean.mapper.ReportEnumMapper;
import com.test.service.IReportService;
import com.test.util.BaseConditionVO;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service("reportService")
public class ReportServiceImpl extends  BaseServiceImpl<ReportEnum,ReportEnumMapper> implements IReportService {

	private static Logger logger = Logger.getLogger(ReportServiceImpl.class);
	
	private ReportEnumMapper reportEnumMapper;

	@Autowired
	public ReportServiceImpl(ReportEnumMapper reportEnumMapper) {
		this.reportEnumMapper=reportEnumMapper;
	}

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

	@Override
	public ReportEnum getByID(String id) {
		return reportEnumMapper.selectByPrimaryKey(id);
	}

}
