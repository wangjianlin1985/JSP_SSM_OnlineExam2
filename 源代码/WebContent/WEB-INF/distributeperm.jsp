<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="UTF-8">
		<title>树-组织架构</title>
		<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet">
		<link href="lib/css/icon.css" type="text/css" rel="stylesheet">
		<link href="css/index.css" type="text/css" rel="stylesheet">
		<script src="lib/js/jquery.min.js"></script>
		<script src="lib/js/jquery.easyui.min.js"></script>
		<script src="lib/js/easyui-lang-zh_CN.js"></script>
	</head>

	<body>

		角色名:<input type="text" id="role" /><br> 权限:
		<input type="text" id="power" onclick="showTree()"/><br>

		<div id="dd" title="权限树" class="easyui-window" closed="true"style="width:400px;height:200px;">
			<!--树形导航菜单开始-->
			<ul id="mytree" class="easyui-tree"></ul>
			<!--树形导航菜单结束-->
        <a href="#" class="easyui-linkbutton" icon="icon-ok" id="loginbtn" onclick="saveInfo()">确定</a>
		</div>
		<div id="mm">
			<a href="#" id="ss" class="easyui-linkbutton" icon="icon-ok" id="loginbtn" onclick="showInfo()">确定</a>
		</div>
		
	</body>
	<script>
		/**
		 * 权限对话框点击事件触发的方法，打开
		 */
		function showTree() {
			//打开对话框
			$('#dd').window('open')
		}
		//文档加载事件
		$(function() {
			//默认关闭对话框
			$('#dd').window('close')
			//加载树
			loadTree();

		})


		//被选中树形节点
		var arr = new Array();
		/**
		 * 加载树
		 */
		function loadTree() {
			$('#mytree').tree({
				url: 'power.do', //地址
				checkbox: true, //定义是否在每个节点前边显示 checkbox 。
				method: "get", //提交方式
				cascadeCheck:false,//定义是否级联检查。定义为false,不做级联
				//当节点前的复选框被选中
				onCheck: function(node, checked) {
					
					//如果节点被选中，就把节点值添加到数组中去
					if(checked) {
						arr.push(node.text);
					} else { //如果没被选中
						if(arr != null && arr.length > 0) {
							//判断该节点是否存在数组中，indexOf(str)返回str在数组中的下标
							if(arr.indexOf(node.text) > -1) {
								//删除数组元素,splice(a,b) a是要删除元素在数组中的索引位置,b代表要从该索引位置开始删除几条数据
								arr.splice(arr.indexOf(node.text), 1)
							}
						}
					}
			
				}

			});

		}
		
		//保存
		function saveInfo() {
			/**
			 * 遍历数组把选中节点赋值给权限文本框
			 */
			var selectValue = "";
			for(var i = 0; i < arr.length; i++) {
				selectValue += arr[i] + " ";
			}

			$("#power").val(selectValue);
			//关闭对话框
			$('#dd').window('close')
		}
		function showInfo(){
			$.ajax({
				url:"insert.do",				
				data:{"arr":arr,"name":$("#role").val()},
				success:function(data){
					if(data=="success"){
						alert("分配成功");
  					}else{
  						alert("分配失败");
  					}
				 }
			});

		}
	</script>
</html>