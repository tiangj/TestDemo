<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>
<li><a class="add" target="dialog" href="${controllerName}/add" rel="page_${controllerName}_add" width="900" height="400"><span>添加</span></a></li>
<li><a class="edit" target="dialog" href="${controllerName}/edit?id={sid_list}" rel="page_${controllerName}_edit" width=900 height=400><span>修改</span></a><li>
<li><a class="icon" target="dialog" href="${controllerName}/view?id={sid_list}" title="预览" width=900 height=600><span>预览</span></a><li>
<li><a class="delete" target="selectedTodo" href="${controllerName}/removes" rel="ids" postType="string" title="确实要将这些记录删除至回收站吗?"><span>批量放入回收站</span></a></li>
<li><a class="edit" target="selectedTodo" href="${controllerName}/recoverys" rel="ids" postType="string"><span>批量恢复</span></a></li>
<li><a class="delete" target="selectedTodo" href="${controllerName}/deletes" rel="ids" postType="string" title="确实要删除这些记录吗,删除后不能恢复?"><span>批量物理删除</span></a></li>
<c:if test="${showTreeFlag != null && showTreeFlag==true }">
	<li><a class="add" target="dialog" href="${controllerName}/tree" rel="page_${controllerName}_tree" width=350 height=550><span>查看树结构</span></a></li>
</c:if>
<c:if test="${showAuditFlag != null && showAuditFlag==true }">
	<li><a class="edit" target="dialog" href="${controllerName}/audit/{sid_list}" rel="page_${controllerName}_audit" width="900" height="400"><span>审核</span></a></li>
</c:if>
<c:if test="${showCheckFlag != null && showCheckFlag==true }">
	<li><a class="edit" target="selectedTodo" href="${controllerName}/rechecks" rel="ids" postType="string"><span>批量复检通过</span></a></li>
	<li><a class="edit" target="selectedTodo" href="${controllerName}/unchecks" rel="ids" postType="string"><span>批量复检驳回</span></a></li>
</c:if>
<c:if test="${showTopFlag != null && showTopFlag==true }">
	<li><a class="edit" target="selectedTodo" href="${controllerName}/tops" rel="ids" postType="string"><span>批量置顶</span></a></li>
	<li><a class="edit" target="selectedTodo" href="${controllerName}/untops" rel="ids" postType="string"><span>批量取消置顶</span></a></li>
</c:if>