package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/JspDB";
			String dbID = "root";
			String dbPW = "dong0117";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPW)) {
					return 1;
				} else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 계정 X
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // DB 오류
	}
	
	public int join(User user) {
		String SQL="INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(3, user.getUserName());
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(5, user.getUserEmail());
			pstmt.setString(4, user.getUserGender());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}

}
