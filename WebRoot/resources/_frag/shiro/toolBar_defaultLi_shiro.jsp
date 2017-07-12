<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>
<shiro:hasPermission name="${controllerName}:add">
	<c:if test="${addFlag == null}">
		<li><a class="add" target="dialog" href="${controllerName}/add" rel="page_${controllerName}_add" width="900" height="400"><span>添加</span></a></li>
	</c:if>
</shiro:hasPermission>
<shiro:hasPermission name="${controllerName}:edit">
	<c:if test="${editFlag==null}">
		<li><a class="edit" target="dialog" href="${controllerName}/edit/{sid_list}" rel="page_${controllerName}_edit" width=900 height=400><span>修改</span></a><li>
	</c:if>
</shiro:hasPermission>
<shiro:hasPermission name="${controllerName}:view">
	<li><a class="icon" target="dialog" href="${controllerName}/view/{sid_list}" title="预览" width=900 height=600><span>预览</span></a><li>
</shiro:hasPermission>
<shiro:hasPermission name="${controllerName}:removes">
	<li><a class="delete" target="selectedTodo" href="${controllerName}/removes" rel="ids" postType="string" title="确实要将这些记录删除至回收站吗?"><span>批量放入回收站</span></a></li>
</shiro:hasPermission>
<shiro:hasPermission name="${controllerName}:recoverys">
	<li><a class="edit" target="selectedTodo" href="${controllerName}/recoverys" rel="ids" postType="string"><span>批量恢复</span></a></li>
</shiro:hasPermission>
<shiro:hasPermission name="${controllerName}:deletes">
	<li><a class="delete" target="selectedTodo" href="${controllerName}/deletes" rel="ids" postType="string" title="确实要删除这些记录吗,删除后不能恢复?"><span>批量物理删除</span></a></li>
</shiro:hasPermission>
	<c:if test="${extButtonFlag != null && extButtonFlag==true }">
<shiro:hasPermission name="${controllerName}:audit">
		<li><a class="edit" target="dialog" href="${controllerName}/audit/{sid_list}" rel="page_${controllerName}_audit" width="900" height="400"><span>审核</span></a></li>
</shiro:hasPermission>
<shiro:hasPermission name="${controllerName}:recheck">
		<li><a class="edit" target="selectedTodo" href="${controllerName}/rechecks" rel="ids" postType="string"><span>批量复检通过</span></a></li>
		<li><a class="edit" target="selectedTodo" href="${controllerName}/unchecks" rel="ids" postType="string"><span>批量复检驳回</span></a></li>
</shiro:hasPermission>
<shiro:hasPermission name="${controllerName}:top">
		<li><a class="edit" target="selectedTodo" href="${controllerName}/tops" rel="ids" postType="string"><span>批量置顶</span></a></li>
		<li><a class="edit" target="selectedTodo" href="${controllerName}/untops" rel="ids" postType="string"><span>批量取消置顶</span></a></li>
</shiro:hasPermission>
	</c:if>
