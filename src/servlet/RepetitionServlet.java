package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PaperService;
import service.impl.PaperServiceImpl;

/**
 * Servlet implementation class RepetitionServlet
 */
@WebServlet("/RepetitionServlet")
public class RepetitionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RepetitionServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String repetition = request.getParameter("repetition");
		String serial = request.getParameter("serial");
		System.out.println("��ˮ��" + serial);
		System.out.println("���ؽ��" + repetition);
		int a = 0;
		
		try {
			PaperService service = new PaperServiceImpl();
			a = service.Repetition(repetition,serial);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		PrintWriter p = response.getWriter();
		String message = null;
		if(a>0){
			message = "���سɹ�";
			p.write(message);
		}else{
			message = "����ʧ�ܣ����Ժ����ԣ�";
			p.write(message);
		}
		
	}

}
