package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Paper;
import com.bean.Student;
import com.bean.Subject;

import service.PaperService;
import service.StudentService;
import service.SubjectService;
import service.impl.PaperServiceImpl;
import service.impl.StudentServiceImpl;
import service.impl.SubjectServiceImpl;

/**
 * Servlet implementation class AddSubjectServlet
 */
@WebServlet("/AddSubjectServlet")
public class AddSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = -3658128508633145268L;
	PaperService addPaperService = new PaperServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		response.setCharacterEncoding("utf-8");
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		if(method.endsWith("teacher")){
			teacher(request, response);
		}
		else if(method.equals("student")){
			student(request,response);
		}
	}

	private void student(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub

		String subject = request.getParameter("subject");
		String teacher = request.getParameter("teacher");
		String idnum = request.getParameter("idnum"); 

		StudentService service = new StudentServiceImpl();
		
		Student student = new Student();
		student.setTeacher(teacher);
		student.setSubject(subject);
		student.setIdnum(idnum);
		
		int a = 0;
		a = service.AddSubject(student);
		if(a > 0){
			request.setAttribute("success", "您已成功选择该老师课题，请按时提交论文！！");
			request.getRequestDispatcher("subject_list.jsp").forward(request, response);
		}
	}

	public void teacher(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("subject"); 
		String time = request.getParameter("time"); 
		String teacherName = request.getParameter("teacher");
		System.out.println(name);
		SubjectService service = new SubjectServiceImpl();
		
		Subject s = new Subject();
		s.setName(name);
		s.setLimit(time);
		s.setTeacherName(teacherName);
		
		System.out.println(s.getTeacherName());
		
		int a = service.addSubject(s);
		if(a > 0){
			request.setAttribute("success", "您已成功发布课题");
			request.getRequestDispatcher("addSubject.jsp").forward(request, response);	
		}
		else{
			request.getRequestDispatcher("555.jsp").forward(request, response);
		}
	}

	
}
