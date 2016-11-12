<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8"></meta>
		<title>文件上传</title>
		<style type="text/css">
		*{
		margin:0;padding:0;
		}
		body{
		font-size:12px;
		color:#999;
		background-image:url("");
		}
		.box{
		 border:1px solid green;
		 width:400px;
		 height:200px;
		 margin:0 auto;
		}
		.box h1{
		font-size:30px;
		text-align:center;
		color:#000033;
		text-shadow:2px 5px 5px green;
		}
		</style>
		<script src="../js/jquery-1.8.2.min.js"></script>
		<script type="text/javascript">
			function selectFileOnclick(){
				$("#selectFile").click();
			}
			
			
		</script>
	</head>
	<body>
		<div class="box">
		<form action="../upload/uploadmedth.do" method="post" enctype="multipart/form-data" name="uploadName">
			<h1>多文件上传</h1>
			<input type="file" style="display:none;" name="multipartFile" id="selectFile" multiple="multiple"/>
			<input type="button" value="选择文件" onclick="selectFileOnclick();"/>
			<input type="submit" value="开始上传"/>
		</form>
		</div>
		<div>
			<c:forEach items="${strings }" var="str">
				<span>${str }</span>
			</c:forEach>
		</div>
	</body>
</html>