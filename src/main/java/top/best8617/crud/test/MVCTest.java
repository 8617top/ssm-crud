
package top.best8617.crud.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import top.best8617.crud.bean.Employee;

/** 

* @author 作者 Your-Name: 

* @version 创建时间：2019年7月22日 下午6:27:55 

* 类说明 

*/
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations= {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})

public class MVCTest {
	@Autowired
	WebApplicationContext context;
	
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPage() {
		try {
			MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pageNo", "4")).andReturn();
			MockHttpServletRequest request = result.getRequest();
			PageInfo page = (PageInfo) request.getAttribute("pageInfo");
			System.out.println("当前页码："+page.getPageNum());
			System.out.println("总页码："+page.getPages());
			System.out.println("总记录数："+page.getTotal());
			
			System.out.println("当前连续显示页码数");
			int[] nums = page.getNavigatepageNums();
			for(int i : nums) {
				System.out.print(i+"  ");
			}
			System.out.println();
			List<Employee> list = page.getList();
			for(Employee e : list) {
				System.out.println("ID:"+e.getEmpId()+"==>Name:"+e.getEmpName());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	

}
