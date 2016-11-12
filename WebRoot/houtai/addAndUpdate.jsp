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
	  <div data-options="region:'center'" style="padding:5px;background:#eee;width:100%;height: 100%; ">
	  	<div class="popupContentMain">
				<div class="item reg">
					<label class="point">用&nbsp;户&nbsp;名</label> <span><input
						type="text" name="userName" id="userNameReg"
						class="valid textReg"></span>
				</div>
				<div class="item reg">
					<label class="point">密&nbsp;&nbsp; 码</label> <span><input
						type="password" name="password" id="passReg" class="valid textReg"></span>
				</div>
				<div class="item reg">
					<label class="point">昵&nbsp;&nbsp; 称</label> <span><input
						type="text" name="cName" id="cName" class="valid textReg"></span>
				</div>
				<div class="item reg">
					<label class="point">性&nbsp;&nbsp; 别</label> <span> <input
						type="radio" name="sex" id="sex">男 <input type="radio"
						name="sex" id="sex">女
					</span>
				</div>
				<div class="item reg">
					<label class="point">邮&nbsp;&nbsp; 箱</label> <span><input
						type="text" name="email" id="emil" class="valid textReg"></span>
				</div>
				<div class="item reg">
					<label class="point">地&nbsp;&nbsp; 址</label> <span> <textarea
							rows="2" cols="10"></textarea></span>
				</div>
				<div class="buttonDIV butReg" align="center">
					<input type="button" value="注册" class="loginbtn" id="Regbtn">
				</div>
			</div>
	  </div>   
  </body>
</html>
