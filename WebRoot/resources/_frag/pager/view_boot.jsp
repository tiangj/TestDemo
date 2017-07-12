<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>

		<p class="nowrap">
			<label>创建人：</label>
			${instance.createUser}
		</p>
		<p class="nowrap">
			<label>创建时间：</label>
			<fmt:formatDate value="${instance.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</p>
		<p class="nowrap">
			<label>更新人：</label>
			${instance.createUser}
		</p>
		<p class="nowrap">
			<label>更新时间：</label>
			<fmt:formatDate value="${instance.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</p>