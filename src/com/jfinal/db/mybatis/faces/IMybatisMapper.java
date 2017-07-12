package com.jfinal.db.mybatis.faces;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.github.pagehelper.PageInfo;
import com.jfinal.mybatis.bean.PagerData;

public interface IMybatisMapper extends Serializable {

	public SqlSessionFactory getSqlSessionFactory();
	
	public <M extends BaseSupportMapper> M createMapper(Class<M> clazzM);
	
	public <M extends BaseSupportMapper> M createMapper(SqlSession sqlSession, Class<M> clazzM);

	public String getSql(String namespace, String id, Object parameter);

	public <M extends BaseSupportMapper> String getSql(Class<M> clazzM, String id, Object parameter);
	
	public <M extends BaseSupportMapper, T, PK> T selectByPrimaryKey(Class<M> clazzM, Class<T> clazzT, PK id);
	
	public <M extends BaseSupportMapper, T, PK> T selectByPrimaryKey(SqlSession sqlSession, Class<M> clazzM, Class<T> clazzT, PK id);
	
	public <M extends BaseSupportMapper, T> int insert(Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int insert(SqlSession sqlSession, Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int updateByPrimaryKey(Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int updateByPrimaryKey(SqlSession sqlSession, Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int insertSelective(Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int insertSelective(SqlSession sqlSession, Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int updateByPrimaryKeySelective(Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int updateByPrimaryKeySelective(SqlSession sqlSession, Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, PK> int deleteByPrimaryKey(Class<M> clazzM, PK id);
	
	public <M extends BaseSupportMapper, PK> int deleteByPrimaryKey(SqlSession sqlSession, Class<M> clazzM, PK id);
	
	public <M extends BaseSupportMapper, PK> int deleteByPrimaryKeys(Class<M> clazzM, List<PK> idList);
	
	public <M extends BaseSupportMapper, PK> int deleteByPrimaryKeys(SqlSession sqlSession, Class<M> clazzM, List<PK> idList);
	
	/**
	 * 根据tableName, id查询
	 * @param clazzM
	 * @param record  {tableName:"",id:""}
	 * @return
	 */
	public <M extends BaseSupportMapper, T> T selectOne(Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> T selectOne(SqlSession sqlSession, Class<M> clazzM, T record);

	/**
	 * 查询结果集中的第一条
	 * @param clazzM
	 * @param example
	 * @return
	 * @throws Exception
	 */
	public <M extends BaseSupportMapper> Map<String, Object> selectFirstByExample(Class<M> clazzM, Map<String, Object> example);

	public <M extends BaseSupportMapper> Map<String, Object> selectFirstByExample(SqlSession sqlSession, Class<M> clazzM, Map<String, Object> example);

	public <M extends BaseSupportMapper> Map<String, Object> selectFirstByInterface(Class<M> clazzM, Map<String, Object> example);

	public <M extends BaseSupportMapper> Map<String, Object> selectFirstByInterface(SqlSession sqlSession, Class<M> clazzM, Map<String, Object> example);
	
	/**
	 * 按tableName, id删除
	 * @param clazzM
	 * @param record  {tableName:"",id:""}
	 * @return
	 */
	public <M extends BaseSupportMapper, T> int deleteOne(Class<M> clazzM, T record);
	
	public <M extends BaseSupportMapper, T> int deleteOne(SqlSession sqlSession, Class<M> clazzM, T record);

	/**
	 * 根据tableName， idList批量删除-物理删除
	 * @param clazz
	 * @param tableName
	 * @param idList
	 * @return 返回成功个数
	 */
	public <M extends BaseSupportMapper, PK> int deleteList(Class<M> clazzM, String tableName, List<PK> idList);
	
	public <M extends BaseSupportMapper, PK> int deleteList(SqlSession sqlSession, Class<M> clazzM, String tableName, List<PK> idList);
	
	/**
	 * 根据条件删除-物理删除
	 * @param clazz
	 * @param example
	 * @return
	 */
	public <M extends BaseSupportMapper> int deleteByExample(Class<M> clazzM, Map<String, Object> example);

	public <M extends BaseSupportMapper> int deleteByExample(SqlSession sqlSession, Class<M> clazzM, Map<String, Object> example);
	
	/**
	 * selectListColumnsByExample 根据条件查询列表
	 * @param clazz
	 * @param example
	 * @return
	 */
	public <M extends BaseSupportMapper> List<Map<String, Object>> selectListColumnsByExample(Class<M> clazzM,
			Map<String, Object> example);
	
	public <M extends BaseSupportMapper> List<Map<String, Object>> selectListColumnsByExample(SqlSession sqlSession, Class<M> clazzM,
			Map<String, Object> example);
	
	/**
	 * selectListColumnsByInterface 根据条件查询列表
	 * @param clazz
	 * @param example
	 * @return
	 */
	public <M extends BaseSupportMapper> List<Map<String, Object>> selectListColumnsByInterface(Class<M> clazzM,
			Map<String, Object> example);
	
	public <M extends BaseSupportMapper> List<Map<String, Object>> selectListColumnsByInterface(SqlSession sqlSession, Class<M> clazzM,
			Map<String, Object> example);
	
	/**
	 * selectListBeanByInterface 根据条件查询对象列表
	 * @param clazzM
	 * @param clazzT
	 * @param example
	 * @return
	 */
	public <M extends BaseSupportMapper, T> List<T> selectListBeanByInterface(Class<M> clazzM, Class<T> clazzT, 
			Map<String, Object> example);

	public <M extends BaseSupportMapper, T> List<T> selectListBeanByInterface(SqlSession sqlSession, Class<M> clazzM, Class<T> clazzT, 
			Map<String, Object> example);
	
	/**
	 * selectPageInfoByExample 根据条件分页查询列表
	 * @param clazz
	 * @param pageNum
	 * @param pageSize
	 * @param example
	 * @return
	 * {"total":13,"lastPage":7,"hasNextPage":true,"nextPage":2,"pages":7,"pageSize":2,"navigatePages":8,
	 * 	"hasPreviousPage":false,"navigatepageNums":{},"size":2,"pageNum":1,"endRow":2,"prePage":0,
	 * 	"isLastPage":false,"startRow":1,"firstPage":1,"isFirstPage":true,
	 * 	"list":[{"id":"6be7b999c8814e8d8816a427a78b260f"},{"id":"1c921c37679345979e7d1ab7b4c4d796"}]
	 * }
	 */
	public <M extends BaseSupportMapper> PageInfo<Map<String, Object>> selectPageInfoByExample(
			Class<M> clazzM, int pageNum, int pageSize, Map<String, Object> example);

	public <M extends BaseSupportMapper> PageInfo<Map<String, Object>> selectPageInfoByExample(SqlSession sqlSession, 
			Class<M> clazzM, int pageNum, int pageSize, Map<String, Object> example);
	
	/**
	 * selectPageInfoByInterface 根据条件分页查询列表
	 * @param clazz
	 * @param pageNum
	 * @param pageSize
	 * @param example
	 * @return
	 * {"total":13,"lastPage":7,"hasNextPage":true,"nextPage":2,"pages":7,"pageSize":2,"navigatePages":8,
	 * 	"hasPreviousPage":false,"navigatepageNums":{},"size":2,"pageNum":1,"endRow":2,"prePage":0,
	 * 	"isLastPage":false,"startRow":1,"firstPage":1,"isFirstPage":true,
	 * 	"list":[{"id":"6be7b999c8814e8d8816a427a78b260f"},{"id":"1c921c37679345979e7d1ab7b4c4d796"}]
	 * }
	 */
	public <M extends BaseSupportMapper> PageInfo<Map<String, Object>> selectPageInfoByInterface(Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example);

	public <M extends BaseSupportMapper> PageInfo<Map<String, Object>> selectPageInfoByInterface(SqlSession sqlSession, Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example);
	
	/**
	 * selectPagerDataByExample 根据条件分页查询列表
	 * @param clazz
	 * @param pageNum
	 * @param pageSize
	 * @param example
	 * @return
	 * {"pager":{"total":13,"pages":7,"pageSize":2,"pageNum":1},
	 * 	"pageList":[{"id":"6be7b999c8814e8d8816a427a78b260f"},{"id":"1c921c37679345979e7d1ab7b4c4d796"}]
	 * }
	 */
	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByExample(Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example);

	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByExample(SqlSession sqlSession, Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example);
	/**
	 * selectPagerDataByExample 根据条件分页查询列表，添加rowNum字段
	 * @param clazzM
	 * @param pageNum
	 * @param pageSize
	 * @param example
	 * @param showRowNum
	 * @return
	 */
	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByExample(Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example, boolean showRowNum);

	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByExample(SqlSession sqlSession, Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example, boolean showRowNum);
	
	/**
	 * selectPagerDataByInterface 根据条件分页查询列表
	 * @param clazz
	 * @param pageNum
	 * @param pageSize
	 * @param example
	 * @return
	 * {"pager":{"total":13,"pages":7,"pageSize":2,"pageNum":1},
	 * 	"pageList":[{"id":"6be7b999c8814e8d8816a427a78b260f"},{"id":"1c921c37679345979e7d1ab7b4c4d796"}]
	 * }
	 */
	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByInterface(Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example);

	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByInterface(SqlSession sqlSession, Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example);
	
	/**
	 * selectPagerDataByInterface 根据条件分页查询列表，添加rowNum字段
	 * @param clazzM
	 * @param pageNum
	 * @param pageSize
	 * @param example
	 * @param showRowNum
	 * @return
	 */
	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByInterface(Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example, boolean showRowNum);

	public <M extends BaseSupportMapper> PagerData<Map<String, Object>> selectPagerDataByInterface(SqlSession sqlSession, Class<M> clazzM, 
			int pageNum, int pageSize, Map<String, Object> example, boolean showRowNum);
	
	/**
	 * selectPagerDataByInterface 根据条件分页查询列表
	 * @param clazzM
	 * @param clazzT
	 * @param pageNum
	 * @param pageSize
	 * @param example
	 * @return
	 * {"pager":{"total":13,"pages":7,"pageSize":2,"pageNum":1},
	 * 	"pageList":[{"id":"6be7b999c8814e8d8816a427a78b260f"},{"id":"1c921c37679345979e7d1ab7b4c4d796"}]
	 * }
	 */
	public <M extends BaseSupportMapper, T> PagerData<T> selectPagerDataByInterface(Class<M> clazzM, Class<T> clazzT,  
			int pageNum, int pageSize, Map<String, Object> example);
	
	public <M extends BaseSupportMapper, T> PagerData<T> selectPagerDataByInterface(SqlSession sqlSession, Class<M> clazzM, Class<T> clazzT,  
			int pageNum, int pageSize, Map<String, Object> example);
	
}
