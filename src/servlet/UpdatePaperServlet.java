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
 * Servlet implementation class UpdatePaperServlet
 */
@WebServlet("/UpdatePaperServlet")
public class UpdatePaperServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePaperServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int score = Integer.parseInt(request.getParameter("score"));
		String idnum = request.getParameter("idnum");
		Paper paper = new Paper();
		paper.setScore(score);
		paper.setIdnum(idnum);
		try{
			PaperService service = new PaperServiceImpl();
			service.UpdateScore(paper);
			request.setAttribute("success", "ÆÀ·Ö³É¹¦");
			request.getRequestDispatcher("score.jsp").forward(request, response);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
