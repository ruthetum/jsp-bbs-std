<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 만들기</title>
<link rel="stylesheet" href="../css/style.css">
<script>
	function modalLogin() {
		
	};
</script>
</head>
<body>
<div id="contents">
	<div style="float:right">
		<%-- 세션 X --%>
		<span><button type="button" onclick="modalLogin">로그인</button></span>
		<span><a href='write.jsp'><input type="button" value="회원가입"></a></span>
		<%-- 세션 O --%>
		<span><a href='write.jsp'><input type="button" value="글쓰기"></a></span>
		<span><a href='write.jsp'><input type="button" value="회원 정보 수정"></a></span>
		<span><a href='write.jsp'><input type="button" value="로그아웃"></a></span>
	</div>
	<p>
	</p>
	<table id='notice_list'>
	<colgroup>
		<col width="80" />
			<col width="410" />
			<col width="130" />
			<col width="190" />
		</colgroup>
		<tr bgcolor='#F2F3F4'>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일자</td>
		</tr>
	</table>
              
	<!-- 페이징 -->
	<p>
</div>

<!-- modal -->
<div id="modalLogin">
	<div class="page-header">
		<h1>로그인</h1>
	</div>
	<div>
		<form>
			<input type="text" placeholeder="아이디"/>
			<br>
			<input type="password" placeholeder="비밀번호"/>
			<br>
			<button type="button">로그인</button>
		</form>
	</div>
</div>

</body>
</html>