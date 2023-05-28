<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>表格-工具栏</title>
		<link href="<%=request.getContextPath() %>/lib/css/default/easyui.css" type="text/css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/lib/css/icon.css" type="text/css" rel="stylesheet">
		
		<script src="<%=request.getContextPath() %>/lib/js/jquery.min.js"></script>
		<script src="<%=request.getContextPath() %>/lib/js/jquery.easyui.min.js"></script>
		<script src="<%=request.getContextPath() %>/lib/js/easyui-lang-zh_CN.js"></script>
	</head>

	<body>
	<!-- 工具栏 -->
	<div id="tb">
		用户名：<input class="easyui-textbox" id="qContentSearch">
		<a href="javascript:search()" class="easyui-linkbutton">查询</a>
	</div>
	<table id="myTable" toolbar="#tb"></table>
	</body>
	<script>
	
	//查询
	function search(){
		$('#myTable').datagrid("load",{"stu_name":$("#qContentSearch").val()});
	
	}
	function usermana(){
		var username = "<%=session.getAttribute("username")%>";
		var row =$('#myTable').datagrid("getSelected");
		console.log(row);
		$.ajax({
			url:"del.do",
			data:{"examName":row.texam.exam_name},
			success:function(msg){
				if(msg=="success"){
					alert("删除成功");
					window.location.reload();
				}else{
					alert("删除失败");
				}
				
			}
		});
	}
	$(function(){
		$("#qWin").window("close");
		//加载数据
		loadQuestion();
	})
	function loadQuestion() {
		//表格的配置信息
		$('#myTable').datagrid({
			title: '用户列表', //表格名称
			iconCls: 'icon-save', //图标
			height: 'auto', //表格高度，可指定高度，可自动
			border: true, //表格是否显示边框
			url: 'selectAllStu.do', //获取表格数据时请求的地址
			method: 'post', //表格数据获取方式,请求地址是上面定义的url
			fitColumns: true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
			columns: [
				[{
					field: 'id',
					title: '编号',
					width: 30,
					sortable: true, //排序字段
					hidden: false
				},
				{
					field: 'stu_name',
					title: '学生姓名',
					width: 80

				},
				{
					field: 'stu_id',
					title: '学号',
					width: 80

				},
				{
					field: 'department',
					title: '系',
					width: 40,
					formatter:function(value,rowData,rowIndex){
						return rowData.department.department_name;
					} 
					
				},
				{
					field: 'teacher',
					title: '教师',
					width: 80,
					formatter:function(value,rowData,rowIndex){
						return rowData.teacher.teacher_name;
					}
				},
				{
					field: 'clazz',
					title: '班级',
					width: 80,
					formatter:function(value,rowData,rowIndex){
						return rowData.clazz.clazz_name;
					}
				},
				{
					field: 'account',
					title: '帐号',
					width: 80

				}
				]
			],
			pagination: true, //如果表格需要支持分页，必须设置该选项为true
			pageSize: 5, //表格中每页显示的行数
			pageList: [5, 15, 20],

			striped: true, //奇偶行是否使用不同的颜色
			remoteSort: false, //是否从服务器排序数
			sortName: 'id', //按照ID列的值排序
			sortOrder: 'asc', //使用倒序排序 */
			idField: 'id',
			loadMsg: '数据正在努力加载，请稍后...', //加载数据时显示提示信息
			onLoadSuccess:function(data){  
		        $("a[name='opera']").linkbutton({text:'删除',plain:true,iconCls:'icon-add'});  
			}

				

		})

	}
	
	</script>
</html>