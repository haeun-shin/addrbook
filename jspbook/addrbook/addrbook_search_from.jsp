<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 검색 화면</title>
</head>
<body>

<div class="s_wrap">
	<form name=form1 method=post action=addrbook_control.jsp>
		<input type=hidden name="action" value="search" />
		<!-- 검색키 search key -->
		<select name ="sk"> 
			<option value="ad_id" selected>번호</option>
			<option value="ad_name">이름</option>
			<option value="ad_tel">전화번호</option>
			<option value="ad_birth">생일</option>
			<option value="ad_comdept">회사</option>
		</select>
		<!-- 검색값 search value -->
		<input type="text" name="sv">
		<input type="submit" value="검색">
	</form>
</div>

</body>
</html>