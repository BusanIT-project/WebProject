package Movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Dao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static private Dao dao = new Dao();

	public Dao() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/movie?"; //DB��ġ
			String dbID = "root"; //mysql ����
			String dbPassword = "1234"; //mysql ��й�ȣ
			String driver = "org.gjt.mm.mysql.Driver"; //

			Class.forName(driver);
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	//싱글톤 객체 리턴
	public static Dao getInstance() {
		return dao;
	}


	//로그인
	public int login(String userID, String userPW) {

		StringBuffer sql = new StringBuffer();

		sql.append("SELECT userPW FROM user_inform ");
		sql.append(" where userID = ? ");


		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; //
				} else 
					return 0; //
			}

			return -1; //

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -2; //DB오류
	}


	//회원가입
	public int insertMember(UserDTO dto) {

		String sql = "INSERT INTO user_inform VALUES(?,?,?,?,?);";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserID());
			pstmt.setString(2, dto.getUserPW());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhoneNumber());
			return pstmt.executeUpdate();

		} catch(SQLException e) {
			e.printStackTrace();
		}

		return -1;
	}
	
	//아이디 중복 검사
	public ArrayList<String> idCheck() {
	      
	      String sql = "SELECT userID FROM user_inform;"; //유저 아이디 가져오는 쿼리
	      ArrayList<String> list = new ArrayList<>(); //아이디 담을 자료구조
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            list.add(rs.getString(1));
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return list;
	   }
	
}