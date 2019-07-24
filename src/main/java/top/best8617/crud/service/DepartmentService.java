
package top.best8617.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.best8617.crud.bean.Department;
import top.best8617.crud.dao.DepartmentMapper;

/** 

* @author ChenShuai 

* @version 创建时间：2019年7月23日 下午5:37:53 

* 类说明 

*/
@Service
public class DepartmentService {

	/** 
	
	* @author ChenShuai 
	
	* @version 创建时间：2019年7月23日 下午5:37:53 
	
	* Des
	
	*/
	@Autowired
	private DepartmentMapper departmentMapper;
	
	
	public List<Department> getDepts() {
		List<Department> list = departmentMapper.selectByExample(null);
		
		return list;
	}
}
