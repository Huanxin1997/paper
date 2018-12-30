package servlet;

import java.io.IOException;
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
 * Servlet implementation class UpdatePswServlet
 */
@WebServlet("/UpdatePswServlet")
public class UpdatePswServlet extends HttpServlet {
	private static final long serialVersionUID = -3658128508633145268L;
	private static final Paper Paper = null;
		
		public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
	
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String idnum = request.getParameter("name");
		String password = request.getParameter("password");
//		System.out.println(serial);
		System.out.println(idnum);
		Student s = new Student();
		
		s.setPassword(password);
		
		StudentService service = new StudentServiceImpl();
		
		int a = service.UpdatePsw(s);
		
		if(a < 0){
			response.sendRedirect(request.getContextPath()+"/paper_list.jsp");
		}
		else{
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}

}
