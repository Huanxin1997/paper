package service;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Teacher;

public interface TeacherService {
	public Pager<Teacher> getTeacher(Teacher teacher, int pageNum, int pageSize);

}
