<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="UI/demo/demo.css" rel="stylesheet" />
<script src="js/jquery-1.8.2.min.js"></script>
<script src="UI/jquery.easyui.min.js"></script>
<script src="UI/locale/easyui-lang-zh_CN.js"></script>
<link href="css/public.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<style type="text/css">
.tableClass {
	height: 100%;
	width: 100%;
}

.context {
	position: relative;
	height: 30px;
	width: 100%;
	margin-left: 0px;
	font-size: 1em;
}

.trClass {
	font-size: 1.5em;
}

.addClass {
	width: 100%;
	height: 30px;
	float: left;
	margin-left: 20px;
}

.addMain {
	width: auto;
	height: auto;
}

.infoClass {
	float: left;
	margin-left: 60px;
	width: 250px;
	height: 50px;
}

.butt {
	margin-left: 120px;
}

.infoBut {
	font-size: 16px;
	width: 120px;
	height: 36px;
	margin: 5%;
	border: 1px solid #AAD2FB;
}

.sel {
	display: none;
}

.cloose {
	color: black;
	font-size: 12px;
	font-style: oblique;
	display: none;
}
.titleClass{
position: relative;
float: left;
height: auto;
width: 80px;
}
.two{
width: 300px;
}
</style>
</head>

<body class="easyui-layout">
	<jsp:include page="menu.jsp"></jsp:include>
	<jsp:include page="top.jsp"></jsp:include>
	<div data-options="region:'center'"
		style="padding: 5px; background: #eee; width: 100%; height: 100%;">
		<div class="tableClass">
			<div class="addClass">
				<div class="titleClass">
					<a class="cloose" id="all">全选</a>
					<span id="gang" style="color: black; display: none;">/</span>
					<a id="not" class="cloose">反选</a> 
				</div>
				<div class="titleClass two">
					<a id="btnAdd" onclick="showBg();" style="width: 78px;" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a> 
					<a id="btnAllDel" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">批量删除</a>
				</div>
				
			</div>
			<table class="context">
				<tr class="trClass">
					<td class="sel">选择</td>
					<td>图片展示</td>
					<td>房间类型编号</td>
					<td>房间类型名称</td>
					<td>房间价格</td>
					<td>数量</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${roomtypeList }" var="roomtype">
					<tr>
						<td class="sel"><input type="checkbox" name="selRoomtypeId"
							id="selRoomtypeId" value="${roomtype.roomTypeId }" /></td>
						<td><img src="${roomtype.roomTypeshow }"
							style="height: 38px; width: 38px;" /></td>
						<td>${roomtype.roomNum }</td>
						<td>${roomtype.roomTypeName }</td>
						<td>${roomtype.roomTypeMoney }</td>
						<td>${roomtype.roomTypeNum }</td>
						<td><a id="btn" href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-cut'">修改</a> <!-- <a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a> -->
							<a id="btn" href="#" class="easyui-linkbutton"
							data-options="iconCls:'icon-help'">详情</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- 弹框显示添加页面 -->
	<div id="fullbg"></div>
	<div id="dialog" style="height: 300px;">
		<p class="close">
			<a onclick="closeBg();">关闭</a>
		</p>
		<!-- <form action="" id="frm" name="frm" method="post"> -->
		<div class="addMain">
			<div class="infoClass">
				<label>房间类型编号</label>&nbsp;&nbsp;&nbsp;<input type="text"
					name="roomNum" id="roomNum" />
			</div>
			<div class="infoClass">
				<label>房间类型名称</label>&nbsp;&nbsp;&nbsp;<input type="text"
					name="roomTypeName" id="roomTypeName" />
			</div>
			<div class="infoClass">
				<label>房间类型价格</label>&nbsp;&nbsp;&nbsp;<input type="text"
					name="roomTypeMoney" id="roomTypeMoney"
					data-options="min:0,precision:2" />
			</div>
			<div class="infoClass">
				<label>房间类型数量</label>&nbsp;&nbsp;&nbsp;<input type="text"
					name="roomTypeNum" id="roomTypeNum"
					data-options="min:0,precision:0" />
			</div>
			<div class="infoClass butt">
				<input type="submit" class="infoBut" name="addBut" id="addBut" />
			</div>
		</div>
		<!-- </form> -->
	</div>
	<!-- 弹框显示添加页面  ---结束 -->

</body>
<script type="text/javascript">
	//页面加载时加载
	$(document).ready(function() {
		//页面加载时清空所有复选框
		$("input[name='selRoomtypeId']").attr("checked", false);

		//全选与反选的悬停移开事件
		$('#all').mouseover(function() {
			/* $('#all').attr("font-size","18px"); */
			$('#all').removeClass("font-size");
			$('#all').css("font-size", "18");
			$('#not').css("font-size", "12");
		});
		$('#all').mouseout(function(){
			$('#all').css("font-size", "12");
		});
		$('#not').mouseover(function() {
			/* $('#all').attr("font-size","18px"); */
			$('#not').removeClass("font-size");
			$('#not').css("font-size", "18");
			$('#all').css("font-size", "12");
		});
		$('#not').mouseout(function(){
			$('#not').css("font-size", "12");
		});

		//全选反选的单击事件
		$('#all').click(function() {
			$("input[name='selRoomtypeId']").attr("checked", true);
		});

		$("#not").click(function() {//反选   
			$('[name="selRoomtypeId"]:checkbox').each(function() {
				/* jquery写法
				$(this).attr("checked", !$(this).attr("checked")); */
				//直接使用js原生代码，简单实用
				this.checked = !this.checked;
			});
		});

	});

	//批量删除按钮事件
	$("#btnAllDel").click(function() {
		if ($(".sel").is(":hidden")) {
			$(".sel").show();
			$('#all').show();
			$('#not').show();
			$('#gang').show();
		} else {
			/* $("input[name='selRoomtypeId']").attr("checked",true); */
			//判断是否至少选中一项
			var checked_num = $("input[name='selRoomtypeId']:checked").length;
			if (checked_num == 0) {
				alert("至少选中一项");
				return;
			}
			//将所有选择的选项拼接成字符串
			var roomtypeIds = "";
			var check_obj = $("input[name='selRoomtypeId']");
			for (var i = 0; i < check_obj.length; i++) {
				if (check_obj.get(i).checked == true) {
					roomtypeIds += check_obj.get(i).value + ",";
				}
			}
			roomtypeIds = roomtypeIds.toString();
			//拼接完成
			if (roomtypeIds) {
				if (confirm("确定删除!")) {
					//删除
					delAll(roomtypeIds);
				}
			}

		}
	});

	//删除的方法
	function delAll(roomtypeids) {
		$.ajax({
			url : 'roomType/delRoomtype.do',
			type : 'POST',
			data : {
				roomtypeids : roomtypeids
			},
			dataType : 'text',
			success : function(data) {
				if (data == "true") {
					$.messager.alert('信息', '删除成功', 'info', function() {
						//删除选中的行---开始
						$('table input[type=checkbox]').each(function() {
							if ($(this).attr("checked")) {
								$(this).parent().parent().remove();
							}
						});
						//删除选中的行---结束
					});
				} else {
					$.messager.alert('信息', '删除失败');
					return;
				}
			},
			error : function() {
				alert("system error");
			}
		});
	}

	//单击显示添加页面方法
	$('#btnAdd').click(function() {
		if ($("#dialog").is(":hidden")) {
			$("#dialog").show(); //如果元素为隐藏,则将它显现
		}
	});

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
