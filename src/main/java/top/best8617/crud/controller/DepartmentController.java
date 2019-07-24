
package top.best8617.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.best8617.crud.bean.Department;
import top.best8617.crud.service.DepartmentService;
import top.best8617.crud.utils.R;

/** 

* @author ChenShuai 

* @version 创建时间：2019年7月23日 下午5:36:15 

* 处理和部门有关的请求

*/

@Controller
public class DepartmentController {

	/** 
	
	* @author ChenShuai 
	
	* @version 创建时间：2019年7月23日 下午5:36:15 
	
	* Des
	
	*/
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 
	 * 2019年7月23日 下午6:30:58
	 * Description
	 */
	@RequestMapping("/depts")
	@ResponseBody
	public R getDepts() {
		List<Department> list = departmentService.getDepts();
		return R.success().add("depts", list);
	}
}
