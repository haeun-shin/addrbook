<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 에러</title>
<%-- 아이콘 --%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
</head>
<body>
<div align="center">
	<div class="fa_wrap">
		<i class="fas fa-exclamation"></i>
	</div>
	<h2 class="error">Server error</h2>
	<table cellpadding=5 class="error_text">
		<tr>
			<td>
				주소록 처리 중 에러가 발생했습니다.<br>
				관리자에게 문의해주세요.<br>
				빠른 시일 내 복구하겠습니다.
				<p>에러 내용 : <%= exception %></p>
			</td>
		</tr>
	</table>
</div>
</body>
</html>