package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Student;

import Util.JdbcUtil;
import dao.PaperDao;

public class PaperDaoImpl implements PaperDao{

	@Override
	public int addPaper(Paper paper) throws Exception{
		// TODO Auto-generated method stub
		JdbcUtil jdbcUtil = new JdbcUtil();
		Connection conn = jdbcUtil.getConnection();
		String sql = "insert into paper(idnum,serial,author,title,file,teacher,subject) values(?,?,?,?,?,?,?)";
		
		PreparedStatement ps = conn.prepareStatement(sql);
		
		ps.setString(1, paper.getIdnum());
		ps.setString(2, paper.getSerial());
		ps.setString(3, paper.getAuthor());
		ps.setString(4, paper.getTitle());
		ps.setString(5, paper.getFile());
		ps.setString(6, paper.getTeacher());
		ps.setString(7, paper.getSubject());
		int a = ps.executeUpdate();
		return a;
	}
	

	@Override
	public int delPaper(Paper paper) throws Exception {
		// TODO Auto-generated method stub
		JdbcUtil jdbcUtil = new JdbcUtil();
		Connection conn = jdbcUtil.getConnection();
		String idnum = paper.getIdnum();
		PreparedStatement ps = null;
		int a = 0;
		String sql = "DELETE FROM paper WHERE idnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, idnum);
			ps.execute();
			a = ps.executeUpdate();
			System.out.println("更新结果" + a);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return a;
	}

	@Override
	public Pager<Paper> getPaper(Paper paper,int pageNum,int pageSize){
		List<Paper> PaperList = getPaper(paper);
		
		Pager<Paper> pager = new Pager<Paper>(pageNum,pageSize,PaperList);
		return pager;
	}
	
	private static List<Paper> getPaper(Paper paper){
		List<Paper> result = new ArrayList<Paper>();
		List<Object> paramList = new ArrayList<Object>();
		String idnum = paper.getIdnum();
		String teacher = paper.getTeacher();
		StringBuilder sql = new StringBuilder("select * from paper where 1=1");
		if(idnum!=null && !idnum.equals("")){
			sql.append(" and idnum like ?");
			paramList.add("%"+idnum+"%");
		}else if(teacher!=null && !teacher.equals("")){
			sql.append(" and teacher like ?");
			paramList.add("%" + teacher + "%");	
		}
		JdbcUtil jdbcUtil = null;
		try{
			jdbcUtil = new JdbcUtil();
			jdbcUtil.getConnection();
			List<Map<String, Object>> mapList = jdbcUtil.findResult(sql.toString(), paramList);
			if(mapList != null){
				for(Map<String,Object>map:mapList){
					Paper p = new Paper(map);
					result.add(p);
				}
			}
		}catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException("查询数据异常",e);
		}finally{
			//释放内存，切记
			if(jdbcUtil != null){
				jdbcUtil.releaseConn();
			}
		}
		return result;		
	}


	@Override
	public int Repetition(String repetition,String serial) {
		// TODO Auto-generated method stub
		int a = 0;
		try{
			JdbcUtil jdbc = new JdbcUtil();
			Connection conn = jdbc.getConnection();
			
			String sql = "UPDATE paper SET repetition_rate=? WHERE serial=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(repetition+serial);
			ps.setString(1, repetition);
			ps.setString(2, serial);
			a = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
		
	}


	@Override
	public int updateScore(Paper paper) {
		// TODO Auto-generated method stub
		int a = 0;
		try{
			JdbcUtil jdbc = new JdbcUtil();
			Connection conn = jdbc.getConnection();
			
			String sql = "UPDATE paper SET score=? WHERE idnum=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, paper.getScore());
			ps.setString(2, paper.getIdnum());
			a = ps.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

}
