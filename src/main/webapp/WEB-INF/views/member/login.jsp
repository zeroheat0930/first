<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/board" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<bd:navbar></bd:navbar>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6 col-12">
			<h1>로그인</h1>
			<form action="${appRoot }/login" method="post">
				<div class="form-group">
					<label for="input1">이름</label>				
					<input id="input1" class="form-control" name="username" />
				</div>
				<div class="form-group">
					<label for="input2">패스워드</label>
					<input id="input2" type="password" 
					class="form-control" name="password" />
				</div>
				
				<div class="form-group form-check">
					<input name="remember-me" type="checkbox" class="form-check-input" id="checkbox1">
					<label class="form-check-label" for="checkbox1">remember me</label>
				</div>
				
				<input class="btn btn-primary" type="submit" value="로그인">
			</form>
		</div>
	</div>	
</div>
</body>
</html>










