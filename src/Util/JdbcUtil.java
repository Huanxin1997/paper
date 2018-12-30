package Util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.bean.Paper;

public class JdbcUtil {

	// ��ʾ�������ݿ���û���
	private static String USERNAME ;

	// �������ݿ������
	private static String PASSWORD;

	// �������ݿ��������Ϣ
	private static String DRIVER;

	// ����������ݿ�ĵ�ַ
	private static String URL;

	// �������ݿ������
	private Connection connection;

	// ����sql����ִ�ж���
	private PreparedStatement pstmt;

	// �����ѯ���صĽ������
	private ResultSet resultSet;
	
	static{
		//�������ݿ�������Ϣ��������ص����Ը�ֵ
		loadConfig();
	}

	/**
	 * �������ݿ�������Ϣ��������ص����Ը�ֵ
	 */
	public static void loadConfig() {
		try {
//			InputStream inStream = JdbcUtil.class
//					.getResourceAsStream("/jdbc.properties");
//			Properties prop = new Properties();
//			prop.load(inStream);
//			USERNAME = prop.getProperty("jdbc.username");
//			PASSWORD = prop.getProperty("jdbc.password");
//			DRIVER= prop.getProperty("jdbc.driver");
//			URL = prop.getProperty("jdbc.url");
			USERNAME = "root";
			PASSWORD = "hhh123456.";
			DRIVER= "com.mysql.jdbc.Driver";
			URL = "jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";

		} catch (Exception e) {
			throw new RuntimeException("��ȡ���ݿ������ļ��쳣��", e);
		}
	}

	public JdbcUtil() {

	}

	/**
	 * ��ȡ���ݿ�����
	 * 
	 * @return ���ݿ�����
	 */
	public Connection getConnection() {
		try {
			Class.forName(DRIVER); // ע������
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false", USERNAME, PASSWORD); // ��ȡ����
		} catch (Exception e) {
			throw new RuntimeException("get connection error!", e);
		}
		return connection;
	}

	/**
	 * ִ�в�ѯ����
	 * 
	 * @param sql
	 *            sql���
	 * @param params
	 *            ִ�в���
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String, Object>> findResult(String sql, List<?> params)
			throws SQLException {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		int index = 1;
		pstmt = connection.prepareStatement(sql);
		if (params != null && !params.isEmpty()) {
			for (int i = 0; i < params.size(); i++) {
				pstmt.setObject(index++, params.get(i));
			}
		}
		resultSet = pstmt.executeQuery();
		ResultSetMetaData metaData = resultSet.getMetaData();
		int cols_len = metaData.getColumnCount();
		while (resultSet.next()) {
			Map<String, Object> map = new HashMap<String, Object>();
			for (int i = 0; i < cols_len; i++) {
				String cols_name = metaData.getColumnName(i + 1);
				Object cols_value = resultSet.getObject(cols_name);
				if (cols_value == null) {
					cols_value = "";
				}
				map.put(cols_name, cols_value);
			}
			list.add(map);
		}
		return list;
	}
	/*
	 * �ͷ���Դ
	 */
	public void releaseConn() {
		if (resultSet != null) {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		JdbcUtil jdbcUtil = new JdbcUtil();
		jdbcUtil.getConnection();
		try {
			List<Map<String, Object>> result = jdbcUtil.findResult(
					"select repetition_rate from paper", null);
			for (Map<String, Object> m : result) {
				System.out.println(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.releaseConn();
		}
	}
}