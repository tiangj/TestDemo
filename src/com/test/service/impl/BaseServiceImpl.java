package com.test.service.impl;


import com.jfinal.db.mybatis.faces.BaseSupportMapper;
import com.jfinal.mybatis.bean.BaseBean;
import com.test.service.IBaseService;

/**
 * Created by admin on 2017/7/14.
 */
public class BaseServiceImpl<T extends BaseBean,M extends BaseSupportMapper> implements IBaseService<T> {

    private Class<M> mClass;

    private Class<T> tClass;

    public BaseServiceImpl(Class<M> mClass, Class<T> tClass) {
        this.mClass = mClass;
        this.tClass = tClass;
    }

    @Override
    public Integer save(Class<T> tClass) {
        try {
            return mClass.newInstance().insertSelective(tClass);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return null;
    }
}
