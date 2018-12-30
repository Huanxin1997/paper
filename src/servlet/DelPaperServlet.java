package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Paper;

import service.PaperService;
import service.impl.PaperServiceImpl;

/**
 * Servlet implementation class DelPaperServlet
 */
@WebServlet("/DelPaperServlet")
public class DelPaperServlet extends HttpServlet {
	private static final long serialVersionUID = -3658128508633145268L;
		
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
		Paper paper = new Paper();
		
		paper.setIdnum(idnum);
		
		PaperService paperService = new PaperServiceImpl();
		
		int a = paperService.DelPaper(paper);
		
		if(a < 0){
			response.sendRedirect(request.getContextPath()+"/paper_list.jsp");
		}
		else{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}


}
