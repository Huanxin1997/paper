package dao;

import com.bean.Pager;
import com.bean.Paper;

public interface PaperDao {
	
	public int delPaper(Paper paper) throws Exception;
	
	public int addPaper(Paper paper) throws Exception;
	public Pager<Paper> getPaper(Paper paper, int pageNum, int pageSize);//��ʦ�͹���Ա��ѯѧ���ύ�����Ķ������������
	public int Repetition(String repetition, String serial);
	public int updateScore(Paper paper);
}