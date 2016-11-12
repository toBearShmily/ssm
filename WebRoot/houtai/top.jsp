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
  	<style type="text/css">
  	.textHead{
  	margin-left: 30px;
  	margin-top: 10px;
  	}
  	.main{
  	float: left;
  	height: 30px;
  	width: 300px;
  	}
  	.extLogin{
  	float: right;
  	height: 30px;
  	width: 100px;
  	}
  	.extBut{
  	margin-top: 22px;
  	margin-left: 3px;
  	border:none;
  	background-color:rgb(204, 236, 242);
  	}
  	#showUserName{
  	font-size: 14;
  	}
	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.extBut').click(function() {
				var myId = $('#myId').val();
				location.href="userInfo/loginOut.do?&userMyId="+myId;
			});
			show();
		});
		
		//加载用户名称
		function show(){
			var myId = $('#myId').val();
			if(myId != null){
				 $.ajax({
						url : 'userInfo/show.do',
						type : 'POST',
						data : {
							myId : myId,
						},
						dataType : 'text',
						success : function(data) {
							if(data != null){
								if(data == "userIsNull")
									location.href="userInfo/toLogin.do";
								else
									$('#showUserName').html(data+"欢迎您");
							}else{
								location.href="userInfo/toLogin.do";
							}
						},
						error : function() {
							alert("system error");
							location.href="userInfo/toLogin.do";
						}
					}); 
			}else
				alert("null");
			
		}
	</script>
  </head>
  <input type="hidden" value="<%=request.getSession().getAttribute("userMyId") %>" id="myId"/>
  <div data-options="region:'north',title:'!!!!',split:true" style="height:100px;">
  	<div class="main"><h2 class="textHead">个人笔记整理中心</h2></div>
  	<div class="extLogin"><span id="showUserName"></span><input type="button" value="退出登录" class="extBut"/></div>
  </div>
</html>
