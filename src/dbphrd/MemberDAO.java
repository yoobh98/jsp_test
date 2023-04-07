package dbphrd;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public MemberDAO() {
		try {
			con=DBConnect.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> selectMemberList() {
		ArrayList<MemberDTO> list=new ArrayList<MemberDTO>();
		String sql="select * from member_tbl_02";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto=new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getDate("joindate"));
				
				String g="";
				if(rs.getString("grade").equals("A")||rs.getString("grade").equals("a")) {
					g="VIP";
					System.out.println(g+" : VIP");
				}if(rs.getString("grade").equals("B")||rs.getString("grade").equals("b")){
					g="�Ϲ�";
					System.out.println(g+" : �Ϲ�");
				}if(rs.getString("grade").equals("C")||rs.getString("grade").equals("c")){
					System.out.println(g+" : ����");
					g="����";
				}
				dto.setGrade(g);
				dto.setCity(rs.getString("city"));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertMember(MemberDTO dto) {
		int result=0;

		String sql="insert into member_tbl_02 values(?,?,?,?,sysdate,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1,dto.getCustno());
			ps.setString(2, dto.getCustname());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getGrade());
			ps.setString(6, dto.getCity());
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<MemberDTO> getJoinList() {
		ArrayList<MemberDTO> list= new ArrayList<MemberDTO>();
		String sql="select M.custno, M.custname,M.grade,sum(L.price) "
				+"from member_tbl_02 M inner join money_tbl_02 L "
				+"on M.custno = L.custno "
				+"group by M.custno,M.custname,M.grade "
				+"order by sum(L.price) desc";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				String grade="";
				MemberDTO dto = new MemberDTO();
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				if(rs.getString("grade").equals("A")||rs.getString("grade").equals("a")) {
					grade="VIP";
				}if(rs.getString("grade").equals("B")||rs.getString("grade").equals("b")){
					grade="�Ϲ�";
				}if(rs.getString("grade").equals("C")||rs.getString("grade").equals("c")){
					grade="����";
				}
				dto.setGrade(grade);
				dto.setPrice(rs.getInt("sum(L.price)"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public MemberDTO selectOne(int custno) {
		MemberDTO dto = new MemberDTO();
		String sql="select * from member_tbl_02 where custno="+custno;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto.setCustno(rs.getInt("custno"));
				dto.setCustname(rs.getString("custname"));
				dto.setPhone(rs.getString("phone"));
				dto.setAddress(rs.getString("address"));
				dto.setJoindate(rs.getDate("joindate"));
				dto.setGrade(rs.getString("grade"));
				dto.setCity(rs.getString("city"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int updateMember(MemberDTO dto) {
		int result=0;
		String sql="update member_tbl_02 set custname=?,phone=?,address=?,grade=?,city=? where custno=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getCustname());
			ps.setString(2, dto.getPhone());
			ps.setString(3, dto.getAddress());
			ps.setString(4, dto.getGrade());
			ps.setString(5, dto.getCity());
			ps.setInt(6, dto.getCustno());
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}

//�긦 ���� �ֳ��� �����ؼ� ���°� �ð����� ������
//Stirng sql="";
//try {
//	ps=con.prepareStatement(sql);
//	rs=ps.executeQuery();
//} catch (Exception e) {
//	e.printStackTrace();
//}
