package service;

import com.bean.Pager;
import com.bean.Paper;

public interface PaperService {

	public int IfAddPaper(Paper paper);//��������
	public int DelPaper(Paper paper);//ɾ������
	public Pager<Paper> getPaper(Paper paper,int PageNum,int pageSize);
	public int Repetition(String repetition, String serial);//�����ظ���
	public void UpdateScore(Paper paper);
}
