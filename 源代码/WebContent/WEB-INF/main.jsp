<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>试卷</title>
<link href="<%=request.getContextPath()%>/lib/css/default/easyui.css"
	type="text/css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/lib/css/icon.css"
	type="text/css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/lib/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/js/jquery.easyui.min.js"></script>
<script src="<%=request.getContextPath()%>/lib/js/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">

	<!--头部导航栏部分开始-->
	<div region="north" split="false"
		style="height: 33px; background-color: #e3eefe">
		<span style="margin-left: 2%;"> <a href="#"
			class="easyui-linkbutton" iconCls="icon-man" plain="true"><%=session.getAttribute("username")%></a>
		</span> <span style="margin-left: 10%;"> <a
			href="<%=request.getContextPath()%>/main/studentPage "
			class="easyui-linkbutton" iconCls="icon-back" plain="true">首页</a> <a
			href="javascript:void(0)" onclick="doAlert()"
			class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改个人信息</a>
			<a href="<%=request.getContextPath()%>/main/logout"
			class="easyui-linkbutton" iconCls="icon-undo" plain="true">退出系统</a>
		</span> <span style="margin-left: 50%;"> <a href="#"
			class="easyui-linkbutton" iconCls="icon-tip" plain="true"><span
				id="presentTime"></span></a>
		</span>
		<script>
			var myDate = new Date();
			$("#presentTime").html("日期:" + myDate.toLocaleDateString());
		</script>
	</div>
	<!--头部导航栏部分结束-->
	<!--底部开始-->
	<div region="south" split="false"
		style="height: 28px; background-color: #e3eefe">
		<span style="margin-left: 40%;"> <a href="#"
			class="easyui-linkbutton" iconCls="icon-search" plain="true">版本号:20180803V</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-large-shapes"
			plain="true">版权所有:西华大学第六组</a> <a href="#" class="easyui-linkbutton"
			iconCls="icon-help" plain="true">如有疑问请联系技术人员</a>
		</span>

	</div>
	<!--底部结束-->

	<!--左边导航栏部分开始-->
	<div region="west" title="导航菜单" style="width: 200px;">
		<!--树形导航菜单开始-->
		<ul id="mytree" class="easyui-tree"></ul>
		<!--树形导航菜单结束-->
	</div>
	<!--左边导航栏部分结束-->

	<!--中间工作区域开始-->
	<div region="center">

		<div id="contentInfo" class="easyui-tabs"
			data-options="tools:'#tab-tools'" style="height: 100%;">
			<div title="首页">
				<div class="easyui-panel"
					style="width: 100%; height: 100%; padding: 10px;">
					<div class="easyui-layout" data-options="fit:true">
						<div id="recentExam"
							data-options="region:'west',title:'未来几天需要的参加的考试',split:true"
							style="width: 230px; padding: 10px"></div>

						<%@ include file="loadingDiv.jsp"%>

						<script type="text/javascript">
						//加载考试信息
						function getNews(){
							$.ajax({
								type : "post", //ajax post方式请求
								url : "",
								dataType : "json",
								data : {
									
								},
								success : function(str) {
									if (str == 'noExit') {
										flage = true;
									} else if (str == 'Exit') {
										flage = false;
									}
								}
							});
						}
						</script>
						<div data-options="region:'center',title:'最新公告'"
							style="padding: 10px">
							<table id="newstable"></table>
							<div id="aa" fit="true" class="easyui-accordion"
								style="width: 300px; height: 200px;">
								<div title="公告内容" id="content"
									data-options="iconCls:'icon-mini-edit',selected:true"
									style="overflow: auto; padding: 10px;"></div>
								<div title="Title2" data-options="iconCls:'icon-reload'"
									style="padding: 10px;">content2</div>
								<div title="Title3">content3</div>
							</div>

							<script type="text/javascript">
								$('#aa').accordion({
									animate : true
								});
							</script>

						</div>

						<div id="preExamInfor"
							data-options="region:'east',title:'本月已参加的考试信息'"
							style="width: 200px; padding: 10px">本月的考试信息</div>
					</div>
				</div>

			</div>
		</div>
		<!--中间工作区域结束-->


		<div id="alertWin" title="修改个人信息" class="easyui-window"
			style="width: 480px; height: 320px;">

			<div
				style="margin-bottom: 20px; margin-top: 20px; text-align: center">
				<span>中&nbsp;&nbsp;文&nbsp;&nbsp;名:</span> <input id="updateCnUser"
					class="easyui-textbox" data-options="prompt:'请输入别名...'"
					style="width: 50%; height: 32px"> <span></span>
			</div>

			<div style="margin-bottom: 20px; text-align: center">
				<span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</span> <input
					id="updateEmail" class="easyui-textbox"
					data-options="prompt:'请输入邮箱...'" style="width: 50%; height: 32px">
				<span></span>
			</div>

			<div style="margin-bottom: 20px; text-align: center">
				<span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span> <input
					id="updatePass" class="easyui-textbox"
					data-options="prompt:'请输入密码...'" style="width: 50%; height: 32px">
			</div>

			<div style="margin-bottom: 20px; text-align: center">
				<span>确认密码:</span> <input id="updateSubmitPass"
					class="easyui-textbox" data-options="prompt:'请确认密码...'"
					style="width: 50%; height: 32px"> <span></span>
			</div>

			<a href="javascript:void(0)" class="easyui-linkbutton"
				style="margin-left: 33.3%;" icon="icon-ok" id="loginbtn"
				onclick="doUpdate()">注册</a> <a href="#" class="easyui-linkbutton"
				style="margin-left: 15%;" icon="icon-cancel" id="loginbtn"
				onclick="closeAlertWin()">取消</a>
		</div>

		<div id="msgWin" title="公告添加" class="easyui-window"
			style="width: 480px; height: 300px;">
			<div
				style="margin-bottom: 20px; margin-top: 20px; text-align: center">
				<span>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题:</span> <input
					id="title" class="easyui-textbox" data-options="prompt:'请输入公告标题...'"
					style="width: 50%; height: 32px"> <span></span>
			</div>

			<div style="margin-bottom: 20px; text-align: center">
				<span>内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容:</span> <input
					id="newContext" class="easyui-textbox"
					data-options="multiline:true" style="width: 50%; height: 100px">
				<span></span>
			</div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				style="margin-left: 33.3%;" icon="icon-ok" id="loginbtn"
				onclick="doInsertInfor()">添加</a> <a href="#"
				class="easyui-linkbutton" style="margin-left: 15%;"
				icon="icon-cancel" id="loginbtn" onclick="closeMsgWin()">取消</a>
		</div>
</body>
<script>
	//添加公告
	function insertInfor(){
     	 $('#msgWin').window({
 			collapsible:false,//关闭折叠按钮
 			maximizable:false,//关闭最大化按钮
 			minimizable:false,//关闭最小化按钮
 			modal: true //true表示有遮盖层的效果，反之则没有
 		});
     	$('#msgWin').window('open');
     }
     
     function doInsertInfor(){
    	 var title = $("#title").val().trim();
    	 var newContext = $("#newContext").val().trim();
    	 $.ajax({
    		 type: 'POST',
				url:"<%=request.getContextPath()%>/main/insertMsg",
				data:{
					"title":title,
					"newContext":newContext
					},
				success:function(msg){
					if(msg=="success"){
						alert("添加成功")
						window.location.reload();
					}
					if(msg=="fail"){
						alert("添加失败")
					}
				}
    	 })
    	 
    	 
     }
     
     function closeMsgWin(){
    	 $('#msgWin').window('close');
     }
	//
	$(function() {     
		closeMsgWin();
		//加载日期
		closeAlertWin();
		//加载日期
		loadnews();
		loadExam();//加载用户一周内考试信息
		loadPreExam(); //加载一个月内的考试信息
		var username = "<%=session.getAttribute("username")%>";
		//加载数据
		$("#mytree").tree({
			url : "<%=request.getContextPath()%>/createPreTree.do",
			method : "get",
			//节点选中事件
			queryParams:{},
			onSelect : function(node) {
				console.log(node);
				if(node.text == "查看所有的考生") {
					//searchstu.do 
					addTab("查看所有的考生", "<%=request.getContextPath()%>/searchstu.do ")
				} else if(node.text == "用户管理") {
					addTab("用户管理", "<%=request.getContextPath()%>/usermanage.do ")
				}  else if(node.text == "分配权限") {
					addTab("分配权限", "<%=request.getContextPath()%>/distributeperm.do ")
				}  else if(node.text == "查询学生") {
					addTab("查询学生", "<%=request.getContextPath()%>/selectStudent.do ")
				}  else if(node.text == "考生管理") {
					addTab("考生管理", "<%=request.getContextPath()%>/search.do ")
				}  else if(node.text == "添加权限") {
					addTab("添加权限", "<%=request.getContextPath()%>/addone.do ")
				} else if(node.text=="试卷管理"){
					addTab("试卷管理", "<%=request.getContextPath()%>/paperPage.do ")
				}else if(node.text=="题库管理"){
					addTab("题库管理", "<%=request.getContextPath()%>/questionPage.do ")
				}else if(node.text=="考试管理"){
					addTab("考试管理", "<%=request.getContextPath()%>/exam.do ")
				}else if(node.text=="成绩管理"){
					addTab("成绩管理", "<%=request.getContextPath()%>/teacherScore.do ")
				}else if(node.text=="考试查询"){
					addTab("考试查询", "<%=request.getContextPath()%>/stuExam.do ")
				}else if(node.text=="试卷阅卷"){
					addTab("试卷阅卷", "<%=request.getContextPath()%>/readpaper.do ")
				}else if(node.text=="成绩查询"){
					addTab("成绩查询", "<%=request.getContextPath()%>/stuScore.do ")
				}else if(node.text=="添加公告"){
					insertInfor()
				}
			},
			onBeforeLoad:function(node,param){
	            param.username = "<%=session.getAttribute("username")%>";
	        }
		});
	})

	//动态添加tab选项卡
	function addTab(title, url) {
		//如果选项卡已经被打开，就选中它，否则，重新打开
		if ($('#contentInfo').tabs('exists', title)) {
			$('#contentInfo').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			$('#contentInfo').tabs('add', {
				title : title,//标题
				content : content,//拼接的html
				closable : true
			//是否有关闭按钮，true是有，fasle是没有
			});
		}
	}
	function loadExam(){
		var account = "<%=session.getAttribute("username")%>";
		$.ajax({
			url:"<%=request.getContextPath()%>/main/selectExam",
			data:{
					"account":account
					},
			success:function(msg){
				var html = "";
 				$("#recentExam").empty();
//  				html = '<div style="width: 180px; height: auto; background: #7190E0; padding: 5px;">'+
// 				   '<div class="easyui-panel" title="'+msg[0].examName+'" collapsible="true" style="width: 180px; height: auto; padding: 10px;">' +
// 				   '考试时间:'+formatDatebox(msg[0].examTime)+'<br /> 卷号:'+msg[0].paperName+'</div></div><br/>'
// 			    $("#recentExam").append(html);
				for(var i=0;i<msg.length;i++){
//					alert(msg[i].id+msg[i].examName+formatDatebox(msg[i].examTime)+msg[i].paperName);
					html = '<div style="width: 180px; height: auto; background:#C6E2FF ; padding: 5px;">'+
					   '<div class="easyui-panel" title="'+msg[i].examName+'" collapsible="true" style="width: 180px; height: auto; padding: 10px;">' +
					   '<span style="font-size:15px;font-weight:bold"><a href="javascript:void(0)" onclick="doTest(\''+msg[i].examName+'\',\''+formatDatebox(msg[i].examTime)+'\')">'+msg[i].examName+'</a></span><br />卷号:'+msg[i].paperName+'<br /> 考试时间:'+formatDatebox(msg[i].examTime)+'</div></div><br/>'
				$("#recentExam").append(html);

				}
  			}
		})
	}
	
	 function doTest(examName,examTime){
		$.ajax({
			url:"<%=request.getContextPath()%>/main/doTest",
			data:{
					"examName":examName,
					"examTime":examTime
					},
			success:function(msg){
				if(msg=="yes"){
					window.location.href = '<%=request.getContextPath()%>/startexam.do?papername='+examName+'';
				}
				if(msg=="no"){
					alert("考试时间未到");
				}
			}
		})
	} 

	
	
	
	function loadPreExam(){
		var account = "<%=session.getAttribute("username")%>";
		$.ajax({
			url:"<%=request.getContextPath()%>/main/selectPreExam",
			data:{
					"account2":account
					},
			success:function(msg){
				var html = "";
				$("#preExamInfor").empty();
				for(var i=0;i<msg.length;i++){
//					alert(msg[i].id+msg[i].examName+formatDatebox(msg[i].examTime)+msg[i].paperName+msg[i].status);
					html = '<div style="width: 100%; height: auto; background:#EEE5DE ; padding: 5px;">'+
					   '<div class="easyui-panel" title="'+msg[i].examName+'" collapsible="true" style="width: 100%; height: auto; padding: 10px;">' +
					   '<span style="font-size:15px;font-weight:bold">'+msg[i].examName+'</span><br />卷号:'+msg[i].paperName+'<br /> 考试状态:'+
					   status(msg[i].status)+'<br /> 考试时间:'+formatDatebox(msg[i].examTime)+'</div></div><br/>'
				    $("#preExamInfor").append(html);
				}
  			}
		})
	}
	
	function status(s){
		if(s==1)
			return "未缺席";
		else
			return "缺席"
	}

	//动态添加tab选项卡
	function addTab(title, url) {
		//如果选项卡已经被打开，就选中它，否则，重新打开
		if ($('#contentInfo').tabs('exists', title)) {
			$('#contentInfo').tabs('select', title);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'
					+ url + '" style="width:100%;height:100%;"></iframe>';
			$('#contentInfo').tabs('add', {
				title : title,//标题
				content : content,//拼接的html
				closable : true
			//是否有关闭按钮，true是有，fasle是没有
			});
		}
	}
	function loadnews() {
		//表格的配置信息
		$('#newstable').datagrid({
			title : '公告信息', //表格名称
			iconCls : 'icon-save', //图标
			height : 'auto', //表格高度，可指定高度，可自动
			border : true, //表格是否显示边框
			url : '<%=request.getContextPath()%>/main/getNews', //获取表格数据时请求的地址
			method : 'get', //表格数据获取方式,请求地址是上面定义的url
			fitColumns : true, //True 就会自动扩大或缩小列的尺寸以适应表格的宽度并且防止水平滚动。
			onBeforeSelect:function(){
		        return false;
		    }, //选中不打勾
			columns : [ [ {
				field : 'publish_time',
				//field : 'formatDatebox(publish_time)',
				title : '时间',
				width : 100,
				sortable : true, //排序字段
				hidden : false,
				formatter: formatDatebox
			}, {
				field : 'news_title',
				title : '标题',
				width : 100,
				hidden : false,
				formatter: formatOper
			}
			] ],
			pagination : true, //如果表格需要支持分页，必须设置该选项为true
			pageSize : 5, //表格中每页显示的行数
			pageList : [ 5, 10, 15 ],

			striped : true, //奇偶行是否使用不同的颜色
			remoteSort : false, //是否从服务器排序数
			sortName : 'publish_time', //按照ID列的值排序
			sortOrder : 'desc', //使用倒序排序 */
			idField : 'publish_time',
			loadMsg : '数据正在努力加载，请稍后...', //加载数据时显示提示信息
// 			frozenColumns : [ [ //固定在表格左侧的复选框
// 			{
// 				field : 'ck',
// 				checkbox : true
// 			}, ] ]

 		})
	}
	
	function formatOper(val,row,index){  
//		console.log(val+" "+row+" "+index);
		var news = row.news_content;
        return '<a href="javascript:void(0)" onclick="getContent(\''+news+'\')">'+val+'</a>';  
    } 
	
	function getContent(news){
		$('#content').html(news);
	}
	
	
	//日期格式化
	Date.prototype.format = function (format) {
	    var o = {
	        "M+": this.getMonth() + 1, // month
	        "d+": this.getDate(), // day
	        "h+": this.getHours(), // hour
	        "m+": this.getMinutes(), // minute
	        "s+": this.getSeconds(), // second
	        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
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
	
	
	function closeAlertWin(){
		$('#alertWin').window('close');
	}
	
	function doAlert(){
		$('#alertWin').window({
	 		collapsible:false,//关闭折叠按钮
	 		maximizable:false,//关闭最大化按钮
//	 		minimizable:false,//关闭最小化按钮
			modal: true //true表示有遮盖层的效果，反之则没有
		});
		$('#alertWin').window('open');
	}
	
	function doUpdate(){
		var username = "<%=session.getAttribute("username")%>";
		var cnUser = $("#updateCnUser").val().trim();
		var email = $("#updateEmail").val().trim();
		var updatePass = $("#updatePass").val().trim();
		if(checkUpdateInfo()){
			$.ajax({
        		type: 'POST',
 				url:"<%=request.getContextPath()%>/main/doUpdate",
 				data:{
 					"username":username,
 					"cnUser":cnUser,
 					"email":email,
 					"updatePass":updatePass
 					},
 				success:function(msg){
 					if(msg=="success"){
 						alert("修改成功!");
 						window.location.reload();     						
 					}
 					if(msg=="fail"){
 						alert("修改失败，请重新操作");
 					}
 					if(msg=="noOperate"){
 						alert("没有进行操作");
 					}
 				}
 			})
		}
	}
	
	function checkUpdateInfo(){
		var cnUser = $("#updateCnUser").val().trim();
		var email = $("#updateEmail").val().trim();
		var updatePass = $("#updatePass").val().trim();
		var updateSubmitPass = $("#updateSubmitPass").val().trim(); 
		if(email!=""){
			reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
     		if(!email.match(reg)){
     			alert("邮箱格式不正确!")
     			return false;
     		}
		}
		if(updatePass!=""||updatePass!=null){
			if(updatePass!=updateSubmitPass){
				alert("两次密码不匹配")
				return false;
			}
		}
		return true;
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