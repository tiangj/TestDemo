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

<c:set var="statusEnumWork000Permission" value="${param.permission}:statusEnumWork000"/>
<c:set var="statusEnumWork100Permission" value="${param.permission}:statusEnumWork100"/>
<c:set var="statusEnumWork200Permission" value="${param.permission}:statusEnumWork200"/>
<c:set var="statusEnumWork210Permission" value="${param.permission}:statusEnumWork210"/>
<c:set var="statusEnumWork300Permission" value="${param.permission}:statusEnumWork300"/>
<c:set var="statusEnumWork400Permission" value="${param.permission}:statusEnumWork400"/>
<c:set var="statusEnumWork410Permission" value="${param.permission}:statusEnumWork410"/>
<c:set var="statusEnumWork411Permission" value="${param.permission}:statusEnumWork411"/>

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
				<c:if test="${applicationScope.permissionMap[statusEnumWork100Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork100Permission]}">
						<li><a class="edit" href="${controllerName}/approve.do?id=${instance.id}&statusEnum=200" target="ajaxTodo" callback="navTabAjax" title="提交"><span>提交</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
			</c:when>
			
			<c:when test="${instance.statusEnum==200}">
				<%-- <c:choose>
					<c:when test="${albumFlag != null && albumFlag eq 'false' && controllerName eq 'adminAlbum'}">
						<li>请先去审核该专辑下所有歌曲，通过后才能审核专辑!</li>
					</c:when>
					<c:otherwise> --%>
						<c:if test="${applicationScope.permissionMap[statusEnumWork200Permission] != null}">
							<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork200Permission]}">
								<li><a class="edit" href="${controllerName}/toApprove.do?id=${instance.id}&statusEnum=210" width="600" height="550" target="dialog" callback="dialogAjax" title="审核(初)"><span>审核(初)</span></a></li>
							</shiro:hasAnyPermission>
						</c:if>
						<c:if test="${applicationScope.permissionMap[statusEnumWork400Permission] != null}">
							<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork400Permission]}">
								<li><a class="delete" href="${controllerName}/toApprove.do?id=${instance.id}&statusEnum=400" width="600" height="550" target="dialog" callback="dialogAjax" title="驳回(初)"><span>驳回(初)</span></a></li>
							</shiro:hasAnyPermission>
						</c:if>
					<%-- </c:otherwise>
				</c:choose> --%>
			</c:when>
			
			<c:when test="${instance.statusEnum==210 || instance.statusEnum==411}">
				<c:if test="${applicationScope.permissionMap[statusEnumWork210Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork210Permission]}">
						<li><a class="edit" href="${controllerName}/toApprove.do?id=${instance.id}&statusEnum=300" width="600" height="550" target="dialog" callback="dialogAjax" title="审核(终)"><span>审核(终)</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
				<c:if test="${applicationScope.permissionMap[statusEnumWork410Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork410Permission]}">
						<li><a class="delete" href="${controllerName}/toApprove.do?id=${instance.id}&statusEnum=410" width="700" height="550" target="dialog" callback="dialogAjax" title="驳回(终)，可编辑"><span>驳回(终)，可编辑</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
				<c:if test="${applicationScope.permissionMap[statusEnumWork411Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork411Permission]}">
						<li><a class="delete" href="${controllerName}/toApprove.do?id=${instance.id}&statusEnum=411" width="700" height="550" target="dialog" callback="dialogAjax" title="驳回(终)，不可编辑"><span>驳回(终)，不可编辑</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
			</c:when>
			
			<c:when test="${instance.statusEnum==300}">
				<c:if test="${applicationScope.permissionMap[statusEnumWork300Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork300Permission]}">
						<li><a class="edit" href="${controllerName}/toApprove.do?id=${instance.id}&statusEnum=null" target="dialog" callback="dialogAjax" title="更改状态" width="700" height="550"><span>更改状态</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
			</c:when>
			
			<c:when test="${instance.statusEnum==400}">
				<c:if test="${applicationScope.permissionMap[statusEnumWork000Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork000Permission]}">
						<li><a class="edit" href="${controllerName}/approve.do?id=${instance.id}&statusEnum=100" target="ajaxTodo" callback="navTabAjax" title="保存"><span>保存</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
				<c:if test="${applicationScope.permissionMap[statusEnumWork100Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork100Permission]}">
						<li><a class="edit" href="${controllerName}/approve.do?id=${instance.id}&statusEnum=200" target="ajaxTodo" callback="navTabAjax" title="提交"><span>提交</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
			</c:when>
			
			<c:when test="${instance.statusEnum==410}">
				<c:if test="${applicationScope.permissionMap[statusEnumWork000Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork000Permission]}">
						<li><a class="edit" href="${controllerName}/approve.do?id=${instance.id}&statusEnum=100" target="ajaxTodo" callback="navTabAjax" title="保存"><span>保存</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
				<c:if test="${applicationScope.permissionMap[statusEnumWork200Permission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnumWork200Permission]}">
						<li><a class="edit" href="${controllerName}/toApprove.do?id=${instance.id}&statusEnum=210" width="600" height="550" target="dialog" callback="dialogAjax" title="审核(初)"><span>审核(初)</span></a></li>
					</shiro:hasAnyPermission>
				</c:if>
			</c:when>
		</c:choose>
	</ul>
</div>