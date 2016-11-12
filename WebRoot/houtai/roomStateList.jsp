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
    <style type="text/css">
    .roomState{
    height: 90px;
    width: 120px;
    margin-left:5px;
    margin-top:5px;
    float: left;
    color: black;
    }
    .roomStateHead{
    width: 100%;
    height: 70px;
    background:#9CF;
    }
    .spanShow{
    width:100%;
    float: left;
    margin-left:5px;
    margin-top:5px;
    }
    .menuSpan{
    position:relative;
    width: 30px;
    height: 17px;
    float: left;
    margin-top:25px;
    margin-left:5px;
    }
    .two{
     background: red;
    }
    /* .but{
    font-size: 16px;
	width: 70px;
	height: 22px;
	margin: 5%;
	border: 1px solid #AAD2FB;
    }
    .crdu{
    position:relative;
    width: 200px;
    height: 25px;
    float:right;
    margin-top:4px;
    margin-right: -100px;
    } */
    </style>
  </head>
 
  <body class="easyui-layout">  
	  <jsp:include page="menu.jsp"></jsp:include> 
	  <jsp:include page="top.jsp"></jsp:include>
	  <div data-options="region:'center'" style="padding:5px;background:#eee;width:100%;height: 100%; ">
	  	<div class="roomStateHead">
	  		<div><span style="color: black;">房间类型</span>&nbsp;
	  		<select id="cc" class="easyui-combobox" name="dept" style="width:100px;">   
			    <option value="">豪华间</option>
	  			<option>标准间</option>
	  			<option>单人间</option>
	  			<option>豪华双人间</option>
	  			<option>总统套房</option>  
			</select>  
			
	  		</div>
	  		<div style="width: 100%;"><span class="menuSpan">空闲</span><span class="menuSpan two" style="background: #3F0;"></span>
	  			  <span class="menuSpan">入住</span><span class="menuSpan two" style="background: #F9C;"></span>
	  			  <span class="menuSpan">维修</span><span class="menuSpan two" style="background: #666;"></span>
	  			  <span class="menuSpan">预定</span><span class="menuSpan two" style="background: #6CC;"></span>
	  		</div>
	  		<!-- <div class="crdu">
	  			<div><span><input type="button" class="but" value="添加"/></span></div>
	  		</div> -->
	  	</div>
	  	<c:forEach items="${roomInfoList }" var="roominfo">
	  		<div class="roomState" <c:if test="${roominfo.roomState == 0 }">style="background: #3F0;"</c:if>
	  							   <c:if test="${roominfo.roomState == 1 }">style="background: #6CC;"</c:if>
	  							   <c:if test="${roominfo.roomState == 2 }">style="background: #F9C;"</c:if>
	  							   <c:if test="${roominfo.roomState == 3 }">style="background: #666;"</c:if>>
	  			<span class="spanShow">${map.get(roominfo.roomId) }</span>
	  			<span class="spanShow">价格：${roominfo.price }</span>
	  			<span class="spanShow">编号：${roominfo.roomNum }</span>
	  		</div>
	  	</c:forEach>
	  </div>   
  </body>
</html>
