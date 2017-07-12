<%@ page language="java" pageEncoding="UTF-8"%>
<%
		try {
			String headerstr = request.getHeader("X-Requested-With");
			String ajaxstr = request.getParameter("ajax");
			System.out.println("headerstr = " + headerstr);
			System.out.println("ajaxstr = " + ajaxstr);
			if ((headerstr != null && "XMLHttpRequest"
					.equalsIgnoreCase(headerstr)) || ajaxstr != null) {
				response.setContentType("text/html;charset=utf-8");
				out.println("{\"statusCode\":\"300\",\"message\":\"\u5BF9\u4E0D\u8D77\uFF0C\u4F60\u7684\u6743\u9650\u4E0D\u8DB3\uFF01\"}");
			} else {
				session.setAttribute("page_error", "对不起，你的权限不足！");
				response.sendRedirect(response.encodeRedirectURL("/"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
			System.err.println("..........error.........");
		}
%>
