package com.test.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.service.IReportService;
import com.test.util.BaseConditionVO;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private IReportService reportService;
	
	@RequestMapping("/list")
	public String reportList(BaseConditionVO vo,Model model){
		 List<Map<String, Object>> retList = reportService.reportList();
		 model.addAttribute("pageList",retList); 

		 
		 return "hello";
		
	}
}
