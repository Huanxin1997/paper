package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Student;

import Util.StringUtil;
import common.Constant;
import service.PaperService;
import service.StudentService;
import service.impl.PaperServiceImpl;

/**
 * Servlet implementation class SublistPaperServlet
 */
@WebServlet("/SublistPaperServlet")
public class SublistPaperServlet extends HttpServlet {
	private static final long serialVersionUID = -3658128508633145268L;
	
	private PaperService paperService = new PaperServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String idnum = request.getParameter("idnum");
		String teacher = request.getParameter("teacher");
		
		System.out.println(teacher);
		
		String pageNumStr = request.getParameter("pageNum"); 
		
		int pageNum = Constant.DEFAULT_PAGE_NUM; //��ʾ�ڼ�ҳ����
		if(pageNumStr!=null && !"".equals(pageNumStr.trim())){
			pageNum = Integer.parseInt(pageNumStr);
		}
		
		int pageSize = Constant.DEFAULT_PAGE_SIZE;  // ÿҳ��ʾ��������¼
		String pageSizeStr = request.getParameter("pageSize");
		if(pageSizeStr!=null && !"".equals(pageSizeStr.trim())){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		
		Paper paper = new Paper();
		paper.setIdnum(idnum);
		paper.setTeacher(teacher);
		System.out.println("��ʦ��"+paper.getTeacher());
		System.out.println("ѧ�ţ�"+paper.getIdnum());
		Pager<Paper> result = paperService.getPaper(paper, pageNum, pageSize);
		
		// ���ؽ����ҳ��
		
		if(teacher==null){
			request.setAttribute("result", result);
			request.setAttribute("idnum", idnum);
			request.getRequestDispatcher("paper_list.jsp").forward(request, response);
		}
		else{
			request.setAttribute("result", result);
			request.setAttribute("idnum", idnum);
			request.getRequestDispatcher("score.jsp").forward(request, response);
		}
	}

}
