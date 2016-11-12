<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border="1px">
		<tr><td>公告名称</td><td>内容</td><td>创建时间</td><td>修改时间</td></tr>
		<c:forEach items="${bList}" var="board">
			<tr><td>${board.boardName }</td><td>${board.context }</td><td>${board.creteDate }</td><td>${board.updateDate }</td></tr>
		</c:forEach>
	</table>
</body>
</html>