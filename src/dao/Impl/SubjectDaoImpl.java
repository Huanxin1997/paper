package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Subject;

import Util.JdbcUtil;
import dao.SubjectDao;

public class SubjectDaoImpl implements SubjectDao{

	@Override
	public int addSubject(Subject s) {
		// TODO Auto-generated method stub
		int a = 0;
		try {
			JdbcUtil jdbc = new JdbcUtil();
			Connection conn = jdbc.getConnection();

			PreparedStatement ps = conn.prepareStatement("insert into subject(`teacherName`,`name`,`limit`) values(?,?,?)");
			
			ps.setString(1, s.getTeacherName());
			ps.setString(2, s.getName());
			ps.setString(3, s.getLimit());
			
			a = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public Pager<Subject> getSubject(Subject subject,int pageNum,int pageSize){
		List<Subject> SubjectList = getSubject(subject);
		
		Pager<Subject> pager = new Pager<Subject>(pageNum,pageSize,SubjectList);
		return pager;
	}
	
	private static List<Subject> getSubject(Subject subject){
		List<Subject> result = new ArrayList<Subject>();
		List<Object> paramList = new ArrayList<Object>();
		String teacherName = subject.getTeacherName();
		
		StringBuilder sql = new StringBuilder("select * from subject where 1=1");
		if(teacherName!=null && !teacherName.equals("")){
			sql.append(" and teacherName like ?");
			paramList.add("%"+teacherName+"%");
		}
		JdbcUtil jdbcUtil = null;
		try{
			jdbcUtil = new JdbcUtil();
			jdbcUtil.getConnection();
			List<Map<String, Object>> mapList = jdbcUtil.findResult(sql.toString(), paramList);
			if(mapList != null){
				for(Map<String,Object>map:mapList){
					Subject s = new Subject(map);
					result.add(s);
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

}
