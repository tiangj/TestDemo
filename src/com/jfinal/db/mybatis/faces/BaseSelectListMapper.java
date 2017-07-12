package com.jfinal.db.mybatis.faces;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseSelectListMapper extends Serializable {
	
	/**
	 * 按条件查询列表，在xml中定义动态条件的SQL语句，可用于后台[检索]
	 * @param example {"interface":"",...}
	 * @return 部分字段 List
	 */
	List<Map<String, Object>> selectListColumnsByExample(Map<String, Object> example);

	/**
	 * 按条件查询接口列表，在xml中自定义完整的SQL语句
	 * @param example {"interface":"",...}
	 * @return 部分字段 List
	 */
	List<Map<String, Object>> selectListColumnsByInterface(Map<String, Object> example);

	/**
	 * 按条件查询接口列表，在xml中自定义完整的SQL语句
	 * @param example {"interface":"",...}
	 * @return 部分字段 List
	 */
	<T> List<T> selectListBeanByInterface(Map<String, Object> example);

}
