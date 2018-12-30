package service;

import com.bean.Pager;
import com.bean.Subject;

public interface SubjectService {
	public int addSubject(Subject s);
	public Pager<Subject> getSubject(Subject s,int PageNum,int pageSize);
}
