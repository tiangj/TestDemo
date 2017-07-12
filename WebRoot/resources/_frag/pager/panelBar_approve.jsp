<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>

<script type="text/javascript">
function navTabAjax(json){
   navTabAjaxDone(json);
   navTab.reload();
}

function dialogAjax(json){
   dialogAjaxDone(json);
   navTab.reload();
}
</script>

<c:set var="statusEnum100Permission" value="${param.permission}:statusEnum100"/>
<c:set var="statusEnum200Permission" value="${param.permission}:statusEnum200"/>
<c:set var="statusEnum300Permission" value="${param.permission}:statusEnum300"/>
<c:set var="statusEnum400Permission" value="${param.permission}:statusEnum400"/>

<c:set var="isWork" value="${(controllerName eq 'adminAlbum') || (controllerName eq 'adminMusic') || (controllerName eq 'adminOpern') || (controllerName eq 'adminLyric')}"/>
<!-- approve.jsp所需要的数据：controllerName , instance -->
<div class="panelBar">
	<ul class="toolBar">
		<li>
			<div class="button">
				<div class="buttonContent">
					<button type="button" class="close">关闭</button>
				</div>
			</div>
		</li>
		<c:choose>
		<c:when test="${instance.statusEnum==100}">
			<c:if test="${applicationScope.permissionMap[statusEnum100Permission] != null}">
				<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnum100Permission]}">
					<li><a class="edit" href="${controllerName}/approve.do?id=${instance.id}&statusEnum=200" target="ajaxTodo" callback="navTabAjax" title="提交"><span>提交</span></a></li>
				</shiro:hasAnyPermission>
			</c:if>
		</c:when>
		
		<c:when test="${instance.statusEnum==200}">
			<c:choose>
				<c:when test="${albumFlag != null && albumFlag eq 'false' && controllerName eq 'adminAlbum'}">
					<li>请先去审核该专辑下所有歌曲，通过后才能审核专辑!</li>
				</c:when>
				<c:otherwise>
					<c:if test="${applicationScope.permissionMap[statusEnum200Permission] != null}">
						<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnum200Permission]}">
							<li><a class="edit" href="${controllerName}/${isWork ? 'toApprove' : 'approve'}.do?id=${instance.id}&statusEnum=300" ${isWork ? 'width="600" height="550"' : ''} target="${isWork ? 'dialog' : 'ajaxTodo'}" callback="${isWork ? 'dialogAjax' : 'navTabAjax'}" title="审核"><span>审核</span></a></li>
						</shiro:hasAnyPermission>
					</c:if>
					<c:if test="${applicationScope.permissionMap[statusEnum300Permission] != null}">
						<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnum300Permission]}">
							<li><a class="delete" href="${controllerName}/${isWork ? 'toApprove' : 'approve'}.do?id=${instance.id}&statusEnum=400" ${isWork ? 'width="600" height="550"' : ''} target="${isWork ? 'dialog' : 'ajaxTodo'}" callback="${isWork ? 'dialogAjax' : 'navTabAjax'}" title="驳回"><span>驳回</span></a></li>
						</shiro:hasAnyPermission>
					</c:if>
				</c:otherwise>
			</c:choose>
		</c:when>
		
		<c:otherwise>
			<c:if test="${applicationScope.permissionMap[statusEnum400Permission] != null}">
				<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnum400Permission]}">
					<li><a class="edit" href="${controllerName}/toApprove.do?id=${instance.id}" target="dialog" callback="dialogAjax" title="状态更改" width="${isWork ? 600 : 350}" height="${isWork ? 550 :180}"><span>更改状态</span></a></li>
				</shiro:hasAnyPermission>
			</c:if>
		</c:otherwise>
		</c:choose>
	</ul>
</div>