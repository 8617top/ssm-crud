package top.best8617.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.best8617.crud.bean.Department;
import top.best8617.crud.bean.Employee;
import top.best8617.crud.dao.DepartmentMapper;
import top.best8617.crud.dao.EmployeeMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void TestCRUD(){
		System.out.println(departmentMapper);
		
//		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//		for(int i = 0;i<10;i++) {
//			String Uid = UUID.randomUUID().toString().substring(0,5)+i;
//			mapper.insertSelective(new Employee(null, Uid, "M", Uid+"@163.com", 4));
//		}
		departmentMapper.insert(new Department(null, "开发部"));
		departmentMapper.insert(new Department(null, "测试部"));
//		employeeMapper.insert(new Employee(null, "Jerry", "M", "best8617@163.com", 14));
//		employeeMapper.insert(new Employee(null, "Tony", "F", "best8617@163.com", 5));
		
		
		
	}

}
