package jspbook.addrbook;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AddrBean {
	Connection conn = null;
	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb?useUnicode=yes&characterEncoding=UTF-8";

	// DB 연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "jspbook", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if(pstmt != null)

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // end if(conn != null)
	}

	// 수정된 주소록 내용 갱신을 위한 메서드
	public boolean updateDB(AddrBook addrbook) {
		connect();

		String sql = "update addrbook set ab_name=?, ab_email=?, ab_birth=?, ab_tel=?, ab_comdept=?, ab_memo=? where ab_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrbook.getAd_name());
			pstmt.setString(2, addrbook.getAd_email());
			pstmt.setString(3, addrbook.getAd_birth());
			pstmt.setString(4, addrbook.getAd_tel());
			pstmt.setString(5, addrbook.getAd_comdept());
			pstmt.setString(6, addrbook.getAd_memo());
			pstmt.setInt(7, addrbook.getAd_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} // end try

		return true;
	}// end updateDB(AddrBook addrbook)

	// 특정 주소록 게시글 삭제 메서드
	public boolean deleteDB(int ab_id) {
		connect();

		String sql = "delete from addrbook where ab_id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ab_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} // end try

		return true;
	}// end deleteDB(int ab_id)

	// 신규 주소록 메시지 추가 메서드
	public boolean insertDB(AddrBook addrbook) {
		connect();
		// sql 문자열 ,gb_id는 자동 등록 되므로 입력하지 않는다.
		String sql = "insert into addrbook(ab_name, ab_email, ab_birth, ab_tel, ab_comdept, ab_memo)"
				+ "values(?,?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addrbook.getAd_name());
			pstmt.setString(2, addrbook.getAd_email());
			pstmt.setString(3, addrbook.getAd_birth());
			pstmt.setString(4, addrbook.getAd_tel());
			pstmt.setString(5, addrbook.getAd_comdept());
			pstmt.setString(6, addrbook.getAd_memo());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		} // end try

		return true;
	}// end insertDB(AddrBook addrbook)

	// 특정 주소록 게시글 가져오는 메서드
	public AddrBook getDB(int ab_id) {
		connect();

		String sql = "select * from addrbook where ab_id=?";
		AddrBook addrbook = new AddrBook();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ab_id);
			ResultSet rs = pstmt.executeQuery();

			// 데이터가 하나만 있으므로 rs.next()를 한 번만 실행한다.
			rs.next();
			addrbook.setAd_id(rs.getInt("ab_id"));
			addrbook.setAd_name(rs.getString("ab_name"));
			addrbook.setAd_email(rs.getString("ab_email"));
			addrbook.setAd_birth(rs.getString("ab_birth"));
			addrbook.setAd_tel(rs.getString("ab_tel"));
			addrbook.setAd_comdept(rs.getString("ab_comdept"));
			addrbook.setAd_memo(rs.getString("ab_memo"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		} // end try

		return addrbook;
	}// end getDB(int ab_id)

	
	
	// 전체 주소록 목록을 가져오는 메서드
	public ArrayList<AddrBook> getDBList() {
		connect();
		ArrayList<AddrBook> datas = new ArrayList<>();
		String sql = "select * from addrbook order by ab_id desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AddrBook addrbook = new AddrBook();
				addrbook.setAd_id(rs.getInt("ab_id"));
				addrbook.setAd_name(rs.getString("ab_name"));
				addrbook.setAd_email(rs.getString("ab_email"));
				addrbook.setAd_birth(rs.getString("ab_birth"));
				addrbook.setAd_tel(rs.getString("ab_tel"));
				addrbook.setAd_comdept(rs.getString("ab_comdept"));
				addrbook.setAd_memo(rs.getString("ab_memo"));
				datas.add(addrbook);
			} // end while(rs.next())
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		} // end try
		return datas;
	}// end getDBList()
	
	// 주소록 서칭
	public ArrayList<AddrBook> getSearchList(String sk, String sv) {
		connect();
		
		ArrayList<AddrBook> datas = new ArrayList<>();
		
		try {
			// 조건이 없을 때는 전체 출력 
			if(sk == null || sv.equals("")) {
				pstmt = conn.prepareStatement("select * from addrbook order by ab_id desc");
			} 

			
			// 값이 둘 다 있을 경우
			else if(sk != null & sv != null) {
				if(sk.equals("ad_id")) {
					pstmt = conn.prepareStatement("select * from addrbook where ab_id=?");
				} else if(sk.equals("ad_name")) {
					pstmt = conn.prepareStatement("select * from addrbook where ab_name=?");
				} else if(sk.equals("ad_tel")) {
					pstmt = conn.prepareStatement("select * from addrbook where ab_tel=?");
				} else if(sk.equals("ad_birth")) {
					pstmt = conn.prepareStatement("select * from addrbook where ab_birth=?");
				} else if(sk.equals("ad_comdept")) {
					pstmt = conn.prepareStatement("select * from addrbook where ab_comdept=?");
				}
				
				pstmt.setString(1, sv);
				
				
			} 
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				AddrBook addrbook = new AddrBook();

				addrbook.setAd_id(rs.getInt("ab_id"));
				addrbook.setAd_name(rs.getString("ab_name"));
				addrbook.setAd_email(rs.getString("ab_email"));
				addrbook.setAd_birth(rs.getString("ab_birth"));
				addrbook.setAd_tel(rs.getString("ab_tel"));
				addrbook.setAd_comdept(rs.getString("ab_comdept"));
				addrbook.setAd_memo(rs.getString("ab_memo"));
				datas.add(addrbook);
			} // end while(rs.next())
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		} // end try
		
		return datas;
	}// end getSearchList()
	

}