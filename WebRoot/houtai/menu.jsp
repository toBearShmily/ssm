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
  </head>
  
  <div data-options="region:'west',title:'功能菜单',split:true" style="width:260px;">
    	<!--左侧导航栏开始  -->
        <ul id="tt" class="easyui-tree">
            <li><span>第一站</span>
                <ul>
                	<li><span><a href="roomInfo/roomInfoShow.do">实时房态</a></span></li>
                    <li><span>预定登记</span></li>
		            <li><span>入住登记</span></li>
		            <li><span>预定管理</span></li>
		            <li><span>在住管理</span></li>
		            <li><span><a href="roomType/roomTypeList.do">类型管理</a></span></li>
		            <li><span>结账记录</span></li>
		            <li><span>客房报表</span></li>
		            <li><span>帐号管理</span></li>
                </ul>
            </li>
            <li>第二站</li>
            <li>第三站</li>
            <li>第四站</li>
            <li>第五站</li>
            <li>第六站</li>
            <li>第七站</li>
            <li>第八站</li>
            <li>第九站</li>
            <li>第十站</li>
        </ul>
    <!--左侧导航栏结束  -->
    </div>   
</html>
