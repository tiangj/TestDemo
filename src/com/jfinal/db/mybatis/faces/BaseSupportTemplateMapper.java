package com.jfinal.db.mybatis.faces;

import java.util.List;
import java.util.Map;

public interface BaseSupportTemplateMapper<T> extends BaseSelectListMapper {

	//添加一条数据
	int insert(T record);
	
	//更新一条数据
	int updateByPrimaryKey(T record);

	//添加一条数据(只添加不为null的字段)
	int insertSelective(T record);

	//更新一条数据(只更新不为null的字段)
	int updateByPrimaryKeySelective(T record);
	
	/**
	 * 按主键删除
		<delete id="deleteByPrimaryKey" parameterType="java.lang.String" >
		    delete from tableName where id = #{id,jdbcType=VARCHAR}
		</delete>
	 * @param id
	 * @return
	 */
	<PK> int deleteByPrimaryKey(PK id);
	
	/**
	 * 按主键批量删除-物理删除  返回成功个数
		<delete id="deleteByPrimaryKeys" parameterType="java.util.List">
			delete from tableName where id in
			<foreach collection="list" index="index" item="id" open="(" separator="," close=")">
				#{id,jdbcType=VARCHAR}
			</foreach>
		</delete>
	 * @param idList
	 * @return
	 */
	<PK> int deleteByPrimaryKeys(List<PK> idList);

	/**
	 * 根据主键查询
		<select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="java.lang.String" >
			select <include refid="Base_Column_List" />
			from tableName
			where id = #{id,jdbcType=VARCHAR}
		</select>
	 * @param id
	 * @return
	 */
	<PK> T selectByPrimaryKey(PK id);
	
	/**
	 * 动态操作表,根据主键查询
		<select id="selectOne" resultMap="BaseResultMap" parameterType="java.util.Map" >
			select <include refid="Base_Column_List" />
			from ${tableName}
			where id = #{id,jdbcType=VARCHAR}
		</select>
	 * @param example {id:主键,tableName:"表名"}
	 * @return
	 */
	abstract T selectOne(T record);

	/**
	 * 删除一条数据
	 * @param record  {tableName:"", id:""}
	 * @return
	 */
	abstract int deleteOne(T record);
	
	/**
	 * 动态操作表,按主键批量删除-物理删除  返回成功个数
		<delete id="deleteByExample" parameterType="java.util.Map">
			delete from ${tableName} where
			<if test="id!=null and id!=''">
				id = #{id,jdbcType=VARCHAR}
			</if>
			<if test="idList!=null">
			 	id in
				<foreach collection="idList" index="index" item="id" open="(" separator="," close=")">
					#{id,jdbcType=VARCHAR}
				</foreach>
			</if>
		</delete>
	 * @param example  {idList:[],tableName:""}  {id:"",tableName:""}
	 * @return
	 */
	abstract int deleteByExample(Map<String, Object> example);

}
