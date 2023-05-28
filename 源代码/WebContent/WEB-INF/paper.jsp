<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>试卷</title>
<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet">
<link href="lib/css/icon.css" type="text/css" rel="stylesheet">

<script src="lib/js/jquery.min.js"></script>
<script src="lib/js/jquery.easyui.min.js"></script>
<script src="lib/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div id="tb" style="margin-bottom: 5px">
		<a href="javascript:paperWin()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">试卷生成</a> <a
			href="javascript:showPaper()" class="easyui-linkbutton"
			iconCls="icon-add" plain="true">预览试卷</a> <a
			href="javascript:deleteall()" class="easyui-linkbutton"
			iconCls="icon-remove" plain="true">批量删除试卷</a>
	</div>

	<table id="questionTbs" toolbar="#tb"></table>
	<!-- 试卷生成 -->
	<div id="paperWin" title="试卷生成" class="easyui-window"
		style="width: 800px; height: 600px; padding: 30px 30px;">

		<div style="margin-bottom: 20px">
			<span>试卷名称:</span> <input class="easyui-textbox" id="qName"
				name="paperName" style="width: 80%; height: 32px" onchange="checkname();" > <span
				style="color: red">*</span>
		</div>
		<div style="margin-bottom: 20px">
			<span>考试时间:</span> <input class="easyui-textbox" id="qTime"
				name="paperTime" style="width: 80%; height: 32px"> <span
				style="color: red">*</span>
		</div>
		<div style="margin-bottom: 20px">
			<span>试卷总分:</span> <input class="easyui-textbox" id="score"
				name="allscore" style="width: 80%; height: 32px"> <span
				style="color: red">*</span>
		</div>
		<div style="margin-bottom: 20px">
			<span>创建日期:</span> <input class="easyui-datebox" id="createTime"
				name="createTime" style="width: 80%; height: 32px"> <span
				style="color: red">*</span>
		</div>
		<!-- 题库列表 -->
		<table id="myTable"></table>

		<div style="margin-bottom: 20px; padding: 30px 100px;">
			<a href="javascript:save();" class="easyui-linkbutton"
				iconCls="icon-save" style="width: 20%; height: 32px;">新增试卷</a> <a
				href="javascript:close();" class="easyui-linkbutton"
				iconCls="icon-cancel" style="width: 20%; height: 32px;">关闭窗口</a>
		</div>
	</div>

	<!--预览试卷  -->
	<div id="showPaper" class="easyui-window"
		style="width: 400px; height: 600px; padding-left: 30%; text-shadow: gray;"
		title="试卷预览" fit="true"></div>
	</body>
<script>
	//验证题目框
 	function checkpaper(){
		if($("#qName").val()==null||$("#qName").val()==""){
			$.messager.alert("信息提示", "试卷题目不能为空", "info");
			return false;
		}
		if($("#qTime").val()==null||$("#qTime").val()==""){
			$.messager.alert("信息提示", "考试时间不能为空", "info");
			return false;
		}
		if($("#score").val()==null||$("#score").val()==""){
			$.messager.alert("信息提示", "考试总分不能为空", "info");
			return false;
		}
		if($("#createTime").val()==null||$("#createTime").val()==""){
			$.messager.alert("信息提示", "试卷生成时间不能为空", "info");
			return false;
		}else{
			return true;
		}
	} 
	//关闭窗口
	function close(){
		$("#paperWin").window("close");
	}
	$(function() {
		loadPaper();
		loadQuestion();
		$("#paperWin").window("close");
		$("#showPaper").window("close");
	})
	//批量删除试卷
	function deleteall(){
		var row= $('#questionTbs').datagrid("getSelections");
		var idd = "";
		//
		if (row != null & row.length > 0) {
			for (var i = 0; i < row.length; i++) {
				idd += row[i].paperId + ",";
			}
			$.messager.confirm("信息提示", "是否删除?",function(is){
				if(is){
					$.post("delpaper.do", {
						"iddarr" : idd
					}, function(data) {
						if (data) {
							$.messager.alert("信息提示", "删除成功", "info");
							$('#questionTbs').datagrid("reload");
						} else {
							$.messager.alert("信息提示", "删除失败", "info");
						}
					})
				}
			});
	
	
		} else {
			$.messager.alert("信息提示", "你没有选中数据", "info")
		} 
	}
	function paperWin() {
		$("#paperWin").window("open");
	}
	function save() {
		//
		var createTime = $("#createTime").val();
		var dt = new Date(createTime)
		var row = $("#myTable").datagrid("getSelections")
		var data = "";
		var type = "";
		if(checkpaper()){
			if (row != null & row.length > 0 ) {
				for (var i = 0; i < row.length; i++) {
					data += row[i].qId + ",";
					type += row[i].qType + ",";
				}
				$.post("createPaper.do", {
					"type":type,
					"data" : data,
					"qname" : $("#qName").val(),
					"qTime" : $("#qTime").val(),
					"score" : $("#score").val(),
					"createTime":dt
				}, function(data) {
					if (data == 'success') {
						$.messager.alert("信息提示", "保存成功", "info");
						$("#paperWin").window("close");
						$("#myTable").datagrid("reload");
					} else {
						$.messager.alert("信息提示", "请检查试卷是否重名或者输入有误", "info");
					}
				});
			} else {
				$.messager.alert("信息提示", "你没有选中题目", "info")
			}
		}
	}
	//单选题号
	var sign = 0;
	//多选题号
	var more = 0;
	//判断题
	var judge = 0;
	//简答题
	var shortanswer = 0;
	//预览试卷
	function showPaper() {
		var row = $('#questionTbs').datagrid("getSelected");
		if(row!=null){
		$("#showPaper").window("open");
		$.post("showPaper.do",
						{
							"pId" : row.paperId
						},
						function(data) {
							var html = "";
							//拼接试题名称，总分，考试时间
							html += "<h4>试卷名称：" + data[0].p.paperName + "</h4>"
							html += "<h4>总分：" + data[0].p.allscore + "</h4>"
							html += "<h4>考试时间：" + data[0].p.paperTime + "分</h4>"

							//获取单选题
							html += "<h2>一：单选题</h2>"
							for (var i = 0; i < data.length; i++) {
								if (data[i].q.qType == 1) {
									sign++;
									html += "<p>" + sign + ":"
											+ data[i].q.qContent + "</p>"
									html += "A:<input type='radio' name='s"+sign+"' value='A'>"
											+ data[i].q.aOption + "<br>";
									html += "B:<input type='radio' name='s"+sign+"' value='B'>"
											+ data[i].q.bOption + "<br>";
									html += "C:<input type='radio' name='s"+sign+"' value='C'>"
											+ data[i].q.cOption + "<br>";
									html += "D:<input type='radio' name='s"+sign+"' value='D'>"
											+ data[i].q.dOption + "<br>";
								}
							}
							//获取多选题
							html += "<h2>二：多选题</h2>"
							for (var i = 0; i < data.length; i++) {
								if (data[i].q.qType == 2) {
									more++;
									html += "<p>" + more + ":"
											+ data[i].q.qContent + "</p>"
									html += "A:<input type='checkbox' name='m"+more+"' value='A'>"
											+ data[i].q.aOption + "<br>";
									html += "B:<input type='checkbox' name='m"+more+"'value='B'>"
											+ data[i].q.bOption + "<br>";
									html += "C:<input type='checkbox' name='m"+more+"' value='C'>"
											+ data[i].q.cOption + "<br>";
									html += "D:<input type='checkbox' name='m"+more+"'value='D'>"
											+ data[i].q.dOption + "<br>";
								}
							}

							//获取判断题
							html += "<h2>三：判断题</h2>"
							for (var i = 0; i < data.length; i++) {
								if (data[i].q.qType == 3) {
									judge++;
									html += "<p>" + judge + ":"
											+ data[i].q.qContent + "</p>"
									html += "√:<input type='radio' name='j"+judge+"' value='√'>";
									html += "×:<input type='radio'name='j"+judge+"' value='×'>";

								}
							}
							html += "<h2>四：简答题</h2>"
							for (var i = 0; i < data.length; i++) {
								if (data[i].q.qType == 4) {
									shortanswer++;
									html += "<p>" + shortanswer + ":"
											+ data[i].q.qContent + "</p>"
									html += "<textarea style='width:500px;height:200px;resize:none;' id='shortanswer"+shortanswer+"'></textarea>";
								}
							}
							html += "<br><button onclick='getPaper()'>提交试卷</button>";
							$("#showPaper").html(html);
							//置零
							//单选题号
							 sign = 0;
							//多选题号
							more = 0;
							//判断题
							judge = 0;
							//简答题
							shortanswer = 0;
						})
		}else{
			$.messager.alert("信息提示", "你没有选中数据！", "info");
		}
	}

	/* var answerArr = new Array();
	//提交试卷
	function getPaper() {
		//获取单选题弹
		for (var i = 1; i <= sign; i++) {
			var sanswer = $('input[name="s' + i + '"]:checked').val();
			answerArr.push(sanswer);
		}
		//获取多选题弹
		for (var i = 1; i <= more; i++) {
			var manswer = "";
			$('input[name="m' + i + '"]:checked').each(function() {
				manswer += $(this).val()
			})
			answerArr.push(manswer);
		}
		//获取判断题
		for (var i = 1; i <= judge; i++) {
			var sanswer = $('input[name="j' + i + '"]:checked').val();
			answerArr.push(sanswer);
		}
		//获取简答题答案
		for (var i = 1; i <= shortanswer; i++) {
			var sanswer = $('textarea[id="shortanswer' + i + '"]').val();
			answerArr.push(sanswer);
		}
		//获取用户答案信息
		/* for (var i = 0; i < answerArr.length; i++) {
			console.log(answerArr[i])
		} */

	/* } */ 
	//加载试题
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
				width : 100

			}, {
				field : 'answer',
				title : '答案',
				width : 10

			}, {
				field : 'score',
				title : '分数',
				width : 10

			}, {
				field : 'qt',
				title : '题型',
				width : 10,
				formatter : function(value, rowData, rowIndex) {
					return value.questionTypeName;
				}

			}

			] ],
			pagination : true, //如果表格需要支持分页，必须设置该选项为true
			pageSize : 5, //表格中每页显示的行数
			pageList : [ 5, 15, 20 ],

			striped : true, //奇偶行是否使用不同的颜色
			remoteSort : false, //是否从服务器排序数
			sortName : 'qId', //按照ID列的值排序
			sortOrder : 'asc', //使用倒序排序 */
			idField : 'qId',
			loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
			frozenColumns : [ [ //固定在表格左侧的复选框
			{
				field : 'ck',
				checkbox : true
			}, ] ]

		})

	}
	//加载试卷
	function loadPaper() {
		//表格的配置信息
		$('#questionTbs').datagrid({
			title : '试卷列表', //表格名称
			iconCls : 'icon-save', //图标
			height : 'auto', //表格高度，可指定高度，可自动
			border : true, //表格是否显示边框
			url : 'searchPaper.do', //获取表格数据时请求的地址
			method : 'get', //表格数据获取方式,请求地址是上面定义的url
			fitColumns : true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
			columns : [ [ {
				field : 'paperId',
				title : '试卷编号',
				width : 8,
				sortable : true, //排序字段
				hidden : false
			}, {
				field : 'paperName',
				title : '试卷名称',
				width : 100

			}, {
				field : 'paperTime',
				title : '考试时间',
				width : 50

			}, {
				field : 'allscore',
				title : '总分',
				width : 10

			}, {
				field : 'createTime',
				title : '试卷创建日期',
				width : 50,
				formatter: formatDatebox
			}
			] ],
			pagination : true, //如果表格需要支持分页，必须设置该选项为true
			pageSize : 5, //表格中每页显示的行数
			pageList : [ 5, 15, 20 ],

			striped : true, //奇偶行是否使用不同的颜色
			remoteSort : false, //是否从服务器排序数
			sortName : 'createTime', //按照ID列的值排序
			sortOrder : 'desc', //使用倒序排序 */
			idField : 'paperId',
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