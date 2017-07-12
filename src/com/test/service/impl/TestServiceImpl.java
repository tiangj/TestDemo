package com.test.service.impl;

import org.springframework.stereotype.Service;

import com.test.service.ITestService;

/**
 * Created by tianguojun on 2016/10/14.
 */
@Service("testService")
public class TestServiceImpl implements ITestService {

    public String hello() {
        return "hello";
    }
}
