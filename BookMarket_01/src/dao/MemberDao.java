package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.Member;

public class MemberDao implements IMemberDao {
	private Connection conn;

	private static MemberDao instance;

	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	private MemberDao() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmarket_db", "root", "mysql");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int memberCheck(String email, String pwd) {
		// TODO Auto-generated method stub
		int result = 0;
		String sql = "SELECT * FROM member WHERE email=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString("pwd") != null && rs.getString("pwd").equals(pwd)) {
					result = rs.getInt("mem_id"); // 회원정보도 존재하고 패스워드도 일치함. 성공값
				} else if (rs.getString("pwd") != null) {
					result = -1; // 패스워드 불일치
				} else {
					result = 0; // 회원이 존재하지 않음
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public Member getMember(int mem_id) {
		// TODO Auto-generated method stub
		Member mb = null;
		String sql = "SELECT * FROM member WHERE mem_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mb = new Member();
				mb.setEmail(rs.getString("email"));
				mb.setMem_id(rs.getInt("mem_id"));
				mb.setPwd(rs.getString("pwd"));
				mb.setName(rs.getString("name"));
				mb.setMoney(rs.getInt("money"));
				mb.setJoin_date(rs.getDate("join_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mb;
	}

	
	
	@Override
	public int insertMember(Member member) {
		String sql = "INSERT INTO member VALUES(0,?,?,?,?,sysdate())";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getMoney());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}


	@Override
	public int updateMember(Member member) {
		String sql = "UPDATE member SET email=?, pwd=?, name=?, money=? WHERE mem_id=?";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getMoney());
			pstmt.setInt(5, member.getMem_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) { 
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int deleteMember(int mem_id) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM member WHERE mem_id = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}

	@Override
	public int getMoney(int mem_id) {
		// TODO Auto-generated method stub
		String sql = "SELECT money FROM member WHERE mem_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int money = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				money = rs.getInt("Money");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return money;
	}

	@Override
	public boolean confirmEmail(String email) {
		String sql = "SELECT COUNT(*) as result"
				+ " FROM member WHERE email = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			rs.next();
			int result = rs.getInt("result");
			if( result > 0 )
				return true;
			else
				 return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return false;
	}
	
	@Override
	public int updateMoney(int mem_id, int money) {
		String sql = "UPDATE member SET money = ? where mem_id = ? ";
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, money);
			pstmt.setInt(2, mem_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) { 
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}



	

}