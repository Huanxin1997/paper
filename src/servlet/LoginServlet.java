package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Student;
import com.bean.Teacher;

import service.LoginService;

import service.impl.LoginServiceImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException { 
			
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd�� HH:mm:ss");
		Date nowDate = new Date();
		String time = sdf.format(nowDate);
		String idnum = request.getParameter("idnum");
		String password = request.getParameter("password");
		String[] role = request.getParameterValues("role");
		
		System.out.println("�˺ţ�" + idnum);
		System.out.println("���룺" + password);
		System.out.println("��ɫ��" + role[0]);
		
		LoginService loginService = new LoginServiceImpl();
		
		Teacher t = new Teacher();
		Student s = new Student();
		
		int a = 0;
		try {
			if(role[0].equals("Super")){
				a = loginService.SuperLogin(idnum,password);
				if(a > 0){
					if(role[0].equals("Super")){
						request.setAttribute("welcome", idnum);
						request.setAttribute("time", time);
						request.getRequestDispatcher("super.jsp").forward(request, response); 
					}
				}
				else{
					request.setAttribute("error", "�û������������!");
					request.getRequestDispatcher("main.jsp").forward(request, response);
				}
			}else if(role[0].equals("t_student")){
				s = loginService.StudentLogin(idnum);
				if(s.getPassword().equals(password)){
					System.out.println(s.getName());
					HttpSession session = request.getSession();
		            //���û����ݱ�����session�������
					session.setAttribute("idnum", idnum);
					session.setAttribute("name", s.getName());
					session.setAttribute("time", time);
		            //��ת���û���ҳ
		            response.sendRedirect(request.getContextPath()+"/student.jsp");
				}else{
					request.setAttribute("error", "�û������������!");
					response.sendRedirect(request.getContextPath() + "/main.jsp");
				}
			}else if(role[0].equals("teacher")){
				t = loginService.TeacherLogin(idnum);
				if(t.getPassword().equals(password)){
					HttpSession session = request.getSession();
		            //���û����ݱ�����session�������
					session.setAttribute("idnum", idnum);
					session.setAttribute("name", t.getName());
					session.setAttribute("time", time);
		            //��ת���û���ҳ
		            response.sendRedirect(request.getContextPath()+"/teacher.jsp");
				}else{
					request.setAttribute("error", "�û������������!");
					request.getRequestDispatcher("main.jsp").forward(request, response);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("a��ֵ�ǣ�"+ a);
	}
}
