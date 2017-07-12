<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>
<%  Calendar calendar = Calendar.getInstance();
	int year = calendar.get(Calendar.YEAR);
	int month = calendar.get(Calendar.MONTH) + 1;
	int day = calendar.get(Calendar.DATE);
	int quarter = month/3+(month%3==0 ? 0 : 1);
	String date = year + "年" + month + "月" + day + "日";
	HttpSession s = request.getSession(false);
	String nickName=(String)s.getAttribute("nick_name");
	/* out.println(date); */%>
<c:set var="y" value="<%=year%>"></c:set>
<c:set var="q" value="<%=quarter%>"></c:set>
<c:set var="m" value="<%=month%>"></c:set>
<c:set var="resURLHead" value="${pageContext.request.contextPath}/resources"></c:set>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JUI(SSM) 后台管理系统</title>

<link href="${resURLHead}/themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${resURLHead}/themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${resURLHead}/themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="${resURLHead}/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="${resURLHead}/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<style>
.fontIcon{position: relative;bottom: 4px;}
</style>
<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="${resURLHead}/js/speedup.js" type="text/javascript"></script>
<![endif]-->
<script src="${resURLHead}/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${resURLHead}/js/jquery.sortable.js" type="text/javascript"></script>
<script src="${resURLHead}/js/jquery.cookie.js" type="text/javascript"></script>
<script src="${resURLHead}/js/jquery.validate.js" type="text/javascript"></script>
<script src="${resURLHead}/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="${resURLHead}/uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>
<script src="${resURLHead}/js/echarts-all.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script src="${resURLHead}/js/dwz.core.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.util.date.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.validate.method.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.barDrag.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.drag.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.tree.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.accordion.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.ui.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.theme.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.navTab.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.tab.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.resize.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.dialog.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.cssTable.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.stable.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.taskBar.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.ajax.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.pagination.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.database.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.datepicker.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.effects.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.panel.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.checkbox.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.history.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.combox.js" type="text/javascript"></script>
<script src="${resURLHead}/js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="${resURLHead}/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	DWZ.init("${resURLHead}/dwz.frag.xml", {
//		loginUrl:"login.jsp", loginTitle:"登录",	// 弹出登录对话框
		loginUrl:"login.jsp",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"${resURLHead}/themes"}); // themeBase 相对于index页面的主题base路径
			//setTimeout(function() {navTab.openTa b("main", "", {title:"基本模板",external:true});}, 100);
		}
	});
});

</script>
</head>

<body scroll="no">
	<div id="layout">
		<c:set var="headerName" value="JUI后台管理系统" scope="request"/> <%--设置当前headerName--%>
		<c:import url="/resources/_frag/pager/headerDiv.jsp"/>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
				<div class="accordion" fillSpace="sidebar">
					<div class="accordionHeader">
						<h2><span>Folder</span>网站管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li>
								<a>测试</a>
								<ul>
									<li><a href="report/list.do" target="navTab" rel="page_Report">测试</a></li>
								</ul>
							</li>
						</ul>
					</div>

					
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><span class="home_icon">我的主页</span></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li>我的主页</li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						 <div class="accountInfo">
							<div style="text-align: center;">
								<span style="font-size:20px;width:100%;line-height: 40px;margin-bottom: 0px;">欢迎使用JUI测试后台系统！</span>
							</div>
						</div>
						<div class="pageFormContent" layoutH="80" style="margin-right:230px;text-align: center">

									哈哈

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 
	<div id="footer">Copyright &copy; 2010 <a href="demo_page2.html" target="dialog">DWZ团队</a> 京ICP备05019125号-10</div>
-->
</body>
</html>