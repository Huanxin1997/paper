package dao;

import com.bean.Pager;
import com.bean.Teacher;

public interface TeacherDao {

	public Pager<Teacher> getTeacher(Teacher teacher, int pageNum, int pageSize);
}
