package com.test.service.impl;


import com.jfinal.db.mybatis.faces.BaseSupportMapper;
import com.test.bean.BaseBean;
import com.test.service.IBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by admin on 2017/7/14.
 */
public class BaseServiceImpl<T extends BaseBean,M extends BaseSupportMapper> implements IBaseService<T> {

    @Autowired
    private M m;

    @Transactional(rollbackFor =Exception.class)
    @Override
    public Integer save(T t) {
        try {
            return m.insertSelective(t);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Transactional(rollbackFor =Exception.class)
    @Override
    public Integer update(T t) {
        try {
            return m.updateByPrimaryKey(t);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }

    @Transactional(rollbackFor =Exception.class)
    @Override
    public Integer del(String id) {
        try {
            return m.deleteByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
            return 0;
        }
    }
}
