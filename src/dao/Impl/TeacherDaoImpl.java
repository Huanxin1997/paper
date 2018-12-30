package dao.Impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bean.Pager;
import com.bean.Teacher;

import Util.JdbcUtil;
import dao.TeacherDao;

public class TeacherDaoImpl implements TeacherDao{
	@Override
	public Pager<Teacher> getTeacher(Teacher teacher,int pageNum,int pageSize){
		List<Teacher> TeacherList = getTeacher(teacher);
		
		Pager<Teacher> pager = new Pager<Teacher>(pageNum,pageSize,TeacherList);
		return pager;
	}
	
	private static List<Teacher> getTeacher(Teacher teacher){
		List<Teacher> result = new ArrayList<Teacher>();
		List<Object> paramList = new ArrayList<Object>();
		String idnum = teacher.getIdnum();
		
		StringBuilder sql = new StringBuilder("select * from teacher where 1=1");
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
					Teacher t = new Teacher(map);
					result.add(t);
				}
			}
		}catch (SQLException e) {
			// TODO: handle exception
			throw new RuntimeException("查询数据异常",e);
		}finally{
			//释放内存，切记
			if(jdbcUtil != null){
				jdbcUtil.releaseConn();
			}
		}
		return result;		
	}
	public static void main(String[] args) {
		List<Teacher> lst = getTeacher(new Teacher());
		for (Teacher teacher : lst) {
			System.out.println(teacher);
		}
	}
}
