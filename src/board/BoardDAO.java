package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public BoardDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // DB오류
	}
	
	public int getNext() {
		String SQL = "SELECT boardID FROM BOARD ORDER BY boardID DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫 번째 게시물
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	public int write(String boardTitle, String boardAuthor, String boardContent) {
		String SQL = "INSERT INTO BOARD VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, boardAuthor);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	public ArrayList<Board> getList(int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE boardID < ? AND boardAvailable = 1 ORDER BY boardID DESC LIMIT 10";
		ArrayList<Board> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setBoardAuthor(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BOARD WHERE boardID < ? AND boardAvailable = 1";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Board getBoard(int boardID) {
		String SQL = "SELECT * FROM BOARD WHERE boardID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Board board = new Board();
				board.setBoardID(rs.getInt(1));
				board.setBoardTitle(rs.getString(2));
				board.setBoardAuthor(rs.getString(3));
				board.setBoardDate(rs.getString(4));
				board.setBoardContent(rs.getString(5));
				board.setBoardAvailable(rs.getInt(6));
				return board;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int edit(int boardID, String boardTitle, String boardContent) {
		String SQL = "UPDATE BOARD SET boardTitle = ?, boardContent = ? WHERE boardId = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, boardTitle);
			pstmt.setString(2, boardContent);
			pstmt.setInt(3, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
	
	public int delete(int boardID) {
		String SQL = "UPDATE BOARD SET boardAvailable = 0 WHERE BoardID = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, boardID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB오류
	}
}
