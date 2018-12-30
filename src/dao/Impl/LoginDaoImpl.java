package dao.Impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.Student;
import com.bean.Super;
import com.bean.Teacher;

import Util.JdbcUtil;
import dao.LoginDao;

public class LoginDaoImpl implements LoginDao{
	
	@Override
	public String Superlogin(String idnum,String password){
		// TODO Auto-generated method stub
		String psw = null;
		try{
			JdbcUtil jdbc = new JdbcUtil();
			Connection conn = jdbc.getConnection();
			Statement stmt = conn.createStatement();
			System.out.println("dao:" + password);
			String sql = "select password from super where idnum='" + idnum + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				psw = rs.getString("password");
				System.out.println(psw);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return psw;
	}

	@Override
	public Teacher Teacherlogin(String idnum) {
		// TODO Auto-generated method stub
		String psw = null;
		String name = null;
		Teacher t =new Teacher();
		try{
			JdbcUtil jdbc = new JdbcUtil();
			Connection conn = jdbc.getConnection();
			Statement stmt = conn.createStatement();
			
			String sql = "select * from teacher where idnum='" + idnum + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				psw = rs.getString("password");
				name = rs.getString("name");
				System.out.println(name);
			}
			t.setPassword(psw);
			t.setName(name);
//			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return t;
	}

	@Override
	public Student Studentlogin(String idnum) {
		// TODO Auto-generated method stub
		String psw = null;
		String name = null;
		Student student =new Student();
		try{
			JdbcUtil jdbc = new JdbcUtil();
			Connection conn = jdbc.getConnection();
			Statement stmt = conn.createStatement();
			
			String sql = "select * from t_student where idnum='" + idnum + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				psw = rs.getString("password");
				name = rs.getString("name");
				System.out.println(psw);
			}
			student.setPassword(psw);
			student.setName(name);
//			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return student;
	}


	
}
