package service;

import com.bean.Pager;
import com.bean.Student;

public interface StudentService {
	public Pager<Student> findStudent(Student searchModel,int pageNum,int pageSize);
	public int DelStudent(Student student);
	public int UpdatePsw(Student student);
	public int AddSubject(Student student);
}
