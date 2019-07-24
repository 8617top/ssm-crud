package top.best8617.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.best8617.crud.bean.Employee;
import top.best8617.crud.service.EmployeeService;
import top.best8617.crud.utils.R;

/*
 * 处理员工CRUD请求
 */
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 
	 * 2019年7月24日 下午5:31:59
	 * 根据id删除/批量删除
	 */
	@RequestMapping(value="/emp/{id}", method=RequestMethod.DELETE)
	@ResponseBody
	public R deleteEmp(@PathVariable("id") String ids) {
		
		if(ids.contains("-")) {
			//批量删除
			String[] str_ids = ids.split("-");
			List<Integer> del_ids = new ArrayList<>();
			for(String string:str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(del_ids);
		}else {
			//单个删除
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return R.success();
	}
	
	/**
	 * 
	 * 2019年7月24日 下午3:58:21
	 * 员工更新
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public R updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return R.success();
	}
	
	/**
	 * 
	 * 2019年7月24日 下午1:31:46
	 * 根据员工id查询信息
	 */
	@RequestMapping(value="/emp/{id}", method=RequestMethod.GET)
	@ResponseBody
	public R getEmp(@PathVariable("id")Integer id) {
		Employee employee = employeeService.getEmp(id);
		return R.success().add("emp", employee);
	}
	
	/**
	 * 
	 * 2019年7月23日 下午9:47:21
	 * 检查用户名是否可用
	 */
	@RequestMapping("/checkuser")
	@ResponseBody
	public R checkUser(@RequestParam("empName") String empName) {
		
		//判断用户名是否是合法表达式
		
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if(!empName.matches(regx)) {
			return R.fail().add("va_msg","用户名必须是6-16位数字和字母的组合或2-5位汉字");
		}
		
		Boolean b = employeeService.checkUser(empName);
		if(b) {
			return R.success();
		}else {
			return R.fail().add("va_msg", "用户名不合法");
		}
	}
	
	/**
	 * 
	 * 2019年7月23日 下午7:32:22
	 * 员工保存
	 */
	@RequestMapping(value="/emp", method=RequestMethod.POST)
	@ResponseBody
	public R saveEmp(@Valid Employee employee, BindingResult result) {
		
		Map<String, Object> map = new HashMap<>();
		
		if(result.hasErrors()) {
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return R.fail().add("errorFields", map);
		}else {
			employeeService.saveEmp(employee);
			return R.success();
		}
	}

	/*
	 * 查询员工数据（分页查询）
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public R getEmpsWithJson(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {
		PageHelper.startPage(pageNo, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo page = new PageInfo(emps, 5);
		return R.success().add("pageInfo", page);
	}

	/*
	 * @RequestMapping("/emps") public String getEmps(@RequestParam(value =
	 * "pageNo", defaultValue="1")Integer pageNo, Model model) {
	 * PageHelper.startPage(pageNo,5); List<Employee> emps =
	 * employeeService.getAll(); PageInfo page = new PageInfo(emps,5);
	 * model.addAttribute("pageInfo",page); return "list"; }
	 */
}
