<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	 <link href="../UI/themes/black/easyui.css" rel="stylesheet" />
    <link href="../UI/themes/icon.css" rel="stylesheet" />
    <script src="../js/jquery-1.8.2.min.js"></script>
    <script src="../UI/jquery.easyui.min.js"></script>
    <script src="../UI/locale/easyui-lang-zh_CN.js"></script>
    <link href="../css/public.css" rel="stylesheet" />
  </head>
  
  <body class="easyui-layout">
    <!--底部开始  -->
    <div data-options="region:'south'" style="height: 60px;">
        <p>你是傻逼你是傻逼你是傻逼你是傻逼</p>
    </div>
    <!--底部结束  -->
  </body>
</html>
