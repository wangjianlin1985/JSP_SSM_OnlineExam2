<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表格-工具栏</title>
		<link href="lib/css/default/easyui.css" type="text/css" rel="stylesheet">
		<link href="lib/css/icon.css" type="text/css" rel="stylesheet">
		
		<script src="lib/js/jquery.min.js"></script>
		<script src="lib/js/jquery.easyui.min.js"></script>
		<script src="lib/js/easyui-lang-zh_CN.js"></script>
</head>
<body>
	<ul id="myTree"></ul>
</body>
<script type="text/javascript">
	$(function(){
// 		$("#myTree").tree({
// 			url:"tree.do",
// 			method:"get",
// 			onSelect:function(node){
				
// 			}
// 		})
		$("#myTree").tree({
				url:"createPreTree.do",
				method:"get",
				//节点选中事件
				onSelect:function(node){
					console.log(node)
				}
					
			})
	})
</script>
</html>