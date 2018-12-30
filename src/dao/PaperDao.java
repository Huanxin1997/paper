package dao;

import com.bean.Pager;
import com.bean.Paper;

public interface PaperDao {
	
	public int delPaper(Paper paper) throws Exception;
	
	public int addPaper(Paper paper) throws Exception;
	public Pager<Paper> getPaper(Paper paper, int pageNum, int pageSize);//老师和管理员查询学生提交的论文都在这个方法里
	public int Repetition(String repetition, String serial);
	public int updateScore(Paper paper);
}