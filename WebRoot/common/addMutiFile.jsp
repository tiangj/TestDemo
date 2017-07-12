<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>
<c:import url="/resources/_frag/pager/pagerForm.jsp"></c:import>
<style type="text/css" media="screen">
.my-uploadify-button {
	background:none;
	border: none;
	text-shadow: none;
	border-radius:0;
}

.uploadify:hover .my-uploadify-button {
	background:none;
	border: none;
}

.fileQueue {
	width: 600px;
	height: 185px;
	overflow: auto;
	border: 1px solid #E5E5E5;
	margin-bottom: 10px;
}
</style>

<div class="pageContent">
<form method="post" action="mutiFile/success" class="pageForm required-validate" 
	onsubmit="return validateCallback(this, ${pageType=='navTab' ? 'navTabAjaxDone' : 'dialogAjaxDone'});">
	<input type="hidden" name="navTabId" value="page_navTab_manageMutiFile"/>
	<input type="hidden" name="callbackType" value="closeCurrent"/>
	<input type="hidden" name="rel" value="page_navTab_manageMutiFile"/>
	<input type="hidden" name="forwardUrl" value=""/>
	<input type="hidden" name="confirmMsg" value=""/>
	<div class="pageFormContent" layoutH="56">
		<input id="mutiUploadifyId" type="file" name="uploadFile" 
			uploaderOption="{
				swf:'${pageContext.request.contextPath}/resources/uploadify/scripts/uploadify.swf',
				uploader:'${controllerName}/updateFile',
				formData:{id:'${id}','fileInputNames':'uploadFile','fileCfgTypes':'${fileCfgTypes}'},
				queueID:'fileQueue',
				buttonImage:'${pageContext.request.contextPath}/resources/uploadify/img/add.jpg',
				buttonClass:'my-uploadify-button',
				width:102,
				auto:true,
				checkExisting:true,
				onQueueComplete:uploadifyOver}"/>
		<div id="fileQueue" class="fileQueue"></div>
	</div>
	<div class="formBar">
		<ul>
			<li style="display: none;"><div class="buttonActive"><div class="buttonContent"><button id="mutiSubmitBtn" type="submit">保存</button></div></div></li>
			<li><div class="buttonActive">
					<div class="buttonContent">
						<button type="submit" onclick="$('#mutiUploadifyId').uploadify('upload', '*');">保存</button>
					</div>
				</div></li>
			<li>
				<div class="button">
					<div class="buttonContent">
						<button type="button" class="close" onclick="$('#mutiUploadifyId').uploadify('cancel', '*');">取消</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
</form>
</div>
<script type="text/javascript">
function uploadifyOver(event, data){
	$("#mutiSubmitBtn").submit();
}

//function uploadifySuccess(file, data, response){}
</script>