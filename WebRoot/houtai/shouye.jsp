<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>结果页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <link href="UI/themes/black/easyui.css" rel="stylesheet" />
    <link href="UI/themes/icon.css" rel="stylesheet" />
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="UI/jquery.easyui.min.js"></script>
    <script src="UI/locale/easyui-lang-zh_CN.js"></script>
    <link href="css/public.css" rel="stylesheet" />
  </head>
 
  <body class="easyui-layout">  
	  <jsp:include page="menu.jsp"></jsp:include> 
	  <jsp:include page="top.jsp"></jsp:include>
	  <div data-options="region:'center'" style="padding:5px;background:#eee;background-image: url(images/316729.jpg);width:100%;height: 100%; ">
	  	
	  </div>   
  </body>
</html>
