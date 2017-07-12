
集成Ueditor：（页面与处理请求分离开）

	1、页面集成到当前项目IXTManagement中
		在WebRoot下引入 
			/ueditor/dialogs
			/lang
			/themes
			/third-party
			/index.html
			/ueditor.all.js
			/ueditor.all.min.js
			/ueditor.config.js   
				注意修改：
					22行添加：window.UEDITOR_HOME_URL = "/IXTManagement/ueditor/";
					36行修改：serverUrl: "http://192.168.2.104:8080/IXTFileMiddleware/ueditor/jsp/controller.jsp"
			/ueditor.parse.js
			/ueditor.parse.min.js
	
==========================================================================
	
	2、处理上传请求分离到项目IXTFileMiddleware中
		在WebRoot下引入        
			/ueditor/jsp/config.json  
				注意设置处理上传请求前缀："*UrlPrefix": "http://192.168.2.104:8080"
			/ueditor/jsp/controller.jsp 
				添加如下代码：(注意允许跨域最好配置固定的地址：Access-Control-Allow-Origin:http://192.168.2.104:8080)
				//解决 跨域访问  参考：http://www.cnblogs.com/zhangxiaodong/p/3760834.html
				response.addHeader("Access-Control-Allow-Origin", "*");
				response.addHeader("Access-Control-Allow-Headers", "X-Requested-With,X_Requested_With");
			
	在WEB-INF/lib下引入         
			commons-codec-1.9.jar
			commons-fileupload-1.3.1.jar
			commons-io-2.4.jar
			javassist-3.15.0-GA.jar
			javax.servlet-api-3.0.1.jar
			javax.servlet.jsp.jstl-api-1.2.1.jar
			json.jar
			ueditor-1.1.3.jar
			
			