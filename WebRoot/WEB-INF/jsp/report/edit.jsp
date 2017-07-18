<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%@ include file="/include.inc.jsp"%>
<div class="pageContent">
	<form action="/report/update.do?navTabId=page_Report&callbackType=closeCurrent" method="post" class='required-validate pageForm'
		  onsubmit="return iframeCallback(this,dialogAjaxDone);">
		<%-- iframeCallback(this,navTabAjaxDone); --%>
		<%--<input type="hidden" name="navTabId" value="page_Report_add">--%>
		<%--<input type="hidden" name="callbackType" value="closeCurrent">--%>
		<%--<input type="hidden" name="rel" value="page_Report_add">--%>
		<input type="hidden" name="id" value="${instance.id}">
		<div class="pageFormContent" layoutH="56">
			<div class="unit">
				<label>code</label>
				<input type="text" name="code" class="textInput required" maxlength="20" size="30" value="${instance.code}"/>
			</div>

			<div class="unit">
				<label>名称</label>
				<input type="text" name="name" class="textInput required" maxlength="20" size="30" value="${instance.name}"/>
			</div>

			<div class="unit">
				<label>排序</label>
				<input type="number" name="orderNum" class="textInput required"  value="${instance.orderNum}" />
			</div>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div></li>
			</ul>
		</div>

	</form>
</div>