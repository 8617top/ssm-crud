
package top.best8617.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.best8617.crud.bean.Employee;
import top.best8617.crud.bean.EmployeeExample;
import top.best8617.crud.bean.EmployeeExample.Criteria;
import top.best8617.crud.dao.EmployeeMapper;

/** 

* @author 作者 Your-Name: 

* @version 创建时间：2019年7月22日 下午5:39:47 

* 类说明 

*/
@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	public List<Employee> getAll() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	/**
	 * 
	 * 2019年7月23日 下午9:40:07
	 * 保存员工数据
	 */
	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}

	/**
	 * 
	 * 2019年7月23日 下午9:42:01
	 * 校验用户名是否可用
	 * @return true : 代表用户名可用
	 */
	public Boolean checkUser(String empName) {
		
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 
	 * 2019年7月24日 下午1:32:15
	 * 根据id查询信息
	 */
	public Employee getEmp(Integer id) {
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	/**
	 * 
	 * 2019年7月24日 下午3:56:35
	 * 员工更新
	 */
	public void updateEmp(Employee employee) {
		
		employeeMapper.updateByPrimaryKeySelective(employee);
	}

	/**
	 * 
	 * 2019年7月24日 下午5:31:52
	 * 根据id删除
	 */
	public void deleteEmp(Integer id) {

		employeeMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 
	 * 2019年7月24日 下午9:09:26
	 * 批量删除
	 */
	public void deleteBatch(List<Integer> ids) {
		
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

}
