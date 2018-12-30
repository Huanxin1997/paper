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
import service.PaperService;
import service.impl.PaperServiceImpl;

/**
 * Servlet implementation class SublistServlet
 */
@WebServlet("/AddPaperServlet")
public class AddPaperServlet extends HttpServlet {
	private static final long serialVersionUID = -3658128508633145268L;
	
	PaperService addPaperService = new PaperServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSSS");//获取当前时间作为流水号，理论上不会重复
		Date nowDate = new Date();
		String serial = sdf.format(nowDate);
		String idnum = request.getParameter("idnum"); 
		String author = request.getParameter("author"); 
		String title = request.getParameter("title");
		String teacher = request.getParameter("teacher");
		String file = request.getParameter("file");
		String subject = request.getParameter("subject");
//		System.out.println(serial);
		
		System.out.println(idnum);
		Paper p = new Paper();
		p.setIdnum(idnum);
		p.setSerial(serial);
		p.setAuthor(author);
		p.setTitle(title);
		p.setTeacher(teacher);
		p.setFile(file);
		p.setSubject(subject);
//		System.out.println(p.getAuthor());
//		System.out.println(p.getFile());
//		System.out.println(p.getSerial());
//		System.out.println(p.getTeacher());
//		System.out.println(p.getTitle());
		
		PaperService add = new PaperServiceImpl();
		
		int a = add.IfAddPaper(p);
		if(a > 0){
			request.setAttribute("message", "提交论文成功");
			request.getRequestDispatcher("addPaper.jsp").forward(request, response);
		}
		else{
			request.setAttribute("message", "提交论文失败");
			request.getRequestDispatcher("addPaper.jsp").forward(request, response);
		}
	}

}
