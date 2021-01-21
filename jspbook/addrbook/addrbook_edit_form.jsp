<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.addrbook.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 : 수정화면</title>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />

<script language=JavaScript>
	function delcheck() {
		result = confirm("정말로 삭제하시겠습니까?");
		
		if(result) {
			document.form1.action.value="delete";
			document.form1.submit();
		} else {
			return;
		}
	}
</script>
<%-- 아이콘 --%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<jsp:useBean id="ab" scope="request" class="jspbook.addrbook.AddrBook" />
<body>
<div class="wrap">
	<div class="main_text">
		<h2>주소록 || 수정화면</h2>
		<p>수정 후 저장버튼을 눌러주세요.</p>
	</div>
	
	<form name=form1 method=post action=addrbook_control.jsp>
		<input type=hidden name="ad_id" value="<%=ab.getAd_id()%>" >
		<input type=hidden name="action" value="update">
		<table class="edit_tb">
			<tr>
				<th>이름</th>
				<td><input type="text" name="ad_name" value="<%=ab.getAd_name() %>"></td>
			</tr>
			<tr>
				<th>email</th>
				<td><input type="text" name="ad_email" value="<%=ab.getAd_email() %>"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="ad_tel" value="<%=ab.getAd_tel() %>"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td><input type="text" name="ad_birth" value="<%=ab.getAd_birth() %>"></td>
			</tr>
			<tr>
				<th>회사</th>
				<td><input type="text" name="ad_comdept" value="<%=ab.getAd_comdept() %>"></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><input type="text" name="ad_memo" value="<%=ab.getAd_memo() %>"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type=submit value="저장">
					<%-- <input type=reset value="취소"> --%>
					<input type="button" value="삭제" onClick="delcheck()">
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