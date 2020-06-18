package poly;

import java.io.BufferedWriter;
import java.io.FileWriter;

public class FileWriterTest {
	
	 public static void main(String[] args) {
         
	        String txt = "테스트입니다!!" ;
	         
	        String fileName = "C:\\test11.txt" ;
	         
	         
	        try{
	                         
	            // BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
	            BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));
	             
	            // 파일안에 문자열 쓰기
	            fw.write(txt);
	            fw.flush();
	 
	            // 객체 닫기
	            fw.close();
	             
	             
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	         
	 
	    }
}
