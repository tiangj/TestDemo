package com.test.service;


import com.jfinal.mybatis.bean.BaseBean;

/**
 * Created by admin on 2017/7/14.
 */
public interface IBaseService<T extends BaseBean> {

    /**
     * 保存的方法
     * @param tClass
     * @return
     */
    Integer save(Class<T> tClass);
}
