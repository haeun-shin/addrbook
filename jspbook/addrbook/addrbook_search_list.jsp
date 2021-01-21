<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="java.util.*, jspbook.addrbook.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 검색 리스트</title>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen" />
<script language=JavaScript>
	function check(ad_id) {
		pwd=prompt('수정/삭제 하려면 비밀번호를 넣으세요.');
		document.location.href="addrbook_control.jsp?action=edit&ad_id="+ad_id+"&upasswd="+pwd;
	}
</script>
<%-- 아이콘 --%>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" />
	<div class="wrap">
		<div class="main_text">
			<h2>주소록 || 검색</h2>
			<p>수정하려면 번호를 눌러주세요.</p>
		</div>

		<form>
			
			<table class="list_tb">
				<tr class="list_hd">
					<th class="list_num">번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>생일</th>
					<th>이메일</th>
					<th>회사</th>
					<th class="list_memo">메모</th>
				</tr>
				<%
					for(AddrBook ab : (ArrayList<AddrBook>)datas){	
				%>
				<tr>
					<td><a href="javascript:check(<%=ab.getAd_id()%>)"><%=ab.getAd_id() %></a></td>
					<td><%=ab.getAd_name() %></td>
					<td><%=ab.getAd_tel() %></td>
					<td><%=ab.getAd_birth() %></td>
					<td><%=ab.getAd_email() %></td>
					<td><%=ab.getAd_comdept() %></td>
					<td><%=ab.getAd_memo() %></td>
				</tr>
				<% 
					}
				%>
			</table>

			<p class="addr_insert">
				<i class="far fa-edit"></i>
				<a href="addrbook_form.jsp" >주소록 등록</a>
			</p>
			<p class="addr_insert">
				<i class="far fa-list-alt"></i>
			<a href=addrbook_control.jsp?action=list >주소록 목록으로</a>
			</p>
			<jsp:include page="addrbook_search_from.jsp"/>
		</form>
	</div>
</body>
</html>