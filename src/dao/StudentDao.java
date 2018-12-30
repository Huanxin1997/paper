package dao;

import com.bean.Pager;
import com.bean.Student;

public interface StudentDao {

	public Pager<Student> getAllStudent(Student searchModel, int pageNum, int pageSize);
	public int DelStudent(Student student);
	public int UpdateStudent(Student student);
	public void AddStudent(Student student);
	public int UpdatePsw(Student student);
	public int AddSubject(Student student);
}
