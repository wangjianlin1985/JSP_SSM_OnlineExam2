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
	<div id="qWin" class="easyui-window" title="选择角色" style="width:500px;height:300px;padding:30px 30px;">
		<form id="myForm" method="post">
		<div style="margin-bottom: 20px;">
			<span>用户名：</span>
			<input class="easyui-textbox" id="name" name="name" style="width:80%;height:32px;"disabled/>
			<span style="color:red;">*</span>
		</div>
		<div style="margin-bottom: 20px;">
			<span>角色：</span>
			<input type="radio" name="radio" value="1" id="role">管理员
			<input type="radio" name="radio" value="2" id="role">学生
			<input type="radio" name="radio" value="3" id="role">教师
		</div>
		<div style="margin-bottom: 20px;margin-left:60px;">
			<a href="javascript:save()" class="easyui-linkbutton" style="width:80%;height:32px;">保存</a>
		</div>
		</form>
	</div>
	</body>
	<script>
	
	//查询
	function search(){
		$('#myTable').datagrid("load",{username:$("#qContentSearch").val()});
	
	}
	function save(){
		var user=$("#name").val();
		var roleid=$("input[type='radio']:checked").val();
		$("#myForm").form("submit",$.ajax({
			url:"saverole.do",//后端地址
			data:{"user":user,"roleid":roleid},
			method:"post",
			success:function(data){
				if(data=="success"){
					alert("成功");
				}else{
					$.messager.alert("信息提示",data,"info");
				}
			}
		}))
		$("#qWin").window("close");
	}
	function usermana(){
		var row =$('#myTable').datagrid("getSelected");
		$("#qWin").window("open");
		$("#name").textbox('setValue',row.username);
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
			url: 'selectUser.do', //获取表格数据时请求的地址
			method: 'post', //表格数据获取方式,请求地址是上面定义的url
			fitColumns: true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
			columns: [
				[{
						field: 'id',
						title: '用户名id',
						width: 25,
						sortable: true, //排序字段
						hidden: false
					},
					{
						field: 'username',
						title: '用户名',
						width: 100

					},
					{
						field: 'password',
						title: '密码',
						width: 100

					},
					{
						field: 'state',
						title: '操作',
						width: 100,
						 formatter:function(value,rowData,rowIndex){
							 var str = '<a href="javascript:usermana()" name="opera" class="easyui-linkbutton"></a>';
								return str;

						} 
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
		        $("a[name='opera']").linkbutton({text:'角色分配',plain:true,iconCls:'icon-add'});  
			}

				

		})

	}
	
	</script>
</html>