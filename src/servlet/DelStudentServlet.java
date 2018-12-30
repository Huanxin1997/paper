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

import service.PaperService;
import service.StudentService;
import service.impl.PaperServiceImpl;
import service.impl.StudentServiceImpl;

/**
 * Servlet implementation class DelStudent
 */
@WebServlet("/DelStudentServlet")
public class DelStudentServlet extends HttpServlet {
	private static final long serialVersionUID = -3658128508633145268L;
	
	private static final Student Student = null;
		
		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
	
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String idnum = request.getParameter("name");
//		System.out.println(serial);
		System.out.println(idnum);
		Student student = new Student();
		
		student.setIdnum(idnum);
		
		StudentService studentSerice = new StudentServiceImpl();
		
		int a = studentSerice.DelStudent(student);
		
		if(a < 0){
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
//		else{
//			request.getRequestDispatcher("jsp/index.jsp").forward(request, response);
//		}
	}

}
