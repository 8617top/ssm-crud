
package top.best8617.crud.utils;

import java.util.HashMap;
import java.util.Map;

/** 

* @author 作者 Your-Name: 

* @version 创建时间：2019年7月23日 上午11:20:28 

* 类说明 

*/

public class R {
	//状态码： 200：成功  500：失败
	private int code;
	//提示信息
	private String msg;
	//数据
	private Map<String, Object> result = new HashMap<String, Object>();
	
	public static R success() {
		R r = new R();
		r.setCode(200);
		r.setMsg("处理成功!");
		return r;
	}
	
	public static R fail() {
		R r = new R();
		r.setCode(500);
		r.setMsg("处理失败!");
		return r;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getResult() {
		return result;
	}
	public void setResult(Map<String, Object> result) {
		this.result = result;
	}

	public R add(String key, Object value) {
		this.getResult().put(key, value);
		return this;
	}

}
