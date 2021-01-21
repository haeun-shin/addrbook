<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 : 작성화면</title>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
<%-- 아이콘 --%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
<div class="wrap">
	<div class="main_text">
		<h2>주소록 || 작성화면</h2>
		<p>작성 후 저장버튼을 눌러주세요.</p>
	</div>
	
	<form name=form1 method=post action=addrbook_control.jsp>
	<input type=hidden name="action" value="insert">
		<table class="edit_tb">
			<tr>
				<th>이름</th>
				<td><input type="text" name="ad_name" maxlength="15"></td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="text" name="ad_email" maxlength="50"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="ad_tel" maxlength="20"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="date" name="ad_birth"></td>
			</tr>
			<tr>
				<th>회사</th>
				<td><input type="text" name="ad_comdept" maxlength="20"></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><input type="text" name="ad_memo"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type=submit value="저장">
					<input type=reset value="초기화">
				</td>
			</tr>
		</table>
	</form>
	<p class="addr_insert">
		<i class="far fa-list-alt"></i>
		<a href=addrbook_control.jsp?action=list >주소록 목록으로</a>
	</p>
</div>

</body>
</html>