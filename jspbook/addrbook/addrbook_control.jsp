<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="jspbook.addrbook.*, java.util.*"  %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ad" class="jspbook.addrbook.AddrBean" /> 
<jsp:useBean id="addrbook" class="jspbook.addrbook.AddrBook" >
<jsp:setProperty name="addrbook" property="*" /> 
</jsp:useBean>
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우

	if(action.equals("list")) {
		// -- 등록했을대 흰 화면 뜨는 건 이 부분을 안 넣어서임.
		// -- DB에 있는 정보를 가져오는 부분		
		ArrayList<AddrBook> datas = ad.getDBList();
		request.setAttribute("datas", datas);
		// -- action이 list라면 list.jsp 로 가라.
		pageContext.forward("addrbook_list.jsp");
	}
	// 주소록 등록 요청인 경우
	else if(action.equals("insert")) {		
		if(ad.insertDB(addrbook)) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else 
			throw new Exception("DB 입력 오류");
		
	}
	// 주소록 수정 페이지 요청인 경우
	else if(action.equals("edit")) {
		AddrBook abook = ad.getDB(addrbook.getAd_id());
		if(!request.getParameter("upasswd").equals("1234")) {
		// if(!request.getParameter("upasswd") != "1234")  원래는 이거인데 String을 제대로 판단 못할 것 같아서 바꿈.
			out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
		} else {
			request.setAttribute("ab", abook);
			pageContext.forward("addrbook_edit_form.jsp");
		} 

	}
	// 주소록 수정 등록 요청인 경우
	else if(action.equals("update")) {
		if(ad.updateDB(addrbook)) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else {
			throw new Exception("DB 갱신 오류");
		}
	}
	// 주소록 삭제 요청인 경우
	else if(action.equals("delete")) {
		if(ad.deleteDB(addrbook.getAd_id())) {
			response.sendRedirect("addrbook_control.jsp?action=list");
		} else {
			throw new Exception("DB 삭제 오류");
		}
	}
	
	// 주소록 검색
	else if(action.equals("search")) {

		String sk = request.getParameter("sk");
		String sv = request.getParameter("sv");
		
		ArrayList<AddrBook> datas = ad.getSearchList(sk, sv);
		request.setAttribute("datas", datas);
		
		pageContext.forward("addrbook_search_list.jsp");
	}
	else {

	}
%>
