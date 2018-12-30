package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Pager;
import com.bean.Subject;
import com.bean.Teacher;

import Util.StringUtil;
import common.Constant;
import service.SubjectService;
import service.TeacherService;
import service.impl.SubjectServiceImpl;
import service.impl.TeacherServiceImpl;

/**
 * Servlet implementation class SublistSubjectServlet
 */
@WebServlet("/SublistSubjectServlet")
public class SublistSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = -3658128508633145268L;
	private SubjectService service = new SubjectServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// ����request��Ĳ���
		String teacherName = request.getParameter("teacher"); //��ȡ����
		System.out.println("����V���͵�"+teacherName);
		String pageNumStr = request.getParameter("pageNum"); 
		if(pageNumStr !=null && !StringUtil.isNum(pageNumStr)){
			request.setAttribute("errorMsg", "�����������");
			request.getRequestDispatcher("subject_list.jsp").forward(request, response);
			return;
		}
		
		int pageNum = Constant.DEFAULT_PAGE_NUM; //��ʾ�ڼ�ҳ����
		if(pageNumStr!=null && !"".equals(pageNumStr.trim())){
			pageNum = Integer.parseInt(pageNumStr);
		}
		
		int pageSize = Constant.DEFAULT_PAGE_SIZE;  // ÿҳ��ʾ��������¼
		String pageSizeStr = request.getParameter("pageSize");
		if(pageSizeStr!=null && !"".equals(pageSizeStr.trim())){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		
		// ��װ��ѯ����
		Subject s = new Subject();
		s.setTeacherName(teacherName);
//		searchModel.setGender(gender);
		
		//����service ��ȡ��ѯ���
		Pager<Subject> result = service.getSubject(s, pageNum, pageSize);
		
		// ���ؽ����ҳ��
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("subject_list.jsp").forward(request, response);
	}

}
