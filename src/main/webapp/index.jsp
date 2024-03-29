<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>员工列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!-- 引入jquery -->
<script type="text/javascript"
	src="${APP_PATH }/static/js/jquery-1.12.4.min.js"></script>
<!-- 引入样式 -->
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- 修改模态框开始 -->
	<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">员工编辑</h4>
				</div>
				<div class="modal-body">
					<!-- 定义表单开始 -->
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">EmpName</label>
							<div class="col-sm-10">
								<p class="form-control-static" id="empName_update_static"></p>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control"
									id="email_update_input" placeholder="email@163.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<!-- 单选按钮开始 -->
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_update_input" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_update_input" value="F"> 女
								</label>
								<!-- 单选按钮结束 -->
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-3">
								<select class="form-control" name="dId">

								</select>
							</div>
						</div>
					</form>
					<!-- 定义表单结束 -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改模态框结束 -->

	<!-- 添加模态框 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<!-- 定义表单开始 -->
					<form class="form-horizontal">
						<div class="form-group">
							<label class="col-sm-2 control-label">EmpName</label>
							<div class="col-sm-10">
								<input type="text" name="empName" class="form-control"
									id="empName_input" placeholder="EmpName"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control"
									id="email_input" placeholder="email@163.com"> <span
									class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Gender</label>
							<div class="col-sm-10">
								<!-- 单选按钮开始 -->
								<label class="radio-inline"> <input type="radio"
									name="gender" id="gender1_add_input" value="M"
									checked="checked"> 男
								</label> <label class="radio-inline"> <input type="radio"
									name="gender" id="gender2_add_input" value="F"> 女
								</label>
								<!-- 单选按钮结束 -->
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">DeptName</label>
							<div class="col-sm-3">
								<select class="form-control" name="dId">

								</select>
							</div>
						</div>
					</form>
					<!-- 定义表单结束 -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="emp_save_btn"
						id="emp_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 搭建显示页面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-6">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_model_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<!-- 显示表格数据 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover" id="emps_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all"/></th>
							<th>#</th>
							<th>empName</th>
							<th>gender</th>
							<th>email</th>
							<th>deptName</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>

	<script type="text/javascript">
	
		/* =========================================================================== */
	
		var totalRecord,currentPage;	
	
		//发送ajax请求，获取分页数据
		$(function(){
			to_page(1);
		});
		function to_page(pageNo){
			$.ajax({
				url:"${APP_PATH}/emps",
				data:"pageNo="+pageNo,
				type:"GET",
				success:function(result){
					//console.log(result);
					//1.解析并显示数据
					build_emps_table(result);
					//2.解析并显示分页信息
					build_page_info(result);
					build_page_nav(result);
				}
			});
		}
		
		function build_emps_table(result){
			//清空表格
			$("#check_all").prop("checked", false);
			$("#emps_table tbody").empty();
			var emps = result.result.pageInfo.list;
			$.each(emps, function(index, item){
				var checkBotTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender=='M'?'男':'女');
				var emailTd = $("<td></td>").append(item.email);
				var deptNameTd = $("<td></td>").append(item.department.deptName);
				var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				//为编辑按钮添加自定义属性
				editBtn.attr("edit-id", item.empId)
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				//为删除按钮添加自定义属性
				delBtn.attr("del-id", item.empId)
				var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
				$("<tr></tr>").append(checkBotTd)
							.append(empIdTd)
							.append(empNameTd)
							.append(genderTd)
							.append(emailTd)
							.append(deptNameTd)
							.append(btnTd)
							.appendTo("#emps_table tbody");
			});
		}
		//解析显示分页信息
		function build_page_info(result){
			$("#page_info_area").empty();
			$("#page_info_area").append("当前第 "+result.result.pageInfo.pageNum+" 页,"
										+"总 "+result.result.pageInfo.pages+" 页,"
										+"总 "+result.result.pageInfo.total+" 条记录");
			totalRecord = result.result.pageInfo.total;
			currentPage = result.result.pageInfo.pageNum;
		}
		//解析显示分页条	
		function build_page_nav(result){
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
			
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
			var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
			
			if(result.result.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			}else{
				firstPageLi.click(function(){
					to_page(1);
				});
				prePageLi.click(function(){
					to_page(result.result.pageInfo.pageNum-1);
				});
			}
			
			if(result.result.pageInfo.hasNextPage == false){
				lastPageLi.addClass("disabled");
				nextPageLi.addClass("disabled");
			}else{
				lastPageLi.click(function(){
					to_page(result.result.pageInfo.pages);
				});
				nextPageLi.click(function(){
					to_page(result.result.pageInfo.pageNum+1);
				});
			}
			
			
			ul.append(firstPageLi).append(prePageLi);
			
			$.each(result.result.pageInfo.navigatepageNums,function(index, item){
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.result.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function(){
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		} 
		
		/* ========================================================================== */
		
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		
		//点击新增按钮弹出模态框
		$("#emp_add_model_btn").click(function(){
			//清除表单数据(表单重置)
			reset_form("#empAddModal form");
			//$("#empAddModal form")[0].reset();
			//发送ajax请求，获取部门信息
			getDepts("#empAddModal select");
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		
		//查出所有部门信息并显示在下拉列表中
		function getDepts(ele){
			//清空下拉列表信息
			$(ele).empty();
			$.ajax({
				url:"${APP_PATH}/depts",
				type:"GET",
				success:function(result){
					//console.log(result);
					$.each(result.result.depts,function(){
						var optionEle = $("<option></option>").append(this.deptName).attr("value", this.deptId);
						optionEle.appendTo(ele);
					});	
				}
			});
		}
		
		
		function show_validate_msg(ele, status, msg){
			//清除状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success" == status){
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			}else if("error" == status){
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
		
		//校验表单数据
		function validate_add_form(){
			//1.获取校验数据
			var empName = $("#empName_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(empName)){
				show_validate_msg("#empName_input", "error", "用户名必须是6-16位数字和字母的组合或2-5位汉字");
				return false;
			}else{
				show_validate_msg("#empName_input", "success", "");
			}
			var email = $("#email_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#email_input", "error", "Email不合法");
				return false;
			}else{
				show_validate_msg("#email_input", "success", "");
			}
			return true;
		}
		
		//校验用户名是否可用
		$("#empName_input").change(function(){
			//发送ajax请求校验用户名是否可用
			var empName = this.value;
			$.ajax({
				url:"${APP_PATH}/checkuser",
				type:"POST",
				data:"empName="+empName,
				success:function(result){
					console.log(result)
					if(result.code == 200){
						show_validate_msg("#empName_input", "success", "用户名可用");
						$("emp_save_btn").attr("ajax-va","success");
					}else{
						show_validate_msg("#empName_input", "error", result.result.va_msg);
						$("emp_save_btn").attr("ajax-va","error");
					}
				}
			});
		});
		
		//保存数据
		$("#emp_save_btn").click(function(){
			//jquery数据校验
			if(!validate_add_form()){
				return true;
			}
			if($(this).attr("ajax-va")=="error"){
				return false;
			}
			//发送ajax请求保存数据
			$.ajax({
				url:"${APP_PATH}/emp",
				type:"POST",
				data:$("#empAddModal form").serialize(),
				success(result){
					if(result.code == 200){
						//1.关闭模态框
						$("#empAddModal").modal("hide");
						//2.跳转到最后一页
						to_page(totalRecord);
					}else{
						if(undefined != result.result.errorFields.email){
							//显示邮箱错误信息
							show_validate_msg("#email_input", "error", result.result.errorFields.email);
						}
						
						if(undefined != result.result.errorFields.empName){
							//显示名字错误信息
							show_validate_msg("#empName_input", "error", result.result.errorFields.empName);
						}
					}
				}
			});
		});
		
		/* =================================================================================== */
		
		$(document).on("click", ".edit_btn", function(){
			//显示部门信息
			getDepts("#empUpdateModal select");
			//查出员工信息
			getEmp($(this).attr("edit-id"));
			//把员工id传递给模态框更新按钮
			$("#emp_update_btn").attr("edit-id", $(this).attr("edit-id"));
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		//查询员工信息
		function getEmp(id){
			$.ajax({
				url:"${APP_PATH}/emp/"+id,
				type:"GET",
				success:function(result){
					//console.log(result);
					var empData = result.result.emp;
					$("#empName_update_static").text(empData.empName);
					$("#email_update_input").val(empData.email);
					$("#empUpdateModal input[name=gender]").val([empData.gender]);
					$("#empUpdateModal select").val(empData.dId);
				}
			});
		}
		//点击更新，绑定事件
		$("#emp_update_btn").click(function(){
			//校验邮箱数据
			var email = $("#email_update_input").val();
			var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			if(!regEmail.test(email)){
				show_validate_msg("#email_input", "error", "Email不合法");
				return false;
			}else{
				show_validate_msg("#email_input", "success", "");
			}
			//发送ajax请求，保存更新数据
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
				type:"PUT",
				data:$("#empUpdateModal form").serialize(),
				success:function(result){
					$("#empUpdateModal").modal("hide");
					//回到本页
					to_page(currentPage);
				}
			})
		});
		/* ======================================================= */
		//点击按钮，弹出确认删除框
		$(document).on("click", ".delete_btn", function(){
			//弹出确认框
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			var empId = $(this).attr("del-id");
			if(confirm("确认删除 【"+empName+"】 吗？")){
				//确认，发送ajax请求
				$.ajax({
					url:"${APP_PATH}/emp/"+empId,
					type:"DELETE",
					success:function(result){
						//回到本页
						to_page(currentPage);
					}
				});
			}
		});
		
		//完成checkbox全选/全不选
		$("#check_all").click(function(){
			$(".check_item").prop("checked", $(this).prop("checked"));
		});
		
		//check_item
		$(document).on("click", ".check_item", function(){
			//判断当前选择元素个数
			var flag = $(".check_item:checked").length == $(".check_item").length
			$("#check_all").prop("checked", flag);
		});
		
		//批量删除
		$("#emp_delete_all_btn").click(function(){
			var empNames = "";
			var del_idstr = "";
			$.each($(".check_item:checked"),function(){
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
				
				del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
			});
			empNames.substring(0, empNames.length-1);
			empNames.substring(0, del_idstr.length-1);
			if(confirm("确认删除【"+empNames+"】吗?")){
				$.ajax({
					url:"${APP_PATH}/emp/"+del_idstr,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						//$("#check_all").prop("checked", false);
						to_page(currentPage);
					}
				});
			}
		});
	</script>
</body>
</html>