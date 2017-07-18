package com.test.service;

import com.test.bean.BaseBean;

/**
 * Created by admin on 2017/7/14.
 */
public interface IBaseService<T extends BaseBean> {

    /**
     * 保存的方法
     * @param t
     * @return
     */
    Integer save(T t);

    /**
     * 更新操作
     * @param t
     * @return
     */
    Integer update(T t);

    /**
     * 删除的方法
     * @param id
     * @return
     */
    Integer del(String id);
}
