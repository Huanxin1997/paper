package dao.Impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bean.Pager;
import com.bean.Student;

import Util.JdbcUtil;
import dao.StudentDao;

public class SublistStudentDaoImpl implements StudentDao {

	@Override
	public Pager<Student> getAllStudent(Student searchModel,int pageNum,int pageSize){
		List<Student> allStudentList = getAllStudent(searchModel);
		
		Pager<Student> pager = new Pager<Student>(pageNum,pageSize,allStudentList);
		return pager;
	}
	
	private static List<Student> getAllStudent(Student searchModel){
		List<Student> result = new ArrayList<Student>();
		List<Object> paramList = new ArrayList<Object>();
		String idnum = searchModel.getIdnum();
		
		StringBuilder sql = new StringBuilder("select * from t_student where 1=1");
		if(idnum!=null && !idnum.equals("")){
			sql.append(" and idnum like ?");
			paramList.add("%"+idnum+"%");
		}
		JdbcUtil jdbcUtil = null;
		try{
			jdbcUtil = new JdbcUtil();
			jdbcUtil.getConnection();
			List<Map<String, Object>> mapList = jdbcUtil.findResult(sql.toString(), paramList);
			if(mapList != null){
				for(Map<String,Object>map:mapList){
					Student s = new Student(map);
					result.add(s);
				}
			}
		}catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException("查询所有数据异常",e);
		}finally{
			//释放内存，切记
			if(jdbcUtil != null){
				jdbcUtil.releaseConn();
			}
		}
		
		
		return result;
		
	}
	public static void main(String[] args) {
		List<Student> lst = getAllStudent(new Student());
		for (Student s : lst) {
			System.out.println(s);
		}
	}

	@Override
	public int DelStudent(Student student) {
		return 0;
		// TODO Auto-generated method stub
		
	}

	@Override
	public int UpdateStudent(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void AddStudent(Student student) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int UpdatePsw(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int AddSubject(Student student) {
		// TODO Auto-generated method stub
		return 0;
	}
}
