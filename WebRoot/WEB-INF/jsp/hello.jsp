<%--
  Created by IntelliJ IDEA.
  User: tian
  Date: 2017/7/11
  Time: 20:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="pagerForm" method="post" action="report/list.do">
    <input type="hidden" name="status" value="${param.status}">
    <input type="hidden" name="keywords" value="${param.keywords}" />
    <input type="hidden" name="pageNum" value="1" />
    <input type="hidden" name="numPerPage" value="${model.numPerPage}" />
    <input type="hidden" name="orderField" value="${param.orderField}" />
    <input type="hidden" name="orderDirection" value="${param.orderDirection}" />
</form>


<div class="pageHeader">
    <form onsubmit="return navTabSearch(this);" action="report/list.do" method="post">
        <div class="searchBar">
            <table class="searchContent">
                <tr>
                    <td>
                        我的客户：<input type="text" name="keyword" />
                    </td>
                </tr>
            </table>
            <div class="subBar">
                <ul>
                    <li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
                </ul>
            </div>
        </div>
    </form>
</div>
<div class="pageContent">
    <div class="panelBar">
        <ul class="toolBar">
            <li><a class="add" href="demo_page4.html" target="navTab"><span>添加</span></a></li>
            <li><a class="delete" href="demo/common/ajaxDone.html?uid={sid_user}" target="ajaxTodo" title="确定要删除吗?"><span>删除</span></a></li>
            <li><a class="edit" href="demo_page4.html?uid={sid_user}" target="navTab"><span>修改</span></a></li>
            <li class="line">line</li>
            <li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
        </ul>
    </div>
    	<c:set var="searchRow" value="1" scope="request"/> <%--设置当前查询条件行数--%>
	<table class="table" width="100%" layoutH="${searchRow==0 ? 87 : 113+25*searchRow}">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="50" align="center">序号</th>
				<th orderField="name" orderField="name" class="${param.orderField eq 'name' ? param.orderDirection : ''}">名称</th>
				<th orderField="code" orderField="code" class="${param.orderField eq 'code' ? param.orderDirection : ''}">类型</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${pageList}" varStatus="s">
				<tr target="sid_list" rel="${item.id}">
					<td><input name="ids" value="${item.id}" type="checkbox"></td>
					<td>${(currentPage-1)*numPerPage+s.index + 1}</td>
					<td>${item.name}</td>
					<td>${item.code}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

    <c:import url="../pager/panelBar.jsp"></c:import>
</div>

