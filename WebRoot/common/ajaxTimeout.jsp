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
				out.println("{\"statusCode\":301,\"message\":\"\u4f1a\u8bdd\u8d85\u65f6\uff0c\u8bf7\u91cd\u65b0\u767b\u5f55\u3002\"}");
			} else {
				String loginUrl = request.getParameter("loginUrl");
				System.out.println("loginUrl = " + loginUrl);
				if (loginUrl == null)
					loginUrl = "../../";
				response.sendRedirect(response.encodeRedirectURL("/"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
			System.err.println("..........error.........");
		}
%>
