package service;

import com.bean.Pager;
import com.bean.Paper;

public interface PaperService {

	public int IfAddPaper(Paper paper);//增加论文
	public int DelPaper(Paper paper);//删除论文
	public Pager<Paper> getPaper(Paper paper,int PageNum,int pageSize);
	public int Repetition(String repetition, String serial);//更改重复率
	public void UpdateScore(Paper paper);
}
