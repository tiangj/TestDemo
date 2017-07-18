package com.test.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.test.bean.ReportEnum;
import com.test.service.IBaseService;
import com.test.service.IReportService;
import com.test.util.BaseConditionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController<ReportEnum>{

	private IReportService reportService;

	@Autowired
	public ReportController(IReportService reportService) {
		super(reportService);
		this.reportService=reportService;
	}

	@RequestMapping("/list")
	public String reportList(BaseConditionVO vo, Model model){
		 Map<String,Object> map=new HashMap<String, Object>();

		 if(vo.getNumPerPage()!=null){
			 vo.setPageSize(vo.getNumPerPage());
		 }
		 //执行分页的方法
		 PageHelper.startPage(vo.getPageNum(),vo.getPageSize());

		 //获取分页的数据
		 Page<Map<String, Object>> retList = reportService.reportList(vo);
		 //返回页面的数据
		 model.addAttribute("pageList",retList);

		//返回总条数
		 vo.setTotalCount(retList.getTotal());

		 //获取每页显示的条数
		 vo.setPageSize(retList.getPageSize());

		//返回每页显示的条数
		 model.addAttribute("pageSize", vo.getPageSize());

		 //返回整个分页对象
		 model.addAttribute("vo", vo);

		 return "report/hello";
	}

	/**
	 * 跳转添加页面
	 * @return
	 */
	@RequestMapping("add")
	public String add(){
		return "report/add";
	}

	@RequestMapping("edit")
	public String edit(Model model,String id){
		ReportEnum reportEnum=reportService.getByID(id);
		model.addAttribute("instance",reportEnum);
		return "report/edit";
	}

}
