package com.test.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.test.bean.ReportEnum;
import com.test.service.IReportService;
import com.test.util.BaseConditionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController{

	@Autowired
	private IReportService reportService;
	
	@RequestMapping("/list")
	public String reportList(BaseConditionVO vo, Model model){

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

		 return "hello";
	}

	/**
	 * 跳转添加页面
	 * @return
	 */
	@RequestMapping("add")
	public String add(){
		return "add";
	}

	@RequestMapping("save")
	public ModelAndView save(ReportEnum reportEnum){
		int ret=reportService.save(reportEnum);
		if(ret>0){
			return ajaxDoneSuccess(getMessage("msg.operation.success"));
		}
		return ajaxDoneError(getMessage("msg.operation.failure"));
	}
}
