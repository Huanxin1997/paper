package service.impl;

import com.bean.Pager;
import com.bean.Paper;

import dao.PaperDao;
import dao.Impl.PaperDaoImpl;
import service.PaperService;

public class PaperServiceImpl implements PaperService{

	PaperDao paperDao = new PaperDaoImpl();
	@Override
	public int IfAddPaper(Paper paper) {
		// TODO Auto-generated method stub
		int a = 0;
		try{
			a = paperDao.addPaper(paper);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}
	
	@Override
	public Pager<Paper> getPaper(Paper paper, int pageNum, int pageSize) {
		// TODO Auto-generated method stub
		Pager<Paper> result = paperDao.getPaper(paper, pageNum, pageSize);
		return result;
	}

	@Override
	public int DelPaper(Paper paper) {
		// TODO Auto-generated method stub
		int a = 0;
		try{
			a = paperDao.delPaper(paper);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int Repetition(String repetition,String serial) {
		// TODO Auto-generated method stub
		int a = 0;
		try{
			a = paperDao.Repetition(repetition,serial);
			System.out.println("service"+a);
		}catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}

	@Override
	public void UpdateScore(Paper paper) {
		// TODO Auto-generated method stub
		try{
			paperDao.updateScore(paper);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
