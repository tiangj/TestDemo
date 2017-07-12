<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/resources/_frag/include.inc.jsp"%>
<style>
.image-list {
	padding: 10px;
}
.image-list li {
  float: left;
  text-align: center;
  margin-right: 20px;
  position: relative;
}
.image-list li img {
	width: 200px;
}
.image-list li .btnDown {
	  position: absolute;
	  top: 0;
	  right: 0;
}
.image-list li .btnEdit {
	  position: absolute
	  top: 50%;
	  right: 0;
}
.image-list li .btnDel {
	  position: absolute;
	  bottom: 0;
	  right: 0;
}
</style>
<!-- 预览图片文件-->
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" target="dialog" href="mutiFile/add?id=${id}&controllerName=${controllerName}&fileCfgTypes=${fileCfgTypes}" width=700 height=450><span>批量上传</span></a></li>
		</ul>
	</div>
	<div class="pageFormContent" layoutH="80">
		<div class="image-list">
		    <ul>
			<c:forEach var="item" items="${imageList}" varStatus="s">
				<li>
					<img width="200" height="200" alt="" src="${item.url}">
					<a class="btnDown" href="${controllerName}/downFile?id=${item.id}&controllerName=${controllerName}&fileCfgTypes=${fileCfgTypes}">下载</a>
					<a class="btnDel" href="${controllerName}/deleteFile?id=${item.id}&controllerName=${controllerName}&fileCfgTypes=${fileCfgTypes}&navTabId=page_navTab_manageMutiFile" target="ajaxTodo" callback="dialogAjaxDoneThis" title="确定要删除吗?">删除</a>
				</li>
			</c:forEach>
		    </ul>
		</div>
	</div>
	<div class="formBar">
		<ul>
			<li>
				<div class="button">
					<div class="buttonContent">
						<button type="button" class="close">关闭</button>
					</div>
				</div>
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
    function dialogAjaxDoneThis(json){
	    dialogAjaxDone(json);
	    if (json.statusCode == DWZ.statusCode.ok){
	        $.pdialog.reload('${controllerName}/manage?id=${id}&controllerName=${controllerName}&fileCfgTypes=${fileCfgTypes}',json.rel);
	    }
	}
</script>
