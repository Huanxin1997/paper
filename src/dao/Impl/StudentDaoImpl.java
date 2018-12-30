package dao.Impl;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bean.Pager;
import com.bean.Student;

import Util.JdbcUtil;
import dao.StudentDao;

public class StudentDaoImpl implements StudentDao{
	JdbcUtil j = new JdbcUtil();
	@Override
	public int DelStudent(Student student) {
		// TODO Auto-generated method stub
		PreparedStatement ps = null;
		Connection conn = j.getConnection();
		String idnum = student.getIdnum();
		int a = 0;
		String sql = "DELETE FROM t_student WHERE idnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, idnum);
			ps.execute();
			a = ps.executeUpdate();
			System.out.println("哈哈的反复" + a);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return a;
	}

	@Override
	public int UpdateStudent(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void AddStudent(Student student) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager<Student> getAllStudent(Student searchModel,int pageNum,int pageSize){
		List<Student> allStudentList = getAllStudent(searchModel);
		
		Pager<Student> pager = new Pager<Student>(pageNum,pageSize,allStudentList);
		return pager;
	}
	
	private static List<Student> getAllStudent(Student searchModel){
		List<Student> result = new ArrayList<Student>();
		List<Object> paramList = new ArrayList<Object>();
		String idnum = searchModel.getIdnum();
		
		StringBuilder sql = new StringBuilder("select * from t_student where 1=1");
		if(idnum!=null && !idnum.equals("")){
			sql.append(" and idnum like ?");
			paramList.add("%"+idnum+"%");
		}
		JdbcUtil jdbcUtil = null;
		try{
			jdbcUtil = new JdbcUtil();
			jdbcUtil.getConnection();
			List<Map<String, Object>> mapList = jdbcUtil.findResult(sql.toString(), paramList);
			if(mapList != null){
				for(Map<String,Object>map:mapList){
					Student s = new Student(map);
					result.add(s);
				}
			}
		}catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException("查询所有数据异常",e);
		}finally{
			//释放内存，切记
			if(jdbcUtil != null){
				jdbcUtil.releaseConn();
			}
		}
		return result;
	}

	@Override
	public int UpdatePsw(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int AddSubject(Student student) {
		// TODO Auto-generated method stub
		int a = 0;
		try {
			Connection conn = j.getConnection();
			String sql = "update t_student set subject=?,teacher=? where idnum=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, student.getSubject());
			ps.setString(2, student.getTeacher());
			ps.setString(3, student.getIdnum());
			a = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
	}

}
