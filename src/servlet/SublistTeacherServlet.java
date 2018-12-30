package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Pager;
import com.bean.Paper;
import com.bean.Teacher;

import Util.StringUtil;
import common.Constant;
import service.PaperService;
import service.TeacherService;
import service.impl.PaperServiceImpl;
import service.impl.TeacherServiceImpl;

/**
 * Servlet implementation class SublistTeacherServlet
 */
@WebServlet("/SublistTeacherServlet")
public class SublistTeacherServlet extends HttpServlet {
private static final long serialVersionUID = -3658128508633145268L;
	
	private TeacherService teacherService = new TeacherServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// ����request��Ĳ���
		String idnum = request.getParameter("name"); //��ȡѧ��
		
		// ��ȡѧ���Ա�
//		int gender = Constant.DEFAULT_GENDER;
//		String genderStr = request.getParameter("gender");
//		if(genderStr!=null && !"".equals(genderStr.trim())){
//			gender = Integer.parseInt(genderStr);
//		}
		
		// У��pageNum��������Ϸ���
		String pageNumStr = request.getParameter("pageNum"); 
		if(pageNumStr !=null && !StringUtil.isNum(pageNumStr)){
			request.setAttribute("errorMsg", "�����������");
			request.getRequestDispatcher("Teacher_list.jsp").forward(request, response);
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
		Teacher teacher = new Teacher();
		teacher.setIdnum(idnum);
//		searchModel.setGender(gender);
		
		//����service ��ȡ��ѯ���
		Pager<Teacher> result = teacherService.getTeacher(teacher, pageNum, pageSize);
		
		// ���ؽ����ҳ��
		request.setAttribute("result", result);
		request.setAttribute("idnum", idnum);
		
		request.getRequestDispatcher("teacher_list.jsp").forward(request, response);
	}

}
