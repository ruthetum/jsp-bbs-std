<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="userPW2"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userEmail"/>
<jsp:setProperty name="user" property="userGender"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	// 빈칸
	if (user.getUserID() == null ||
		user.getUserPW() == null ||
		user.getUserPW2() == null ||
		user.getUserEmail() == null ||
		user.getUserGender() == null ||
		user.getUserName() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('빈 칸이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else if (!user.getUserPW().equals(user.getUserPW2())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
	} else {
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('성공적으로 회원가입이 되었습니다.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
	}
	
%>
</body>
</html> 