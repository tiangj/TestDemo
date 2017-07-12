package com.jfinal.mybatis.bean;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.kit.JsonKit;

public class JSONResult {

	/**
	 * 
	 * @param statusCode
	 * @param message
	 * @return {"message":"操作成功!","statusCode":200}
	 */
	public static String init(int statusCode, String message) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("statusCode", statusCode);
		map.put("message", message);
		return JsonKit.toJson(map);
	}

	/**
	 * 
	 * @param statusCode
	 * @param message
	 * @param data
	 * @return {"message":"操作成功!","statusCode":200,"data":""}
	 */
	public static String init(int statusCode, String message, Object data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("statusCode", statusCode);
		map.put("message", message);
		map.put("data", data);
		return JsonKit.toJson(map);
	}
	
	public static String timeout() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("statusCode", 301);
		map.put("message", "会话超时!");
		return JsonKit.toJson(map);
	}
}
