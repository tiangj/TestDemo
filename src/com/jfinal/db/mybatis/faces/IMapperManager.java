package com.jfinal.db.mybatis.faces;

import java.io.Serializable;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

/**
 * @author mengxin 2016年5月4日 上午10:55:52
 */
public interface IMapperManager extends Serializable {

    /**
     * 获取SqlSessionFactory
     * @return
     */
    public SqlSessionFactory getSqlSessionFactory();
    
    /**
     * 获取操作数据库的mapper, 默认执行mapper方法后自动提交事务
     * @param clazz
     * @return
     */
    public <M extends BaseSupportMapper> M createMapper(Class<M> clazz);
    
    /**
     * 获取操作数据库的mapper
     * @param clazz
     * @param session   传入已有的session
     * @param isCommit  执行mapper方法后是否提交事务
     * @return
     */
    public <M extends BaseSupportMapper> M createMapper(Class<M> clazz, SqlSession sqlSession);
}
