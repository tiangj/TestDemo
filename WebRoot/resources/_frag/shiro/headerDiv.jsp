<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/shiro/include.inc.jsp"%>
		<div id="header">
			<div class="headerNav">
				<!--<a class="logo" >标志</a>-->
				<span style="color:#EEEEEE;font-size:28px;float:left;padding-left:20px;padding-top:10px;">${headerName}</span>
				<ul class="nav">
					<%--shrio取登录用户名 --%>
					<!-- <shiro:user><li><a>欢迎[<shiro:principal/>]登录</a></li></shiro:user> -->
					<%-- <li><a>欢迎[<%=nickName%>]登录</a></li> --%>
				<shiro:hasPermission name="IXTBigManage3">
					<li><a href="index" target="_blank">IXT后台管理系统</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="IXTCountManage">
					<li><a href="count" target="_blank">数据后台管理系统</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="IXTActivityManage">
					<li><a href="activitys" target="_blank">活动后台管理系统</a></li>
				</shiro:hasPermission>
				<shiro:hasPermission name="IXTCashManage">
					<li><a href="finance" target="_blank">财务后台管理系统</a></li>
				</shiro:hasPermission>
					<li><a href="x_changepwd.html" target="dialog" width="600">设置</a></li>
					<li><a href="logout">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>
			<!-- navMenu -->
		</div>