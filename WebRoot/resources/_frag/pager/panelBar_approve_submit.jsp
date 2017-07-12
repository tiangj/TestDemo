<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>

<script type="text/javascript">
function setStatusEnum(num){
	$("#statusEnumId").val(num);
}
</script>
<!-- 引入panelBar_approve_submit.jsp之后，
	1.需要在表单提交时需要捕获submit方法，在里面添加自己的东西
		$("form").submit(function(e){
			//	提交时自己要做的一些处理
			var paid=$("#inputOrg1").val();
			$("#paid").val(paid);
		});
	2.在表单提交时不需要写 input name='statusEnum' -->
<input id="statusEnumId" type="hidden" name="statusEnum" value="100" />
		
<c:set var="statusEnum100Permission" value="${param.permission}:statusEnum100"/>
		
<div class="formBar">
	<ul style="float: left;">
		<li><div class="buttonActive">
				<div class="buttonContent">
					<button type="submit" onclick="setStatusEnum(100);">保存</button>
				</div>
			</div>
		</li>
		<c:if test="${applicationScope.permissionMap[statusEnum100Permission] != null}">
			<shiro:hasAnyPermission name="${applicationScope.permissionMap[statusEnum100Permission]}">
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit" onclick="setStatusEnum(200);">提交</button>
						</div>
					</div>
				</li>
			</shiro:hasAnyPermission>
		</c:if>
		<li>
			<div class="button">
				<div class="buttonContent">
					<button type="button" class="close">取消</button>
				</div>
			</div>
		</li>
	</ul>
</div>