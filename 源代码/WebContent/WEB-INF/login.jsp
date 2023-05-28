<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线考试系统-登录</title>
    <link href="<%=request.getContextPath() %>/log/css/login.css" rel="stylesheet" type="text/css" />
 	<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script> 
	
	<link href="<%=request.getContextPath() %>/lib/css/default/easyui.css" type="text/css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/lib/css/icon.css" type="text/css" rel="stylesheet">
		
	<script src="<%=request.getContextPath() %>/lib/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/lib/js/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath() %>/lib/js/easyui-lang-zh_CN.js"></script>
	
 </head>
 
 <body onkeydown="LoginByKey()">
 	<div class="second_body_opacity"></div>
     <div class="second_body">
        <form id="myForm">
            <div class="logo"></div>
            <div class="title-zh" style="left: 358px;">在线考试系统</div>
            <div class="title-en" style="left: 354px;">Online Examination System</div>
            <div class="message" data-bind="html:message"></div>
            <table border="0" style="width:300px;">
                <tr>
                    <td style="white-space:nowrap; padding-bottom: 5px;width:55px;">用户名：</td>
                    <td colspan="2"><input type="text" id="userName" class="login" data-bind="value:form.userCode" /></td>
                </tr>
                <tr>
                    <td class="lable" style="white-space:nowrap; letter-spacing: 0.5em; vertical-align: middle">密码：</td>
                    <td colspan="2"><input type="password" id="password" class="login" data-bind="value:form.password" /></td>
                </tr>
                 <tr>
                    <td style="white-space:nowrap; padding-bottom: 5px;width:55px;">验证码：</td>
                    <td colspan="1" style="width: 140px"><input type="text" id="loginCode" class="login" style="width: 50px;" />&nbsp;<img src="<%=request.getContextPath() %>/pictureCheckCode" id="CreateCheckCode" align="middle" style="margin-top:-15px;"></td>  
                    <td colspan="1"><a href="javascript:void(0)" onclick="changeCode()" style="text-decoration : none">看不清？换一个</a></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="1" ><input type="radio" name="role" value="student" checked="checked" style="margin-left: 0px;"/><span>学生登录</span></td>
                    <td colspan="1" ><input type="radio" name="role" value="teacher" /><span>教师登录</span></td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">
                        <input type="button" value="登录" class="login_btn" onclick="login()"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input id="registbtn" type="button" value="注册" class="login_btn" onclick="regist()"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td><a href="javascript:void(0)" onclick="changePassword()" >忘记密码？</a></td>
                </tr>
            </table>
        </form>
       </div>
       
       <div id="changeWin" title="重置密码" class="easyui-window"  style="width:440px;height:200px;padding-top: 20px;" align="center">
        	<table border="0" style="width:350px;" >
        		<tr>
                    <td style="white-space:nowrap; padding-bottom: 5px;width:55px;text-align:right;" >
                    	<span style="font-size:15px;font-weight: bold;font-family: 微软雅黑;" >账&nbsp;&nbsp;&nbsp;号：</span>
                    </td>
                    <td colspan="2">
                    	<input id="changeUser" class="easyui-textbox" data-options="prompt:'请输入用户名...'" style="width:90%;height:32px"/>
                    </td>
                </tr>
                <tr>
                    <td style="white-space:nowrap; padding-bottom: 5px;width:55px;text-align:right;" >
                    	<span style="font-size:15px;font-weight: bold;font-family: 微软雅黑;" >验证码：</span>
                    </td>
                    <td colspan="2">
                    	<input type="text" id="changeCode" class="login" style="width: 50px;margin: 10px 2px 3px 3px" />
                    	<img src="<%=request.getContextPath() %>/pictureCheckCode" id="CreateCheckCode2" align="middle" style="margin:-30px 10px 1px 4px;"> 
 						<a href="javascript:void(0)" onclick="changeCode2()" style="text-decoration : none;">看不清？换一个</a> 
                    </td>
                </tr>
 				<tr>
                    <td></td>
                    <td colspan="1" style="text-align: left;">
                    	<a href="javascript:void(0)"  class="easyui-linkbutton" style="margin-top: 10px;" icon="icon-ok" id="loginbtn" onclick="doChange()">确认</a>		
                    </td>
                    <td colspan="1" style="text-align: right: ;">
                    	<a href="#" class="easyui-linkbutton" style="margin-left: 15%;margin-top: 10px;"  icon="icon-cancel" id="loginbtn" onclick="closeChangeWin()">取消</a>
                    </td>
                </tr>
			</table>
		</div>
        
        <div id="registWin" title="注册" class="easyui-window"  style="width:480px;height:465px;">
			<div style="margin-bottom:20px; margin-top:20px; text-align: center" >
				<span>用&nbsp;&nbsp;户&nbsp;&nbsp;名:</span>
				<input id="user"  class="easyui-textbox" data-options="prompt:'请输入用户名...'" style="width:50%;height:32px">
				<span></span>
			</div>
			<div style="margin-bottom:20px; text-align: center" >
				<span>中&nbsp;&nbsp;文&nbsp;&nbsp;名:</span>
				<input id="cnUser" class="easyui-textbox" data-options="prompt:'请输入别名...'" style="width:50%;height:32px">
				<span></span>
			</div>
			<div style="margin-bottom:20px; text-align: center" >
				<span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</span>
				<input id="newEmail" class="easyui-textbox" data-options="prompt:'请输入邮箱...'" style="width:50%;height:32px">
				<span></span>
			</div>
			<div style="margin-bottom:20px; text-align: center" >
				<span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</span>
				<input id="pass" class="easyui-textbox" data-options="prompt:'请输入密码...'" style="width:50%;height:32px">
			</div>
			<div style="margin-bottom:20px; text-align: center" >
				<span>确认密码:</span>
				<input id="submitPass" class="easyui-textbox" data-options="prompt:'请确认密码...'" style="width:50%;height:32px">
				<span></span>
			</div>
			<div style="margin-bottom:20px; text-align: center" >
				<span>所在班级:</span>
				<input class="easyui-textbox" name="className" id="myClass" style="width:50%;height:32px">	
			</div>
			
			<div style="margin-bottom:20px; text-align: center" >
				<span>所在院系:</span>
				<input  class="easyui-textbox" name="className" id="myDepartment" style="width:50%;height:32px">	
			</div>

			
			<a href="javascript:void(0)"  class="easyui-linkbutton" style="margin-left: 33.3%;" icon="icon-ok" id="loginbtn" onclick="doregist()">注册</a>		
			<a href="#" class="easyui-linkbutton" style="margin-left: 15%;"  icon="icon-cancel" id="loginbtn" onclick="closeWin1()">取消</a>
		</div>
        
         <%@ include file="loadingDiv.jsp"%> 
   
        
     <script type="text/javascript">
	     $(function(){
				//默认打开页面，对话框是关闭的
				closeWin();
			})
			     
         function regist(){
        	 $('#myClass').combobox({
			 		url:'<%=request.getContextPath()%>/login/getInfor1',
					valueField:'id',
					textField:'text',
					onLoadSuccess: function () { //加载完成后,val[0]写死设置选中第一项
		                var val = $(this).combobox("getData");
		                for (var item in val[0]) {
		                    if (item == "id") {
		                        $(this).combobox("select", val[0][item]);
		                    }
		                }
					}
				});
      	  	 $('#myDepartment').combobox({
			 		url:'<%=request.getContextPath()%>/login/getInfor2',
					valueField:'id',
					textField:'text',
					onLoadSuccess: function () { //加载完成后,val[0]写死设置选中第一项
		                var val = $(this).combobox("getData");
		                for (var item in val[0]) {
		                    if (item == "id") {
		                        $(this).combobox("select", val[0][item]);
		                    }
		                }
		            }
				});
	    	 $('#registWin').window('open');
        }
	     
	     function closeWin(){
				$('#registWin').window('close');
				$('#changeWin').window('close');
		}
	     
		 function closeWin1(){
			$('#registWin').window('close');
			window.location.reload();
		 }
		 
     	 $('#registWin').window({
			collapsible:false,//关闭折叠按钮
			maximizable:false,//关闭最大化按钮
			minimizable:false,//关闭最小化按钮
			modal: true //true表示有遮盖层的效果，反之则没有
		});
     	   	 
     	function checkRegist(){
     		var username = $("#user").val().trim();
     		var cnUser = $("#cnUser").val().trim();
     		var newEmail = $("#newEmail").val().trim();
     		var password = $("#pass").val().trim();
     		var submitPass = $("#submitPass").val().trim();
     		var clazz = $("#myClass").val().trim();
     		var department = $("#myDepartment").val().trim();
     		if(username==""||username==null){
     			alert("用户名不能为空！")
     			return false;
     		}
     		var reg = /^[\u4e00-\u9fa5]+$/;
     		if(username.match(reg)){
     			alert("用户名不能含有中文字符");
     			return false;
     		}
     		if(username.length<6||username.length>15){
     			alert("密码应该大于6位，小于15位！")
     			return false;
     		}
     		if(cnUser==""||cnUser==null){
     			alert("中文名不能为空！")
     			return false;
     		}
     		if(newEmail==""||newEmail==null){
     			alert("邮箱不能为空！")
     			return false;
     		}
     		reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
     		if(!newEmail.match(reg)){
     			alert("邮箱格式不正确!")
     			return false;
     		}
     		if(password==""||password==null){
     			alert("密码不能为空！")
     			return false;
     		}
     		if(password!=submitPass){
     			alert("密码不匹配！")
     			return false;
     		}
     		if(clazz==""||clazz==null){
     			alert("班级不能为空！")
     			return false;
     		}
     		if(department==""||department==null){
     			alert("系不能为空！")
     			return false;
     		}
     		return true;
     	} 
     	 
     	function doregist(){
     		var username = $("#user").val().trim();
     		var cnUser = $("#cnUser").val().trim();
     		var email = $("#newEmail").val().trim();
     		var password = $("#pass").val().trim();
     		var submitPass = $("#submitPass").val().trim();
     		var clazz = $("#myClass").val().trim();
     		var department = $("#myDepartment").val().trim();
     		if(checkRegist()){
     			$.ajax({
            		type: 'POST',
     				url:"<%=request.getContextPath() %>/login/doregist",
     				data:{
     					"username":username,
     					"cnUser":cnUser,
     					"email":email,
     					"password":password,
     					"clazz":clazz,
     					"department":department
     					},
     				success:function(msg){
     					if(msg=="success"){
     						alert("恭喜您，注册成功!");
     						window.location.reload();     						
     					}
     					if(msg=="fail"){
     						alert("账号已被注册,请重新输入");
     					}
     					if(msg=="doAgin"){
     						alert("操作失败，请重新输入信息");
     					}
     				}
     			})
     		}
     	}
     
     	
     	//忘记密码
     	function changePassword(){
     		$('#changeWin').window('open');
     	}
     	
     	function closeChangeWin(){
			$('#changeWin').window('close');
			window.location.reload();
		 }
     	
     	function doChange(){
     		var changeUser = $("#changeUser").val().trim();
     		var changeCode = $("#changeCode").val().trim();
     		if(changeUser==null||changeUser==""){
     			alert("请输入账户");
     			return false;
     		}
     		if(changeCode==null||changeCode==""){
     			alert("请输入验证码")
     			return false;
     		}
     		$.ajax({
        		type: 'POST',
 				url:"<%=request.getContextPath()%>/login/doChange",
 				data:{
 					"changeUser":changeUser,
 					"changeCode":changeCode,
 					},
 				success:function(msg){
 					if(msg=="wrongCode"){
 						alert("验证码错误");
 					}
 					if(msg=="noUser"){
 						alert("无此用户");
 					}
 					if(msg=="success"){
 						$("#changeWin").empty();
 						html = '<span style="font-size:15px;font-weight: bold;">'+
 						'点此发送邮件</span>:<input id="sendbtn" type="button" value="发送邮件" class="login_btn" onclick="sendEmail()"/>'+
 						'<input id="getUserInfor" type="hidden" value="'+changeUser+'" />';
 						$("#changeWin").append(html);
 					}
 				}
 			})
     	}
     	
     	function sendEmail(){
     		var username = $('#getUserInfor').val();
     		$.ajax({
				url:"<%=request.getContextPath()%>/login/sendMessage",
				data:{
					"username":username,
				},
				success:function(msg){
					if(msg[0]=="success"){
						//下一步操作；
						$("#changeWin").empty();
 						html = '<span style="font-size:15px;font-weight: bold;">'+
 						'修改后的密码</span>:<input id="newPass" class="easyui-textbox" data-options="prompt:\'输入新密码...\'" style="width:50%;height:32px"/>'+
 						'&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" icon="icon-ok" id="loginbtn" onclick="getChange()">确认</a>'+
 						'<input id="getUserInfor2" type="hidden" value="'+msg[1]+'" />';
 						$("#changeWin").append(html);
					}
					if(msg[0]=="errorCode"){
						alert("错误验证码")					
				    }
					if(msg[0]=="errorUser"){
						alert("错误用户")
					}
					if(msg[0]=="nullInfor"){
						alert("操作过时")
					}
				}
			})
     	}
     	
     	function getChange(){
     		var newPass=$("#newPass").val().trim();
     		var getUserInfor2 = $("#getUserInfor2").val().trim();
     		$.ajax({
     			url:"<%=request.getContextPath()%>/login/updatePass",
     			data:{
     				"newPass":newPass,
     				"getUserInfor2":getUserInfor2
     			},
     			success:function(msg){
     				if(msg=="yes"){
     					alert("修改成功！");
     					window.location.reload();
     				}else{
     					alert("失败");
     				}
     			}
     		})
     		
     	}
     	
     	
     	 function check(){
     		var username = $("#userName").val().trim();
     		var password = $("#password").val().trim();
     		if(username==null||username==""){
     			alert("请填写用户名!");
     			return false;
     		}
     		if(username.length<6||username.length>15){
     			alert("用户名大于6位或小于15位");
     			return false
     		}
     		if(password==null||password==""){
     			alert("请填写密码!");
     			return false;
     		}
     		return true;
     	 }
     	 	 	 
     	 
         function login(){
        	 if(check()){
        		 var username = $("#userName").val().trim();
            	 var password = $("#password").val().trim();
            	 var code = $("#loginCode").val().trim();
            	 var role = $("input[name='role']:checked").val().trim();
            	 $.ajax({
            		type: 'POST',
     				url:"<%=request.getContextPath() %>/login/doLogin",
     				data:{
     					"username":username,
     					"password":password,
     					"code":code,
     					"role":role
     					},
     				success:function(msg){
     					if(msg=="wrongCode"){
     						alert("验证码错误！");
     						changeCode();
     					}
     					if(msg=="wrong"){
     						alert("用户名或其他错误！")
     						changeCode();
     					}
     					if(msg=="student"){
     						window.location.href="<%=request.getContextPath()%>/main/studentPage";
     					}
     					if(msg=="teacher"){
     						window.location.href="<%=request.getContextPath()%>/main/teacherPage";
     					}
     					if(msg=="admin"){
     						window.location.href="<%=request.getContextPath()%>/main/adminPage";
     					}
     				}
     			})
        	 }
         }
         
         function changeCode(){	 
        	 document.getElementById("CreateCheckCode").src = 
        	 document.getElementById("CreateCheckCode").src+ "?nocache=" + new Date().getTime();

         }
         function changeCode2(){	 
        	 document.getElementById("CreateCheckCode2").src = 
        	 document.getElementById("CreateCheckCode2").src+ "?nocache=" + new Date().getTime();

         }
         
     	function LoginByKey(){
    		if(event.keyCode == 13){
    			login();
    		}
    	}
     </script>
 </body>
</html> 