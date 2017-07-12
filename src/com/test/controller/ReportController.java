package com.test.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.test.service.IReportService;
import com.test.util.BaseConditionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private IReportService reportService;
	
	@RequestMapping("/list")
	public String reportList(BaseConditionVO vo, Model model){
		 PageHelper.startPage(vo.getPageNum(),vo.getPageSize());

		 Page<Map<String, Object>> retList = reportService.reportList();
		 model.addAttribute("pageList",retList);

		 vo.setTotalCount(retList.getTotal());
		 model.addAttribute("vo", vo);
		 model.addAttribute("pageSize",retList.getPageSize());

		 return "hello";
	}
}
