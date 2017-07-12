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

function showStatus(statusEnum){
	if(statusEnum == 100){
		$("#status_save").show();
		$("#status_shenhe").hide();
		$("#status_bohui").hide();
		$("#status_update").hide();
	}else if(statusEnum == 200){
		$("#status_shenhe").show();
		$("#status_bohui").show();
		
		$("#status_save").hide();
		$("#status_update").hide();
	}else {
		$("#status_update").show();
		
		$("#status_save").hide();
		$("#status_shenhe").hide();
		$("#status_bohui").hide();
	}
}
</script>

<!-- 引用菜单按钮 
		1. 若该模块有审核功能，则不配置  以status开头的参数 , navTabId也不用配置
			buttonName 中也不配置以status开头的值
		
		2. 如果buttonName中值含有add(edit/view)时，才需要配置 以 add(edit/view)开头的参数	
		-->

<!-- menu_button_list.jsp所需要的数据：
	controllerName			adminNews							访问地址，controller的名字
	buttonName				add,edit,view,remove,				按钮的名称，添加，编辑，查看，删除至回收站
							delete,create_news,							彻底删除，批量生成新闻
							upImage,reload_shiro,						图片上传，reload_shiro
							status_save,status_shenhe,					提交，审核
							status_bohui,status_update					驳回，更改状态
							
	permission				news_main							权限名称，sys_menu中的code值
	
	add_target				navTab(dialog/selectedTodo)			界面展示方式，面板、弹出框、
	add_width				900									宽度
	add_height				550									高度
	
	edit_target				navTab
	edit_width				900
	edit_height				550
	
	view_target				navTab
	view_width				900
	view_height				550
	
	navTabId				page_News							界面ID，保证更改审核状态后能刷新界面

	status_save_target		ajaxTodo							callback  与target值对应		ajaxTodo - navTabAjax       dialog - dialogAjax
	status_save_callback	navTabAjax							需要在javascript中提供两个方法 
	
	status_shenhe_target	ajaxTodo
	status_shenhe_callback	navTabAjax
	
	status_bohui_target		ajaxTodo
	status_bohui_callback	navTabAjax
	
	status_update_target	dialog
	status_update_callback	dialogAjax
	status_update_width		350
	status_update_target	180
	 -->
<c:set var="isWork" value="${(param.controllerName eq 'adminAlbum') || (param.controllerName eq 'adminMusic') || (param.controllerName eq 'adminOpern') || (param.controllerName eq 'adminLyric')}"/>
	 
<c:set var="addPermission" value="${param.permission}:add"/>
<c:set var="editPermission" value="${param.permission}:edit"/>
<c:set var="viewPermission" value="${param.permission}:view"/>
<c:set var="removePermission" value="${param.permission}:remove"/>
<c:set var="deletePermission" value="${param.permission}:delete"/>
<c:set var="create_newsPermission" value="${param.permission}:create_news"/>
<c:set var="upImagePermission" value="${param.permission}:upImage"/>
<c:set var="reload_shiroPermission" value="${param.permission}:reload_shiro"/>
<c:set var="clear_copyrightDataPermission" value="${param.permission}:clear_copyrightData"/>

<c:set var="sendPermission" value="${param.permission}:send_voucher"/>
<c:set var="updateDeadlinePermission" value="${param.permission}:updateDeadline_voucher"/>

<div class="panelBar">
	<ul class="toolBar">
		<c:if test="${applicationScope.permissionMap[addPermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[addPermission]}">
				<c:if test="${fn:contains(param.buttonName , 'add')}">
					<li><a class="add" target="${param.add_target}" href="${param.controllerName}/toAddPage.do" width="${param.add_width}" height="${param.add_height}" ${param.add_attr}><span>添加</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		<c:if test="${applicationScope.permissionMap[editPermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[editPermission]}">
				<c:if test="${fn:contains(param.buttonName , 'edit')}">
					<li><a class="edit" target="${param.edit_target}" href="${param.controllerName}/toEditPage.do?id={sid_list}" width="${param.edit_width}" height="${param.edit_height}" ${param.edit_attr}><span>修改</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		<c:if test="${applicationScope.permissionMap[viewPermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[viewPermission]}">
				<c:if test="${fn:contains(param.buttonName , 'view')}">
					<li><a class="icon" target="${param.view_target}" href="${param.controllerName}/toViewPage.do?id={sid_list}" width="${param.view_width}" height="${param.view_height}"><span>查看</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		<c:choose>
			<c:when test="${deleteFlag}">
				<c:if test="${applicationScope.permissionMap[deletePermission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[deletePermission]}">
						<c:if test="${fn:contains(param.buttonName , 'delete')}">
							<li><a class="delete" title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" postType="string" href="${param.controllerName}/deletes.do"><span>彻底删除</span></a></li>
						</c:if>
					</shiro:hasAnyPermission>
				</c:if>
			</c:when><c:otherwise>
				<c:if test="${applicationScope.permissionMap[removePermission] != null}">
					<shiro:hasAnyPermission name="${applicationScope.permissionMap[removePermission]}">
						<c:if test="${fn:contains(param.buttonName , 'remove')}">
							<li><a class="delete" title="确实要将这些记录删除吗?" target="selectedTodo" rel="ids" postType="string" href="${param.controllerName}/removes.do"><span>删除至回收站</span></a></li>
						</c:if>
					</shiro:hasAnyPermission>
				</c:if>
			</c:otherwise>
		</c:choose>
		<c:if test="${applicationScope.permissionMap[create_newsPermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[create_newsPermission]}">
				<c:if test="${fn:contains(param.buttonName , 'create_news')}">
					<li><a class="add" title="确实要批量生成新闻吗?" target="${param.create_news_target}" rel="ids" postType="string" href="${param.controllerName}/toCreatePages.do"><span>批量生成新闻</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		<c:if test="${applicationScope.permissionMap[upImagePermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[upImagePermission]}">
				<c:if test="${fn:contains(param.buttonName , 'upImage')}">
					<li><a class="add" onClick="upImage()"><span>图片上传</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		
		<c:if test="${applicationScope.permissionMap[reload_shiroPermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[reload_shiroPermission]}">
				<c:if test="${fn:contains(param.buttonName , 'reload_shiro')}">
					<li><a class="add" target="dialog" href="adminServerInfo/toReloadPermission.do" width=900 height=400><span>reload_shiro</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		
		<c:if test="${applicationScope.permissionMap[clear_copyrightDataPermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[clear_copyrightDataPermission]}">
				<c:if test="${fn:contains(param.buttonName , 'clear_copyrightData')}">
					<li><a class="delete" target="selectedTodo" href="adminClearCopyright/toClear.do" width=900 height=400><span>清除无用版权数据</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		
		<c:if test="${applicationScope.permissionMap[sendPermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[sendPermission]}">
				<c:if test="${fn:contains(param.buttonName , 'send_voucher')}">
					<li><a class="add" target="dialog" href="adminVoucher2CustomerInventory/toAddPage.do" width=1194 height=500 rel='add' mask='false'><span>发送代金券</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		<c:if test="${applicationScope.permissionMap[updateDeadlinePermission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[updateDeadlinePermission]}">
				<c:if test="${fn:contains(param.buttonName , 'updateDeadline_voucher')}">
					<li><a class="add" target="ajaxTodo" href="adminVoucherList/updateDeadlineVoucher.do"><span>更新过期代金券</span></a></li>
				</c:if>
			</shiro:hasAnyPermission>
		</c:if>
		
		<!-- target    1. ajaxTodo 直接弹出一个选择框，是或者否
					   2. navTab	弹出一个面板，里面嵌套一个html
			 
			 callback  与target值对应		ajaxTodo - navTabAjax       dialog - dialogAjax
			 		   需要在javascript中提供两个方法 
			 		   
			 更改状态时会跳到一个弹出页面，approve.jsp，在approve.jsp中navTabId的值为index.jsp该模块对应的rel
			 比如资讯管理 , News/approve.jsp - navTabId = page_News
					   	 -->
		<%-- <c:if test="${fn:contains(param.buttonName , 'status_save')}">
			<li><a id="status_save" title="提交" target="${param.status_save_target}" callback="${param.status_save_callback}" href="${param.controllerName}/approve.do?id={sid_list}&statusEnum=200" style="display:none;"><span style="background-image: url('images/status_save.gif');">提交</span></a></li>
		</c:if>

		<c:if test="${fn:contains(param.buttonName , 'status_shenhe')}">
			<li><a id="status_shenhe" title="审核" target="${param.status_shenhe_target}" callback="${param.status_shenhe_callback}" width="${param.status_shenhe_width}" height="${param.status_shenhe_height}" href="${param.controllerName}/${isWork ? 'toApprove' : 'approve'}.do?id={sid_list}&statusEnum=300" style="display:none;"><span style="background-image: url('images/status_shenhe.gif');">审核</span></a></li>
		</c:if>
		<c:if test="${fn:contains(param.buttonName , 'status_bohui')}">
			<li><a id="status_bohui" title="驳回" target="${param.status_bohui_target}" callback="${param.status_bohui_callback}" width="${param.status_bohui_width}" height="${param.status_bohui_height}" href="${param.controllerName}/${isWork ? 'toApprove' : 'approve'}.do?id={sid_list}&statusEnum=100" style="display:none;"><span style="background-image: url('images/status_bohui.gif');">驳回</span></a></li>
		</c:if>

		<c:if test="${fn:contains(param.buttonName , 'status_update')}">
			<li><a id="status_update" title="更改状态" target="${param.status_update_target}" callback="${param.status_update_callback}" width="${param.status_update_width}" height="${param.status_update_height}" href="${param.controllerName}/toApprove.do?id={sid_list}&navTabId=${param.navTabId}" style="display:none;"><span style="background-image: url('images/status_update.gif');">更改状态</span></a></li>
		</c:if> --%>
	</ul>
</div>