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
<script src="<%=request.getContextPath()%>/lib/js/jquery.js"></script>
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
	
</script>
<script src="<%=request.getContextPath()%>/lib/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/js/jquery.easyui.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/js/easyui-lang-zh_CN.js"></script>

</head>

<body>
	<!-- 工具栏 -->
	<div id="tb">
		<div style="margin-bottom: 5px">
			<a href="javascript:searchScore()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询成绩</a>

		</div>


		<div>
			试卷名：<input class="easyui-textbox" id="qContentSearch"> <a
				href="javascript:search()" class="easyui-linkbutton"
				iconCls="icon-search">查询</a>
		</div>

	</div>
	<div id="tb2">
		<div style="margin-bottom: 5px">
			<a href="javascript:searchScore()" class="easyui-linkbutton"
				iconCls="icon-search" plain="true">查询成绩</a>

		</div>


		<div>
			<a href="javascript:count()" class="easyui-linkbutton"
				iconCls="icon-search">查询</a> &nbsp&nbsp<input class="easyui-textbox"
				id="avgscore"> 平均成绩 <input class="easyui-textbox" id="pass">
			及格率&nbsp&nbsp&nbsp&nbsp<a  id=passcount></a>&nbsp&nbsp&nbsp&nbsp<a id=notpasscount></a>
		</div>

	</div>
	<table id="myTable" toolbar="#tb"></table>

	<!-- 根据选中的试卷加载相关成绩弹窗 -->
	<div id="qWins" title="成绩列表" class="easyui-window"
		style="width: 1000px; height: 600px; padding: 30px 30px;">
		<table id="myTable2" toolbar="#tb2"></table>
		<script>
			$(function() {
			
				loadscore2();

			})
			//时间格式转换
			function formatterdate2(val, row) {
				if (val != null) {
					var date = new Date(val);
					return date.getFullYear() + '-' + (date.getMonth() + 1)
							+ '-' + date.getDate();
				}
			}
			function loadscore2() {
				//表格的配置信息
				$('#myTable2').datagrid({
					title : '试卷', //表格名称
					iconCls : 'icon-save', //图标
					height : 'auto', //表格高度，可指定高度，可自动
					border : true, //表格是否显示边框
					url : 'searchScore.do', //获取表格数据时请求的地址
					method : 'post', //表格数据获取方式,请求地址是上面定义的url
					fitColumns : true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
					columns : [ [ {
						field : 'stuId',
						title : '学生id',
						width : 10,

					}, {
						field : 'stu',
						title : '学生姓名',
						width : 10,
						formatter : function(val, row, index) {
							return row.stuName;

						}

					}, {
						field : 'examScore',
						title : '考试分数',
						width : 50,
						sortable : true,
						formatter : function(val, row, index) {
							if (val == null) {
								return "尚未考试"
							} else {
								return val;
							}
						}

					}, {
						field : 'examName',
						title : '考试名称',
						width : 50

					}, {
						field : 'paperId',
						title : '试卷id',

						width : 10

					}

					] ],
					pagination : true, //如果表格需要支持分页，必须设置该选项为true
					pageSize :50, //表格中每页显示的行数
					pageList : [50, 150, 200 ],

					striped : true, //奇偶行是否使用不同的颜色
					remoteSort : false, //是否从服务器排序数
					sortName : 'examScore', //按照ID列的值排序
					sortOrder : 'dsec', //使用倒序排序 */
					idField : 'stuId',
					loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
				
					frozenColumns : [ [ //固定在表格左侧的复选框
					{
						field : 'ck',
						checkbox : false
					}, ] ]

				})

			}
		</script>
	</div>

</body>
<script>
//弹窗关闭刷新主页面并清除avg，pass数据

$('#qWins').dialog({
    onClose:function(){
    	 $("#avgscore").textbox("setText","");
 	    $("#pass").textbox("setText","");
    	    if(location.href.indexOf('#reloaded')==-1){
    	    location.href=location.href+"#reloaded";
    	 
    	    location.reload();
    	    }
    	
    }
});

//获取平均成绩
function count() {

	var rows = $('#myTable2').datagrid('getRows')//获取当前页的数据行
	var total = 0;
	var n=0;
	var count=rows.length;//统计考试学生数量
	for (var i = 0; i < rows.length; i++) {
		if(rows[i]['examScore']==null ){
			count=count-1;
	  
	}else {
		 total += rows[i]['examScore']; //获取指定列
	}
	}

	var avg=total/count;

    $("#avgscore").textbox("setText",avg);
    for (var j = 0; j < rows.length; j++) {
	    if( rows[j]['examScore']>=60) {
	    	n=n+1;
	    }   
	}
    var pass=n/count;
    var notcount=rows.length-count;
    $("#pass").textbox("setText",pass*100+"%");
    document.getElementById("passcount").innerText=count+"人已考";
    document.getElementById("notpasscount").innerText=notcount+"人未考";
   
}
//通过试卷id找成绩
	function searchScore() {
		var row = $('#myTable').datagrid("getSelected");
		var paperId = row.paperId;
		//	$("#paperId").val(paperId);
		$('#myTable2').datagrid("load", {
			paperId : paperId
		})
		
		//第一到第十不同标记
			$("#qWins").window("open");
		$('#myTable2').datagrid({   
							rowStyler : function(index, row) {
								if (index == 0 && $('#myTable2').datagrid('options').pageNumber==1) {
									return 'background-color:yellow;color:blue;font-weight:bold;';
								} else if (index == 1 && $('#myTable2').datagrid('options').pageNumber==1) {
									return 'background-color:red;color:blue;font-weight:bold;';
								} else if (index == 2 && $('#myTable2').datagrid('options').pageNumber==1) {
									return 'background-color:green;color:blue;font-weight:bold;';
								} else if (index >= 3 && index <= 9 && $('#myTable2').datagrid('options').pageNumber==1) {
									return 'background-color:lightblue;font-weight:bold;';
								}
							}
						});
	
	

	}

	//查询根据卷子名查询
	function search() {
		$('#myTable').datagrid("load", {
			paperName : $("#qContentSearch").val()
		})
	}

	$(function() {
		$("#qWins").window("close");
		loadPaper();
	})
	function formatterdate(val, row) {
		if (val != null) {
			var date = new Date(val);
			return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
					+ date.getDate();
		}
	}
	function loadPaper() {
		//表格的配置信息
		$('#myTable').datagrid({
			title : '试卷', //表格名称
			iconCls : 'icon-save', //图标
			height : 'auto', //表格高度，可指定高度，可自动
			border : true, //表格是否显示边框
			url : 'searchPaper.do', //获取表格数据时请求的地址
			method : 'post', //表格数据获取方式,请求地址是上面定义的url
			fitColumns : true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
			columns : [ [ {
				field : 'paperId',
				title : '试卷id',
				width : 10,
				//排序字段
				hidden : false
			}, {
				field : 'paperName',
				title : '试卷名称',
				width : 50

			}, {
				field : 'allscore',
				title : '考试总分',
				width : 50

			}, {
				field : 'paperTime',
				title : '考试时间',

				width : 10

			}, {
				field : 'createTime',
				title : '创建时间',
				width : 10,
				sortable : true,
				formatter : formatterdate
			// formatter:function(val,row,index){
			//		console.log(val)
			//	console.log(row)
			//		console.log(index)
			//		return row.paperName;
			//} 

			}

			] ],
			pagination : true, //如果表格需要支持分页，必须设置该选项为true
			pageSize : 5, //表格中每页显示的行数
			pageList : [ 5, 15, 20 ],

			striped : true, //奇偶行是否使用不同的颜色
			remoteSort : false, //是否从服务器排序数
			sortName : 'createTime', //按照ID列的值排序
			sortOrder : 'desc', //使用倒序排序 */
			idField : 'id',
			loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
			singleSelect: true, //只能选中一条
			frozenColumns : [ [ //固定在表格左侧的复选框
			{
				field : 'ck',
				checkbox : true
			}, ] ]

		})

	}
</script>
</html>