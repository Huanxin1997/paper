import java.text.SimpleDateFormat;
import java.util.Date;

public class test {
	public static void main(String[] args){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");//时间格式
		Date nowDate = new Date();//得到当前时间
		String serial = sdf.format(nowDate);
		
		System.out.println(serial);
	}
}
