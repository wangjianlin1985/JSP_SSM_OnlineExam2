<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<h2 align="center">考试注意事项</h2>
	<p align="center">请仔细阅读考试的相关注意事项</p>
	<div align="center">
		<div id="p" class="easyui-panel" title="注意事项"
			style="width: 700px; height: 400px; padding: 10px;">
			<p style="font-size: 14px">注意事项:</p>
			<ul>
				<li>考试开始前15分钟考生凭学生证和有效身份证件（身份证等）进入规定考场对号入座，并将有效证件放在考桌左上角，以便监考人员查验。考试开始指令发出后，考生才能开始答卷。</li>
				<li>考生进入考场必须关闭各种通讯工具。
					参加闭卷考试考生在入场时除携带必要的文具外，不准携带其它物品(如:书籍、资料、笔记本和自备草稿纸以及具有收录、储存、记忆功能的电子工具等)。已携带入场的应按要求指定位置存放。
					参加非闭卷考试的考生除携带必要的文具外，可携带该考试科目规定允许的相关资料。</li>
				<li>考试开始30分钟后，考生停止进入考场（听力考试开始至结束，考生不得进出考场）。开考30分钟后考生方可交卷离开考场。考生交卷后应立即退场，不得在考场附近逗留、交谈，不得再返回考场续考。
					四、考生领到试卷后，应清点试卷是否齐全，检查试卷有无缺损、错印等情况，若发现试卷差错应举手向监考人员报告。</li>
				<li>考生答卷前，在试卷密封线内填写指定内容（如姓名、学号等）。凡漏写姓名、学生证号、座位号或字迹模糊无法辨认，以及在试卷密封线外填写学生证号、姓名或作其他标记的试卷一律按零分处理。</li>
				<li>在考试期间原则上不允许上厕所，若遇特殊情况，须由工作人员陪同出入考场。</li>
				<li>考试结束指令发出后，考生立即停止答卷，将答卷（答题卡）反扣在桌面上，并按监考人员要求退离考场。严禁将试卷、答卷（答题卡）和考场统一发放的草稿纸带出考场。</li>
			</ul>
		</div>
	</div>
	<div style="margin: 20px 0 10px 0;" align="center">
		<a href="#" class="easyui-linkbutton"
			onclick="javascript:$('#p').panel('open')">Open</a> <a href="#"
			class="easyui-linkbutton" onclick="javascript:$('#p').panel('close')">Close</a>
	</div>
	<div style="margin-bottom: 20px" align="center">
		<a href="javascript:start()" class="easyui-linkbutton"
			iconCls="icon-edit" style="width: 40%; height: 32px">我已认真阅读,开始考试</a>
	</div>
	<!-- 输入学号姓名弹窗 -->
	<div id="paperWin" title="开始考试" class="easyui-window"
		style="width: 400px; height: 280px; padding: 30px 30px;">
		<div style="margin-bottom: 20px">
			<span>学号:</span> <input class="easyui-textbox" id="stuid"
				name="stuid" style="width: 80%; height: 32px" > <span
				style="color: red">*</span>
		</div>
		<div style="margin-bottom: 20px">
			<span>姓名:</span> <input class="easyui-textbox" id="stuname"
				name="stuname" style="width: 80%; height: 32px"> <span
				style="color: red">*</span>
		</div>
		<div style="margin-bottom: 20px; padding: 30px 100px;">
			<a href="javascript:save();" class="easyui-linkbutton"
				iconCls="icon-ok" style="width: 120px; height: 32px;">开始考试</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	
	//判断学号和姓名是否为空
	function check(){
		if($("#stuid").val()==null||$("#stuid").val()==""){
			$.messager.alert("信息提示","请输入学号","info");
			return false;
		}
		if($("#stuname").val()==null||$("#stuname").val()==""){
			$.messager.alert("信息提示","请输入姓名","info");
			return false;
		}else{
			return true;
		}
	}
	$(function() {
		$("#paperWin").window("close");
	})
	function start() {
		$("#paperWin").window("open");
	}
	function save() {
		var stuid = $("#stuid").val();
		var stuname = $("#stuname").val();
		if(check()){
			$.ajax({
				url : "getpaperid",
				dataType : "json",
				data : {
					"stuid" : stuid,
					"stuname" : stuname
				},
				success : function(data) {
					//console.log(data.papername)
					window.location.href = "getpaper.do?paperid=" + data.paperid+ "";
				}
			});
		}
	}
</script>
</html>