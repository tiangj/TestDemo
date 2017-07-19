package com.test.controller;

import com.test.bean.BaseBean;
import com.test.service.IBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class BaseController<T extends BaseBean> {

	private IBaseService<T> baseService;

	@Autowired
	public BaseController(IBaseService<T> baseService) {
		this.baseService = baseService;
	}

	@RequestMapping("save")
	public ModelAndView save(T t){
		int ret=baseService.save(t);
		if(ret>0){
			return  ajaxDoneSuccess("成功");
		}
		return ajaxDoneError("失败");
	}

	@RequestMapping("del")
	public ModelAndView del(String id){
		Integer ret=baseService.del(id);
		if(ret>0){
			return  ajaxDoneSuccess("成功");
		}
		return ajaxDoneError("失败");
	}

	@RequestMapping("update")
	public ModelAndView update(T t){
		Integer ret=baseService.update(t);
		if(ret>0){
			return  ajaxDoneSuccess("成功");
		}
		return ajaxDoneError("失败");
	}

	protected ModelAndView ajaxDone(int statusCode, String message, String forwardUrl) {
		//构造方法中传递返回要跳转的页面
		ModelAndView mav = new ModelAndView("common/ajaxDone");
		mav.addObject("statusCode", statusCode);
		mav.addObject("message", message);
		mav.addObject("forwardUrl", forwardUrl);
		return mav;
	}
	
	protected ModelAndView ajaxDoneSuccess(String message) {
		return ajaxDone(200, message, "");
	}

	protected ModelAndView ajaxDoneError(String message) {
		return ajaxDone(300, message, "");
	}

}
