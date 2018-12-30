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
		// 接收request里的参数
		String teacherName = request.getParameter("teacher"); //获取姓名
		System.out.println("发大V发送到"+teacherName);
		String pageNumStr = request.getParameter("pageNum"); 
		if(pageNumStr !=null && !StringUtil.isNum(pageNumStr)){
			request.setAttribute("errorMsg", "参数传输错误");
			request.getRequestDispatcher("subject_list.jsp").forward(request, response);
			return;
		}
		
		int pageNum = Constant.DEFAULT_PAGE_NUM; //显示第几页数据
		if(pageNumStr!=null && !"".equals(pageNumStr.trim())){
			pageNum = Integer.parseInt(pageNumStr);
		}
		
		int pageSize = Constant.DEFAULT_PAGE_SIZE;  // 每页显示多少条记录
		String pageSizeStr = request.getParameter("pageSize");
		if(pageSizeStr!=null && !"".equals(pageSizeStr.trim())){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		
		// 组装查询条件
		Subject s = new Subject();
		s.setTeacherName(teacherName);
//		searchModel.setGender(gender);
		
		//调用service 获取查询结果
		Pager<Subject> result = service.getSubject(s, pageNum, pageSize);
		
		// 返回结果到页面
		request.setAttribute("result", result);
		
		request.getRequestDispatcher("subject_list.jsp").forward(request, response);
	}

}
