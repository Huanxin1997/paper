package service.impl;

import com.bean.Pager;
import com.bean.Student;

import dao.StudentDao;
import dao.Impl.StudentDaoImpl;
import dao.Impl.SublistStudentDaoImpl;
import service.StudentService;

public class StudentServiceImpl implements StudentService{
	StudentDao dao = new StudentDaoImpl();
	@Override
	public int DelStudent(Student student) {
		// TODO Auto-generated method stub
		int a = 0;
		try{
			a = dao.DelStudent(student);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return a;
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
		try{
			dao = new StudentDaoImpl();
			a = dao.AddSubject(student);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}
	@Override
	public Pager<Student> findStudent(Student searchModel, int pageNum, int pageSize) {
		Pager<Student> result = dao.getAllStudent(searchModel, pageNum,
				pageSize);
		return result;
	}
}
