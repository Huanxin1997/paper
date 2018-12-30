package service.impl;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Teacher;

import dao.TeacherDao;
import dao.Impl.TeacherDaoImpl;
import service.TeacherService;

public class TeacherServiceImpl implements TeacherService{
	private TeacherDao dao = new TeacherDaoImpl();
	public TeacherServiceImpl(){
		dao = new TeacherDaoImpl();
	}
	
	@Override
	public Pager<Teacher> getTeacher(Teacher teacher, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		Pager<Teacher> result = dao.getTeacher(teacher, pageNum, pageSize);
		return result;
	}

}
