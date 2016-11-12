<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- <link rel="stylesheet" type="text/css" href="css/styles.css"> -->
<link href="css/style.css" rel="stylesheet" />

<style type="text/css">
* {
	margin: 0 auto;
}

html {
	height: 100%;
}

body {
	height: 100%;
	background: url("images/bg.jpg") no-repeat;
}

.popupwindow {
	background-color: #F9F9F9;
}

.popupHead {
	background-color: #fff;
	height: 36px;
	width: 400px;
}

.forgetpwd {
	width: 130px;
	height: 20px;
	font-size: 18px;
	margin-right: 2px;
	margin-top: 15px;
	border: 1px;
}

.popupContentMain {
	width: 400px;
	height: 115px;
}

.item {
	margin: 5px 0 10px 0;
	position: relative;
}

.point {
	color: #727272;
	font-size: 16px;
	font-weight: normal;
	margin-right: 15px;
	text-align: right;
}

.valid {
	width: 222px;
	height: 30px;
	border: 1px solid #D4DBED;
	background-color: #FAFFBD;
}

.buttonDIV {
	height: 75px; 
	padding: 5px;
	background-color: #DFDFDF;
	
}
.butReg{
margin-top: 55px;
}

.loginbtn {
	font-size: 16px;
	width: 120px;
	height: 36px;
	margin: 5%;
	border: 1px solid #AAD2FB;
}
img#imageVer {
position: relative;
top: -4px;
}
a#otherImage {
position: relative;
top: 9px;
}
label.point.var {
position: relative;
top: 9px;
}
.item.reg {
margin-left: 36px;
}
input#userNameReg {
margin-left: -8px;
}
input.login {
margin-left: 24px;
}
.textReg {
background-color: rgb(249, 249, 249);
}
</style>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript">
	var t=10;//设定跳转的时间 
	//登录
	$(document).ready(function() {

		$('#loginbtn').click(function() {
			var name = $('#userName').val();
			var pass = $('#pass').val();
			var writeVer = $('#writeVer').val();
			$.ajax({
				url : 'userInfo/login.do?type=void',
				type : 'POST',
				data : {
					userName : name,
					pass : pass,
					writeVer : writeVer
				},
				dataType : 'text',
				success : function(data) {
					if(data == "oldLogin"){
						if (confirm("该用户已经登录了!")) {
							location.href="userInfo/toIndex2.do";
						}else{
							location.href="userInfo/toLogin.do";
						}
						return;
					}else if (data == "true") {
						location.href = "userInfo/toIndex2.do";
					} else if (data == "false") {
						if (confirm("验证码错误了！")) {
							location.href = "userInfo/toLogin.do";
						}
					} else if (data == "error") {
						if (confirm("用户名或密码错误!")) {
							location.href = "userInfo/toLogin.do";
						}
					}
				},
				error : function() {
					alert("system error");
				}
			});
		});

		/* 单击显示注册页面 */
		$('#reg').click(function() {
			if ($("#reg").is(":hidden")) {
				$("#reg").show(); //如果元素为隐藏,则将它显现
			}
		});
		
		/* 注册   */
		$('#Regbtn').click(function(){
			var name = $('#userNameReg').val();
			var pass = $('#passReg').val();
			var emil = $('#emil').val();
			$.ajax({
				url : 'userInfo/saveUser.do',
				type : 'POST',
				data : {
					userName : name,
					pass : pass,
					email : emil
				},
				dataType : 'text',
				success : function(data){
					if(data == "true"){
						$('#showInfoMessage').show();
						$('.popupContentMain').hide();
						$('#showInfo').html("注册成功");
						$('#toLog').hide();
						setInterval("refer()",1000); //启动1秒定时
					}else if(data == "false"){
						alert("false");
						$('#showInfoMessage').show();
						$('.popupContentMain').hide();
						$('#showInfo').html("注册失败");
						$('#show').hide();
					}
				},
				error : function() {
					alert("system error");
				}
			});
		});
		
		//单击返回
		$('#toLog').click(function(){
			location.href = "userInfo/toLogin.do";
		});

	});
	
	
	
	function refer(){  
	    if(t==0){ 
	    	location.href = "userInfo/toLogin.do"; //#设定跳转的链接地址 
	    } 
	    document.getElementById('show').innerHTML=""+t+"秒后跳转到登录界面"; // 显示倒计时 
	    t--; // 计数器递减 
	    //本文转自： 
	} 
</script>
</head>

<body>
	<div class="popupwindow" id="popup_login"
		style="position: absolute; width: 400px; height: 266px; border: 1px solid #FFFFFF; top: 50%; left: 50%; margin-left: -200px; margin-top: -133px;">
		<div class="popupHead" style="cursor: default;">
			<div class="forgetpwd">
				<p style="text-decoration: none" id="reg" onclick="showBg();">注册</p> <a href=""
					style="text-decoration: none">忘记密码</a>
			</div>
		</div>
		<div class="popupContentMain" align="center">
			<div class="item">
				<label class="point">用 户  名</label> <span><input type="text"
					name="userName" id="userName" class="valid"></span>
			</div>
			<div class="item">
				<label class="point">密 码</label> <span><input type="password"
					name="pass" id="pass" class="valid login"></span>
			</div>
			<div class="item">
				<label class="point var">验证码</label> <span><a id="otherImage" href="#"
					onclick="document.getElementById('imageVer').src='myVerifyCode/verifyCode.do?'+new Date()">换一张</a>&nbsp<img
					alt="" src="myVerifyCode/verifyCode.do" align="middle"
					id="imageVer" />&nbsp;<input type="text" id="writeVer"
					name="writeVer" placeholder="请输入验证码" class="valid"
					style="width: 111px; border: 1px solid #D4DBED;"></span>
			</div>
			<div class="buttonDIV" align="center">
				<input type="button" value="登   入" class="loginbtn" id="loginbtn">
			</div>
		</div>

	</div>

	<!-- 注册页面 -->
	<div id="fullbg"></div>
	<div id="dialog">
		<p class="close">
			<a href="#" onclick="closeBg();">关闭</a>
		</p>
		<!-- <form action="userInfo/saveUser.do" id="frm" name="frm" method="post"> -->
			<div id="showInfoMessage" style="display: none;"><span id="showInfo" style="color: red;"></span>&nbsp;<span id="show"></span>&nbsp;<a id="toLog">返回</a></div>
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
		<!-- </form> -->
	</div>
</body>
<script type="text/javascript">
	//显示灰色 jQuery 遮罩层 
	function showBg() {
		var bh = $("body").height();
		var bw = $("body").width();
		$("#fullbg").css({
			height : bh,
			width : bw,
			display : "block"
		});
		$("#dialog").show();
	}
	//关闭灰色 jQuery 遮罩 
	function closeBg() {
		$("#fullbg,#dialog").hide();
	}
</script>
</html>
