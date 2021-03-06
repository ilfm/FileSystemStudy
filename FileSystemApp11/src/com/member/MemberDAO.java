/*========================
 * 	MemberDTO.java
 * ======================= 
 */
package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBCPConn;

public class MemberDAO
{
	private Connection conn = DBCPConn.getConnection();
	
	public int insertData(MemberDTO dto) 
	{
		int result=0;
		
		PreparedStatement pstmt =null;
		String fileds = "USERID , USERPWD , USERNAME, TEL, EMAIL";
		String sql ="INSERT INTO MEMBER("+ fileds +")"
				+ " VALUES(?,?,?,?,?)";
		
		try
		{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			
			result = pstmt.executeUpdate();
			pstmt.close();			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
				
		return result;
		
	}
	
	public MemberDTO getReadData(String userId)
	{
		MemberDTO dto = new MemberDTO();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try
		{
			String sql ="SELECT USERID, USERNAME, USERPWD, TEL, EMAIL"
					+ " ,TO_CHAR(CREATED ,'YYYY-MM-DD') AS CREATED"
					+ " FROM MEMBER"
					+ " WHERE USERID =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) 
			{
				dto.setUserId(rs.getString("USERID"));
				dto.setUserName(rs.getString("USERNAME"));
				dto.setUserPwd(rs.getString("USERPWD"));
				dto.setTel(rs.getString("TEL"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setCreated(rs.getString("CREATED"));
								
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
		return dto;
	}
	
	public int updateData(MemberDTO dto) 
	{
		int result =0;
		PreparedStatement pstmt = null;
		
		
		try
		{
			String sql = "UPDATE MEMBER "
					+ "SET USERPWD=?, TEL=?, EMAIL=? "
					+ "WHERE USERID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserPwd());
			pstmt.setString(2, dto.getTel());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getUserId());
			
			result = pstmt.executeUpdate();
			System.out.println(result);
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return result;
	}
	
	public int deleteData(String userId) 
	{
		int result =0;
		
		PreparedStatement pstmt = null;
		String sql=null;
		
		try
		{
			sql="DELETE FROM MEMBER"
					+ " WHERE USERID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	
}
