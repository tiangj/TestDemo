package com.test.service;

import java.util.List;
import java.util.Map;

import com.test.bean.User;

/**
 * Created by admin on 2017/5/10.
 */
public interface IUserService {

    Integer saveUserInfo(User user);

    List<Map<String,Object>> getList(Map<String,Object> map);
}
