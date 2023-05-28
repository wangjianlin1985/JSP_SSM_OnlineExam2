<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>阅卷</title>
<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet">
<link href="lib/css/icon.css" type="text/css" rel="stylesheet">
<script src="lib/js/jquery.min.js"></script>
<script src="lib/js/jquery.easyui.min.js"></script>
<script src="lib/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<div id="tb" style="margin-bottom: 5px">
		<a href="javascript:paperWin()" class="easyui-linkbutton"
			iconCls="icon-edit" plain="true">开始阅卷</a>
	</div>

	<table id="questionTbs" toolbar="#tb"></table>
	<!--预览试卷  -->
	<div id="showPaper" class="easyui-window"
		style="width: 600px; height: 600px; text-shadow: gray;"
		title="主观题阅卷窗口">
		<table id="shorttable" width="100%" toolbar="#sh"></table>
		<div id="aa" class="easyui-accordion"
			style="width: 100%; height: 600px;">
			<div title="答案详细信息" id="content"
				data-options="iconCls:'icon-mini-edit',selected:true"
				style="overflow: auto; padding: 10px;">
				<h3 style="color: #0099FF;">点击主观题显示详细信息</h3>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">


//页面加载函数
$(function(){
	loadPaper();
	$("#showPaper").window("close");
})
/* //打开阅卷窗口
//单选题号
	var sign = 0;
	//多选题号
	var more = 0;
	//判断题
	var judge = 0;
	//简答题
	var shortanswer = 0;
function showPaper() {
		$("#showPaper").window("open");
		var row = $('#questionTbs').datagrid("getSelected");
		$.post("showPaper.do",{
							"pId" : row.paperId
						},
						function(data) {
							var html = "";
							//拼接试题名称，总分，考试时间
							html += "<h4>试卷名称：" + data[0].p.paperName + "</h4>"
							html += "<h4>总分：" + data[0].p.allscore + "</h4>"
							html += "<h4>考试时间：" + data[0].p.paperTime + "分</h4>"
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

						})
	} */
//开始阅卷
function startread(){
		var row = $('#shorttable').datagrid('selectRow', 0);
	}
//加载简答题试题答案
function paperWin(){
	$("#showPaper").window("open");
	var row = $('#questionTbs').datagrid("getSelected");
	//console.log(row.paperName);
	var papername = row.paperName;
	var paperid = row.paperId;
	$('#shorttable').datagrid({
		title : '学生列表', //表格名称
		iconCls : 'icon-save', //图标
		queryParams:{"papername":papername,"paperid":paperid},
		height : 'auto', //表格高度，可指定高度，可自动
		border : true, //表格是否显示边框
		url : 'read.do', //获取表格数据时请求的地址
		method : 'get', //表格数据获取方式,请求地址是上面定义的url
		fitColumns : true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
		singleSelect:true,
		columns : [ [ {
			field : 'id',
			title : '编号',
			width : 8,
			sortable : true, //排序字段
			hidden : false
		}, {
			field : 'stuid',
			title : '学号',
			width : 100

		}, {
			field : 'stuname',
			title : '姓名',
			width : 50

		}, {
			field : 'papername',
			title : '试卷名称',
			width : 50

		}, {
			field : 'objectivescore',
			title : '客观题分数',
			width : 20
		}, {
			field : 'readstatu',
			title : '阅卷状态',
			width : 50,
			formatter : function(value, rowData, rowIndex) {
				if(value == 1){
					return "已阅卷";
				}else{
					return "未阅卷";
				}
			}
		}, {
			field : 'subjectiveanswer',
			title : '主观题答案',
			width : 25,
			formatter: formatOper
		}
		] ],
		pagination : true, //如果表格需要支持分页，必须设置该选项为true
		pageSize : 5, //表格中每页显示的行数
		pageList : [ 5, 15, 20 ],

		striped : true, //奇偶行是否使用不同的颜色
		remoteSort : false, //是否从服务器排序数
		sortName : 'stuname', //按照ID列的值排序
		sortOrder : 'asc', //使用倒序排序 */
		idField : 'stuid',
		loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
		 frozenColumns : [ [ //固定在表格左侧的复选框
		{
			field : 'ck',
			checkbox : true
		}, ] ] ,
		/* onClickRow: function (rowIndex, rowData) {
            $(this).datagrid('unselectRow', rowIndex);
} */
	})
} 
//设置某些列不可点击
function formatOper(val,row,index){  
//	console.log(val+" "+row+" "+index);
	var news = row.subjectiveanswer;
    return '<a href="javascript:void(0)" onclick="getContent(\''+news+'\')">点击获得主观题答案</a>';  
} 
//显示简答题答案
var shortanswer = 0;
function getContent(news){
	var num = "<%=session.getAttribute("num") %>";
	console.log(num)
	var str={};
	str = news.split("&&");
	var answer = "";
	for (var i = 0; i < num; i++) {
		shortanswer++;
		answer += "<h3>主观题:"+shortanswer+"</h3>";
		if(str[i]!=null){
			answer += "<textarea style='width:800px;height:200px;resize:none;' readonly placeholder='未提交答案'>"+str[i]+"</textarea><br/>";
		}else{
			answer += "<textarea style='width:800px;height:200px;resize:none;' readonly placeholder='未提交答案'></textarea><br/>";
		}
		answer += "填写得分:<input name='sh"+shortanswer+"'></input>"
	}
	answer += "<br><button onclick='getPaper()'>提交测评</button>";
	$("#content").html(answer);
}
var answerArr = new Array();
//提交总分
function getPaper() {
	var row = $('#shorttable').datagrid("getSelected");
	var stuid = row.stuid;
	var objectivescore = row.objectivescore;
	var papername = row.papername;
	var allscore = "";
	//获取单选题弹
	for (var i = 1; i <= shortanswer; i++) {
		var sanswer = $('input[name="sh' + i + '"]').val();
		answerArr.push(sanswer);
	}
    for (var i = 0; i < answerArr.length; i++) {
    	allscore += answerArr[i]+",";
	}
    $.messager.confirm("信息提示", "是否提交",function(is){
    	if(is){
    		$.ajax({
    	    	url:"doaddscore.do",
    	    	dataType:"text",
    	    	async:false,//设置为同步刷新
    	    	data:{"score":allscore,"stuid":stuid,"obscore":objectivescore,"papername":papername},
    	    	success:function(data){
    	    		if(data=="\"success\""){
    	    			$.messager.alert("信息提示","提交成功","info");
    	    			$("#content").empty();
    	    			$('#shorttable').datagrid('reload');
    	    			shortanswer = 0;
    	    		}
    	    	}
    	    }); 
    	}
    });
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
		singleSelect:true,
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
		}, ] ] ,
		onClickRow: function (rowIndex, rowData) {
            $(this).datagrid('unselectRow', rowIndex);
}
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
    "q+": Math.floor((this.getMonth() + 3)/ 3), //quarter
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