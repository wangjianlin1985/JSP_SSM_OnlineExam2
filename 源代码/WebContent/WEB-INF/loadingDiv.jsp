<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<div id='loadingDiv' style="position: absolute; z-index: 1000; top: 0px; left: 0px;
		width: 100%; height: 100%; background: white; text-align: center;">
	    <h1 style="top: 48%; position: relative;">
	        <font color="#15428B">加载中···</font>
	    </h1>
</div>
 
<script type="text/JavaScript">
    function closeLoading() {
        $("#loadingDiv").fadeOut("normal", function () {
            $(this).remove();
        });
    }
    var no;
    $.parser.onComplete = function () {
        if (no) clearTimeout(no);
        no = setTimeout(closeLoading, 50);
    }
</script>
</body>
</html>