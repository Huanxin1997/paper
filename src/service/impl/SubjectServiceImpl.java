package service.impl;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Subject;

import dao.SubjectDao;
import dao.Impl.SubjectDaoImpl;
import service.SubjectService;

public class SubjectServiceImpl implements SubjectService{
	
	SubjectDao dao = new SubjectDaoImpl();
	@Override
	public int addSubject(Subject s) {
		int a = 0;
		try{
			a = dao.addSubject(s);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}
	
	@Override
	public Pager<Subject> getSubject(Subject s, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		Pager<Subject> result = dao.getSubject(s, pageNum, pageSize);
		return result;
	}

}
