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
					return 1; //�α��� ����
				} else 
					return 0; // id,��� ����ġ
			}

			return -1; // �������� �ʴ� ���̵�

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
}