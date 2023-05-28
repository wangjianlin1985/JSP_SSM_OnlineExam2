<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>表格-工具栏</title>
<link href="<%=request.getContextPath()%>/lib/css/default/easyui.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/lib/css/icon.css"
	type="text/css" rel="stylesheet">

<script src="<%=request.getContextPath()%>/lib/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/js/jquery.easyui.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<!-- 工具栏 -->
	<div id="tb">
		<div style="margin-bottom: 5px">
			<a href="javascript:addWin()" class="easyui-linkbutton"
				iconCls="icon-add" plain="true">贡献题目</a> <a
				href="javascript:updateWin()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">题目修改</a> <a
				href="javascript:delBat()" class="easyui-linkbutton"
				iconCls="icon-edit" plain="true">题目批量删除</a>
		</div>
		<div>
			题目：<input class="easyui-textbox" id="qContentSearch"> <a
				href="javascript:search()" class="easyui-linkbutton"
				iconCls="icon-search">查询</a>
		</div>
	</div>
	<table id="myTable" toolbar="#tb"></table>
	<div title="修改窗口" id="mywindow" class="easyui-window" draggable="false"
		style="width: 600px; height: 400px; padding: 60px 30px;">
		<form id="myForm" method="post">
			<div style="margin-bottom: 20px">
				<span>题号:</span> <input class="easyui-textbox" id="qId" name="qId"
					style="width: 80%; height: 32px" readonly> <span
					style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>题目:</span> <input class="easyui-textbox" id="qContent"
					name="qContent" style="width: 80%; height: 32px"> <span
					style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>答案:</span> <input class="easyui-textbox" id="answer"
					name="answer" style="width: 80%; height: 32px"> <span
					style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>分数:</span> <input class="easyui-textbox" id="score"
					name="score" style="width: 80%; height: 32px"> <span
					style="color: red">*</span>
			</div>
			<!-- <div style="margin-bottom: 20px">
				<span>修改日期:</span> <input class="easyui-datebox" id="questionCreateTime"
					name="questionCreateTime" style="width: 80%; height: 32px"> <span
					style="color: red">*</span>
			</div> -->
			<div style="margin-bottom: 20px; padding-left: 30%">
				<a href="javascript:save()" class="easyui-linkbutton"
					iconCls="icon-search" style="width: 30%; height: 32px;">保存</a>
			</div>
		</form>
	</div>

	<div title="新增窗口" id="addwindow" class="easyui-window"
		draggable="false"
		style="width: 600px; height: 400px; padding: 30px 30px">
		<form id="addForm" method="post" name="myadd">
			<div style="margin-bottom: 20px">
				<span>题号:</span> <input class="easyui-textbox easyui-validatebox"
					id="qId" name="qId" style="width: 80%; height: 32px"
					required="true" type="text"> <span style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>题目:</span> <input class="easyui-textbox easyui-validatebox"
					id="qContent" name="qContent" style="width: 80%; height: 32px"
					required="true" type="text"> <span style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>题型:</span><select id="cc" class="easyui-combobox"
					data-options="events:{change:checkpd}" on name="qType"
					style="width: 200px;">
					<option value="1" selected>单选题</option>
					<option value="2">多选题</option>
					<option value="3">判断题</option>
					<option value="4">简答题</option>
				</select><span style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>答案A:</span> <input class="easyui-textbox" id="aoption"
					name="aOption" style="width: 80%; height: 32px">
			</div>
			<div style="margin-bottom: 20px">
				<span>答案B:</span> <input class="easyui-textbox" id="boption"
					name="bOption" style="width: 80%; height: 32px">
			</div>
			<div style="margin-bottom: 20px">
				<span>答案C:</span> <input class="easyui-textbox" id="coption"
					name="cOption" style="width: 80%; height: 32px">
			</div>
			<div style="margin-bottom: 20px">
				<span>答案D:</span> <input class="easyui-textbox" id="doption"
					name="dOption" style="width: 80%; height: 32px">

			</div>
			<div style="margin-bottom: 20px">
				<span>答案:</span> <input class="easyui-textbox easyui-validatebox"
					id="answer" name="answer" style="width: 80%; height: 32px;"
					required="true" type="text"> <span style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>难度:</span><select id="difficulty"
					class="easyui-combobox easyui-validatebox" name="difficultyId"
					style="width: 200px;" required="true">
					<option value="1" selected>简单</option>
					<option value="2">一般</option>
					<option value="3">难</option>
					<option value="4">很难</option>
				</select><span style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<span>分数:</span> <input class="easyui-textbox easyui-validatebox"
					id="score" name="score" style="width: 80%; height: 32px"
					required="true" type="text"> <span style="color: red">*</span>
			</div>
			<div style="margin-bottom: 20px">
				<a href="javascript:add()" class="easyui-linkbutton"
					iconCls="icon-search" style="width: 30%; height: 32px">新增题目</a>
			</div>
		</form>
	</div>
</body>
<script>
	//把简答题和判断题的选项框设为不可编辑的
	function checkpd(){
		var value = $("#cc").val();
		if(value==3||value==4){
			$("#aoption").attr("disabled",true);
		}
	}
	//批量删除
	function delBat() {
		var row = $('#myTable').datagrid("getSelections");
		var iddarr = "";
		//
		if (row != null & row.length > 0) {
			for (var i = 0; i < row.length; i++) {
				iddarr += row[i].qId + ",";
			}
			$.post("delall.do", {
				"iddarr" : iddarr
			}, function(data) {
				if (data) {
					$.messager.alert("信息提示", "删除成功", "info")
					$('#myTable').datagrid("reload");
				} else {
					$.messager.alert("信息提示", "删除失败", "info")
				}
			});
			
		} else {
			$.messager.alert("信息提示", "你没有选中数据", "info")
		}
		//console.log(iddarr);
	}
	//添加
	function add() {
			$("#addForm").form("submit", {
				url : "add.do",
				onSubmit : function() {
					return $(this).form('validate');
				},
				success : function(data) {
					console.log(data);
					if (data == "\"success\"") {
						$.messager.alert("信息提示", "添加成功!", "info");
						$("#addwindow").window("close");
						$('#myTable').datagrid('reload');
					}else{
						$.messager.alert("信息提示", "题号不能重复!", "info");
					}
				}
			});
		
	}
	//打开新增窗口
	function addWin() {
		$("#addwindow").window("open");
	}
	//保存
	function save() {
		$("#myForm").form("submit", {
			url : "update.do",
			onSubmit : function() {
			},
			success : function(data) {
				if (data == 'success') {
					$.messager.alert("信息提示", "修改成功", "info")
					$("#mywindow").window("close");
					$('#myTable').datagrid('reload');
				}
			}
		})
	}
	//修改数据
	function updateWin() {
		var row = $('#myTable').datagrid("getSelected");
		//打开弹窗
		if(row==null){
			$.messager.alert("信息提示", "你没有选中数据！", "info")
		}else{
			$("#mywindow").window("open");
			//把选中行的数据加载到表单myForm中
			$("#myForm").form("load", row);
		}
		//$("#qId").val(row.qId)
		//eaysui设置值
		//$("#qId").textbox("setValue",row.qId)

		//取值
		//var ss =$("#qId").textbox("getValue");
		//console.log(row);
	}
	//查询
	function search() {
		$('#myTable').datagrid("load", {
			qContent : $("#qContentSearch").val()
		})
	}
	$(function() {
		//加载数据
		loadQuestion();
		$("#mywindow").window("close");
		$("#addwindow").window("close");
	})
	function loadQuestion() {
		//表格的配置信息
		$('#myTable').datagrid({
			title : '题库列表', //表格名称
			iconCls : 'icon-save', //图标
			height : 'auto', //表格高度，可指定高度，可自动
			border : true, //表格是否显示边框
			url : 'question.do', //获取表格数据时请求的地址
			method : 'post', //表格数据获取方式,请求地址是上面定义的url
			fitColumns : true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
			columns : [ [ {
				field : 'qId',
				title : '题号',
				width : 8,
				sortable : true, //排序字段
				hidden : false
			}, {
				field : 'qContent',
				title : '题目',
				width : 60

			}, 
			{
				field : 'score',
				title : '分数',
				width : 30

			}, 
			{
				field : 'answer',
				title : '答案',
				width : 60

			}, 
			{
				field : 'questionCreateTime',
				title : '题目更新时间',
				width : 60,
				formatter: formatDatebox
			}, 
			{
				field : 'qt',
				title : '题型',
				width : 10,
				formatter : function(value, rowData, rowIndex) {
					return value.questionTypeName;
				}
			}

			] ],
			pagination : true, //如果表格需要支持分页，必须设置该选项为true
			pageSize : 10, //表格中每页显示的行数
			pageList : [ 5, 10, 15 ],

			striped : true, //奇偶行是否使用不同的颜色
			remoteSort : false, //是否从服务器排序数
			sortName : 'questionCreateTime', //按照ID列的值排序
			sortOrder : 'desc', //使用倒序排序 */
			idField : 'qId',
			loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
		    frozenColumns : [ [ //固定在表格左侧的复选框
			{
				field : 'ck',
				checkbox : true
			}, ] ] 
		})
	}
	//日期格式化
	Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, // month
        "d+": this.getDate(), // day
        "h+": this.getHours(), // hour
        "m+": this.getMinutes(), // minute
        "s+": this.getSeconds(), // second
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter
        "S": this.getMilliseconds()
        // millisecond
    }
    if (/(y+)/.test(format))
        format = format.replace(RegExp.$1, (this.getFullYear() + "")
            .substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(format))
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
    return format;
}
function formatDatebox(value) {
    if (value == null || value == '') {
        return '';
    }
    var dt;
    if (value instanceof Date) {
        dt = value;
    } else {
        dt = new Date(value);
    }
    return dt.format("yyyy-MM-dd"); //扩展的Date的format方法(上述插件实现)
}
</script>
</html>