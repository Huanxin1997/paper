import java.text.SimpleDateFormat;
import java.util.Date;

public class test {
	public static void main(String[] args){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd�� HH:mm:ss");//ʱ���ʽ
		Date nowDate = new Date();//�õ���ǰʱ��
		String serial = sdf.format(nowDate);
		
		System.out.println(serial);
	}
}
