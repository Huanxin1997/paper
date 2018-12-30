package dao;

import com.bean.Student;
import com.bean.Super;
import com.bean.Teacher;

public interface LoginDao{
	public String Superlogin(String idnum,String password);
	public Teacher Teacherlogin(String idnum);
	public Student Studentlogin(String idnum);
}
