package service.impl;

import com.bean.Student;
import com.bean.Teacher;

import dao.LoginDao;
import dao.Impl.LoginDaoImpl;
import service.LoginService;

public class LoginServiceImpl implements LoginService {
	
	int a = 0;	
	@Override
	public int SuperLogin(String idnum,String password) throws Exception {
		System.out.println("service:" + password);
		// TODO Auto-generated method stub				
		LoginDao dao = new LoginDaoImpl();
		String psw = dao.Superlogin(idnum,password);
		if(psw.equals(password)){
			a = 1;
		}else{
			a = 0;
		}
		System.out.println("adeshi" + a);
		return a;
	}

	@Override
	public Teacher TeacherLogin(String idnum) throws Exception {
		// TODO Auto-generated method stub
		LoginDao dao = new LoginDaoImpl();
		Teacher t = dao.Teacherlogin(idnum);
		return t;
	}

	@Override
	public Student StudentLogin(String idnum) throws Exception {
		// TODO Auto-generated method stub
		LoginDao dao = new LoginDaoImpl();
		Student s = dao.Studentlogin(idnum);
		return s;
	}

}
