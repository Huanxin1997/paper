package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Pager;
import com.bean.Student;

import Util.StringUtil;
import common.Constant;
import service.StudentService;
import service.impl.StudentServiceImpl;

/**
 * Servlet implementation class SublistServlet
 */
@WebServlet("/SublistServlet")
public class SublistServlet extends HttpServlet {
private static final long serialVersionUID = -3658128508633145268L;
	
	private StudentService studentService = new StudentServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// 接收request里的参数
		String idnum = request.getParameter("name"); //获取学号

		String pageNumStr = request.getParameter("pageNum"); 
		if(pageNumStr !=null && !StringUtil.isNum(pageNumStr)){
			request.setAttribute("errorMsg", "参数传输错误");
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
		
		Student searchModel = new Student(); 
		searchModel.setIdnum(idnum);
		
		//调用service 获取查询结果
		Pager<Student> result = studentService.findStudent(searchModel, pageNum, pageSize);
		
		// 返回结果到页面
		request.setAttribute("result", result);
		request.setAttribute("idnum", idnum);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
