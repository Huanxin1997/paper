package service;

import com.bean.Student;
import com.bean.Super;
import com.bean.Teacher;

public interface LoginService {
	public int SuperLogin(String idnum,String password)throws Exception;
	public Teacher TeacherLogin(String idnum)throws Exception;
	public Student StudentLogin(String idnum)throws Exception;
}
