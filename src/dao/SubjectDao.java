package dao;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Subject;

public interface SubjectDao {
	
	public int addSubject(Subject s);
	public Pager<Subject> getSubject(Subject subject, int pageNum, int pageSize);
}
