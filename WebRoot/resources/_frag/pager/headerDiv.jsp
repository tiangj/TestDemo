<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>
		<div id="header">
			<div class="headerNav">
				<!--<a class="logo" >标志</a>-->
				<span style="color:#EEEEEE;font-size:28px;float:left;padding-left:20px;padding-top:10px;">${headerName}</span>
				<ul class="nav">
					<%-- <li><a>欢迎[<%=nickName%>]登录</a></li> --%>
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