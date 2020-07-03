<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navber-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">JSP 게시판 만들기</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li><a href="board.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align:center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Name" name="userName" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="PW" name="userPW" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="PW for Check" name="userPW2" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Email" name="userEmail" maxlength="20">
					</div>
					<div class="form-group" style="text-align:center;">
						<div class-"btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	
</body>
</html>