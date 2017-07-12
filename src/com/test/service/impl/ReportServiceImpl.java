package com.test.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
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
	public Page<Map<String, Object>> reportList() {
		Map<String, Object> example = new HashMap<String, Object>();
		example.put("interface", "getReportTypeList1");
		Page<Map<String, Object>> retList = reportEnumMapper.selectListColumnsByExample(example);
		logger.info("retList:"+retList);
		return retList;
	}

}
